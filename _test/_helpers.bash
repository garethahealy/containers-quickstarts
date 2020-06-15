helm_template() {
  CHART_DIR=$1
  TEMPLATE_OPTS=$2

  pushd $CHART_DIR
  helm template $TEMPLATE_OPTS $(pwd) --output-dir /tmp/$CHART_DIR > /dev/null 2>&1
  popd
}

split_list_items() {
  LIST_DIR=$1

  mkdir -p /tmp/rego-policies/${LIST_DIR}

  for f in `ls $LIST_DIR/.yml | xargs` ; do
    yq --yaml-output '.items[]' $f > /tmp/rego-policies/${LIST_DIR}/$(basename $f)
  done
}

split_template_objects() {
  TEMPLATE_DIR=$1

  mkdir -p /tmp/containers-quickstarts/${TEMPLATE_DIR}

  for f in `ls $TEMPLATE_DIR/*.yml | xargs` ; do
    yq --yaml-output '.objects[]' $f > /tmp/containers-quickstarts/${TEMPLATE_DIR}/$(basename $f)
  done
}

copy_file_tmp() {
  FILE_DIR=$1

  mkdir -p /tmp/containers-quickstarts/${FILE_DIR}

  for f in `ls $FILE_DIR/*.yml | xargs` ; do
    yq --yaml-output '.' $f > /tmp/containers-quickstarts/${FILE_DIR}/$(basename $f)
  done
}

print_err() {
  if [ "$1" -ne 2 ]; then echo "$2" | grep "not ok"; fi
}