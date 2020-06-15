#!/usr/bin/env bats

load _helpers

@test ".openshift/templates" {
  split_template_objects .openshift/templates

  run conftest test /tmp/containers-quickstarts/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "build-docker-generic/.openshift/templates" {
  split_template_objects build-docker-generic/.openshift/templates

  run conftest test /tmp/containers-quickstarts/build-docker-generic/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}


@test "build-s2i-executable/.openshift/templates" {
  split_template_objects build-s2i-executable/.openshift/templates

  run conftest test /tmp/containers-quickstarts/build-s2i-executable/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "build-s2i-gows/.openshift/templates" {
  split_template_objects build-s2i-gows/.openshift/templates/imagestreams
  split_template_objects build-s2i-gows/.openshift/templates/builds
  split_template_objects build-s2i-gows/.openshift/templates/deployments

  run conftest test /tmp/containers-quickstarts/build-s2i-gows/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "build-s2i-jekyll/.openshift/templates" {
  split_template_objects build-s2i-jekyll/.openshift/templates/imagestreams
  split_template_objects build-s2i-jekyll/.openshift/templates/builds
  split_template_objects build-s2i-jekyll/.openshift/templates/deployments

  run conftest test /tmp/containers-quickstarts/build-s2i-jekyll/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "build-s2i-liberty/.openshift/templates" {
  split_template_objects build-s2i-liberty/.openshift/templates

  run conftest test /tmp/containers-quickstarts/build-s2i-liberty/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "build-s2i-play/.openshift/templates" {
  split_template_objects build-s2i-play/.openshift/templates

  run conftest test /tmp/containers-quickstarts/build-s2i-play/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "eap/chart" {
  helm_template "eap/chart" "--set sourceUri=conftest"

  run conftest test /tmp/eap/chart/eap72/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "gitlab-ce/.openshift/templates" {
  split_template_objects gitlab-ce/.openshift/templates

  run conftest test /tmp/containers-quickstarts/gitlab-ce/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "gogs/.openshift/templates" {
  split_template_objects gogs/.openshift/templates

  run conftest test /tmp/containers-quickstarts/gogs/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "hoverfly/.openshift/templates" {
  split_template_objects hoverfly/.openshift/templates

  run conftest test /tmp/containers-quickstarts/hoverfly/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "hygieia/.openshift/templates" {
  split_template_objects hygieia/.openshift/templates

  run conftest test /tmp/containers-quickstarts/hygieia/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "ipa-server/.openshift/files" {
  run conftest test ipa-server/.openshift/files --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "jenkins-masters/hygieia-plugin/.openshift/templates" {
  split_template_objects jenkins-masters/hygieia-plugin/.openshift/templates

  run conftest test /tmp/containers-quickstarts/jenkins-masters/hygieia-plugin/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "mongodb/.openshift/templates" {
  split_template_objects mongodb/.openshift/templates

  run conftest test /tmp/containers-quickstarts/mongodb/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "motepair" {
  helm_template "motepair"

  run conftest test /tmp/motepair/motepair/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "nexus/chart/nexus" {
  helm_template "nexus/chart/nexus" "--dependency-update"

  run conftest test /tmp/nexus/chart/nexus/nexus/charts/sonatype-nexus --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "ocp4-logging/.openshift/templates" {
  split_template_objects ocp4-logging/.openshift/templates

  run conftest test /tmp/containers-quickstarts/ocp4-logging/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "rabbitmq/.openshift/templates" {
  split_list_items rabbitmq/.openshift/templates/imagestreams
  split_template_objects rabbitmq/.openshift/templates/builds
  split_template_objects rabbitmq/.openshift/templates/deployments
  copy_file_tmp rabbitmq/.openshift/templates/configmaps

  run conftest test /tmp/containers-quickstarts/rabbitmq/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "rabbitmq/chart" {
  helm_template "rabbitmq/chart"

  run conftest test /tmp/rabbitmq/chart/RabbitMQ/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "sonarqube/.openshift/templates" {
  split_template_objects sonarqube/.openshift/templates

  run conftest test /tmp/containers-quickstarts/sonarqube/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "ubi7-gitlab-runner/.openshift" {
  split_template_objects ubi7-gitlab-runner/.openshift

  run conftest test /tmp/containers-quickstarts/ubi7-gitlab-runner/.openshift --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "utilities/ubi8-asciidoctor/.openshift" {
  split_template_objects utilities/ubi8-asciidoctor/.openshift

  run conftest test /tmp/containers-quickstarts/utilities/ubi8-asciidoctor/.openshift --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "utilities/ubi8-git/.openshift" {
  split_template_objects utilities/ubi8-google-api-python-client/.openshift

  run conftest test /tmp/containers-quickstarts/utilities/ubi8-google-api-python-client/.openshift --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "utilities/ubi8-google-api-python-client/.openshift" {
  split_template_objects utilities/ubi8-google-api-python-client/.openshift

  run conftest test /tmp/containers-quickstarts/utilities/ubi8-google-api-python-client/.openshift --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}

@test "zalenium/.openshift/templates" {
  split_template_objects zalenium/.openshift/templates

  run conftest test /tmp/containers-quickstarts/zalenium/.openshift/templates --output tap

  print_err "$status" "$output"

  [ "$status" -eq 0 ]
}