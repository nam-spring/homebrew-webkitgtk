class Webkitgtk < Formula
  desc "Full-featured Gtk+ port of the WebKit rendering engine"
  homepage "https://webkitgtk.org/"
  # url "https://webkitgtk.org/releases/webkitgtk-2.14.1.tar.xz"
  # sha256 "2e2d76c328de65bed6e0e4f096b2720a366654b27fc1af0830ece90bc4b7ceb5"
  # revision 2

  # bottle do
  #   sha256 "56e0d21409bdb19d458fae16b51f4b3ce0dac2e5bdf5961cc8c7359b457a888f" => :sierra
  #   sha256 "088b8f11009ea5dfc3d387059be2f958a8f723ac3fadfd242db515bb080da559" => :el_capitan
  #   sha256 "fcbacf52a0926be46549ecbd710281cbf50b7dfe36af13a16a7067c66a8d4067" => :yosemite
  # end

  # TODO: Verify deps

  # patch do
  #   url "https://raw.githubusercontent.com/Homebrew/formula-patches/master/webkit/webkit-2.14.1.diff"
  #   sha256 "df9af608b9c5c1f19c26db5970ad6b8638fc6b7573b9510f82e4ddadf248787d"
  # end

  head do
    url "https://github.com/WebKit/webkit/tree/main"
    depends_on "cmake" => :build
    depends_on "gtk+3"
    depends_on "libsoup"
    depends_on "autoconf"
    depends_on "automake"
    depends_on "bison"
    depends_on "enchant"
    depends_on "flex"
    depends_on "gettext"
    depends_on "gobject-introspection"
    depends_on "intltool"
    depends_on "itstool"
    depends_on "libcroco"
    depends_on "libgcrypt"
    depends_on "libgpg-error"
    depends_on "libtasn1"
    depends_on "libtiff"
    depends_on "libtool"
    depends_on "ninja"
    depends_on "pango"
    depends_on "pkg-config"
    depends_on "sqlite"
    depends_on "webp"
    depends_on "xz"
  end

  def install
    # https://github.com/WebKit/webkit#building-gtk-port

    # ENV.delete "SDKROOT"

    # turn introspection support OFF until we figure out how to fix it
    # extra_args = %w[
    #   -DENABLE_INTROSPECTION=OFF
    #   -DPORT=GTK
    #   -DENABLE_X11_TARGET=OFF
    #   -DENABLE_QUARTZ_TARGET=ON
    #   -DENABLE_TOOLS=ON
    #   -DENABLE_MINIBROWSER=ON
    #   -DENABLE_PLUGIN_PROCESS_GTK2=OFF
    #   -DENABLE_VIDEO=OFF
    #   -DENABLE_WEB_AUDIO=OFF
    #   -DENABLE_CREDENTIAL_STORAGE=OFF
    #   -DENABLE_GEOLOCATION=OFF
    #   -DENABLE_OPENGL=OFF
    #   -DENABLE_GRAPHICS_CONTEXT_3D=OFF
    #   -DUSE_LIBNOTIFY=OFF
    #   -DUSE_LIBHYPHEN=OFF
    #   -DCMAKE_SHARED_LINKER_FLAGS=-L/path/to/nonexistent/folder
    # ]

    # mkdir "build" do
    #   system "cmake", "..", *(std_cmake_args + extra_args)
    #   system "make", "install"
    # end
    system "pwd"
    system "Tools/Scripts/update-webkitgtk-libs"
  end

  # test do
  #   (testpath/"test.c").write <<-EOS.undent
  #     #include <webkit2/webkit2.h>
  #
  #     int main(int argc, char *argv[]) {
  #       fprintf(stdout, "%d.%d.%d\\n",
  #         webkit_get_major_version(),
  #         webkit_get_minor_version(),
  #         webkit_get_micro_version());
  #       return 0;
  #     }
  #   EOS
  #   ENV.libxml2
  #   atk = Formula["atk"]
  #   cairo = Formula["cairo"]
  #   fontconfig = Formula["fontconfig"]
  #   freetype = Formula["freetype"]
  #   gdk_pixbuf = Formula["gdk-pixbuf"]
  #   gettext = Formula["gettext"]
  #   glib = Formula["glib"]
  #   gtkx3 = Formula["gtk+3"]
  #   harfbuzz = Formula["harfbuzz"]
  #   libepoxy = Formula["libepoxy"]
  #   libpng = Formula["libpng"]
  #   libsoup = Formula["libsoup"]
  #   pango = Formula["pango"]
  #   pixman = Formula["pixman"]
  #   flags = %W[
  #     -I#{atk.opt_include}/atk-1.0
  #     -I#{cairo.opt_include}/cairo
  #     -I#{fontconfig.opt_include}
  #     -I#{freetype.opt_include}/freetype2
  #     -I#{gdk_pixbuf.opt_include}/gdk-pixbuf-2.0
  #     -I#{gettext.opt_include}
  #     -I#{glib.opt_include}/gio-unix-2.0/
  #     -I#{glib.opt_include}/glib-2.0
  #     -I#{glib.opt_lib}/glib-2.0/include
  #     -I#{gtkx3.opt_include}/gtk-3.0
  #     -I#{harfbuzz.opt_include}/harfbuzz
  #     -I#{include}/webkitgtk-4.0
  #     -I#{libepoxy.opt_include}
  #     -I#{libpng.opt_include}/libpng16
  #     -I#{libsoup.opt_include}/libsoup-2.4
  #     -I#{pango.opt_include}/pango-1.0
  #     -I#{pixman.opt_include}/pixman-1
  #     -D_REENTRANT
  #     -L#{atk.opt_lib}
  #     -L#{cairo.opt_lib}
  #     -L#{gdk_pixbuf.opt_lib}
  #     -L#{gettext.opt_lib}
  #     -L#{glib.opt_lib}
  #     -L#{gtkx3.opt_lib}
  #     -L#{libsoup.opt_lib}
  #     -L#{lib}
  #     -L#{pango.opt_lib}
  #     -latk-1.0
  #     -lcairo
  #     -lcairo-gobject
  #     -lgdk-3
  #     -lgdk_pixbuf-2.0
  #     -lgio-2.0
  #     -lglib-2.0
  #     -lgobject-2.0
  #     -lgtk-3
  #     -lintl
  #     -ljavascriptcoregtk-4.0
  #     -lpango-1.0
  #     -lpangocairo-1.0
  #     -lsoup-2.4
  #     -lwebkit2gtk-4.0
  #   ]
  #   system ENV.cc, "test.c", "-o", "test", *flags
  #   assert_match version.to_s, shell_output("./test")
  # end
end
