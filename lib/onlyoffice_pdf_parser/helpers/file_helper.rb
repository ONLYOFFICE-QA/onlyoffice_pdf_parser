module OnlyofficePdfParser
  # Class for working with files
  class FileHelper
    class << self
      # @return [String] name for temp file
      def generate_temp_name
        file = Tempfile.new(%w[onlyoffice_bmp_parser .bmp])
        path = file.path
        file.unlink
        path
      end

      # @return [True, False] if string is file path
      def file_path?(string)
        File.exist?(string)
      rescue ArgumentError
        false
      end
    end
  end
end
