module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def logout_button
        link_to 'Logout', '/logout', class: "logout"
      end
    end
  end
end
