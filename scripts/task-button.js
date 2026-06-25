// Templater user script — task-button.js
// Renders the Claude Code run button for a task note.
// Usage in a note: <%* await tp.user.task_button(tp) %>
// Or call it from DataviewJS via: app.plugins.plugins['templater-obsidian']

async function task_button(tp) {
  // This is intentionally left as a marker — the actual button
  // is rendered inline via DataviewJS in each task note.
  return '';
}

module.exports = task_button;
