module Web
  module Helpers
    module PathHelper
      def current_path
        params.env['REQUEST_PATH']
      end

      def current_page?(path)
        current_path == path
      end
    end
  end
end
