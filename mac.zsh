
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

HOMEBREW_HOME=/usr/local
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk/
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$HOMEBREW_HOME/sbin:$HOMEBREW_HOME/bin:$PATH:$(where node)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vimr'
fi


[ -f "$HOMEBREW_HOME/bin/hub" ] && alias git=hub
alias vr="/usr/local/bin/vimr"
alias vi=mvim

function xc {
    xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`

    if [[ `echo -n $xcode_proj | wc -m` == 0 ]]
    then
        echo "No xcworkspace/xcodeproj file found in the current directory."
    else
        open "$xcode_proj"
    fi
}


