Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15E5A380D
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 16:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DDB215E5;
	Sat, 27 Aug 2022 16:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DDB215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661609195;
	bh=xWYn0WcN1Y9kjpHCfIng01yXuJWr0oWvoWzTfUP8Cvo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wne+/3guJeY9ci1XD9jSLYf5tFXrDrsA/qoaiVDcNg1FFOXzfgvqqkh+tYBTIT+4+
	 dzGnojOR/ZbmRzr8XFTDnanSU/0v9VfI33+WfnumHMofy6gTspcBC1ixnT10VZcXJX
	 C+f9BrjvYzP6iM/kGHEScyAshQ0lHMML3QVRNS4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4866F8021D;
	Sat, 27 Aug 2022 16:05:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22DD1F80132; Sat, 27 Aug 2022 16:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0EE2BF800AA
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 16:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE2BF800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661609130270931959-webhooks-bot@alsa-project.org>
References: <1661609130270931959-webhooks-bot@alsa-project.org>
Subject: Tascam US122L, JACK, PulseAudio and OBS
Message-Id: <20220827140534.22DD1F80132@alsa1.perex.cz>
Date: Sat, 27 Aug 2022 16:05:34 +0200 (CEST)
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

alsa-project/alsa-lib issue #269 was opened from stephematician:

Apologies if this is the wrong place - however I'm getting an error most of the time in a very specific situation.

My setup is a TASCAM US122L USB interface, which ALSA is capable of recognising and setting up as a usb_stream device. I then run jackd for this device, load the pulseaudio module for a JACK source (at this point I can record via parecord), and then attempt to add a PulseAudio input to OBS. At this point, I'll get an input for less than a second, then it'll cut out and I'll get an error in JACK.

I've attached the output of alsa-info; showing that the device is recognised. The contents of my .asoundrc are somewhat widely used:

```
# The usb_stream plugin configuration

pcm.!usb_stream {
        @args [ CARD ]
        @args.CARD {
                type string
                default "1"
        }

        type usb_stream

        card $CARD
}

ctl.!usb_stream {
        @args [ CARD ]
        @args.CARD {
                type string
                default "1"
        }

        type hw

        card $CARD
}
```

I run jackd with a command like:

```
/usr/bin/jackd -v -p128 -dalsa -dusb_stream:CARD=US122L -r44100 -p256 -n2 -C
```

I then set up a source in PulseAudio using `pacmd load-module module-jack-source`. Typically at this point, `parecord --device=jack_in test.wav` records no problems.

Then I'll run OBS and try to add a PulseAudio input, at which point I usually get a very short period of input (less than 1 second?) and then the input will cut out and I'll see the following error in jackd output:

```
Couldn't configure usb_stream
: Input/output error
ALSA: prepare error for capture on "usb_stream:CARD=US122L" (Input/output error)
```

Upon tracking this down, it seems that some call to snd_pcm_prepare by JACK is receiving an error code; but I'm not an expert in this library (or alsa) so it's hard for me to even guess what the problem could be.
[alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/9438112/alsa-info.txt)

I have also raised this issue on JACK in case it's a problem with that library (link here - but details are the same https://github.com/jackaudio/jack1/issues/118#issue-1353053534)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/269
Repository URL: https://github.com/alsa-project/alsa-lib
