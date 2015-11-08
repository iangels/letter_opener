module LetterOpener
  class Railtie < Rails::Railtie
    initializer "letter_opener.add_delivery_method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :letter_opener, LetterOpener::DeliveryMethod, :location => Rails.root.join("tmp", "letter_opener"), preview_in_browser: true
      end
    end

    initializer "letter_opener_test.add_delivery_method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :letter_opener_test, LetterOpener::DeliveryMethod, :location => Rails.root.join("tmp", "letter_opener"), preview_in_browser: false
      end
    end
  end
end
