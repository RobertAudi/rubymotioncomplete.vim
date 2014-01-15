let s:rubymotion_completion_directory = fnameescape(expand("<sfile>:p:h:h") . "/completion")

function! RubyMotionCompletionFiles()
  return  s:rubymotion_completion_directory . "/classes.txt," .
        \ s:rubymotion_completion_directory . "/constants.txt," .
        \ s:rubymotion_completion_directory . "/functions.txt," .
        \ s:rubymotion_completion_directory . "/methods.txt," .
        \ s:rubymotion_completion_directory . "/notifications.txt," .
        \ s:rubymotion_completion_directory . "/types.txt"
endfunction

function! s:addCompletionFilesToDictionary()
  if !isdirectory(s:rubymotion_completion_directory)
    echoerr "Could not find the completion directory: " . s:rubymotion_completion_directory
    return
  endif

  execute "set dictionary+=" . RubyMotionCompletionFiles()
endfunction

command! EnableRubyMotionCompletions call <SID>addCompletionFilesToDictionary()
