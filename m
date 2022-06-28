Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C627F55C0C1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 13:38:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04455AE8;
	Tue, 28 Jun 2022 13:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04455AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656416288;
	bh=vR8EqFFybjXfsCOKb18r+QUgupaWONhX/BZDNGEMAZM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZI69wX9Q6w7mrsuOqko1jM8Rz5o2FE33vv2Z07g150Y7D+aBDbjnFaiPzCvHCN2H
	 XGHACzdcSsuBbbqCQyo0/3OmA234J6s0k0A8/wK20niK7BQTuvRBzi/dlUkTFLigNj
	 XD2lLsXRWIDvD/CR/xXSNHvb5VxEZbxowrW8gDNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF95F8025B;
	Tue, 28 Jun 2022 13:37:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB8CDF80115; Tue, 28 Jun 2022 13:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D1C0F80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 13:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D1C0F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656416220883438110-webhooks-bot@alsa-project.org>
References: <1656416220883438110-webhooks-bot@alsa-project.org>
Subject: HDA Nvidia no profile
Message-Id: <20220628113706.EB8CDF80115@alsa1.perex.cz>
Date: Tue, 28 Jun 2022 13:37:06 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #245 was opened from decepticlown:

I have a TV connected through `HDMI` to laptop which has `NVidia 1650ti` card. In `pavucontrol` I can not see any `HDA NVidia` profiles. It only shows `off`. I can solve it by `downgrading to alsa-lib 1.2.4`. After that HDMI profiles are shown properly and sound works. Issue persists with both proprietary and open source NVidia drivers. 

pipewire version: 0.3.52-2
pipewire-alsa version: 0.3.52-2
pipewire-pulse version: 0.3.52-2
wireplumber version: 0.4.10-3
alsa-lib version: 1.2.7-1
Archlinux kernel version: 5.18.7

I haven't done any configuration for above packages. Its basically fresh install.
<details>
<summary> $ pactl list cards</summary>

    Card #44
	Name: alsa_card.pci-0000_01_00.1
	Driver: alsa
	Owner Module: n/a
	Properties:
		api.acp.auto-port = "false"
		api.acp.auto-profile = "false"
		api.alsa.card = "0"
		api.alsa.card.longname = "HDA NVidia at 0xfc080000 irq 99"
		api.alsa.card.name = "HDA NVidia"
		api.alsa.path = "hw:0"
		api.alsa.use-acp = "true"
		api.dbus.ReserveDevice1 = "Audio0"
		device.api = "alsa"
		device.bus = "pci"
		device.bus_path = "pci-0000:01:00.1"
		device.description = "HDA NVidia"
		device.enum.api = "udev"
		device.icon_name = "audio-card-analog-pci"
		device.name = "alsa_card.pci-0000_01_00.1"
		device.nick = "HDA NVidia"
		device.plugged.usec = "3396199"
		device.product.id = "4346"
		device.subsystem = "sound"
		device.sysfs.path = "/sys/devices/pci0000:00/0000:00:01.1/0000:01:00.1/sound/card0"
		device.vendor.id = "4318"
		device.vendor.name = "NVIDIA Corporation"
		media.class = "Audio/Device"
		factory.id = "14"
		client.id = "34"
		object.id = "42"
		object.serial = "44"
		object.path = "alsa:pcm:0"
		alsa.card = "0"
		alsa.card_name = "HDA NVidia"
		alsa.long_card_name = "HDA NVidia at 0xfc080000 irq 99"
		alsa.driver_name = "snd_hda_intel"
		device.string = "0"
	Profiles:
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
	Active Profile: off

    Card #45
	Name: alsa_card.pci-0000_06_00.6
	Driver: alsa
	Owner Module: n/a
	Properties:
		api.acp.auto-port = "false"
		api.acp.auto-profile = "false"
		api.alsa.card = "1"
		api.alsa.card.longname = "HD-Audio Generic at 0xfc5c0000 irq 100"
		api.alsa.card.name = "HD-Audio Generic"
		api.alsa.path = "hw:1"
		api.alsa.use-acp = "true"
		api.dbus.ReserveDevice1 = "Audio1"
		device.api = "alsa"
		device.bus = "pci"
		device.bus_path = "pci-0000:06:00.6"
		device.description = "Family 17h/19h HD Audio Controller"
		device.enum.api = "udev"
		device.icon_name = "audio-card-analog-pci"
		device.name = "alsa_card.pci-0000_06_00.6"
		device.nick = "HD-Audio Generic"
		device.plugged.usec = "3762193"
		device.product.id = "5603"
		device.product.name = "Family 17h/19h HD Audio Controller"
		device.subsystem = "sound"
		device.sysfs.path = "/sys/devices/pci0000:00/0000:00:08.1/0000:06:00.6/sound/card1"
		device.vendor.id = "4130"
		device.vendor.name = "Advanced Micro Devices, Inc. [AMD]"
		media.class = "Audio/Device"
		factory.id = "14"
		client.id = "34"
		object.id = "43"
		object.serial = "45"
		object.path = "alsa:pcm:1"
		alsa.card = "1"
		alsa.card_name = "HD-Audio Generic"
		alsa.long_card_name = "HD-Audio Generic at 0xfc5c0000 irq 100"
		alsa.driver_name = "snd_hda_intel"
		device.string = "1"
	Profiles:
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
		HiFi: Play HiFi quality Music (sinks: 1, sources: 2, priority: 8000, available: yes)
	Active Profile: HiFi
	Ports:
		[Out] Speaker: Speaker (type: Speaker, priority: 100, latency offset: 0 usec, availability unknown)
			Properties:
				port.type = "speaker"
				card.profile.port = "0"
			Part of profile(s): HiFi
		[Out] Headphones: Headphones (type: Headphones, priority: 200, latency offset: 0 usec, availability group: Headphone, not available)
			Properties:
				port.type = "headphones"
				port.availability-group = "Headphone"
				card.profile.port = "1"
			Part of profile(s): HiFi
		[In] Mic2: Headphones Stereo Microphone (type: Mic, priority: 200, latency offset: 0 usec, availability group: Mic, not available)
			Properties:
				port.type = "mic"
				port.availability-group = "Mic"
				card.profile.port = "2"
			Part of profile(s): HiFi
		[In] Mic1: Digital Microphone (type: Mic, priority: 100, latency offset: 0 usec, availability unknown)
			Properties:
				port.type = "mic"
				card.profile.port = "3"
			Part of profile(s): HiFi
