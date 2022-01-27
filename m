Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC249EA81
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 19:46:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFBD01695;
	Thu, 27 Jan 2022 19:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFBD01695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643309192;
	bh=nCZNaEpdiUzQae7rHRg+7EWNZ8nORTJO61KbqlAViAA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdhBzPtt51tRysfM8r5stp3j887nrR/Ca4p7UTpM4gZgDwiW2Q4pTiZrQPv0VjD0F
	 Gyp4D540USJNGv4UP5AsurHQakDCLnG8fqBvVoDp1Ji7W2CoBgzr5H3ZT0FrCUP2Sn
	 0sL3ztqnq21OF6gmtvLmS5JCLHPGF3Wa10Q8spSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF99F8025A;
	Thu, 27 Jan 2022 19:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4509F800C8; Thu, 27 Jan 2022 19:45:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F0EE1F800C8
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 19:45:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0EE1F800C8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1643309117056905985-webhooks-bot@alsa-project.org>
References: <1643309117056905985-webhooks-bot@alsa-project.org>
Subject: ucm2: Add intial Amlogic GXL support
Message-Id: <20220127184523.A4509F800C8@alsa1.perex.cz>
Date: Thu, 27 Jan 2022 19:45:23 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #137 was opened from jeromebrunet:

This adds the support for the GXL-P241 and the LIBRETECH-CC.
I have proposed the related ucm-validator PR: https://github.com/alsa-project/alsa-tests/pull/23

I was not successful with txt check:
```
!!Sysfs card info
!!---------------

Traceback (most recent call last):
  File "/home/jbrunet/work/generic/sound/alsa-tests/python/ucm-validator/./ucm.py", line 238, in <module>
    main(sys.argv)
  File "/home/jbrunet/work/generic/sound/alsa-tests/python/ucm-validator/./ucm.py", line 233, in main
    r = globals()[cmd](*argv[2:])
  File "/home/jbrunet/work/generic/sound/alsa-tests/python/ucm-validator/./ucm.py", line 185, in do_configs
    errors, warnings = config_walk(alsainfo_path)
  File "/home/jbrunet/work/generic/sound/alsa-tests/python/ucm-validator/./ucm.py", line 129, in config_walk
    errors1, warnings1 = config_walk(path2)
  File "/home/jbrunet/work/generic/sound/alsa-tests/python/ucm-validator/./ucm.py", line 142, in config_walk
    info.load(path2)
  File "/home/jbrunet/work/generic/sound/alsa-tests/python/ucm-validator/../lib/alsainfo.py", line 314, in load
    raise AlsaInfoError("%s: unknown section %s" % (filename, repr(name)))
alsainfo.AlsaInfoError: configs/Meson/LIBRETECH-CC.txt: unknown section 'Sysfs card info'
```

I also check with the dummy json:
```
*** configuration 'configs/Meson/GXL-P241.json' @ AlsaJsonSoundcard(json='GXL-P241', id='GXL-P241', driver='gx-sound-card', name='GXL-P241', longname='GXL-P241') ***
Device file 'conf.d/gx-sound-card/GXL-P241.conf'
Verb 'HiFi', file 'Meson/p241/p241-HiFi.conf'
Device 'Line'
Device 'HDMI'
ERR: conf.d/gx-sound-card/GXL-P241.conf: Verb=HiFi Device=Line PlaybackPCM defined in SectionVerb
ERR:   AlsaJsonSoundcard(json='GXL-P241', id='GXL-P241', driver='gx-sound-card', name='GXL-P241', longname='GXL-P241')
ERR: total errors: 1
```

I'm not quite sure where to put the `PlaybackPCM`, if not in `Verb`.
The `Device ` section in not a good fit, as far as I understand.
On these devices, we have a single PCM interface. HDMI and Line Devices may be enabled on it (possibly simultaneously).

Any suggestion ? 

Looking at pulseaudio, I'm quite happy with the result:
```
$ pactl list sinks
Sink #0
	State: SUSPENDED
	Name: alsa_output.platform-sound.HiFi__hw_LIBRETECHCC_0__sink
	Description: Built-in Audio HDMI + Analog Lineout
	Driver: module-alsa-card.c
	Sample Specification: s16le 2ch 44100Hz
	Channel Map: front-left,front-right
	Owner Module: 6
	Mute: no
	Volume: front-left: 65536 / 100% / 0.00 dB,   front-right: 65536 / 100% / 0.00 dB
	        balance 0.00
	Base Volume: 65536 / 100% / 0.00 dB
	Monitor Source: alsa_output.platform-sound.HiFi__hw_LIBRETECHCC_0__sink.monitor
	Latency: 0 usec, configured 0 usec
	Flags: HARDWARE DECIBEL_VOLUME LATENCY 
	Properties:
		alsa.resolution_bits = "16"
		device.api = "alsa"
		device.class = "sound"
		alsa.class = "generic"
		alsa.subclass = "generic-mix"
		alsa.name = ""
		alsa.id = "fe.dai-link-0 (*)"
		alsa.subdevice = "0"
		alsa.subdevice_name = "subdevice #0"
		alsa.device = "0"
		alsa.card = "0"
		alsa.card_name = "LIBRETECH-CC"
		alsa.long_card_name = "LIBRETECH-CC"
		alsa.driver_name = "snd_soc_meson_gx_sound_card"
		device.bus_path = "platform-sound"
		sysfs.path = "/devices/platform/sound/sound/card0"
		device.form_factor = "internal"
		device.string = "_ucm0001.hw:LIBRETECHCC,0"
		device.buffering.buffer_size = "352768"
		device.buffering.fragment_size = "176384"
		device.access_mode = "mmap+timer"
		device.profile.name = "HiFi: hw:LIBRETECHCC,0: sink"
		device.profile.description = "HDMI + Analog Lineout"
		alsa.mixer_device = "_ucm0001.hw:LIBRETECHCC"
		device.description = "Built-in Audio HDMI + Analog Lineout"
		module-udev-detect.discovered = "1"
		device.icon_name = "audio-card"
	Ports:
		[Out] HDMI: HDMI (type: HDMI, priority: 100, availability unknown)
		[Out] Line: Analog Lineout (type: Line, priority: 100, availability unknown)
	Active Port: [Out] HDMI
	Formats:
		pcm
```

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/137
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/137.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
