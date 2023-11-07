# Pagy::DEFAULT.freeze

# Optionally override some pagy default with your own in the pagy initializer
Pagy::DEFAULT[:items] = 10        # items per page
# Better user experience handled automatically
require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page

# Require the headers extra in the pagy initializer
require 'pagy/extras/headers'
