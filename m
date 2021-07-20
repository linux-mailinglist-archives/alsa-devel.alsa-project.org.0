Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC493D0123
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 20:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D213168F;
	Tue, 20 Jul 2021 20:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D213168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626804137;
	bh=jrJFNwhrUjpATmY0nN7b6Vv+8avcbpMYBMtGOVslp+4=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EZ5qzkW/zKXLUmrczNUi1Uhv10W7GBeT53WvunV99JXSsIsZP8tbYh7i2HFi+bkQ2
	 YALm5m/24aBaucH1asqLTCsIJNDtQG2ArB+Oo+YKxMWHXSsMSXs3k+y8LT7qNisag4
	 8y1vHYGn9ImjEMJQv8UkGqyLeBKG0OfmmgePWy00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB685F80227;
	Tue, 20 Jul 2021 20:00:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A371F80218; Tue, 20 Jul 2021 20:00:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx.ghoul.cz (mx.ghoul.cz [37.205.14.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD822F800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 20:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD822F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ufiseru.cz header.i=@ufiseru.cz
 header.b="qLfhFFLg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F3BA1B60B
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 20:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ufiseru.cz; s=dkim;
 t=1626804009; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=jrJFNwhrUjpATmY0nN7b6Vv+8avcbpMYBMtGOVslp+4=;
 b=qLfhFFLg46SIeBZ4FHop6tRkVz0XDbvWtylI2cYfiqWfyelPjFYwuz9t78X9l+DTitMCDt
 sz0SkiH1Vox279DMLmrpZRcs9wzx1osFaX0OKh7SxXol039gUrnaooisDlTHjWo89Wyixo
 tEjSvb6G809B7pzn7RSWkPThn8fVXk/zFhdE6IDw0aKQCWGtHNnOVR/Q6BAboT95ZRchh7
 JJpjU3ZYAH7A4amq7bRYmRxhq6xVbLlJjfvER2YqMUdJj6/IYRobp8ZRTUbXCTtEclu5H6
 U9Zv+5sPWXiywKvuKOOSnJP2LDpze+QuqPjJ1DmpBG53VTjD0UUa86E4pS0CSg==
MIME-Version: 1.0
Date: Tue, 20 Jul 2021 18:00:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "=?utf-8?B?SmFrdWIgRmnFoWVy?=" <jakub@ufiseru.cz>
Message-ID: <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
Subject: mic not working on JBL Quantum series USB headsets
To: alsa-devel@alsa-project.org
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Alsa people,

hope this is the right place to post.

My Quantum 800's microphone doesn't work and I found other reports sugges=
ting
this issue affects the whole Quantum product line.

It's a wireless headset with USB dongle.

I *think* the issue is with Alsa because the Capture device is "detected"=
 but not
populated under /sys:

arecord list of devices:
```
% arecord -l
**** List of CAPTURE Hardware Devices ****
(...)
card 1: Q800 [Quantum 800], device 0: USB Audio [USB Audio]
Subdevices: 1/1
Subdevice #0: subdevice #0
```

amixer knobs:
```
% amixer -c1
Simple mixer control 'PCM',0
Capabilities: pswitch pswitch-joined
Playback channels: Mono
Mono: Playback [on]
Simple mixer control 'PCM',1
Capabilities: pswitch pswitch-joined
Playback channels: Mono
Mono: Playback [on]
Simple mixer control 'Headset',0
Capabilities: cvolume cvolume-joined cswitch cswitch-joined
Capture channels: Mono
Limits: Capture 0 - 64
Mono: Capture 64 [100%] [0.00dB] [on]
```

arecord trying to use the capture device:
```
% arecord -Dhw:1,0 /tmp/out.wav
arecord: main:831: audio open error: No such file or directory
```

/sys pcm "endpoints" (missing capture endpoint):
```
% ls -1d /sys/class/sound/pcm*
/sys/class/sound/pcmC1D0p
/sys/class/sound/pcmC1D1p
```

nothing suspicious in dmesg:
```
usb 3-1.3: new full-speed USB device number 12 using xhci_hcd
usb 3-1.3: New USB device found, idVendor=3D0ecb, idProduct=3D203e, bcdDe=
vice=3D 1.00
usb 3-1.3: New USB device strings: Mfr=3D4, Product=3D5, SerialNumber=3D0
usb 3-1.3: Product: Quantum 800
usb 3-1.3: Manufacturer: JBL
usb 3-1.3: Found post-registration device assignment: 0ecb203e:02
input: JBL Quantum 800 Consumer Control as
/devices/pci0000:00/0000:00:1d.4/0000:05:00.0/0000:06:01.0/0000:08:00.0/0=
000:09:02.0/0000:0a:00.0/us
3/3-1/3-1.3/3-1.3:1.5/0003:0ECB:203E.0024/input/input51
input: JBL Quantum 800 as
/devices/pci0000:00/0000:00:1d.4/0000:05:00.0/0000:06:01.0/0000:08:00.0/0=
000:09:02.0/0000:0a:00.0/us
3/3-1/3-1.3/3-1.3:1.5/0003:0ECB:203E.0024/input/input52
hid-generic 0003:0ECB:203E.0024: input,hiddev96,hidraw0: USB HID v1.11 De=
vice [JBL Quantum 800] on
usb-0000:0a:00.0-1.3/input5
```

Nothing at all in either Pulse or Pipewire logs.

alsa-info: http://alsa-project.org/db/?f=3Dd9e7a91d97b2f64a0b2d00a05dfc9f=
9dace3a6f6

Linux 5.12.14-lqx2

Other reports:

https://bbs.archlinux.org/viewtopic.php?pid=3D1983686
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/998

The headset also works for me on Windows 10 out of the box (and according=
 to the Internet, it
works on Mac, too).

Note that I updated the headset and dongle to the latest firmware (v3.1.5=
.0) with no effect.

The 800 model also has Bluetooth with both A2DP and HSP profile. Not sure=
 if this is relevant
but for clarity:

- with Pulse A2DP profile works only as output device (SBC and AAC), othe=
r profiles, such as
HSP, are listed but "unavailable"
- with Pipewire only HSP profiles are listed and available (mSBC, CVSD an=
d "plain"),
microphone *works*

I'd like to help with debugging, just tell me how (or if) I can.

thanks,

-jakub.
