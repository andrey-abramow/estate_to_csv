class Coldwellbankerhomes::HomeParser < PageParser

  def call
    linkData = JSON.parse(page.css('a.share.icon-mail')[1]['data-ic-form-fields'])
    {
      street_address: linkData['Address'] || '',
      zip_code: linkData['Zip'] || '',
      state: linkData['State'] || '',
      year_build: find_from_columns('Year Built: '),
      bedrooms: find_from_columns('Bedrooms: '),
      price: page.at('strong.price span').content,
      county:  find_from_columns('County:'),
      url: url || '',
      photos: page.css('div.photo-carousel div.fancybox-small img').map { |img| img['src'] }.join('; ') || ''
    }
  end

  def find_from_columns(text)
    element = page.xpath("//strong[contains(text(), '#{text}')]")[0]&.parent
    element&.children&.last&.content&.strip || ''
  end

end