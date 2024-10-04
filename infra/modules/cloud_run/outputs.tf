output "cloud_run_url" {
  description = "La URL del servicio de Cloud Run desplegado."
  value       = google_cloud_run_service.service.status[0].url
}
