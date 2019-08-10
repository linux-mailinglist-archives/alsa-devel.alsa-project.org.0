Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607388C60
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 19:07:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C471663;
	Sat, 10 Aug 2019 19:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C471663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565456870;
	bh=UfDBOzBxs42NdchPN6Vm2zScBNbEkRO+ttbt6xV79Ik=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U+ngQ0zomGuQ6SbxlG72bUfsL2ZBn84Zc4kt3KTfA2h9JWUfWmk5FvKRXkZo37hq2
	 xRmk6hm3IJEPa7o3FxY4RqbXnWFxvqWaHQQBr4guW+G39W2T2u46bkzbWcJQoEa7Rl
	 Y9ptc+HF4Ij1n/1vVFRRYMxx24ONrGlMTXzbVNSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA62F80506;
	Sat, 10 Aug 2019 19:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 595F3F80506; Sat, 10 Aug 2019 19:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94694F801A4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 19:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94694F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iNAG5ylr"
Received: by mail-qt1-x829.google.com with SMTP id y26so98972444qto.4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=84bbHiG39P/i0aYyZTPviLiplNpaxturxOykM9UiG5M=;
 b=iNAG5ylrsK/84P5vpvhscQRK9d78sJLzi3nfcP4leXNStfUuMya4iJ3EjfeA716sAz
 deWVUQTHA8ePpQW+PWxeKaCd9Wzby+p9qF9dGGUoJi3u8tv3ek+N/Cbo37rxYbupLPME
 gEvlCG97OBcvS8zuZQBMn99qG6El2ezlEpozEb0CaIpOdkda8X5rFaZ1mA9mH58k6f+h
 2NsH9Vrquls10RYsPGIgnEBk9pIyaEoUe/Ou6l7cgWMxpMSPCyGA0HgPUd9YXDYLoPFO
 IvzNN5/hISCWUMzbcFSb38jtacxQy0Y3jkRlpoow1mXLoYkeUH3Xqh5XlwbfYQXCxeTb
 Whdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=84bbHiG39P/i0aYyZTPviLiplNpaxturxOykM9UiG5M=;
 b=UaMHQckRX3xn3GMq9Nd5GBIjj7RwjG9rFsHO/N4lO8QROHKirQrxLPqjNlp5TdYPzv
 GJ9I0YGVph658mkE6FANlAJ0oBh2sqRyLr+Rvht7jadl+cIMyY4/SYD8Xlc44olJI1kA
 p+uWB51BqZ3xgoP2gVIk8xvJ6Rw4/H78170UF4Rc1rl+dL9iaUKSaNUnH4qx/D+K1otO
 bYtVom0noADFsFOj4MpSQBs9hcT2OJ9GRz1x8PSrBpBDzc/K8KQmlNbuBW3AE+uSt/Re
 VjU3tVuGNVm+i8zqntcgp3hIiab6kOdFel2cnXHIbsaePwO6e/L0CoSKbihCExyKGIE6
 upaQ==
X-Gm-Message-State: APjAAAUAPpabjMNcSvkDcTDW/pQUsguoKwOcM4Hhiztg/5R62cQ8xKsd
 5R+d17JywWn8MwfLdPzxKG96OZLThlhAHqyQ/0YLHvfH
X-Google-Smtp-Source: APXvYqx9RGgE2x632TL1Rv+GHQA9vtC7bW11uvDOAd4gSi4UmcOD17PNUkOo+6ic2qqjIf4vm7Bl5XsBmFMa55LPIdc=
X-Received: by 2002:ac8:7552:: with SMTP id b18mr23444605qtr.235.1565456757213; 
 Sat, 10 Aug 2019 10:05:57 -0700 (PDT)
MIME-Version: 1.0
From: Pavel Hofman <pavhofman@gmail.com>
Date: Sat, 10 Aug 2019 19:05:46 +0200
Message-ID: <CA+SWvNw__saBd3udOLgY8ei7ndjmNYy4SFTJnoP202CoknGDgw@mail.gmail.com>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] bcm2835.conf for RPi v. 4 incl. HDMI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, may I ask for help with cards/bcm2835.conf for the new RPi? No
such config exists yet:

pi@raspberrypi:~ $ strace -f aplay -L 2>&1 | grep -i bcm2835
access("/usr/share/alsa/cards/bcm2835_alsa.conf", R_OK) = -1 ENOENT
(No such file or directory)

