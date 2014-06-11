% Media Cloud API Version 2
%

#API URLs

*Note:* by default the API only returns a subset of the available fields in returned objects. The returned fields are those that we consider to be the most relevant to users of the API. If the `all_fields` parameter is provided and is non-zero, then a more complete list of fields will be returned. For space reasons, we do not list the `all_fields` parameter on individual API descriptions.

## Authentication

Every call below includes a `key` parameter which will authenticate the user to the API service.  The key parameter is excluded
from the examples in the below sections for brevity.

### Example

https://api.mediacloud.org/api/v2/media/single/1?key=KRN4T5JGJ2A

## Errors

The Media Cloud returns an appropriate HTTP status code for any error, along with a json document in the following format:

```json
{ "error": "error message" }
```

## Request Limits

Each user is limited to 1,000 API calls and 20,000 stories returned in any 7 day period.  Requests submitted beyond this 
limit will result in a status 403 error.  Users who need access to more requests should email info@mediacloud.org.

## Media

The Media api calls provide information about media sources.  A media source is a publisher of content, such as the New York 
Times or Instapundit.  Every story belongs to a single media source.  Each media source can have zero or more feeds.

### api/v2/media/single/

| URL                              | Function
| -------------------------------- | -------------------------------------------------------------
| `api/v2/media/single/<media_id>` | Return the media source in which `media_id` equals `<media_id>`

#### Query Parameters 

None.

#### Example

Fetching information on The New York Times

URL: https://api.mediacloud.org/api/v2/media/single/1

Response:

```json
[
  {
    "url": "http:\/\/nytimes.com",
    "name": "New York Times",
    "media_id": 1,
    "media_source_tags": [
     {
       "tag_sets_id": 5,
       "show_on_stories": null,
       "tags_id": 8875027,
       "show_on_media": 1,
       "description": "Top U.S. mainstream media according Google Ad Planner's measure of unique monthly users.",
       "tag_set": "collection",
       "tag": "ap_english_us_top25_20100110",
       "label": "U.S. Mainstream Media"
     },
    "media_sets": [
      {
        "media_sets_id": 1,
        "name": "Top 25 Mainstream Media",
        "description": "Top 25 mainstream media sources by monthly unique users from the U.S. according to the Google AdPlanner service."
      },
    ]
  }
]
```


### api/v2/media/list/

| URL                 | Function
| ------------------- | -----------------------------
| `api/v2/media/list` | Return multiple media sources

#### Query Parameters 

| Parameter       | Default | Notes
| --------------- | ------- | -----------------------------------------------------------------
| `last_media_id` | 0       | Return media sources with a `media_id` greater than this value
| `rows`          | 20      | Number of media sources to return. Cannot be larger than 100
| `name`          | none    | Name of media source for which to search

If the name parameter is specified, the call returns only media sources that match a case insensitive search 
specified value.  If the specified value is less than 3 characters long, the call returns an empty list.

#### Example

URL: https://api.mediacloud.org/api/v2/media/list?last_media_id=1&rows=2

Output format is the same as for api/v2/media/single above.

## Media Sets

A media set is a collection of media sources, such as U.S. Top 25 Mainstream Media or Global Voices Cited Blogs.  Each 
media source can belong to zero or more media sets.  Each media set belongs to zero or more dashboards.

### api/v2/media_set/single

| URL                                       | Function
| ----------------------------------------- | ----------------------------------------------------------------------
| `api/v2/media_set/single/<media_sets_id>` | Return the media set in which `media_sets_id` equals `<media_sets_id>`

#### Query Parameters

None.

#### Example

https://api.mediacloud.org/api/v2/media_sets/single/1

