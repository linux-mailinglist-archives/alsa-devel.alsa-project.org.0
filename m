Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC753BFD8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 22:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A17CF18E8;
	Thu,  2 Jun 2022 22:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A17CF18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654201807;
	bh=+EEnn6VVfjFYehjkbFUij/d3QeWPSweoXHMl439udUw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3WoqKnwX+j7Lqllsemek43sk+R/5NG5k/jFM0BfG0MUsXIN6t7HoDiQ0oy1Y4OQc
	 I4PdHYmh7LjhDSnNRnQ8SbZVagatIk6VqjjJLjgtLbQVC/qhCiZnnfN1Az1+ltPth9
	 Xsk1CGytrYll+aTkU91aRKarRds0WbMBfxqPRmhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0918EF80236;
	Thu,  2 Jun 2022 22:29:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA20EF80236; Thu,  2 Jun 2022 22:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6B87DF80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 22:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B87DF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654201734502451897-webhooks-bot@alsa-project.org>
References: <1654201734502451897-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Steinberg UR44 not getting expected results
Message-Id: <20220602202905.AA20EF80236@alsa1.perex.cz>
Date: Thu,  2 Jun 2022 22:29:05 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #163 was opened from CameronNemo:

I am testing the following software:

* alsa-lib: 1.2.7
* alsa-utils: 1.2.7
* alsa-ucm-conf: 1.2.7

Unfortunately the changes for the Steinberg UR44 do not seem to be working as intended.

I am not seeing the expected mono inputs and stereo outputs that I see defined in `/usr/share/alsa/ucm2/USB-Audio/Steinberg/UR44-HiFi.conf`.

I am seeing the following from `aplay -L`:

```
null
    Discard all samples (playback) or generate zero samples (capture)
default
    Default Audio Device
sysdefault
    Default Audio Device
default:CARD=UR44
    Steinberg UR44, USB Audio
    Default Audio Device
sysdefault:CARD=UR44
    Steinberg UR44, USB Audio
    Default Audio Device
front:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    Front output / input
surround21:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    2.1 Surround output to Front and Subwoofer speakers
surround40:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    4.0 Surround output to Front and Rear speakers
surround41:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
```

And the following from `arecord -L`:

```
null
    Discard all samples (playback) or generate zero samples (capture)
default
    Default Audio Device
sysdefault
    Default Audio Device
default:CARD=UR44
    Steinberg UR44, USB Audio
    Default Audio Device
sysdefault:CARD=UR44
    Steinberg UR44, USB Audio
    Default Audio Device
front:CARD=UR44,DEV=0
    Steinberg UR44, USB Audio
    Front output / input
```

`spa-acp-tool list`:

```
card 0: profiles:2 devices:2 ports:2
    profile 0: name:"off" prio:0 (available: yes)
  * profile 1: name:"Direct" prio:1 (available: unknown)
  * port 0: name:"[Out] Direct" direction:playback prio:1000 (available: unknown)
  * port 1: name:"[In] Direct" direction:capture prio:1000 (available: unknown)
  * device 0: direction:playback name:"Direct: hw:UR44: sink" prio:1000 flags:00000009 devices: "hw:UR44" 
  * device 1: direction:capture name:"Direct: hw:UR44: source" prio:1000 flags:00000009 devices: "hw:UR44" 
```

`pactl list sources`:

