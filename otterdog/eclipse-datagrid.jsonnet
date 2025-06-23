local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.datagrid', 'eclipse-datagrid') {
  settings+: {
    description: "",
    name: "Eclipse DataGrid Project",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
}
