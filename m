Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699444EFD7F
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 02:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF02318A8;
	Sat,  2 Apr 2022 02:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF02318A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648860139;
	bh=4n9t756Zular8enwAgPybYyZV5SkuRMqQgf6o+xtesQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ND/3jF4P55+26Um2smaYQnJcZ9ooXVTjKFzPPqNDXiYMN0cYyOAyVMxC3ZXPT3Jf4
	 CJ5o3kHtklbGg3fyXU1Lux6GXW7yV+plZbkhJ8dSfyhrvmYBmbzv0QIW1O14PUZAD9
	 BPhklZ9viVXGaSpML4axPZY7kawzJv0o7H0LDKiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 491CFF8032D;
	Sat,  2 Apr 2022 02:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F554F80279; Sat,  2 Apr 2022 02:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 49B07F80100
 for <alsa-devel@alsa-project.org>; Sat,  2 Apr 2022 02:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B07F80100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648860061568669081-webhooks-bot@alsa-project.org>
References: <1648860061568669081-webhooks-bot@alsa-project.org>
Subject: Cannot run amixer due to: helem (MIXER, 'Mic Boost Volume', 0, 1,
 0) appears twice or more
Message-Id: <20220402004109.0F554F80279@alsa1.perex.cz>
Date: Sat,  2 Apr 2022 02:41:09 +0200 (CEST)
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

alsa-project/alsa-lib issue #220 was opened from 0jrp0:

After a recent update to Debian, I am receiving the following error:

```shell
$ amixer
ALSA lib simple_none.c:1555:(simple_add1) helem (MIXER,'Mic Boost Volume',0,1,0) appears twice or more
amixer: Mixer default load error: Invalid argument
```

I attempted to remove `/var/lib/alsa/asound.state`, but it didn't help. If I run `alsactl restore`, it does nothing. If I run `alsactl store`, it just dumps the duplicate Mic Boost Volume entry again.

I have an HDMI device that I don't use where this is possibly coming from. I attempted to blacklist the kernel module for `snd_hda_codec_hdmi`, but it didn't help (nor could I figure out how to persist the black list across reboots even after modifying `/etc/modprobe.d/`).

My current setup is using `pipewire` using the `pipewire-pulse` binary which connects up to `alsa`.

Some info:

```
$ pactl list short sinks
89      alsa_output.pci-0000_00_1f.3.pro-output-0       PipeWire        s32le 2ch 48000Hz       SUSPENDED
90      alsa_output.pci-0000_00_1f.3.pro-output-4       PipeWire        s32le 2ch 48000Hz       SUSPENDED
111     bluez_output.04_52_C7_B0_B3_08.a2dp-sink        PipeWire        s16le 2ch 48000Hz       SUSPENDED
```

```
$ sudo dmesg |grep snd
[   24.786073] snd_hda_intel 0000:00:1f.3: enabling device (0140 -> 0142)
[   24.786637] snd_hda_intel 0000:65:00.1: enabling device (0140 -> 0142)
[   24.786746] snd_hda_intel 0000:65:00.1: Disabling MSI
[   24.786790] snd_hda_intel 0000:65:00.1: Handle vga_switcheroo audio client
[   24.814739] snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
[   24.814745] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   24.814748] snd_hda_codec_generic hdaudioC0D0:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   24.814751] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
[   24.814752] snd_hda_codec_generic hdaudioC0D0:    inputs:
[   24.814754] snd_hda_codec_generic hdaudioC0D0:      Mic=0x18
[   24.814756] snd_hda_codec_generic hdaudioC0D0:      Line=0x1a
[   24.832905] snd_hda_codec_generic hdaudioC0D1: autoconfig for Generic: line_outs=1 (0x1b/0x0/0x0/0x0/0x0) type:speaker
[   24.832912] snd_hda_codec_generic hdaudioC0D1:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   24.832914] snd_hda_codec_generic hdaudioC0D1:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   24.832916] snd_hda_codec_generic hdaudioC0D1:    mono: mono_out=0x0
[   24.832917] snd_hda_codec_generic hdaudioC0D1:    inputs:
[   24.832918] snd_hda_codec_generic hdaudioC0D1:      Mic=0x19
[   24.837834] snd_hda_intel 0000:00:1f.3: control 2:0:0:Capture Volume:0 is already present
[   24.837840] snd_hda_intel 0000:00:1f.3: control 2:0:0:Capture Switch:0 is already present
[   24.837843] snd_hda_intel 0000:00:1f.3: control 2:0:0:Mic Boost Volume:0 is already present
[   24.966257] usbcore: registered new interface driver snd-usb-audio
```