</details>

<details>
<summary> $ pactl list sinks </summary>

    Sink #52
	State: SUSPENDED
	Name: alsa_output.pci-0000_06_00.6.HiFi__hw_Generic__sink
	Description: Family 17h/19h HD Audio Controller Speaker + Headphones
	Driver: PipeWire
	Sample Specification: s32le 2ch 48000Hz
	Channel Map: front-left,front-right
	Owner Module: 4294967295
	Mute: no
	Volume: front-left: 32966 /  50% / -17.90 dB,   front-right: 32966 /  50% / -17.90 dB
	        balance 0.00
	Base Volume: 65536 / 100% / 0.00 dB
	Monitor Source: alsa_output.pci-0000_06_00.6.HiFi__hw_Generic__sink.monitor
	Latency: 0 usec, configured 0 usec
	Flags: HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
	Properties:
		alsa.card = "1"
		alsa.card_name = "HD-Audio Generic"
		alsa.class = "generic"
		alsa.device = "0"
		alsa.driver_name = "snd_hda_intel"
		alsa.id = "ALC245 Analog"
		alsa.long_card_name = "HD-Audio Generic at 0xfc5c0000 irq 100"
		alsa.mixer_device = "_ucm0003.hw:Generic"
		alsa.name = "ALC245 Analog"
		alsa.resolution_bits = "16"
		alsa.subclass = "generic-mix"
		alsa.subdevice = "0"
		alsa.subdevice_name = "subdevice #0"
		api.alsa.card.longname = "HD-Audio Generic at 0xfc5c0000 irq 100"
		api.alsa.card.name = "HD-Audio Generic"
		api.alsa.open.ucm = "true"
		api.alsa.path = "hw:Generic"
		api.alsa.pcm.card = "1"
		api.alsa.pcm.stream = "playback"
		audio.channels = "2"
		audio.position = "FL,FR"
		card.profile.device = "0"
		device.api = "alsa"
		device.class = "sound"
		device.id = "43"
		device.profile.description = "Speaker + Headphones"
		device.profile.name = "HiFi: hw:Generic: sink"
		device.routes = "2"
		factory.name = "api.alsa.pcm.sink"
		media.class = "Audio/Sink"
		device.description = "Family 17h/19h HD Audio Controller Speaker + Headphones"
		node.name = "alsa_output.pci-0000_06_00.6.HiFi__hw_Generic__sink"
		node.nick = "ALC245 Analog"
		node.pause-on-idle = "false"
		object.path = "alsa:pcm:1:hw:Generic:playback"
		priority.driver = "1000"
		priority.session = "1000"
		factory.id = "18"
		clock.quantum-limit = "8192"
		client.id = "34"
		node.driver = "true"
		factory.mode = "merge"
		audio.adapt.follower = ""
		library.name = "audioconvert/libspa-audioconvert"
		object.id = "50"
		object.serial = "52"
	Ports:
		[Out] Speaker: Speaker (type: Speaker, priority: 100, availability unknown)
		[Out] Headphones: Headphones (type: Headphones, priority: 200, availability group: Headphone, not available)
	Active Port: [Out] Speaker
	Formats:
		pcm
