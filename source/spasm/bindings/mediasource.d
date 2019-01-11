module spasm.bindings.mediasource;

import spasm.types;
import spasm.bindings.common;
import spasm.bindings.dom;
import spasm.bindings.html;

enum AppendMode {
  segments,
  sequence
}
enum EndOfStreamError {
  network,
  decode
}
struct MediaSource {
  EventTarget _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = EventTarget(h);
  }
  auto sourceBuffers() {
    auto result = SourceBufferList(JsHandle(MediaSource_sourceBuffers_Get(this._parent)));
    return result;
  }
  auto activeSourceBuffers() {
    auto result = SourceBufferList(JsHandle(MediaSource_activeSourceBuffers_Get(this._parent)));
    return result;
  }
  auto readyState() {
    auto result = MediaSource_readyState_Get(this._parent);
    return result;
  }
  auto duration(double duration) {
    MediaSource_duration_Set(this._parent, duration);
  }
  auto duration() {
    auto result = MediaSource_duration_Get(this._parent);
    return result;
  }
  auto onsourceopen(EventHandler onsourceopen) {
    MediaSource_onsourceopen_Set(this._parent, onsourceopen);
  }
  auto onsourceopen() {
    auto result = MediaSource_onsourceopen_Get(this._parent);
    return result;
  }
  auto onsourceended(EventHandler onsourceended) {
    MediaSource_onsourceended_Set(this._parent, onsourceended);
  }
  auto onsourceended() {
    auto result = MediaSource_onsourceended_Get(this._parent);
    return result;
  }
  auto onsourceclose(EventHandler onsourceclose) {
    MediaSource_onsourceclose_Set(this._parent, onsourceclose);
  }
  auto onsourceclose() {
    auto result = MediaSource_onsourceclose_Get(this._parent);
    return result;
  }
  auto addSourceBuffer(string type) {
    auto result = SourceBuffer(JsHandle(MediaSource_addSourceBuffer(this._parent, type)));
    return result;
  }
  auto removeSourceBuffer(SourceBuffer sourceBuffer) {
    MediaSource_removeSourceBuffer(this._parent, sourceBuffer.handle);
  }
  auto endOfStream(EndOfStreamError error) {
    MediaSource_endOfStream(this._parent, error);
  }
  auto setLiveSeekableRange(double start, double end) {
    MediaSource_setLiveSeekableRange(this._parent, start, end);
  }
  auto clearLiveSeekableRange() {
    MediaSource_clearLiveSeekableRange(this._parent);
  }
  auto isTypeSupported(string type) {
    auto result = MediaSource_isTypeSupported(this._parent, type);
    return result;
  }
}
enum ReadyState {
  closed,
  open,
  ended
}
struct SourceBuffer {
  EventTarget _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = EventTarget(h);
  }
  auto mode(AppendMode mode) {
    SourceBuffer_mode_Set(this._parent, mode);
  }
  auto mode() {
    auto result = SourceBuffer_mode_Get(this._parent);
    return result;
  }
  auto updating() {
    auto result = SourceBuffer_updating_Get(this._parent);
    return result;
  }
  auto buffered() {
    auto result = TimeRanges(JsHandle(SourceBuffer_buffered_Get(this._parent)));
    return result;
  }
  auto timestampOffset(double timestampOffset) {
    SourceBuffer_timestampOffset_Set(this._parent, timestampOffset);
  }
  auto timestampOffset() {
    auto result = SourceBuffer_timestampOffset_Get(this._parent);
    return result;
  }
  auto audioTracks() {
    auto result = AudioTrackList(JsHandle(SourceBuffer_audioTracks_Get(this._parent)));
    return result;
  }
  auto videoTracks() {
    auto result = VideoTrackList(JsHandle(SourceBuffer_videoTracks_Get(this._parent)));
    return result;
  }
  auto textTracks() {
    auto result = TextTrackList(JsHandle(SourceBuffer_textTracks_Get(this._parent)));
    return result;
  }
  auto appendWindowStart(double appendWindowStart) {
    SourceBuffer_appendWindowStart_Set(this._parent, appendWindowStart);
  }
  auto appendWindowStart() {
    auto result = SourceBuffer_appendWindowStart_Get(this._parent);
    return result;
  }
  auto appendWindowEnd(double appendWindowEnd) {
    SourceBuffer_appendWindowEnd_Set(this._parent, appendWindowEnd);
  }
  auto appendWindowEnd() {
    auto result = SourceBuffer_appendWindowEnd_Get(this._parent);
    return result;
  }
  auto onupdatestart(EventHandler onupdatestart) {
    SourceBuffer_onupdatestart_Set(this._parent, onupdatestart);
  }
  auto onupdatestart() {
    auto result = SourceBuffer_onupdatestart_Get(this._parent);
    return result;
  }
  auto onupdate(EventHandler onupdate) {
    SourceBuffer_onupdate_Set(this._parent, onupdate);
  }
  auto onupdate() {
    auto result = SourceBuffer_onupdate_Get(this._parent);
    return result;
  }
  auto onupdateend(EventHandler onupdateend) {
    SourceBuffer_onupdateend_Set(this._parent, onupdateend);
  }
  auto onupdateend() {
    auto result = SourceBuffer_onupdateend_Get(this._parent);
    return result;
  }
  auto onerror(EventHandler onerror) {
    SourceBuffer_onerror_Set(this._parent, onerror);
  }
  auto onerror() {
    auto result = SourceBuffer_onerror_Get(this._parent);
    return result;
  }
  auto onabort(EventHandler onabort) {
    SourceBuffer_onabort_Set(this._parent, onabort);
  }
  auto onabort() {
    auto result = SourceBuffer_onabort_Get(this._parent);
    return result;
  }
  auto appendBuffer(BufferSource data) {
    SourceBuffer_appendBuffer(this._parent, data);
  }
  auto abort() {
    SourceBuffer_abort(this._parent);
  }
  auto remove(double start, double end) {
    SourceBuffer_remove(this._parent, start, end);
  }
}
struct SourceBufferList {
  EventTarget _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = EventTarget(h);
  }
  auto length() {
    auto result = SourceBufferList_length_Get(this._parent);
    return result;
  }
  auto onaddsourcebuffer(EventHandler onaddsourcebuffer) {
    SourceBufferList_onaddsourcebuffer_Set(this._parent, onaddsourcebuffer);
  }
  auto onaddsourcebuffer() {
    auto result = SourceBufferList_onaddsourcebuffer_Get(this._parent);
    return result;
  }
  auto onremovesourcebuffer(EventHandler onremovesourcebuffer) {
    SourceBufferList_onremovesourcebuffer_Set(this._parent, onremovesourcebuffer);
  }
  auto onremovesourcebuffer() {
    auto result = SourceBufferList_onremovesourcebuffer_Get(this._parent);
    return result;
  }
  auto opIndex(uint index) {
    auto result = SourceBuffer(JsHandle(SourceBufferList_getter__uint(this._parent, index)));
    return result;
  }
  auto opDispatch(uint index)() {
    auto result = SourceBuffer(JsHandle(SourceBufferList_getter__uint(this._parent, index)));
    return result;
  }
}