```
$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: Generic Analog [Generic Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 4: Generic Analog [Generic Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

```
$ lspci -v
...
00:1f.3 Audio device: Intel Corporation 200 Series PCH HD Audio
        Subsystem: Lenovo 200 Series PCH HD Audio
        Flags: bus master, fast devsel, latency 32, IRQ 65, NUMA node 0, IOMMU group 21
        Memory at 43ffff20000 (64-bit, non-prefetchable) [size=16K]
        Memory at 43ffff00000 (64-bit, non-prefetchable) [size=64K]
        Capabilities: <access denied>
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel
...
```

```
$ inxi -SAxc 0
System:
  Host: {redacted} Kernel: 5.15.15-{redacted}-amd64 x86_64
    bits: 64 compiler: gcc v: 11.2.0 Desktop: awesome 4.3
    Distro: Debian GNU/Linux 12 
Audio:
  Device-1: Intel 200 Series PCH HD Audio vendor: Lenovo
    driver: snd_hda_intel v: kernel bus-ID: 00:1f.3
  Device-2: NVIDIA GP107GL High Definition Audio driver: snd_hda_intel
    v: kernel bus-ID: 65:00.1
  Device-3: Logitech Webcam C930e type: USB driver: snd-usb-audio,uvcvideo
    bus-ID: 1-14:9
  Sound Server-1: ALSA v: k5.15.15-1rodete2-amd64 running: yes
  Sound Server-2: PulseAudio v: 15.0 running: no
  Sound Server-3: PipeWire v: 0.3.47 running: yes
```

```
$ head -n 1 /proc/asound/card0/codec*
==> /proc/asound/card0/codec#0 <==
Codec: Realtek Generic

==> /proc/asound/card0/codec#1 <==
Codec: Realtek Generic
```

```
$ /bin/cat /etc/modprobe.d/alsa-base.conf 
options snd-hda-intel model=generic
```

```
$ aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
lavrate
    Rate Converter Plugin Using Libav/FFmpeg Library
samplerate
    Rate Converter Plugin Using Samplerate Library
speexrate
    Rate Converter Plugin Using Speex Resampler
jack
    JACK Audio Connection Kit
oss
    Open Sound System
pulse
    PulseAudio Sound Server
upmix
    Plugin for channel upmix (4,6,8)
vdownmix
    Plugin for channel downmix (stereo) with a simple spacialization
hw:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    Direct hardware device without any conversions
hw:CARD=PCH,DEV=4
    HDA Intel PCH, Generic Analog
    Direct hardware device without any conversions
plughw:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    Hardware device with all software conversions
plughw:CARD=PCH,DEV=4
    HDA Intel PCH, Generic Analog
    Hardware device with all software conversions
default:CARD=PCH
    HDA Intel PCH, Generic Analog
    Default Audio Device
sysdefault:CARD=PCH
    HDA Intel PCH, Generic Analog
    Default Audio Device
front:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    Front output / input
surround21:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    2.1 Surround output to Front and Subwoofer speakers
surround40:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    4.0 Surround output to Front and Rear speakers
surround41:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
dmix:CARD=PCH,DEV=0
    HDA Intel PCH, Generic Analog
    Direct sample mixing device
dmix:CARD=PCH,DEV=4
    HDA Intel PCH, Generic Analog
    Direct sample mixing device
usbstream:CARD=PCH
    HDA Intel PCH
    USB Stream Output
usbstream:CARD=C930e
    Logitech Webcam C930e
    USB Stream Output
hw:CARD=NVidia,DEV=3
    HDA NVidia, HDMI 0
    Direct hardware device without any conversions
hw:CARD=NVidia,DEV=7
    HDA NVidia, HDMI 1
    Direct hardware device without any conversions
hw:CARD=NVidia,DEV=8
    HDA NVidia, HDMI 2
    Direct hardware device without any conversions
hw:CARD=NVidia,DEV=9
    HDA NVidia, HDMI 3
    Direct hardware device without any conversions
plughw:CARD=NVidia,DEV=3
    HDA NVidia, HDMI 0
    Hardware device with all software conversions
plughw:CARD=NVidia,DEV=7
    HDA NVidia, HDMI 1
    Hardware device with all software conversions
plughw:CARD=NVidia,DEV=8
    HDA NVidia, HDMI 2
    Hardware device with all software conversions
plughw:CARD=NVidia,DEV=9
    HDA NVidia, HDMI 3
    Hardware device with all software conversions
hdmi:CARD=NVidia,DEV=0
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=1
    HDA NVidia, HDMI 1
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=2
    HDA NVidia, HDMI 2
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=3
    HDA NVidia, HDMI 3
    HDMI Audio Output
dmix:CARD=NVidia,DEV=3
    HDA NVidia, HDMI 0
    Direct sample mixing device
dmix:CARD=NVidia,DEV=7
    HDA NVidia, HDMI 1
    Direct sample mixing device
dmix:CARD=NVidia,DEV=8
    HDA NVidia, HDMI 2
    Direct sample mixing device
dmix:CARD=NVidia,DEV=9
    HDA NVidia, HDMI 3
    Direct sample mixing device
usbstream:CARD=NVidia
    HDA NVidia
    USB Stream Output
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/220
Repository URL: https://github.com/alsa-project/alsa-lib