```json
[
  {
    "media_sets_id": 1,
    "name": "Top 25 Mainstream Media",
    "description": "Top 25 mainstream media sources by monthly unique users from the U.S. according to the Google AdPlanner service.",
    "media": [
      {
        "media_id": 1,
        "url": "http:\/\/nytimes.com",
        "name": "New York Times"
      },
      {
        "media_id": 2,
        "url": "http:\/\/washingtonpost.com",
        "name": "Washington Post"
      },
      {
        "media_id": 4,
        "url": "http:\/\/www.usatoday.com",
        "name": "USA Today"
      },
      {
        "media_id": 6,
        "url": "http:\/\/www.latimes.com\/",
        "name": "Los Angeles Times"
      },
      {
        "media_id": 7,
        "url": "http:\/\/www.nypost.com\/",
        "name": "The New York Post"
      },
      {
        "media_id": 8,
        "url": "http:\/\/www.nydailynews.com\/",
        "name": "The Daily News New York"
      },
      {
        "media_id": 14,
        "url": "http:\/\/www.sfgate.com\/",
        "name": "San Francisco Chronicle"
      },
      {
        "media_id": 314,
        "url": "http:\/\/www.huffingtonpost.com\/",
        "name": "The Huffington Post"
      },
      {
        "media_id": 1089,
        "url": "http:\/\/www.reuters.com\/",
        "name": "Reuters"
      },
      {
        "media_id": 1092,
        "url": "http:\/\/www.foxnews.com\/",
        "name": "FOX News"
      },
      {
        "media_id": 1094,
        "url": "http:\/\/www.bbc.co.uk\/?ok",
        "name": "BBC"
      },
      {
        "media_id": 1095,
        "url": "http:\/\/www.cnn.com\/",
        "name": "CNN"
      },
      {
        "media_id": 1098,
        "url": "http:\/\/www.newsweek.com\/",
        "name": "Newsweek "
      },
      {
        "media_id": 1104,
        "url": "http:\/\/www.forbes.com\/",
        "name": "Forbes"
      },
      {
        "media_id": 1149,
        "url": "http:\/\/www.msnbc.msn.com\/",
        "name": "MSNBC"
      },
      {
        "media_id": 1747,
        "url": "http:\/\/www.dailymail.co.uk\/home\/index.html",
        "name": "Daily Mail"
      },
      {
        "media_id": 1750,
        "url": "http:\/\/www.telegraph.co.uk\/",
        "name": "Daily Telegraph"
      },
      {
        "media_id": 1751,
        "url": "http:\/\/www.guardian.co.uk\/",
        "name": "Guardian"
      },
      {
        "media_id": 1752,
        "url": "http:\/\/www.cbsnews.com\/",
        "name": "CBS News"
      },
      {
        "media_id": 4415,
        "url": "http:\/\/cnet.com",
        "name": "CNET"
      },
      {
        "media_id": 4418,
        "url": "http:\/\/examiner.com",
        "name": "Examiner.com"
      },
      {
        "media_id": 4419,
        "url": "http:\/\/time.com",
        "name": "TIME.com"
      }
    ],
  }
]
```

### api/v2/media_sets/list

| URL                      | Function
| ------------------------ | --------------------------
| `api/v2/media_sets/list` | Return multiple media sets

#### Query Parameters 

| Parameter            | Default | Notes
| -------------------- | ------- | -----------------------------------------------------------------
| `last_media_sets_id` | 0       | Return media sets with `media_sets_id` is greater than this value
| `rows`               | 20      | Number of media sets to return. Cannot be larger than 100

#### Example

URL: https://api.mediacloud.org/api/v2/media_sets/list?rows=1&last_media_sets_id=1

Output is the same as the api/v2/media_set/single example above.

## Feeds

A feed is either a syndicated feed, such as an RSS feed, or a single web page.  Each feed is downloaded between once
an hour and once a day depending on traffic.  Each time a syndicated feed is downloaded, each new URL found in the feed is 
added to the feed's media source as a story.  Each time a web page feed is downloaded, that web page itself is added as
a story for the feed's media source.

Each feed belongs to a single media source.  Each story can belong to one or more feeds from the same media source.

### api/v2/feeds/single

| URL                              | Function
| -------------------------------- | --------------------------------------------------------
| `api/v2/feeds/single/<feeds_id>` | Return the feed for which `feeds_id` equals `<feeds_id>`

#### Query Parameters 

None.

#### Example

URL: https://api.mediacloud.org/api/v2/feeds/single/1

```json
[
  {
    "name": "Bits",
    "url": "http:\/\/bits.blogs.nytimes.com\/rss2.xml",
    "feeds_id": 1,
    "feed_type": "syndicated",
    "media_id": 1
  }
]
```

### api/v2/feeds/list

| URL                 | Function
| ------------------- | --------------------------
| `api/v2/feeds/list` | Return multiple feeds

#### Query Parameters

| Parameter            | Default    | Notes
| -------------------- | ---------- | -----------------------------------------------------------------
| `last_feeds_id`      | 0          | Return feeds in which `feeds_id` is greater than this value
| `rows`               | 20         | Number of feeds to return. Cannot be larger than 100
| `media_id`           | (required) | Return feeds belonging to the media source

#### Example

URL: https://api.mediacloud.org/api/v2/feeds/list?media_id=1

Output format is the same as for api/v2/feeds/single above.

## Dashboards

A dashboard is a collection of media sets, for example US/English or Russian.  Dashboards are useful for finding the core
media sets related to some topic, usually a country.  Each media set can belong to zero or more dashboards.

### api/v2/dashboard/single

| URL                                       | Function
| ----------------------------------------- | ----------------------------------------------------------------------
| `api/v2/dashboard/single/<dashboards_id>` | Return the dashboard for which `dashboards_id` equals `<dashboards_id>`

#### Query Parameters 

| Parameter     | Default | Notes
| ------------- | ------- | -------------------------------------------------------------------------------------
| `nested_data` | 1       | If 0, return only the `name` and `dashboards_id`.<br />If 1, return nested information about the dashboard's `media_sets` and their `media`.

#### Example

https://api.mediacloud.org/api/v2/dashboards/single/2

