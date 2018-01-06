# Example installation

# bash setup
mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
ln -s "$HOME/dotfiles/bash/bashrc" "$HOME/.bashrc"
cp "$HOME/dotfiles/bash/example_local_pre.sh" \
   "$HOME/dotfiles/bash/local_pre.sh"
cp "$HOME/dotfiles/bash/example_local_post.sh" \
   "$HOME/dotfiles/bash/local_post.sh"

# vim setup
mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
cp "$HOME/dotfiles/vim/vimrc_wrapper" "$HOME/.vimrc"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir "$HOME/scripts"
cd "$HOME/scripts"
git clone http://github.com/bertnp/repo_lists.git
cd "$HOME/.vim/bundle"
python3 "$HOME/scripts/repo_lists/list_clone.py" \
        "$HOME/scripts/repo_lists/vim.list"

# tmux setup
mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"
