variable todoapp_ui_path {
  type        = string
  default     = "../../../todoapp-redux/dist"
  description = "Path to UI code"
}

variable s3_ui_bucket_name {
  type        = string
  default     = "todoapp-react-ui-code"
  description = "React UI code for todo app"
}
