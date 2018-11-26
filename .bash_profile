# .bash_profile
DOTFILES_DIR=$HOME/.dotfiles

# User specific environment and startup programs

PATH="$DOTFILES_DIR/bin:$PATH"
export PATH

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,prompt,nvm,rvm,custom}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done
## MacOS

##

# Set LSCOLORS

eval "$(dircolors "$DOTFILES_DIR"/system/.dir_colors)"

. .inputrc

for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done


unset file DOTFILE

export DOTFILES_DIR
