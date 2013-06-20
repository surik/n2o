-module(action_api).
-author('Maxim Sokhatsky').
-include_lib("n2o/include/wf.hrl").
-compile(export_all).

render_action(Record) ->
    Anchor = Record#api.anchor,
    Name = Record#api.name,
    Data = "Bert.encode(data)",
    PostbackScript = wf_event:generate_postback_script(Name, Anchor, "document", undefined, api_event, Data),
    wf:f("~s = function(data) {",  [Name]) ++ PostbackScript ++ "};".

