{ pkgs, inputs, ... }:

{
  home = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      XDG_SESSION_TYPE = "wayland";
    };
  };

  xdg.configFile = {
    "sway/config".source = ./home/sway/config;
    "wofi/style.css".source = ./home/wofi/style.css;
    "picom/config".source = ./home/picom/config;
    "dunst/dunstrc".source = ./home/dunst/dunstrc;
    "i3/config".source = ./home/i3/config;
    "i3/i3exit".source = ./home/i3/i3exit;
    "i3/i3subscribe".source = ./home/i3/i3subscribe;
    "i3lock/cat.png".source = ./home/i3lock/cat.png;
    "i3lock/i3lock.sh".source = ./home/i3lock/i3lock.sh;
    "i3blocks/config".source = ./home/i3blocks/config;
    "i3blocks/i3status.conf".source = ./home/i3blocks/i3status.conf;
    "scripts/battery.sh".source = ./home/scripts/battery.sh;
    "scripts/weather.sh".source = ./home/scripts/weather.sh;
    "scripts/glucose.sh".source = ./home/scripts/glucose.sh;
    "scripts/cpu.pl".source = ./home/scripts/cpu.pl;
    "scripts/memory.sh".source = ./home/scripts/memory.sh;
    "scripts/temperature.sh".source = ./home/scripts/temperature.sh;
    "scripts/wifi.sh".source = ./home/scripts/wifi.sh;
    "scripts/dist.js".source = ./home/scripts/dist.js;
    "waybar/config".source = ./home/waybar/config;
    "waybar/style.css".source = ./home/waybar/style.css;
  };

  programs = {
    doom-emacs = {
      enable = true;
      doomPrivateDir = ./home/doom.d;
    };
    git = {
      enable = true;
      userName = "Julius de Bruijn";
      userEmail = "julius@nauk.io";
      extraConfig = {
        pull.rebase = true;
      };
      aliases = {
        co = "checkout";
        br = "branch";
        st = "status";
        ci = "commit";
      };
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set PATH ~/.cargo/bin ~/.local/bin $PATH
      '';
      plugins = [
        {
          name = "agnoster";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "theme-agnoster";
            rev = "43860ce1536930bca689470e26083b0a5b7bd6ae";
            sha256 = "16k94hz3s6wayass6g1lhlcjmbpf2w8mzx90qrrqp120h80xwp25";
          };
        }
      ];
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    beets = {
      enable = true;
      settings = {
        directory = "/mnt/music";
        library = "/home/pimeys/.config/beets/musiclibrary.blb";
        plugins = "convert replaygain fetchart";
        replaygain = {
          backend = "gstreamer";
        };
        import = {
          move = "yes";
        };
        fetchart = {
          auto = "yes";
        };
        convert = {
          auto = "no";
          threads = 4;
          copy_album_art = "yes";
          embed = "yes";
          format = "opus";
          dest = "/mnt/opus/";
          formats = {
            opus = {
              command = "ffmpeg -i $source -ar 48000 -ac 2 -ab 96k $dest";
              extension = "opus";
            };
          };
        };
      };
    };
    alacritty = {
      enable = true;
      settings = {
        env = {
          TERM = "xterm-256color";
        };
        scrolling = {
          history = 100000;
        };
        font = {
          normal = {
            family = "Inconsolata";
            style = "Regular";
          };
          bold = {
            family = "Inconsolata";
            style = "Bold";
          };
          italic = {
            family = "Inconsolata";
            style = "Italic";
          };
          bold_italic = {
            family = "Inconsolata";
            style = "Bold Italic";
          };
          size = 14.0;
        };
        colors = {
          primary = {
            background = "0x002635";
            foreground = "0xe6e6dc";
          };
          normal = {
            black = "0x00384d";
            red = "0xc43061";
            green = "0x7fc06e";
            yellow = "0xf08e48";
            blue = "0x1c8db2";
            magenta = "0xc694ff";
            cyan = "0x00cccc";
            white = "0x77929e";
          };
          bright = {
            black = "0x517f8d";
            red = "0xff5a67";
            green = "0x9cf087";
            yellow = "0xffcc1b";
            blue = "0x7eb2dd";
            magenta = "0xfb94ff";
            cyan = "0x00ffff";
            white = "0xb7cff9";
          };
          cursor = {
            text = "0x002635";
            cursor = "0xffcc1b";
          };
        };
      };
    };
  };

  xresources.properties = {
    "Xft.dpi" = 96;
    "Xft.antialias" = true;
    "Xft.hinting" = true;
    "Xft.rgba" = "rgb";
    "Xft.autohint" = false;
    "Xft.hintstyle" = "hintfull";
    "Xft.lcdfilter" = "lcddefault";
    "rofi.modi" = "run";
    "rofi.font" = "Inconsolata for Powerline 15";
    "!rofi.width" = 100;
    "!rofi.lines" = 5;
    "!rofi.columns" = 1;
    "rofi.opacity" = 80;
    "rofi.color-normal" = "#073642, #eee8d5, #002b36, #eee8d5, #073642";
    "rofi.color-urgent" = "#073642, #eee8d5, #002b36, #eee8d5, #073642";
    "rofi.color-active" = "#073642, #eee8d5, #002b36, #eee8d5, #073642";
    "rofi.color-window" = "#073642, #eee8d5";
    "!rofi.location" = 2;
    "!rofi.padding" = 25;
    "rofi.fuzzy" = false;
    "*background" = "#1d2021";
    "*foreground" = "#ebdbb2";
    "*color0" = "#282828";
    "*color8" = "#928374";
    "*color1" = "#cc241d";
    "*color9" = "#fb4934";
    "*color2" = "#98971a";
    "*color10" = "#b8bb26";
    "*color3" = "#d79921";
    "*color11" = "#fabd2f";
    "*color4" = "#458588";
    "*color12" = "#83a598";
    "*color5"  = "#b16286";
    "*color13" = "#d3869b";
    "*color6" = "#689d6a";
    "*color14" = "#8ec07c";
    "*color7" = "#a89984";
    "*color15" = "#ebdbb2";
  };
}