```json
[
   {
      "name":"dashboard 2",
      "dashboards_id": "2",
      "media_sets":
      [
      {
         "name":"set name",
         "media_sets_id": "2",
         "media":[
            {
               "name":"source 1 name",
               "media_id":"source 1 media id",
               "url":"http://source1.com"
            },
            {
               "name":"source 2 name",
               "media_id":"source 2 media id",
               "url":"http://source2.com"
            },

         ]
      }
   ]
}
]
```

### api/v2/dashboards/list

| URL                      | Function
| ------------------------ | --------------------------
| `api/v2/dashboards/list` | Return multiple dashboards

#### Query Parameters 

| Parameter            | Default | Notes
| -------------------- | ------- | -------------------------------------------------------------------------------------
| `last_dashboards_id` | 0       | Return dashboards in which `dashboards_id` greater than this value
| `rows`               | 20      | Number of dashboards to return. Cannot be larger than 100
| `nested_data`        | 1       | If 0, return only the `name` and `dashboards_id`.<br />If 1, return nested information about the dashboard's `media_sets` and their `media`.

#### Example

URL: https://api.mediacloud.org/api/v2/dashboards/list?rows=1&last_dashboards_id=1

Output is the same as the api/v2/dashboard/single example above.

## Stories

A story represents a single published piece of content.  Each unique URL downloaded from any syndicated feed within 
a single media source is represented by a single story.  For example, a single New York Times newspaper story is a 
Media Cloud story, as is a single Instapundit blog post.  Only one story may exist for a given title for each 24 hours 
within a single media source.

### Output description

The following table describes the meaning and origin of fields returned by both api/v2/stories_public/single and api/v2/stories_public/list.

| Field               | Description
| ------------------- | ----------------------------------------------------------------------
| `stories_id`        | The internal Media Cloud ID for the story.
| `media_id`          | The internal Media Cloud ID for the media source to which the story belongs.
| `publish_date`      | The publish date of the story as specified in the RSS feed.
| `tags`              | A list of any tags associated with this story, including those written through the write-back api.
| `collect_date`      | The date the RSS feed was actually downloaded.
| `url`               | The URL field in the RSS feed.
| `guid`              | The GUID field in the RSS feed. Defaults to the URL if no GUID is specified in the RSS feed.


### api/v2/stories_public/single

| URL                                  | Function
| ------------------------------------ | ------------------------------------------------------
| `api/v2/stories_public/single/<stories_id>` | Return the story for which `stories_id` equals `<stories_id>`

#### Example

