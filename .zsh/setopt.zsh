# case insesitive options where _ are igored nobeep = no_BE__e_b
# can use prefix no to invert option
# 
# options on http://zsh.sourceforge.net/Doc/Release/Options.html


# ============================================
#                   general
# ============================================
# prevent stdout redirection from accidentally overwriting an existing file
setopt no_clobber

# turn off beep
setopt no_beep

# filename generation
setopt extended_glob


# ============================================
#           changing directories
# ============================================
setopt no_autocd                # no dir change without cd
setopt auto_pushd               # does not push dirs to the stack wit cd 
setopt pushd_ignore_dups        # do not push multiples of the same dir to the stack
#setopt auto_name_dirs
setopt no_cdable_vars	        # if trying to complete a nonexisten dir path from cd do NOT treat it as an completion from ~/
setopt auto_param_slash	        # if a dir name is completed add a traling/ instead of space


# ============================================
#                  history
# ============================================
# setopt append_history
setopt extended_history         # Saves the start time and run time of commands in history
setopt hist_expire_dups_first   # when the history limit is reached remove the oldest duplicates first
setopt HIST_SAVE_NO_DUPS        # history commands is not in the history (to avoid fluff and recurtions)
setopt hist_verify              # when executing commands with history expantions return the expanded line insted of executing it
setopt hist_ignore_dups         # duplicates are not saved in to history
setopt inc_append_history
#setopt share_history            # Makes the history file shared, incrementaly adds new commands to the history file as they are typed


# ============================================
#                completion
# ============================================
setopt always_to_end            # if a word is completed whith the cursor inside the word the cursor is moved to the end of the completed word if one is found
setopt complete_in_word         # Does not move the cursor to the end of the word when completing 
setopt no_complete_aliases      # wheter or not to allow completion of the content of aliases (that is if you have aliased a=git with complete_aliases true a<tab> yelds no git completions)

setopt AUTO_LIST
setopt BASH_AUTO_LIST                  # on ambigus completion list choises

# no horrible cycling behaviour
setopt no_auto_menu             # use menu completion afte the second request for completion
setopt no_menu_complete

setopt list_packed              # more compact listings


# ============================================
#                   I/O
# ============================================
# Kansje fjern
setopt no_correct                  # try to correct spelling of commands
setopt no_correctall               # wil not try to correct the spelling of all the arguments on a line
DISABLE_CORRECTION="true" 
# prompt: enable parameter expansion, command substitution, and
# arithmetic expansion
setopt prompt_subst
