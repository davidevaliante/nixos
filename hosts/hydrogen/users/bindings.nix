{
  bind = [
    # start programs
    "$mod, Q, exec, kitty"
    "$mod, C, killactive"
  ] ++
    # workspaces
    (builtins.concatLists (builtins.genList (
      workspace_index : 
        let
	  ws = toString workspace_index;
	in
          [
            "$mod, ${ws}, workspace, ${ws}"
	    "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
	  ]
      ) 10)
    );
}