Note: This fetches data on the CC licensed Global Voices story ["Myanmar's new flag and new name"](http://globalvoicesonline.org/2010/10/26/myanmars-new-flag-and-new-name/#comment-1733161) from November 2010.

URL: https://api.mediacloud.org/api/v2/stories_public/single/27456565


```json
[
  {
    "collect_date": "2010-11-24 15:33:39",
    "url": "http:\/\/globalvoicesonline.org\/2010\/10\/26\/myanmars-new-flag-and-new-name\/comment-page-1\/#comment-1733161",
    "guid": "http:\/\/globalvoicesonline.org\/?p=169660#comment-1733161",
    "publish_date": "2010-11-24 04:05:00",
    "media_id": 1144,
    "stories_id": 27456565,
    "story_tags": [ 1234235 ],
  }
]
```

### api/v2/stories_public/list
  
| URL                             | Function
| ------------------------------- | ---------------------------------
| `api/v2/stories_public/list` | Return multiple processed stories

#### Query Parameters 

| Parameter                    | Default | Notes
| ---------------------------- | ------- | ------------------------------------------------------------------------------
| `last_processed_stories_id`  | 0       | Return stories in which the `processed_stories_id` is greater than this value.
| `rows`                       | 20      | Number of stories to return.
| `q`                          | null    | If specified, return only results that match the given Solr query.  Only one `q` parameter may be included.
| `fq`                         | null    | If specified, file results by the given Solr query.  More than one `fq` parameter may be included.


The `last_processed_stories_id` parameter can be used to page through these results. The API will return stories with a 
`processed_stories_id` greater than this value.  To get a continuous stream of stories as they are processed by Media Cloud, 
the user must make a series of calls to api/v2/stories_public/list in which `last_processed_stories_id` for each 
call is set to the `processed_stories_id` of the last story in the previous call to the API.

*Note:* `stories_id` and `processed_stories_id` are separate values. The order in which stories are processed is different than the `stories_id` order. The processing pipeline involves downloading, extracting, and vectoring stories. Requesting by the `processed_stories_id` field guarantees that the user will receive every story (matching the query criteria if present) in
the order it is processed by the system.

The `q` and `fq` parameters specify queries to be sent to a Solr server that indexes all Media Cloud stories.  The Solr
server provides full text search indexing of each sentence collected by Media Cloud.  All content is stored as individual 
sentences.  The api/v2/stories_public/list call searches for sentences matching the `q` and / or `fq` parameters if specified and
the stories that include at least one sentence returned by the specified query.

The `q` and `fq` parameters are passed directly through to Solr.  Documentation of the format of the `q` and `fq` parameters is [here](http://lucene.apache.org/core/4_6_1/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package_description).  Below are the fields that may be used as solr query parameters, for example 'sentence:obama AND media_id:1':

| Field                        | Description
| ---------------------------- | -----------------------------------------------------
| sentence                     | the text of the sentence
| stories_id                   | a Media Cloud story ID
| media_id                     | the Media Cloud media source ID of a story
| publish_date                 | the publish date of a story 
| tags_id_story                | the ID of a tag associated with a story
| tags_id_media                | the ID of a tag associated with a media source
| media_sets_id                | the ID of a media set
| processed_stories_id         | the processed_stories_id as returned by stories_public/list

Be aware that ':' is usually replaced with '%3A' in programmatically generated URLs.

#### Example

The output of these calls is in exactly the same format as for the api/v2/stories_public/single call.

URL: https://api.mediacloud.org/api/v2/stories_public/list?last_processed_stories_id=8625915

Return a stream of all stories processed by Media Cloud, greater than the `last_processed_stories_id`.

URL: https://api.mediacloud.org/api/v2/stories_public/list?last_processed_stories_id=2523432&q=sentence:obama+AND+media_id:1

Return a stream of all stories from The New York Times mentioning `'obama'` greater than the given `last_processed_stories_id`.

## Sentences

The text of every story processed by Media Cloud is parsed into individual sentences.  Duplicate sentences within
the same media source in the same week are dropped (the large majority of those duplicate sentences are 
navigational snippets wrongly included in the extracted text by the extractor algorithm).

### api/v2/sentences/count

#### Query Parameters

| Parameter          | Default          | Notes
| ------------------ | ---------------- | ----------------------------------------------------------------
| `q`                | n/a              | `q` ("query") parameter which is passed directly to Solr
| `fq`               | `null`           | `fq` ("filter query") parameter which is passed directly to Solr
| `split`            | `null`           | if set to 1 or true, split the counts into date ranges
| `split_start_date` | `null`           | date on which to start date splits, in YYYY-MM-DD format
| `split_end_date`   | `null`           | date on which to end date splits, in YYYY-MM-DD format

The q and fq parameters are passed directly through to Solr (see description of q and fq parameters in api/v2/stories_public/list section above).

The call returns the number of sentences returned by Solr for the specified query.

If split is specified, split the counts into regular date ranges for dates between split\_start\_date and split\_end\_date. 
The number of days in each date range depends on the total number of days between split\_start\_date and split\_end\_date:

| Total Days | Days in each range
| ---------- | ------------------
| < 15       | 1 day
| < 45       | 3 days
| < 105      | 7 days
| >= 105     | 1 month

Note that the total count returned by a split query is for all sentences found by the solr query, which query might or might not
include a date restriction.  So in the example africa query below, the 236372 count is for all sentences matching africa, not just those within the split date range.

#### Example

Count sentences containing the word 'obama' in The New York Times.

URL: https://api.mediacloud.org/api/v2/sentences/count?q=sentence:obama&fq=media_id:1

```json
{
  "count" => 96620
}
```

Count sentences containing 'africa' in the U.S. Mainstream Media from 2014-01-01 to 2014-03-01:

URL: https://api.mediacloud.org/api/v2/sentences/count?q=sentence:africa+AND+tags\_id\_media:8875027&split=1&split\_start\_date=2014-01-01&split\_end\_date=2014-03-01

```json
{
  "count": 236372,
  "split":
  {
    "2014-01-01T00:00:00Z": 650,
    "2014-01-08T00:00:00Z": 900,
    "2014-01-15T00:00:00Z": 999,
    "2014-01-22T00:00:00Z": 1047,
    "2014-01-29T00:00:00Z": 1125,
    "2014-02-05T00:00:00Z": 946,
    "2014-02-12T00:00:00Z": 1126
    "2014-02-19T00:00:00Z": 1094,
    "2014-02-26T00:00:00Z": 1218,
    "gap": "+7DAYS",
    "end": "2014-03-05T00:00:00Z",
    "start": "2014-01-01T00:00:00Z",
    }
}
````

## Word Counting

### api/v2/wc/list

Returns word frequency counts of the most commwords in all sentences returned by 
querying Solr using the `q` and `fq` parameters, with stopwords removed.  Words are stemmed
before being counted.  For each word, the call returns the stem and the full term most used 
with the given stem (for example, in the below example, 'romnei' is the stem that appeared 
7969 times and 'romney' is the word that was most commonly stemmed into 'romnei').

#### Query Parameters

| Parameter | Default | Notes
| --------- | ------- | ----------------------------------------------------------------
| `q`       | n/a     | `q` ("query") parameter which is passed directly to Solr
| `fq`      | `null`  | `fq` ("filter query") parameter which is passed directly to Solr
| `l`       | `en`    | space separated list of languages to use for stopwording and stemming

See above /api/v2/stories_public/list for Solr query syntax.

By default, the system stems and stopwords the list in English.  If you specify the 'l' parameter, 
the system will stem and stopword the words by each of the listed langauges serially.  To do no stemming 
or stopwording, specify 'none'.  The following language are supported (by 2 letter language code): 
'da' (Danish), 'de' (German), 'en' (English), 'es' (Spanish), 'fi' (Finnish), 'fr' (French),
'hu' (Hungarian), 'it' (Italian), 'lt' (Lithuanian), 'nl' (Dutch), 'no' (Norwegian), 'pt' (Portuguese),
'ro' (Romanian), 'ru' (Russian), 'sv' (Swedish), 'tr' (Turkish).


### Example

Obtain word frequency counts for all sentences containing the word `'obama'` in The New York Times

URL:  https://api.mediacloud.org/api/v2/wc/list?q=sentence:obama&fq=media_id:1

```json
[
  {
    "count": 91778,
    "stem": "obama",
    "term": "obama"
  },
  {
    "count": 10455,
    "stem": "republican",
    "term": "republicans"
  },
  {
    "count": 7969,
    "stem": "romnei",
    "term": "romney"
  },
  // WORDS SKIPPED FOR SPACE REASONS
  {
    "count": 22,
    "stem": "swell",
    "term": "swelling"
  },
  {
    "count": 22,
    "stem": "savvi",
    "term": "savvy"
  },
  {
    "count": 22,
    "stem": "unspecifi",
    "term": "unspecified"
  }
]
```

## Tags and Tag Sets

Media Cloud associates tags with media sources, stories, and individual sentences.  A tag consists of a short snippet of text, 
a `tags_id`, and `tag_sets_id`.  Each tag belongs to a single tag set.  The tag set provides a separate name space for a group
of related tags.  Each tag has a unique name ('tag') within its tag set.  Each tag set consists of a tag_sets_id and a uniaue 
name.

For example, the `'gv_country'` tag set includes the tags `japan`, `brazil`, `haiti` and so on.  Each of these tags is associated with
some number of media sources (indicating that the given media source has been cited in a story tagged with the given country
in a Global Voices post).

### api/v2/tags/single/

| URL                              | Function
| -------------------------------- | -------------------------------------------------------------
| `api/v2/tags/single/<tags_id>`   | Return the tag in which `tags_id` equals `<tags_id>`

#### Query Parameters 

None.

### Output description

| Field               | Description
|---------------------|-----------------------------------
| tags_id             | Media Cloud internal tag ID
| tags\_sets\_id      | Media Cloud internal ID of the parent tag set
| tag                 | text of tag, often cryptic
| label               | a short human readable label for the tag
| description         | a couple of sentences describing the meaning of the tag
| show\_on\_media     | recommendation to show this tag as an option for searching solr using the tags_id_media
| show\_on\_stories   | recommendation to show this tag as an option for searching solr using the tags_id_stories

The show\_on\_media and show\_on\_stories fields are useful for picking out which tags are likely to be useful for
external researchers.  A tag should be considered useful for searching via tags\_id\_media or tags\_id\_stories
if show\_on\_media or show\_on\_stories, respectively, is set to true for _either_ the specific tag or its parent
tag set.

#### Example

Fetching information on the tag 8876989.

URL: https://api.mediacloud.org/api/v2/tags/single/8875027

Response:

```json
[
  {
    "tag_sets_id": 5,
    "show_on_stories": null,
    "label": "U.S. Mainstream Media",
    "tag": "ap_english_us_top25_20100110",
    "tags_id": 8875027,
    "show_on_media": 1,
    "description": "Top U.S. mainstream media according Google Ad Planner's measure of unique monthly users."
  },
]
```

### api/v2/tags/list/

| URL                 | Function
| ------------------- | -----------------------------
| `api/v2/tags/list`  | Return multiple tags

#### Query Parameters 

| Parameter       | Default    | Notes
| --------------- | ---------- | -----------------------------------------------------------------
| `last_tags_id`  | 0          | Return tags with a `tags_id` is greater than this value
| `tag_sets_id`   | (required) | Return tags belonging to the given tag set.  The most useful tag set is tag set 5.
| `rows`          | 20         | Number of tags to return. Cannot be larger than 100

#### Example

URL: https://api.mediacloud.org/api/v2/tags/list?rows=2&tag_sets_id=5&last_tags_id=8875026

### api/v2/tag_sets/single/

| URL                                    | Function
| -------------------------------------- | -------------------------------------------------------------
| `api/v2/tag_sets/single/<tag_sets_id>` | Return the tag set in which `tag_sets_id` equals `<tag_sets_id>`

#### Query Parameters 

None.

### Output description

| Field               | Description
|---------------------|-----------------------------------
| tags\_sets\_id      | Media Cloud internal ID of the tag set
| name                | text of tag set, often cryptic
| label               | a short human readable label for the tag
| description         | a couple of sentences describing the meaning of the tag
| show\_on\_media     | recommendation to show this tag as an option for searching solr using the tags_id_media
| show\_on\_stories   | recommendation to show this tag as an option for searching solr using the tags_id_stories

The show\_on\_media and show\_on\_stories fields are useful for picking out which tags are likely to be useful for
external researchers.  A tag should be considered useful for searching via tags\_id\_media or tags\_id\_stories
if show\_on\_media or show\_on\_stories, respectively, is set to true for _either_ the specific tag or its parent
tag set.

#### Example

Fetching information on the tag set 5.

URL: https://api.mediacloud.org/api/v2/tag_sets/single/5

Response:

```json
[
  {
    "tag_sets_id": 5,
    "show_on_stories": null,
    "name": "collection",
    "label": "Collections",
    "show_on_media": null,
    "description": "Curated collections of media sources.  This is our primary way of organizing our media sources -- almost every media source in our system is a member of one or more of these curated collections.  Some collections are manually curated, and others are generated using quantitative metrics."
    }
]
```

### api/v2/tag_sets/list/

| URL                     | Function
| ----------------------- | -----------------------------
| `api/v2/tag_sets/list`  | Return all `tag_sets`

#### Query Parameters 

| Parameter          | Default | Notes
| ------------------ | ------- | -----------------------------------------------------------------
| `last_tag_sets_id` | 0       | Return tag sets with a `tag_sets_id` greater than this value
| `rows`             | 20      | Number of tag sets to return. Cannot be larger than 100

None.

#### Example

URL: https://api.mediacloud.org/api/v2/tag_sets/list

# Extended Examples

## Output Format / JSON
  
The format of the API responses is determined by the `Accept` header on the request. The default is `application/json`. Other supported formats include `text/html`, `text/x-json`, and `text/x-php-serialization`. It's recommended that you explicitly set the `Accept` header rather than relying on the default.
 
Here's an example of setting the `Accept` header in Python:

```python  
import pkg_resources  

import requests   
assert pkg_resources.get_distribution("requests").version >= '1.2.3'
 
r = requests.get( 'https://api.mediacloud.org/api/v2/media/list', params = params, headers = { 'Accept': 'application/json'}, headers = { 'Accept': 'application/json'} )  

data = r.json()
```

## Create a CSV file with all media sources.

```python
media = []
start = 0
rows  = 100
while True:
      params = { 'start': start, 'rows': rows }
      print "start:{} rows:{}".format( start, rows)
      r = requests.get( 'https://api.mediacloud.org/api/v2/media/list', params = params, headers = { 'Accept': 'application/json'} )
      data = r.json()

      if len(data) == 0:
      	 break

      start += rows
      media.extend( data )

fieldnames = [ 
 u'media_id',
 u'url',
 u'moderated',
 u'moderation_notes',
 u'name'
 ]

with open( '/tmp/media.csv', 'wb') as csvfile:
    print "open"
    cwriter = csv.DictWriter( csvfile, fieldnames, extrasaction='ignore')
    cwriter.writeheader()
    cwriter.writerows( media )

```

## Grab all processed stories from US Top 25 MSM as a stream

This is broken down into multiple steps for convenience and because that's probably how a real user would do it. 

### Find the media set

We assume that the user is new to Media Cloud. They're interested in what sources we have available. They run cURL to get a quick list of the available dashboards.

```
curl https://api.mediacloud.org/api/v2/dashboards/list&nested_data=0
```

```json
[
 {"dashboards_id":1,"name":"US / English"}
 {"dashboards_id":2,"name":"Russia"}
 {"dashboards_id":3,"name":"test"}
 {"dashboards_id":5,"name":"Russia Full Morningside 2010"}
 {"dashboards_id":4,"name":"Russia Sampled Morningside 2010"}
 {"dashboards_id":6,"name":"US Miscellaneous"}
 {"dashboards_id":7,"name":"Nigeria"}
 {"dashboards_id":101,"name":"techblogs"}
 {"dashboards_id":116,"name":"US 2012 Election"}
 {"dashboards_id":247,"name":"Russian Public Sphere"}
 {"dashboards_id":463,"name":"lithanian"}
 {"dashboards_id":481,"name":"Korean"}
 {"dashboards_id":493,"name":"California"}
 {"dashboards_id":773,"name":"Egypt"}
]
```

The user sees the "US / English" dashboard with `dashboards_id = 1` and asks for more detailed information.

```
curl https://api.mediacloud.org/api/v2/dashboards/single/1
```

```json
[
   {
      "name":"US / English",
      "dashboards_id": "1",
      "media_sets":
      [
         {
      	 "media_sets_id":1,
	 "name":"Top 25 Mainstream Media",
	 "description":"Top 25 mainstream media sources by monthly unique users from the U.S. according to the Google AdPlanner service.",
	 media:
	   [
	     NOT SHOWN FOR SPACE REASONS 
	   ]
	 },
   	 {
	 "media_sets_id":26,
	 "name":"Popular Blogs",
	 "description":"1000 most popular feeds in bloglines.",
	  media:
	   [
	     NOT SHOWN FOR SPACE REASONS 
	   ]
   	   }
   ]  
]
```

*Note:* the full list of media are not shown for space reasons.

After looking at this output, the user decides that she is interested in the "Top 25 Mainstream Media" set with `media_sets_id=1`.

### Grab stories by querying stories_public/list

We can obtain all stories by repeatedly querying api/v2/stories_public/list using the `q` parameter to restrict to `media_sets_id = 1` and changing the `last_processed_stories_id` parameter. 

This is shown in the Python code below where `process_stories` is a user provided function to process this data.

```python
import requests

start = 0
rows  = 100
while True:
      params = { 'last_processed_stories_id': start, 'rows': rows, 'q': 'media_sets_id:1' }

      print "Fetching {} stories starting from {}".format( rows, start)
      r = requests.get( 'https://api.mediacloud.org/api/v2/stories_public/list/', params = params, headers = { 'Accept': 'application/json'} )
      stories = r.json()

      if len(stories) == 0:
      	 break

      start = stories[ -1 ][ 'processed_stories_id' ]

      process_stories( stories )
```


## Grab all stories in The New York Times during October 2012

### Find the `media_id` of The New York Times

Currently, the best way to do this is to create a CSV file with all media sources as shown in the earlier example.

Once you have this CSV file, manually search for The New York Times. You should find an entry for The New York Times at the top of the file with `media_id = 1`.

### Grab stories by querying stories_public/list

We can obtain the desired stories by repeatedly querying `api/v2/stories_public/list` using the `q` parameter to restrict to `media_id` to 1 and  the `fq` parameter to restrict by date range. We repeatedly change the `last_processed_stories_id` parameter to obtain all stories.

This is shown in the Python code below where `process_stories` is a user provided function to process this data.

```python
import requests

start = 0
rows  = 100
while True:
      params = { 'last_processed_stories_id': start, 
      'rows': rows, 'q': 'media_set_id:1', 'fq': 'publish_date:[2010-10-01T00:00:00Z TO 2010-11-01T00:00:00Z]'  }

      print "Fetching {} stories starting from {}".format( rows, start)
      r = requests.get( 'https://api.mediacloud.org/api/v2/stories_public/list/', params = params, headers = { 'Accept': 'application/json'} )
      stories = r.json()

      if len(stories) == 0:
      	 break

      start = stories[ -1 ][ 'processed_stories_id' ]

      process_stories( stories )
```

## Get word counts for top words for sentences matching 'trayvon' in U.S. Political Blogs during April 2012

This is broken down into multiple steps for convenience and because that's probably how a real user would do it. 


### Find the media set

We assume that the user is new to Media Cloud. They're interested in what sources we have available. They run cURL to get a quick list of the available dashboards.

```
curl https://api.mediacloud.org/api/v2/dashboards/list&nested_data=0
```

```json
[
 {"dashboards_id":1,"name":"US / English"}
 {"dashboards_id":2,"name":"Russia"}
 {"dashboards_id":3,"name":"test"}
 {"dashboards_id":5,"name":"Russia Full Morningside 2010"}
 {"dashboards_id":4,"name":"Russia Sampled Morningside 2010"}
 {"dashboards_id":6,"name":"US Miscellaneous"}
 {"dashboards_id":7,"name":"Nigeria"}
 {"dashboards_id":101,"name":"techblogs"}
 {"dashboards_id":116,"name":"US 2012 Election"}
 {"dashboards_id":247,"name":"Russian Public Sphere"}
 {"dashboards_id":463,"name":"lithanian"}
 {"dashboards_id":481,"name":"Korean"}
 {"dashboards_id":493,"name":"California"}
 {"dashboards_id":773,"name":"Egypt"}
]
```

The user sees the "US / English" dashboard with `dashboards_id = 1` and asks for more detailed information.

```
curl https://api.mediacloud.org/api/v2/dashboards/single/1
```

```json
[
   {
      "name":"dashboard 2",
      "dashboards_id": "2",
      "media_sets":
      [
         {
      	 "media_sets_id":1,
	 "name":"Top 25 Mainstream Media",
	 "description":"Top 25 mainstream media sources by monthly unique users from the U.S. according to the Google AdPlanner service.",
	 media:
	   [
	     NOT SHOWN FOR SPACE REASONS 
	   ]
	 },
   	 {
	 "media_sets_id":26,
	 "name":"Popular Blogs",
	 "description":"1000 most popular feeds in bloglines.",
	  "media":
	   [
	     NOT SHOWN FOR SPACE REASONS 
	   ]
   	 },
	 {
	     "media_sets_id": 7125,
             "name": "Political Blogs",
	     "description": "1000 most influential U.S. political blogs according to Technorati, pruned of mainstream media sources.",
	     "media":
	   [
	     NOT SHOWN FOR SPACE REASONS 
	   ]

	  }
   ]  
]
```

*Note:* the full list of media are not shown for space reasons.

After looking at this output, the user decides that she is interested in the "Political Blogs" set with `media_sets_id = 7125`.


### Make a request for the word counts based on `media_sets_id`, sentence text and date range

One way to appropriately restrict the data is by setting the `q` parameter to restrict by sentence content and then the `fq` parameter twice to restrict by `media_sets_id` and `publish_date`.

Below `q` is set to `"sentence:trayvon"` and `fq` is set to `"media_sets_id:7125" and "publish_date:[2012-04-01T00:00:00.000Z TO 2013-05-01T00:00:00.000Z]"`. (Note that ":", "[", and "]" are URL encoded.)

```
curl 'https://api.mediacloud.org/api/v2/wc?q=sentence:trayvon&fq=media_sets_id:7125&fq=publish_date:%5B2012-04-01T00:00:00.000Z+TO+2013-05-01T00:00:00.000Z%5D'
```

Alternatively, we could use a single large query by setting `q` to `"sentence:trayvon AND media_sets_id:7125 AND publish_date:[2012-04-01T00:00:00.000Z TO 2013-05-01T00:00:00.000Z]"`:

```
curl 'https://api.mediacloud.org/api/v2/wc?q=sentence:trayvon+AND+media_sets_id:7125+AND+publish_date:%5B2012-04-01T00:00:00.000Z+TO+2013-05-01T00:00:00.000Z%5D&fq=media_sets_id:7135&fq=publish_date:%5B2012-04-01T00:00:00.000Z+TO+2013-05-01T00:00:00.000Z%5D'
```


## Tag sentences of a story based on whether they have an odd or even number of characters

For simplicity, we assume that the user is interested in the story with `stories_id = 100` and is using a tag set called `'ts'`.

```python

stories_id = 100
r = requests.get( 'https://api.mediacloud.org/api/v2/story/single/' + stories_id, headers = { 'Accept': 'application/json'} )
data = r.json()
story = data[0]

custom_tags = []
tag_set_name = 'ts'
for story_sentence in story['story_sentences']:
    sentence_length = len( story_sentence['sentence'] )
    story_sentences_id = story_sentence[ 'story_sentences_id' ]

    if sentence_length %2 == 0:
       tag_name = 'even'
    else:
       tag_name = 'odd'

    custom_tags.append( '{},{}:{}'.format( story_sentences_id, tag_set_name, tag_name )


r = requests.put( 'https://api.mediacloud.org/api/v2/sentences/put_tags/', { 'sentence_tag': custom_tags }, headers = { 'Accept': 'application/json'} )  

```

## Get word counts for top words for sentences with the tag `'odd'` in `tag_set = 'ts'`


###Find the `tag_sets_id` for `'ts'`

The user requests a list of all tag sets.

```
curl https://api.mediacloud.org/api/v2/tag_sets/list
```

```json
[
  {
    "tag_sets_id": 597,
    "name": "gv_country"
   },
   // additional tag sets skipped for space
  {
    "tag_sets_id": 800,
    "name": "ts"
   },

]
```

Looking through the output, the user sees that the `tag_sets_id` is 800.

###Find the `tags_id` for `'odd'` given the `tag_sets_id`

The following Python function shows how to find a `tags_id` given a `tag_sets_id`

```python
def find_tags_id( tag_name, tag_sets_id):
   last_tags_id = 0
   rows  = 100
   while True:
      params = { 'last_tags_id': last_tags_id, 'rows': rows }
      print "start:{} rows:{}".format( start, rows)
      r = requests.get( 'https://api.mediacloud.org/api/v2/tags/list/' + tag_sets_id , params = params, headers = { 'Accept': 'application/json'} )
      tags = r.json()

      if len(tags) == 0:
         break

      for tag in tags:
          if tag['tag'] == tag_name:
             return tag['tags_id']

          last_tags_id = max( tag[ 'tags_id' ], last_tags_id )

   return -1
   
```

###Request a word count using the `tags_id`

Assume that the user determined that the `tags_id` was 12345678 using the above code.  The following will return
the word count for all sentences in stories belonging to any media source associated with tag 12345678.

```
curl 'https://api.mediacloud.org/api/v2/wc?q=tags_id_media:12345678'
```

## Grab stories from 10 January 2014 with the tag `'foo:bar'`

### Find the `tag_sets_id` for `'foo'`

See the "Get Word Counts for Top Words for Sentences with the Tag `'odd'` in `tag_set = 'ts'`" example above.

### Find the `tags_id` for `'bar'` given the `tag_sets_id`

See the "Get Word Counts for Top Words for Sentences with the Tag `'odd'` in `tag_set = 'ts'`" example above.

### Grab stories by querying stories_public/list

We assume the `tags_id` is 678910.

```
import requests

start = 0
rows  = 100
while True:
      params = { 'last_processed_stories_id': start, 'rows': rows, 'q': 'tags_id_stories:678910' }

      print "Fetching {} stories starting from {}".format( rows, start)
      r = requests.get( 'https://api.mediacloud.org/api/v2/stories_public/list/', params = params, headers = { 'Accept': 'application/json'} )
      stories = r.json()

      if len(stories) == 0:
         break

      start = stories[ -1 ][ 'processed_stories_id' ]

      process_stories( stories )
```