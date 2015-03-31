# Using the [Beacon API](https://beacon-bea.herokuapp.com/events)

Our API contains information regarding upcoming events. Each event will be displayed on the map with a popup window containing event details, and a beacon that will grow with the number of guests.

---

### Viewing events

```ruby
get '/events'
```

Events are displayed as beacons on the home tab's map.

---

### Creating events

```ruby
post '/events'
```

#### Parameters for creating a new event:

| Field name | Data type | Required/optional | Description |
|---|---|---|---|
| title | string | Required |  |
| description | text | Optional |  |
| location | string | Required | Should be a valid street address; Google Maps will only recognize and place beacons for formatted addresses, not landmarks |
| date_start | datetime | Required |  |
| date_end | datetime | Optional | Beacons will not show for past events |
| people_count | integer | Optional | Will increment and increase beacon radius for each user that clicks attending. Defaults to 1. |
| category | string | Required | Select from the drop-down menu--options include Sports, Entertainment, Social, Misc, Video Games, Food, and Outdoors |

---

### Viewing an event

```ruby
get '/events/:event_id'
```

Individual events can be accessed through its beacon's popup window.

Sample response:

```javascript
{
  id: 1,
  title: "Aaron's birthday party",
  description: "Aaron is turning 20. Bring your own apple juice.",
  location: "1272 El Camino Real, San Bruno",
  date_start: "2015-02-14T20:00:00.000Z",
  date_end: "2015-02-15T01:00:00.000Z",
  people_count: 30,
  category: "Social",
  created_at: "2015-02-18T00:37:22.402Z",
  updated_at: "2015-02-18T00:37:22.402Z"
}
```
