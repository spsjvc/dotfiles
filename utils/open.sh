open() {
	(xdg-open "$@" >/dev/null 2>&1 &)
}
