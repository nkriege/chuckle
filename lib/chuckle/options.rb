module Chuckle
  module Options
    DEFAULT_OPTIONS = {
      cache_dir: nil,
      cache_errors: true,
      cookies: false,
      expires_in: :never,
      nretries: 2,
      rate_limit: 1,
      timeout: 30,
      user_agent: "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0",
      verbose: false,
    }

    # cache root directory
    def cache_dir
      @cache_dir ||= begin
        dir = options[:cache_dir]
        dir ||= begin
          if home = ENV["HOME"]
            if File.exists?(home) && File.stat(home).writable?
              "#{home}/.chuckle"
            end
          end
        end
        dir ||= "/tmp/chuckle"
        dir
      end
    end

    # should errors be cached?
    def cache_errors?
      options[:cache_errors]
    end

    # are cookies enabled?
    def cookies?
      options[:cookies]
    end

    # number of seconds to cache responses and cookies, or :never
    def expires_in
      options[:expires_in]
    end

    # number of retries to attempt
    def nretries
      options[:nretries]
    end

    # number of seconds between requests
    def rate_limit
      options[:rate_limit]
    end

    # timeout per retry
    def timeout
      options[:timeout]
    end

    # user agent
    def user_agent
      options[:user_agent]
    end

    # verbose output?
    def verbose?
      options[:verbose]
    end
  end
end
