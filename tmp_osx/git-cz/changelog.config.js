module.exports = {
  disableEmoji: false,
  format: "{type}: {subject}",
  list: [
    "feat",
    "add",
    "update",
    "change",
    "revert",
    "docs",
    "fix",
    "refactor",
    "chore",
  ],
  maxMessageLength: 128,
  minMessageLength: 3,
  questions: ["type", "subject"],
  scopes: [],
  types: {
    feat: {
      description: "A new feature",
      value: "feat",
    },
    add: {
      description: "Add new files or functionality",
      value: "add",
    },
    update: {
      description: "Update existing functionality",
      value: "update",
    },
    change: {
      description: "Change due to spec updates",
      value: "change",
    },
    revert: {
      description: "Revert changes",
      value: "revert",
    },
    docs: {
      description: "Documentation only changes",
      value: "docs",
    },
    fix: {
      description: "A bug fix",
      value: "fix",
    },
    refactor: {
      description: "A code change that neither fixes a bug or adds a feature",
      value: "refactor",
    },
    chore: {
      description: "Maintain codebase",
      value: "chore",
    },
    messages: {
      type: "Select the type of change that you're committing:",
      subject: "Write a short, imperative mood description of the change:\n",
    },
  },
};
