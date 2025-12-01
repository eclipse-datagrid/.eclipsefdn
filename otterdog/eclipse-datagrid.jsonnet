local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.datagrid', 'eclipse-datagrid') {
  settings+: {
    description: "",
    name: "Eclipse DataGrid Project",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "pass:bots/technology.datagrid/gpg/passphrase",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "pass:bots/technology.datagrid/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/technology.datagrid/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/technology.datagrid/central.sonatype.org/token-username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('datagrid') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description = "Docs: https://docs.microstream.one/enterprise/",
      has_discussions: true,
      homepage: "https://eclipsestore.io/",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          requires_commit_signatures: true,
          required_approving_review_count: 1
        },
      ],
      topics+: [
        "in-memory-database",
        "in-memory-storage",
        "java",
        "object-graph",
        "persistence",
        "storage-engine",
        "distributed",
        "replication"
      ],
      web_commit_signoff_required: false,
    },
  ],
}
