{
  combine = toolsetList:
    builtins.foldl' (acc: ts: {
      packages = (acc.packages or []) ++ (ts.packages or []);
      nativeBuildInputs = (acc.nativeBuildInputs or []) ++ (ts.nativeBuildInputs or []);
      env = (acc.env or {}) // (ts.env or {});
      shellHook = let
        prev = acc.shellHook or "";
        next = ts.shellHook or "";
      in
        if prev == ""
        then next
        else if next == ""
        then prev
        else prev + "\n" + next;
    }) {}
    toolsetList;

  mkShellArgs = toolset:
    {
      packages = toolset.packages or [];
      nativeBuildInputs = toolset.nativeBuildInputs or [];
      shellHook = toolset.shellHook or "";
    }
    // (toolset.env or {});
}
