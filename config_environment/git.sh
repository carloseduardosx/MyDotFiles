installer "git" "brew install git --with-default-names" true

cd .. \
&& ln -sf `pwd`/git_template ~/.git_template \
&& git config --global init.templatedir '~/.git_template' \
&& cd config_environment