```
Source #56
	State: SUSPENDED
	Name: alsa_output.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__sink.monitor
	Description: Monitor of Steinberg UR44 Direct Steinberg UR44
	Driver: PipeWire
	Sample Specification: s24le 4ch 48000Hz
	Channel Map: front-left,front-right,rear-left,rear-right
	Owner Module: 4294967295
	Mute: no
	Volume: front-left: 65536 / 100% / 0.00 dB,   front-right: 65536 / 100% / 0.00 dB,   rear-left: 65536 / 100% / 0.00 dB,   rear-right: 65536 / 100% / 0.00 dB
	        balance 0.00
	Base Volume: 65536 / 100% / 0.00 dB
	Monitor of Sink: alsa_output.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__sink
	Latency: 0 usec, configured 0 usec
	Flags: HARDWARE DECIBEL_VOLUME LATENCY 
	Properties:
		object.path = "alsa:pcm:0:hw:UR44:playback"
		api.alsa.path = "hw:UR44"
		api.alsa.open.ucm = "true"
		api.alsa.pcm.card = "0"
		api.alsa.pcm.stream = "playback"
		audio.channels = "4"
		audio.position = "FL,FR,RL,RR"
		device.routes = "1"
		alsa.mixer_device = "_ucm0003.hw:UR44"
		alsa.resolution_bits = "24"
		device.api = "alsa"
		device.class = "monitor"
		alsa.class = "generic"
		alsa.subclass = "generic-mix"
		alsa.name = "USB Audio"
		alsa.id = "USB Audio"
		alsa.subdevice = "0"
		alsa.subdevice_name = "subdevice #0"
		alsa.device = "0"
		alsa.card = "0"
		alsa.card_name = "Steinberg UR44"
		alsa.long_card_name = "Yamaha Corporation Steinberg UR44 at usb-0000:04:00.4-1, high speed"
		alsa.driver_name = "snd_usb_audio"
		device.profile.name = "Direct: hw:UR44: sink"
		device.profile.description = "Direct Steinberg UR44"
		card.profile.device = "0"
		device.id = "54"
		factory.name = "api.alsa.pcm.sink"
		priority.driver = "1000"
		priority.session = "1000"
		media.class = "Audio/Sink"
		node.nick = "Steinberg UR44"
		node.name = "alsa_output.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__sink"
		device.description = "Steinberg UR44 Direct Steinberg UR44"
		device.icon_name = "audio-card"
		device.bus = "usb"
		device.bus_path = "pci-0000:04:00.4-usb-0:1:1.0"
		node.pause-on-idle = "false"
		factory.id = "18"
		client.id = "34"
		clock.quantum-limit = "8192"
		node.driver = "true"
		factory.mode = "merge"
		audio.adapt.follower = ""
		library.name = "audioconvert/libspa-audioconvert"
		object.id = "56"
		object.serial = "56"
	Formats:
		pcm

Source #57
	State: SUSPENDED
	Name: alsa_input.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__source
	Description: Steinberg UR44 Direct Steinberg UR44
	Driver: PipeWire
	Sample Specification: s24le 6ch 48000Hz
	Channel Map: front-left,front-right,rear-left,rear-right,front-center,lfe
	Owner Module: 4294967295
	Mute: no
	Volume: front-left: 48287 /  74% / -7.96 dB,   front-right: 48287 /  74% / -7.96 dB,   rear-left: 48287 /  74% / -7.96 dB,   rear-right: 48287 /  74% / -7.96 dB,   front-center: 48287 /  74% / -7.96 dB,   lfe: 48287 /  74% / -7.96 dB
	        balance 0.00
	Base Volume: 65536 / 100% / 0.00 dB
	Monitor of Sink: n/a
	Latency: 0 usec, configured 0 usec
	Flags: HARDWARE DECIBEL_VOLUME LATENCY 
	Properties:
		object.path = "alsa:pcm:0:hw:UR44:capture"
		api.alsa.path = "hw:UR44"
		api.alsa.open.ucm = "true"
		api.alsa.pcm.card = "0"
		api.alsa.pcm.stream = "capture"
		audio.channels = "6"
		audio.position = "FL,FR,RL,RR,FC,LFE"
		device.routes = "1"
		alsa.mixer_device = "_ucm0003.hw:UR44"
		alsa.resolution_bits = "24"
		device.api = "alsa"
		device.class = "sound"
		alsa.class = "generic"
		alsa.subclass = "generic-mix"
		alsa.name = "USB Audio"
		alsa.id = "USB Audio"
		alsa.subdevice = "0"
		alsa.subdevice_name = "subdevice #0"
		alsa.device = "0"
		alsa.card = "0"
		alsa.card_name = "Steinberg UR44"
		alsa.long_card_name = "Yamaha Corporation Steinberg UR44 at usb-0000:04:00.4-1, high speed"
		alsa.driver_name = "snd_usb_audio"
		device.profile.name = "Direct: hw:UR44: source"
		device.profile.description = "Direct Steinberg UR44"
		card.profile.device = "1"
		device.id = "54"
		factory.name = "api.alsa.pcm.source"
		priority.driver = "2000"
		priority.session = "2000"
		media.class = "Audio/Source"
		node.nick = "Steinberg UR44"
		node.name = "alsa_input.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__source"
		device.description = "Steinberg UR44 Direct Steinberg UR44"
		device.icon_name = "audio-input-microphone"
		device.bus = "usb"
		device.bus_path = "pci-0000:04:00.4-usb-0:1:1.0"
		node.pause-on-idle = "false"
		factory.id = "18"
		client.id = "34"
		clock.quantum-limit = "8192"
		node.driver = "true"
		factory.mode = "split"
		audio.adapt.follower = ""
		library.name = "audioconvert/libspa-audioconvert"
		object.id = "57"
		object.serial = "57"
	Ports:
		[In] Direct: Direct Steinberg UR44 (type: Unknown, priority: 1000, availability unknown)
	Active Port: [In] Direct
	Formats:
		pcm
```

