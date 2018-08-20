AlgoliaSearch.configuration = {
  application_id: Settings.agID,
  api_key: Settings.agKey,
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5,
  pagination_backend: :kaminari
}
