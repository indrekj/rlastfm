module RLastFM
  class Album < Api
    class << self
      # Get a list of Buy Links for a particular Album. It is required that
      # you supply either the artist and track params or the mbid param.
      #
      # == Parameters
      #  <tt>artist</tt> - The artist name.
      #  <tt>album</tt> - The album name.
      #  <tt>country</tt> - A country name, as defined by the ISO 3166-1
      #     country names standard.
      # == Optional parameters
      #  <tt>mbid</tt> - The musicbrainz id for the album.
      #  <tt>autocorrect</tt> - 1 or 0, transform misspelled artist names into
      #     correct artist names, returning the correct version instead. The
      #     corrected artist name will be returned in the response.
      # == Example
      #  RLastFM::Album.get_buy_links("MGMT", "Congratulations", "United Kingdom")
      def get_buy_links(artist, album, country, options = {})
        options.merge!(:album => album, :artist => artist, :country => country)
        get("album.getBuylinks", options)
      end

      # Get the metadata for an album on Last.fm using the album name and
      # artist name or a musicbrainz id.
      #
      # == Parameters
      #  <tt>artist</tt> - The artist name.
      #  <tt>album</tt> - The album name.
      # == Optional parameters
      #  <tt>mbid</tt> - The musicbrainz id for the album.
      #  <tt>lang</tt> - The language to return the biography in.
      #  <tt>autocorrect</tt> - 1 or 0, transform misspelled artist names into
      #     correct artist names, returning the correct version instead. The
      #     corrected artist name will be returned in the response.
      #  <tt>username</tt> - The username for the context of the request. If
      #     supplied, the user's playcount for this album is included in the
      #     response.
      # == Example
      #  RLastFM::Album.get_info("MGMT", "Congratulations")
      def get_info(artist, album, options = {})
        options.merge!(:album => album, :artist => artist)
        get("album.getInfo", options)
      end

      # Get the tags applied by an individual user to an album on Last.fm.
      #
      # == Parameters
      #  <tt>artist</tt> - The artist name.
      #  <tt>album</tt> - The album name.
      # == Optional parameters
      #  <tt>mbid</tt> - The musicbrainz id for the album.
      #  <tt>autocorrect</tt> - 1 or 0, transform misspelled artist names into
      #     correct artist names, returning the correct version instead. The
      #     corrected artist name will be returned in the response.
      # == Example
      #  RLastFM::Album.get_tags("MGMT", "Congratulations")
      def get_tags(artist, album, options = {})
        raise NotImplemented
      end

      # Get the top tags for an album on Last.fm, ordered by popularity.
      #
      # == Parameters
      #  <tt>artist</tt> - The artist name.
      #  <tt>album</tt> - The album name.
      # == Optional parameters
      #  <tt>mbid</tt> - The musicbrainz id for the album.
      #  <tt>autocorrect</tt> - 1 or 0, transform misspelled artist names into
      #     correct artist names, returning the correct version instead. The
      #     corrected artist name will be returned in the response.
      # == Example
      #  RLastFM::Album.get_top_tags("MGMT", "Congratulations")
      def get_top_tags(artist, album, options = {})
        options.merge!(:album => album, :artist => artist)
        get("album.getTopTags", options)
      end
    end
  end
end
