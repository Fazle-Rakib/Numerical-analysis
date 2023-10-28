function retval = conditionals ()
  score  = input('Enter a number:');
  fprintf('Number entered: %d\n', score);

  if(score >= 90)
    fprintf('Your letter grade is A\n');
  elseif(score >= 80)
    fprintf('Your letter grade is A-\n');
  endif

endfunction
