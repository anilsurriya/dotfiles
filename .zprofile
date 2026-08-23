# .bash_profile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# User specific environment and startup programs
# Start ssh-agent
SSH_ENV="${HOME}/.ssh/agent-environment"

start_agent () {
	echo "Initialising new SSH agent..."
	ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
	echo succeeded
	chmod 600 "$SSH_ENV"
	. "$SSH_ENV" >/dev/null
	ssh-add;
}

# Source SSH settings, if applicable
if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" >/dev/null
	ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
		start_agent
	}
else
	start_agent
fi