extern (C) Handle MediaSource_sourceBuffers_Get(Handle);
extern (C) Handle MediaSource_activeSourceBuffers_Get(Handle);
extern (C) ReadyState MediaSource_readyState_Get(Handle);
extern (C) void MediaSource_duration_Set(Handle, double);
extern (C) double MediaSource_duration_Get(Handle);
extern (C) void MediaSource_onsourceopen_Set(Handle, EventHandler);
extern (C) EventHandler MediaSource_onsourceopen_Get(Handle);
extern (C) void MediaSource_onsourceended_Set(Handle, EventHandler);
extern (C) EventHandler MediaSource_onsourceended_Get(Handle);
extern (C) void MediaSource_onsourceclose_Set(Handle, EventHandler);
extern (C) EventHandler MediaSource_onsourceclose_Get(Handle);
extern (C) Handle MediaSource_addSourceBuffer(Handle, string);
extern (C) void MediaSource_removeSourceBuffer(Handle, Handle);
extern (C) void MediaSource_endOfStream(Handle, EndOfStreamError);
extern (C) void MediaSource_setLiveSeekableRange(Handle, double, double);
extern (C) void MediaSource_clearLiveSeekableRange(Handle);
extern (C) bool MediaSource_isTypeSupported(Handle, string);
extern (C) void SourceBuffer_mode_Set(Handle, AppendMode);
extern (C) AppendMode SourceBuffer_mode_Get(Handle);
extern (C) bool SourceBuffer_updating_Get(Handle);
extern (C) Handle SourceBuffer_buffered_Get(Handle);
extern (C) void SourceBuffer_timestampOffset_Set(Handle, double);
extern (C) double SourceBuffer_timestampOffset_Get(Handle);
extern (C) Handle SourceBuffer_audioTracks_Get(Handle);
extern (C) Handle SourceBuffer_videoTracks_Get(Handle);
extern (C) Handle SourceBuffer_textTracks_Get(Handle);
extern (C) void SourceBuffer_appendWindowStart_Set(Handle, double);
extern (C) double SourceBuffer_appendWindowStart_Get(Handle);
extern (C) void SourceBuffer_appendWindowEnd_Set(Handle, double);
extern (C) double SourceBuffer_appendWindowEnd_Get(Handle);
extern (C) void SourceBuffer_onupdatestart_Set(Handle, EventHandler);
extern (C) EventHandler SourceBuffer_onupdatestart_Get(Handle);
extern (C) void SourceBuffer_onupdate_Set(Handle, EventHandler);
extern (C) EventHandler SourceBuffer_onupdate_Get(Handle);
extern (C) void SourceBuffer_onupdateend_Set(Handle, EventHandler);
extern (C) EventHandler SourceBuffer_onupdateend_Get(Handle);
extern (C) void SourceBuffer_onerror_Set(Handle, EventHandler);
extern (C) EventHandler SourceBuffer_onerror_Get(Handle);
extern (C) void SourceBuffer_onabort_Set(Handle, EventHandler);
extern (C) EventHandler SourceBuffer_onabort_Get(Handle);
extern (C) void SourceBuffer_appendBuffer(Handle, BufferSource);
extern (C) void SourceBuffer_abort(Handle);
extern (C) void SourceBuffer_remove(Handle, double, double);
extern (C) uint SourceBufferList_length_Get(Handle);
extern (C) void SourceBufferList_onaddsourcebuffer_Set(Handle, EventHandler);
extern (C) EventHandler SourceBufferList_onaddsourcebuffer_Get(Handle);
extern (C) void SourceBufferList_onremovesourcebuffer_Set(Handle, EventHandler);
extern (C) EventHandler SourceBufferList_onremovesourcebuffer_Get(Handle);
extern (C) Handle SourceBufferList_getter__uint(Handle, uint);