function! commitcomplete#CompleteCommitMessageType(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    let res = []
    let items = [
          \ {'word': 'feat', 'menu': 'A new feature'},
          \ {'word': 'fix', 'menu': 'A bug fix'},
          \ {'word': 'docs', 'menu': 'Documentation only changes'},
          \ {'word': 'style', 'menu': 'Changes that do not affect the meaning of the code'},
          \ {'word': 'refactor', 'menu': 'A code change that neither fixes a bug nor adds a feature'},
          \ {'word': 'perf', 'menu': 'A code change that improves performance'},
          \ {'word': 'test', 'menu': 'Adding missing tests'},
          \ {'word': 'chore', 'menu': 'Changes to the build process or auxiliary tools and libraries'}]

    for m in items
      if m.word =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res
  endif
endfunction
