Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9683F56C
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 13:09:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E25852;
	Sun, 28 Jan 2024 13:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E25852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706443770;
	bh=ea2/hbIhTYA11KZqLwPn676DDnTOZ3ro4Bj0W8jlfRg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l19wjyv0ELuwwV5SbeCn5Ulze0DyUJ7HXAZKSxQy0W/LPm14jSQd8ftS4AfzyO0mk
	 iq6QnZpdQOO0G+GtC5LKtw/RiwekrvYR/cp2/ziR3RMc2l6OQHo87zCZS1JpuftPRp
	 hgEivM17ctLyjuA/NcmBIn+NzX689ZuNyS0QQ9EA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B55E6F8055B; Sun, 28 Jan 2024 13:08:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1054F80568;
	Sun, 28 Jan 2024 13:08:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B75AF80310; Sun, 28 Jan 2024 13:08:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5FCF80149
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 13:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA5FCF80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706443728000905991-webhooks-bot@alsa-project.org>
References: <1706443728000905991-webhooks-bot@alsa-project.org>
Subject: Tascam US-428 crash
Message-Id: <20240128120853.0B75AF80310@alsa1.perex.cz>
Date: Sun, 28 Jan 2024 13:08:53 +0100 (CET)
Message-ID-Hash: 2XCHTIRNUMADGM6N2ZRNMC7WEIH5O455
X-Message-ID-Hash: 2XCHTIRNUMADGM6N2ZRNMC7WEIH5O455
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XCHTIRNUMADGM6N2ZRNMC7WEIH5O455/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #23 was opened from mgsx-dev:

Hi, i'm not sure that's the right place to post the issue. (sorry in advance)

I have a Tascam US-428 Hardware and tried to make it works on Ubuntu 22.04. I followed setup instruction for US-224 and adapted it for the US 428 : https://alsa.opensrc.org/Tascam_US-224

First i had to install firmware manually since hotplug package seems to be no longer available : 
* `lsusb` shows my hardware correctly : `Bus 001 Device 004: ID 1604:8000 Tascam US-428 Audio/Midi Controller (without fw)`
* I downloaded firmwares from https://github.com/alsa-project/alsa-firmware
* Loaded it to the Tascam : `sudo fxload -s alsa-firmware/usx2yloader/tascam_loader.ihx -I alsa-firmware/usx2yloader/us428fw.ihx -D /dev/bus/usb/001/004`
* I manually copied `alsa-firmware/usx2yloader/` files (us428.conf, us428.prepad, and us428.rbt) to  `/usr/lib/firmware/usx2yloader/` folder to make `usx2yloader` working.
* Running `lsusb` confirmed it works. It shows now : `Bus 001 Device 005: ID 1604:8001 Tascam US-428 Audio/Midi Controller`
* Also, the USB led on my Tascam turned up green.

Then I tried to launch us428control to test midi : 
* `us428control -v 2` properly logs midi event when i move some controls on the Tascam.

So far so good.

Then i tried to test audio playback. ALSA properly list my device : 
```
aplay -l
...
card 1: USX2Y [TASCAM US-X2Y], device 0: US-X2Y Audio [US-X2Y Audio #0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

aplay -L
...
hw:CARD=USX2Y,DEV=0
    TASCAM US-X2Y, US-X2Y Audio #0
    Direct hardware device without any conversions
plughw:CARD=USX2Y,DEV=0
    TASCAM US-X2Y, US-X2Y Audio #0
    Hardware device with all software conversions
sysdefault:CARD=USX2Y
    TASCAM US-X2Y, US-X2Y Audio #0
    Default Audio Device
dmix:CARD=USX2Y,DEV=0
    TASCAM US-X2Y, US-X2Y Audio #0
    Direct sample mixing device
usbstream:CARD=USX2Y
    TASCAM US-X2Y
    USB Stream Output
```

Then i tried to playback a wav file : `aplay -D dmix:CARD=USX2Y,DEV=0 test.wav` but when the song finish, or when i interrupt it, my whole system freeze (desktop GUI and mouse) and i had to shutdown my laptop manually.

Note that i tried with other device name but it freeze as well, i also launched Audacity which freeze at startup as well.

I'm a bit lost and i can't find useful information on the internet about it. Any help appreciated. Thanks for reading.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/23
Repository URL: https://github.com/alsa-project/alsa-tools
