import std.stdio;

auto ignore(Block)(lazy Block block) {
  try {
    block();
  } catch (Exception e) {}
}

void writeIndexJsFile(string path) {
  import std.file;
  import std.algorithm;
  import std.range;
  import std.typecons;
  import std.path;
  import std.format;
  import std.conv;
  auto items = path.dirEntries("*.js", SpanMode.depth).map!(e=>tuple!("file","name")(e.name.relativePath(path),e.name.baseName.stripExtension)).filter!((i){ return i.name != "index" && i.name[0] != '.' && i.name[0] != '#';}).array;
  auto imports = items.map!((entry){return format("import * as %s from './%s.js';", entry.name, entry.name);});
  auto modulesLine = chain("const modules = [", items.map!(i => i.name).joiner(", "), "];").text;
  write(path ~ "/index.js", chain(only("// File is autogenerated with `dub run spasm:webpack-bootstrap`"), imports, only(modulesLine), only("export { spasm, modules }")).joiner("\n").text);
}

void main(string[] args)
{
  import std.file;
  import sdlang;
  import std.array : replace;
  immutable string spasmjs = import("./spasm/modules/spasm.js");
  immutable string spajs = import("./spasm/modules/spa.js");
  immutable string entryjs = import("./spasm/entry.js");
  immutable string indexhtml = import("./spasm/index.template.html");
  immutable string devserver = import("./dev-server.js");
  immutable string packagejson = import("./package.json");
  immutable string webpackconfigjs = import("./webpack.config.js");

  string name;
  if (exists("dub.sdl")) {
    Tag targetProject = parseFile("dub.sdl");
    name = targetProject.expectTagValue!string("name");
  } else if (exists("dub.json")) {
    import asdf;
    struct Def {
      string name;
    }
    auto project = readText("dub.json").deserialize!Def;
    name = project.name;
  } else {
    throw new Exception("Must be run in folder with dub.sdl/dub.json file");
  }
  writeln("\nThis bootstrap project sets up the js-runtime needed to run applications build on top of spasm, as well as a webpack configuration used to bundle an `index.html`.");
  writeln("\nCopying runtime files and webpack config...");
  remove("app.js").ignore();
  mkdir("spasm").ignore();
  mkdir("spasm/modules").ignore();
  write("spasm/entry.js", entryjs);
  write("spasm/modules/spasm.js", spasmjs.replace("@@targetProjectName@@", name));
  writeIndexJsFile("spasm/modules");
  write("spasm/modules/spa.js", spajs);
  if (exists("index.template.html"))
    rename("index.template.html","spasm/index.template.html");
  else if (!exists("spasm/index.template.html"))
    write("spasm/index.template.html",indexhtml);
  write("dev-server.js",devserver.replace("@@targetProjectName@@", name));
  write("package.json",packagejson);
  write("webpack.config.js",webpackconfigjs);
  writeln("Done!");
  writeln("\nNext steps:");
  writeln("run `npm install` to install js dependencies");
  writeln("run `npx webpack` to bundle js");
  writeln("run `npm run start` to start a dev-server");
  writeln("\nNote:");
  writeln("It is assumed your wasm binary is called `"~name~"`.\nIf that is not the case, or you change it in the future, you'll need to update ./spasm/modules/spasm.js and ./dev-server.js\n");
}
