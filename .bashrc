[ -r /Users/bdraper/.byobu/prompt ] && . /Users/bdraper/.byobu/prompt   #byobu-prompt#
 
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/Users/bdraper/perl5";
export PERL_MB_OPT="--install_base /Users/bdraper/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/bdraper/perl5";
export PERL5LIB="/Users/bdraper/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/bdraper/perl5/bin:$PATH";
 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
 
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory
 
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
#export PS1="$PS1\$(git-radar --bash --fetch)"
 
export HIERADATA_SOURCE="file://~/Work/modules/hieradata"
 
#source /usr/local/bin/virtualenvwrapper.sh
 
alias vssh='pushd .vagrant/beaker_vagrant_files/default.yml && vagrant ssh ; popd'
alias destroy='pushd .vagrant/beaker_vagrant_files/default.yml && vagrant destroy -f ; popd'
alias build='time RS_PROVISION=yes RS_DESTROY=no bundle exec rake spec:acceptance'
alias rebuild='time RS_PROVISION=no RS_DESTROY=no bundle exec rake spec:acceptance'
 
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gpo='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpu='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gc='/Users/bdraper/sbin/git_commit_with_pt_id.sh'
alias bs='bundle exec rake spec:test'
alias ba='bundle exec rake spec:acceptance'
alias bci='bundle exec rake ci'
alias mtr=/usr/local/sbin/mtr
 
export EDITOR='/usr/bin/vim'
