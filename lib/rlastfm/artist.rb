module RLastFM
  class Artist < Api
    class << self
      def add_tags(artist, tags, options = {})
        raise NotImplementedError
      end

      # Use the last.fm corrections data to check whether the supplied artist
      # has a correction to a canonical artist.
      #
      # == Parameters
      # * +artist+ - The artist name.
      # == Example
      #  RLastFM::Artist.get_correction("MG-MT")
      def get_correction(artist, options = {})
        options.merge!(:artist => artist)
        get("artist.getCorrection", options)
      end

      # Get a list of upcoming events for this artist. Easily integratable into
      # calendars, using the ical standard.
      #
      # == Parameters
      # * +artist+ - The artist name.
      # == Optional parameters
      # * +mbid+ - The musicbrainz id for the album.
      # * +autocorrect+ - 1 or 0, transform misspelled artist names into
      #   correct artist names, returning the correct version instead. The
      #   corrected artist name will be returned in the response.
      # == Example
      #  RLastFM::Artist.get_events("MGMT")
      def get_events(artist, options = {})
        options.merge!(:artist => artist)
        get("artist.getEvents", options)
      end

      # Get a list of upcoming events for this artist. Easily integratable into
      # calendars, using the ical standard.
      #
      # == Parameters
      # * +artist+ - The artist name.
      # == Optional parameters
      # * +mbid+ - The musicbrainz id for the album.
      # * +autocorrect+ - 1 or 0, transform misspelled artist names into
      #   correct artist names, returning the correct version instead. The
      #   corrected artist name will be returned in the response.
      # * +page+ - The page number to fetch.
      # * +limit+ - How many to return. Defaults and maxes out at 50.
      # * +order+ - Sort ordering can be either 'popularity' (default) or
      #   'dateadded'.
      # == Example
      #  RLastFM::Artist.get_images("MGMT")
      def get_images(artist, options = {})
        options.merge!(:artist => artist)
        get("artist.getImages", options)
      end

      # Get the metadata for an artist. Includes biography.
      #
      # == Parameters
      # * +artist+ - The artist name.
      # == Optional parameters
      # * +mbid+ - The musicbrainz id for the album.
      # * +autocorrect+ - 1 or 0, transform misspelled artist names into
      #   correct artist names, returning the correct version instead. The
      #   corrected artist name will be returned in the response.
      # * +lang+ - The language to return the biography in, expressed as an
      #   ISO 639 alpha-2 code.
      # == Example
      #  RLastFM::Artist.get_info("MGMT")
      def get_info(artist, options = {})
        options.merge!(:artist => artist)
        get("artist.getInfo", options)
      end

      # TODO:
      # def get_past_events
      # def get_podcast
      # def get_shouts
      # def get_similar
      # def get_tags
      # def get_top_albums
      # def get_top_fans
      # def get_top_tags
      # def get_top_tracks
      # def remove_tag
      # def search
      # def share
      # def shout
    end
  end
end
