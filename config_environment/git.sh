installer "git" "brew install git --with-default-names" true

cd .. \
&& npm install -g diff-so-fancy \
&& git config --global core.editor "nvim" \
&& git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX" \
&& git config --global color.diff-highlight.oldNormal "red bold" \
&& git config --global color.diff-highlight.oldHighlight "red bold 52" \
&& git config --global color.diff-highlight.newNormal "green bold" \
&& git config --global color.diff-highlight.newHighlight "green bold 22"