I understand the _alsa suffix is handled in aliases (e.g.
https://www.raspberrypi.org/forums/viewtopic.php?t=221734#p1361104 )

The reason I am looking for this file are Pulseaudio profiles. PA
requires front:X, surroundX, hdmi:X, etc. PCM devices, yet non of
these are created due to the missing card config:

pi@raspberrypi:~ $ aplay -L
default
    Playback/recording through the PulseAudio sound server
null
    Discard all samples (playback) or generate zero samples (capture)
jack
    JACK Audio Connection Kit
pulse
    PulseAudio Sound Server
sysdefault:CARD=ALSA
    bcm2835 ALSA, bcm2835 ALSA
    Default Audio Device
dmix:CARD=ALSA,DEV=0
    bcm2835 ALSA, bcm2835 ALSA
    Direct sample mixing device
dmix:CARD=ALSA,DEV=1
    bcm2835 ALSA, bcm2835 IEC958/HDMI
    Direct sample mixing device
dsnoop:CARD=ALSA,DEV=0
    bcm2835 ALSA, bcm2835 ALSA
    Direct sample snooping device
dsnoop:CARD=ALSA,DEV=1
    bcm2835 ALSA, bcm2835 IEC958/HDMI
    Direct sample snooping device
hw:CARD=ALSA,DEV=0
    bcm2835 ALSA, bcm2835 ALSA
    Direct hardware device without any conversions
hw:CARD=ALSA,DEV=1
    bcm2835 ALSA, bcm2835 IEC958/HDMI
    Direct hardware device without any conversions
plughw:CARD=ALSA,DEV=0
    bcm2835 ALSA, bcm2835 ALSA
    Hardware device with all software conversions
plughw:CARD=ALSA,DEV=1
    bcm2835 ALSA, bcm2835 IEC958/HDMI
    Hardware device with all software conversions
usbstream:CARD=ALSA
    bcm2835 ALSA
    USB Stream Output


As a result, only the Analog Mono PA profile (based on the only
existing hw:0) is available in PA:

D: [pulseaudio] alsa-mixer.c: Checking for playback on Analog Mono (analog-mono)
D: [pulseaudio] alsa-util.c: Trying hw:0 with SND_PCM_NO_AUTO_FORMAT ...
D: [pulseaudio] alsa-util.c: Managed to open hw:0
...
D: [pulseaudio] alsa-mixer.c: Checking for playback on Analog Stereo
(analog-stereo)
D: [pulseaudio] alsa-util.c: Trying front:0 with SND_PCM_NO_AUTO_FORMAT ...
I: [pulseaudio] (alsa-lib)conf.c: Unknown parameters 0
I: [pulseaudio] (alsa-lib)pcm.c: Unknown PCM front:0
---
D: [pulseaudio] alsa-mixer.c: Checking for playback on Digital Stereo
(HDMI) (hdmi-stereo)
D: [pulseaudio] alsa-util.c: Trying hdmi:0 with SND_PCM_NO_AUTO_FORMAT ...
I: [pulseaudio] (alsa-lib)conf.c: Unknown parameters 0
I: [pulseaudio] (alsa-lib)pcm.c: Unknown PCM hdmi:0
...
D: [pulseaudio] alsa-mixer.c: Checking for playback on Digital
Surround 7.1 (HDMI) (hdmi-surround71)
D: [pulseaudio] alsa-util.c: Trying hdmi:0 with SND_PCM_NO_AUTO_FORMAT ...
I: [pulseaudio] (alsa-lib)conf.c: Unknown parameters 0
I: [pulseaudio] (alsa-lib)pcm.c: Unknown PCM hdmi:0


RPi v.4 has 2 HDMI outputs:

pi@raspberrypi:~ $ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: ALSA [bcm2835 ALSA], device 0: bcm2835 ALSA [bcm2835 ALSA]
  Subdevices: 6/7
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
card 0: ALSA [bcm2835 ALSA], device 1: bcm2835 IEC958/HDMI [bcm2835 IEC958/HDMI]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: ALSA [bcm2835 ALSA], device 2: bcm2835 IEC958/HDMI1 [bcm2835
IEC958/HDMI1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

Each is 2 - 8 channel:

pi@raspberrypi:~ $ aplay -v --dump-hw-params -D hw:0,1 /dev/zero
Playing raw data '/dev/zero' : Unsigned 8 bit, Rate 8000 Hz, Mono
HW Params of device "hw:0,1":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: [32 128]
CHANNELS: [2 8]
RATE: [44100 192000]
PERIOD_TIME: [10000 743039)
PERIOD_SIZE: [441 32768]
PERIOD_BYTES: [1776 524288]
PERIODS: [1 75)
BUFFER_TIME: (2296 743039)
BUFFER_SIZE: [441 32768]
BUFFER_BYTES: [1764 131072]
TICK_TIME: ALL

I looked at hdmi section of cards/Intel-HDA.conf but that one is very
complicated. May I ask for help how the config should look like to
work both for multichannel PCM and digital formats (i.e. support for
the AES vars)? I very much appreciate any help.

Best regards,

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
