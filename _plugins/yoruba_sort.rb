# _plugins/yoruba_sort.rb
# Custom Jekyll filter for sorting Yoruba terms alphabetically
# Ignores tone marks (`, ´, ˆ) and treats dotted letters (ẹ, ọ, ṣ) as base letters

module YorubaSort
  # Normalize a Yoruba string for sorting
  # Removes all accents and tone marks, converts dotted letters to base
  def normalize_yoruba(text)
    return "" if text.nil?
    
    normalized = text.dup
    
    # Convert to lowercase first
    normalized = normalized.downcase
    
    # Remove/replace all Yoruba special characters
    # Vowels with grave/acute accents → base vowel
    normalized.gsub!(/[àáâãäåāăą]/, 'a')
    normalized.gsub!(/[èéêëēĕėęě]/, 'e')
    normalized.gsub!(/[ìíîïĩīĭį]/, 'i')
    normalized.gsub!(/[òóôõöōŏő]/, 'o')
    normalized.gsub!(/[ùúûüũūŭůű]/, 'u')
    
    # Dotted letters → base letter
    normalized.gsub!(/[ẹ]/, 'e')
    normalized.gsub!(/[ọ]/, 'o')
    normalized.gsub!(/[ṣ]/, 's')
    
    # n with accent → n
    normalized.gsub!(/[ǹń]/, 'n')
    
    # Remove any remaining combining diacritical marks
    normalized.gsub!(/[\u0300-\u036f]/, '')
    
    # Remove periods, spaces, and other punctuation for sorting
    normalized.gsub!(/[^a-z0-9]/, '')
    
    normalized
  end

  # Sort an array by normalized Yoruba text
  def sort_by_yoruba(array, property = nil)
    return array if array.nil? || !array.is_a?(Array)
    
    if property.nil?
      # Sort strings directly
      array.sort_by { |item| normalize_yoruba(item.to_s) }
    else
      # Sort objects by a property
      array.sort_by do |item|
        if item.respond_to?(property)
          normalize_yoruba(item.send(property).to_s)
        elsif item.is_a?(Hash) && item.key?(property)
          normalize_yoruba(item[property].to_s)
        else
          ""
        end
      end
    end
  end
end

Liquid::Template.register_filter(YorubaSort)
