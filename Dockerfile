FROM haxe:4.2.2

WORKDIR /app

RUN apt-get update -yqq && apt-get install -yq \
	libgl1-mesa-dev \
    libglu1-mesa-dev \
    g++ g++-multilib \
    gcc-multilib \
    libasound2-dev \
    libx11-dev \
    libxext-dev \
    libxi-dev \
    libxrandr-dev \
    libxinerama-dev


RUN haxelib setup /usr/lib/haxe/lib/ && \
    haxelib install hxcpp

## Install Haxe dependencies
RUN haxelib install lime --always --quiet && \
    haxelib install openfl --always --quiet && \
    haxelib install flixel --always --quiet && \
    haxelib install flixel-tools && \
    haxelib install flixel-addons && \
    haxelib install flixel-ui && \
    haxelib install hscript && \
    haxelib install newgrounds && \
    haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit.git && \
    haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit && \
    haxelib git faxe https://github.com/uhrobots/faxe && \
    haxelib git polymod https://github.com/larsiusprime/polymod.git && \
    haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc && \
    haxelib install actuate && \
    haxelib git extension-webm https://github.com/KadeDev/extension-webm

RUN cp "/usr/lib/haxe/lib/lime/7,9,0/templates/bin/lime.sh" /usr/local/bin/lime && \
    chmod 755 /usr/local/bin/lime