`pactl list sinks`:

```
Sink #56
	State: SUSPENDED
	Name: alsa_output.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__sink
	Description: Steinberg UR44 Direct Steinberg UR44
	Driver: PipeWire
	Sample Specification: s24le 4ch 48000Hz
	Channel Map: front-left,front-right,rear-left,rear-right
	Owner Module: 4294967295
	Mute: no
	Volume: front-left: 48287 /  74% / -7.96 dB,   front-right: 48287 /  74% / -7.96 dB,   rear-left: 48287 /  74% / -7.96 dB,   rear-right: 48287 /  74% / -7.96 dB
	        balance 0.00
	Base Volume: 65536 / 100% / 0.00 dB
	Monitor Source: alsa_output.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__sink.monitor
	Latency: 0 usec, configured 0 usec
	Flags: HARDWARE DECIBEL_VOLUME LATENCY 
	Properties:
		object.path = "alsa:pcm:0:hw:UR44:playback"
		api.alsa.path = "hw:UR44"
		api.alsa.open.ucm = "true"
		api.alsa.pcm.card = "0"
		api.alsa.pcm.stream = "playback"
		audio.channels = "4"
		audio.position = "FL,FR,RL,RR"
		device.routes = "1"
		alsa.mixer_device = "_ucm0003.hw:UR44"
		alsa.resolution_bits = "24"
		device.api = "alsa"
		device.class = "sound"
		alsa.class = "generic"
		alsa.subclass = "generic-mix"
		alsa.name = "USB Audio"
		alsa.id = "USB Audio"
		alsa.subdevice = "0"
		alsa.subdevice_name = "subdevice #0"
		alsa.device = "0"
		alsa.card = "0"
		alsa.card_name = "Steinberg UR44"
		alsa.long_card_name = "Yamaha Corporation Steinberg UR44 at usb-0000:04:00.4-1, high speed"
		alsa.driver_name = "snd_usb_audio"
		device.profile.name = "Direct: hw:UR44: sink"
		device.profile.description = "Direct Steinberg UR44"
		card.profile.device = "0"
		device.id = "54"
		factory.name = "api.alsa.pcm.sink"
		priority.driver = "1000"
		priority.session = "1000"
		media.class = "Audio/Sink"
		node.nick = "Steinberg UR44"
		node.name = "alsa_output.usb-Yamaha_Corporation_Steinberg_UR44-00.Direct__hw_UR44__sink"
		device.description = "Steinberg UR44 Direct Steinberg UR44"
		device.icon_name = "audio-card"
		device.bus = "usb"
		device.bus_path = "pci-0000:04:00.4-usb-0:1:1.0"
		node.pause-on-idle = "false"
		factory.id = "18"
		client.id = "34"
		clock.quantum-limit = "8192"
		node.driver = "true"
		factory.mode = "merge"
		audio.adapt.follower = ""
		library.name = "audioconvert/libspa-audioconvert"
		object.id = "56"
		object.serial = "56"
	Ports:
		[Out] Direct: Direct Steinberg UR44 (type: Unknown, priority: 1000, availability unknown)
	Active Port: [Out] Direct
	Formats:
		pcm
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/163
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
