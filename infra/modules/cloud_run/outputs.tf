output "api_cloud_run_url" {
  value = google_cloud_run_service.api_service.status[0].url
}

output "subscriber_cloud_run_url" {
  value = google_cloud_run_service.subscriber_service.status[0].url
}