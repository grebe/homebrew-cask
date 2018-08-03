cask 'imazing' do
  version '2.6.4,9261:1533229973'
  sha256 'c30635936ba7eaf4af762a29e3c9190066085f527c15c6f0031a52663edc2cff'

  # dl.devmate.com/com.DigiDNA.iMazing2Mac was verified as official when first introduced to the cask
  url "https://dl.devmate.com/com.DigiDNA.iMazing2Mac/#{version.after_comma.before_colon}/#{version.after_colon}/iMazing#{version.major}forMac-#{version.after_comma.before_colon}.dmg"
  appcast "https://updates.devmate.com/com.DigiDNA.iMazing#{version.major}Mac.xml"
  name 'iMazing'
  homepage 'https://imazing.com/'

  conflicts_with cask: 'imazing-mini'
  depends_on macos: '>= :mountain_lion'

  app 'iMazing.app'

  uninstall login_item: 'iMazing Mini',
            quit:       [
                          "com.DigiDNA.iMazing#{version}Mac",
                          "com.DigiDNA.iMazing#{version}Mac.Mini",
                        ]

  zap trash: [
               '~/Library/Application Support/iMazing',
               '~/Library/Application Support/iMazing Mini',
               '~/Library/Application Support/MobileSync/Backup/iMazing.Versions',
               "~/Library/Caches/com.DigiDNA.iMazing#{version.major}Mac",
               "~/Library/Caches/com.DigiDNA.iMazing#{version.major}Mac.Mini",
               "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.DigiDNA.iMazing#{version.major}Mac.Mini",
               '~/Library/Caches/iMazing',
               "~/Library/Preferences/com.DigiDNA.iMazing#{version.major}Mac.plist",
               "~/Library/Preferences/com.DigiDNA.iMazing#{version.major}Mac.Mini.plist",
               '/Users/Shared/iMazing Mini',
               '/Users/Shared/iMazing',
             ]

  caveats <<~EOS
    Performing a zap on this cask removes files pertaining to both #{token}
    and imazing-mini, so it should not be done if you only want to uninstall one of them.
  EOS
end
