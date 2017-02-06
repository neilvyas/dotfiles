function np () {
  touch _posts/$(date +%Y-%m-%d)-${1:gs/ /-}.md
}