</details>

<details>
<summary> $ journalctl --user -u pipewire </summary>

	Jun 22 19:32:54 acpomen systemd[624]: Started PipeWire Multimedia Service.
	Jun 22 19:32:54 acpomen pipewire[7606]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:32:54 acpomen pipewire[7606]: mod.rt: could not set nice-level to -11: No such file or directory
	Jun 22 19:32:54 acpomen pipewire[7606]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:32:54 acpomen pipewire[7606]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:32:54 acpomen pipewire[7606]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:32:54 acpomen pipewire[7606]: mod.rt: could not make thread 7611 realtime using RTKit: No such file or directory
	Jun 22 19:33:14 acpomen systemd[624]: Stopping PipeWire Multimedia Service...
	Jun 22 19:33:14 acpomen systemd[624]: Stopped PipeWire Multimedia Service.
	-- Boot cffbe11774b045209ebac44a28f3b208 --
	Jun 22 19:40:30 acpomen systemd[710]: Started PipeWire Multimedia Service.
	Jun 22 19:40:30 acpomen pipewire[828]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:40:30 acpomen pipewire[828]: mod.rt: could not set nice-level to -11: No such file or directory
	Jun 22 19:40:30 acpomen pipewire[828]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:40:30 acpomen pipewire[828]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:40:30 acpomen pipewire[828]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 19:40:30 acpomen pipewire[828]: mod.rt: could not make thread 841 realtime using RTKit: No such file or directory
	Jun 22 21:24:34 acpomen systemd[710]: Stopping PipeWire Multimedia Service...
	Jun 22 21:24:34 acpomen systemd[710]: Stopped PipeWire Multimedia Service.
	-- Boot ce4eadd6c5724803a855cdd812d7c3b1 --
	Jun 22 21:24:55 acpomen systemd[671]: Started PipeWire Multimedia Service.
	Jun 22 21:24:55 acpomen pipewire[795]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:24:55 acpomen pipewire[795]: mod.rt: could not set nice-level to -11: No such file or directory
	Jun 22 21:24:55 acpomen pipewire[795]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:24:55 acpomen pipewire[795]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:24:55 acpomen pipewire[795]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:24:55 acpomen pipewire[795]: mod.rt: could not make thread 817 realtime using RTKit: No such file or directory
	Jun 22 21:29:13 acpomen systemd[671]: Stopping PipeWire Multimedia Service...
	Jun 22 21:29:13 acpomen systemd[671]: Stopped PipeWire Multimedia Service.
	-- Boot 84159dbd36c44d528956ced91fa003bc --
	Jun 22 21:29:31 acpomen systemd[692]: Started PipeWire Multimedia Service.
	Jun 22 21:29:31 acpomen pipewire[815]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:29:31 acpomen pipewire[815]: mod.rt: could not set nice-level to -11: No such file or directory
	Jun 22 21:29:31 acpomen pipewire[815]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:29:31 acpomen pipewire[815]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:29:31 acpomen pipewire[815]: mod.rt: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown
	Jun 22 21:29:31 acpomen pipewire[815]: mod.rt: could not make thread 825 realtime using RTKit: No such file or directory
	Jun 22 21:31:26 acpomen systemd[692]: Stopping PipeWire Multimedia Service...
	Jun 22 21:31:26 acpomen systemd[692]: Stopped PipeWire Multimedia Service.
	-- Boot 23fb63f7cfda4de1953f2c4a0b307323 --
	Jun 22 21:32:08 acpomen systemd[678]: Started PipeWire Multimedia Service.
	Jun 23 02:53:10 acpomen systemd[678]: Stopping PipeWire Multimedia Service...
	Jun 23 02:53:10 acpomen systemd[678]: Stopped PipeWire Multimedia Service.
	Jun 23 02:53:10 acpomen systemd[678]: pipewire.service: Consumed 48.006s CPU time.
	-- Boot fe356232671a4f5a80b0907d9fb80e14 --
	Jun 23 12:41:30 acpomen systemd[705]: Started PipeWire Multimedia Service.
	Jun 23 22:27:07 acpomen pipewire[1179]: spa.alsa: hdmi:0,5: Channels doesn't match (requested 8, got 6)
	Jun 23 22:27:07 acpomen pipewire[1179]: spa.alsa: hdmi:0,5: Channels doesn't match (requested 8, got 6)
	Jun 23 22:27:07 acpomen pipewire[1179]: spa.alsa: hdmi:0,5: Channels doesn't match (requested 8, got 6)
	Jun 23 22:27:08 acpomen pipewire[1179]: spa.alsa: hw:0,11: Channels doesn't match (requested 8, got 6)
	Jun 23 22:27:08 acpomen pipewire[1179]: spa.alsa: hw:0,11: Channels doesn't match (requested 8, got 6)
	Jun 23 22:27:08 acpomen pipewire[1179]: spa.alsa: hw:0,11: Channels doesn't match (requested 8, got 6)
	Jun 24 02:05:47 acpomen systemd[705]: Stopping PipeWire Multimedia Service...
	Jun 24 02:05:47 acpomen systemd[705]: Stopped PipeWire Multimedia Service.
	Jun 24 02:05:47 acpomen systemd[705]: pipewire.service: Consumed 1min 9.342s CPU time.
	-- Boot 2c6154fab18a4a5594b6357264a845ff --
	Jun 24 12:06:07 acpomen systemd[708]: Started PipeWire Multimedia Service.
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: pw.node: (alsa_output.pci-0000_01_00.1.pro-output-10-78) suspended -> error (Start error: Device or resource busy)
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: pw.node: (alsa_output.pci-0000_01_00.1.pro-output-11-79) suspended -> error (Start error: Device or resource busy)
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 24 15:42:27 acpomen pipewire[1140]: pw.link: 0x55a4586a0f10: port 0x55a457909450 can't set io:1 (Spa:Enum:IO:Buffers): Invalid argument
	Jun 24 15:42:27 acpomen pipewire[1140]: pw.link: 0x55a4586a0f10: port 0x55a457909450 can't set io:1 (Spa:Enum:IO:Buffers): Invalid argument
	Jun 24 17:01:55 acpomen systemd[708]: Stopping PipeWire Multimedia Service...
	Jun 24 17:01:55 acpomen systemd[708]: Stopped PipeWire Multimedia Service.
	Jun 24 17:01:55 acpomen systemd[708]: pipewire.service: Consumed 23.174s CPU time.
	-- Boot 2cae9b322eeb4d01b875c6ad08ceaa01 --
	Jun 24 17:02:40 acpomen systemd[672]: Started PipeWire Multimedia Service.
	Jun 24 22:29:37 acpomen systemd[672]: Stopping PipeWire Multimedia Service...
	Jun 24 22:29:37 acpomen systemd[672]: Stopped PipeWire Multimedia Service.
	Jun 24 22:29:37 acpomen systemd[672]: pipewire.service: Consumed 32.107s CPU time.
	-- Boot d0598bf6fa6f4cabb8564254d1618467 --
	Jun 26 19:14:11 acpomen systemd[667]: Started PipeWire Multimedia Service.
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: pw.node: (alsa_output.pci-0000_01_00.1.pro-output-10-58) suspended -> error (Start error: Device or resource busy)
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 26 19:15:01 acpomen pipewire[1087]: pw.node: (alsa_output.pci-0000_01_00.1.pro-output-11-49) suspended -> error (Start error: Device or resource busy)
	Jun 26 23:26:35 acpomen systemd[667]: Stopping PipeWire Multimedia Service...
	Jun 26 23:26:35 acpomen systemd[667]: Stopped PipeWire Multimedia Service.
	Jun 26 23:26:35 acpomen systemd[667]: pipewire.service: Consumed 29.662s CPU time.
	-- Boot e754f78daab143569c36d8be663986ae --
	Jun 28 17:10:19 acpomen systemd[752]: Started PipeWire Multimedia Service.
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: pw.node: (alsa_output.pci-0000_01_00.1.pro-output-10-78) suspended -> error (Start error: Device or resource busy)
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,10': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.alsa: 'hw:0,11': playback open failed: Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: spa.audioadapter: params Spa:Enum:ParamId:EnumFormat: 0:0 (follower format) Device or resource busy
	Jun 28 18:49:19 acpomen pipewire[1277]: pw.node: (alsa_output.pci-0000_01_00.1.pro-output-11-79) suspended -> error (Start error: Device or resource busy)
	Jun 28 18:49:19 acpomen pipewire[1277]: pw.link: 0x556e964bf250: port 0x556e9576fc80 can't set io:1 (Spa:Enum:IO:Buffers): Invalid argument
	Jun 28 18:49:19 acpomen pipewire[1277]: pw.link: 0x556e964bf250: port 0x556e9576fc80 can't set io:1 (Spa:Enum:IO:Buffers): Invalid argument
	Jun 28 15:44:26 acpomen systemd[752]: Stopping PipeWire Multimedia Service...
	Jun 28 15:44:26 acpomen systemd[752]: Stopped PipeWire Multimedia Service.
	Jun 28 15:44:26 acpomen systemd[752]: pipewire.service: Consumed 49.188s CPU time.
	-- Boot 9c1e5f7301a64e9180bd6a9bf6cb3ec6 --
	Jun 28 15:45:13 acpomen systemd[696]: Started PipeWire Multimedia Service.
	Jun 28 16:05:17 acpomen systemd[696]: Stopping PipeWire Multimedia Service...
	Jun 28 16:05:17 acpomen systemd[696]: Stopped PipeWire Multimedia Service.
	-- Boot 619883556f584c45b36b0072399b3621 --
	Jun 28 16:05:38 acpomen systemd[678]: Started PipeWire Multimedia Service.
	Jun 28 16:07:51 acpomen systemd[678]: Stopping PipeWire Multimedia Service...
	Jun 28 16:07:51 acpomen systemd[678]: Stopped PipeWire Multimedia Service.
	Jun 28 16:07:51 acpomen systemd[678]: Started PipeWire Multimedia Service.
	Jun 28 16:13:04 acpomen systemd[678]: Stopping PipeWire Multimedia Service...
	Jun 28 16:13:04 acpomen systemd[678]: Stopped PipeWire Multimedia Service.
	-- Boot 017f208f301c4e3787ee98c5827a39eb --
	Jun 28 16:13:22 acpomen systemd[682]: Started PipeWire Multimedia Service.
	Jun 28 16:16:30 acpomen systemd[682]: Stopping PipeWire Multimedia Service...
	Jun 28 16:16:30 acpomen systemd[682]: Stopped PipeWire Multimedia Service.
	-- Boot b9c9a99d501148028e7db65ec457fd0a --
	Jun 28 16:16:50 acpomen systemd[665]: Started PipeWire Multimedia Service.
	Jun 28 16:34:10 acpomen systemd[665]: Stopping PipeWire Multimedia Service...
	Jun 28 16:34:10 acpomen systemd[665]: Stopped PipeWire Multimedia Service.
	Jun 28 16:43:22 acpomen systemd[665]: Started PipeWire Multimedia Service.
</details>

Please, let me know if you need any relevent logs. I'm not sure which ones to post.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/245
Repository URL: https://github.com/alsa-project/alsa-lib
