output "ids" {
  value = [
    "${aws_route_table.route_table.*.id}",
  ]
}
