# Attach to an existing tmux session or create a new one.
#
# Usage: t [session-name]
t() {
	# Use the provided name, or default to the current directory name
	local name="${1:-$(basename "$PWD")}"
	# -A: attach if session exists, create otherwise
	# -s: specify session name
	tmux new-session -A -s "$name"
}

# Tab completion for t: suggest existing tmux sessions
_t() {
	local -a sessions
	local line

	# Parse each line from "tmux list-sessions" (format: "name: 1 windows (created ...)")
	while IFS= read -r line; do
		local name="${line%%:*}"
		local desc="${line#*: }"
		# _describe expects "value:description" format
		sessions+=("$name:$desc")
	done < <(tmux list-sessions 2>/dev/null)

	# Display completions with descriptions (only the name part is inserted on selection)
	_describe 'session' sessions
}

# Register _t as the completion function for t
compdef _t t
