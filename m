Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9F26C323
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 15:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2E516C3;
	Wed, 16 Sep 2020 15:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2E516C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600261796;
	bh=exJ4B0E8ZOtJLqRGXEepgGDMdI5G6V3kXysajnFYBl8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+DLw9o5gDmaE2Nay2+TWZ5XBP0VVyUp2NxgMp34y7wb7FLdY2MSxpQ68vXDLK6Zv
	 1JCfB8DBYqu+ikEtg8VQ7KDkVseNrwouKkh+dXw99dkQyIvH4w4bicLruakrrhUcIo
	 3VPdF8nDWKdIlQjeXP7JzYylMEJq9n8qLVGq3eEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 313D2F8015A;
	Wed, 16 Sep 2020 15:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85F9F80292; Wed, 16 Sep 2020 15:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 980B5F8015A
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 15:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 980B5F8015A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1600261734400299072-webhooks-bot@alsa-project.org>
References: <1600261734400299072-webhooks-bot@alsa-project.org>
Subject: aplay: playing mono audio file alteres pulseaudio default Master left
 or right volume level
Message-Id: <20200916130900.E85F9F80292@alsa1.perex.cz>
Date: Wed, 16 Sep 2020 15:09:00 +0200 (CEST)
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

alsa-project/alsa-utils issue #55 was edited from maxmbed:

### Description

I am encountering an unexpected behaviour with pulse audio master volume in my application. 

If I set for example left channel to 100% and right channel 0%, and play mono audio file (i.e. audio file with 1 channel only), then I would expect to hear only the audio file on left channel.

The actual behaviour in the example of above is when playing the audio file, the Master volume right channel will be automatically adjusted to 50%. If play again it increases to 75% and so on. 

This issue happens also with other R/L volume level, the case of above is just an example.

**Important to note the case does not happen with stereo audio file** where audio sounds on left only channel as we can expect.

### Steps to repeat issue:

(a) Set mixer Lch to 100%, Rch to 0%
```
$ amixer -D default sset Master 65535,0
Simple mixer control 'Master',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 65536
  Mono:
  Front Left: Playback 65535 [100%] [on]
  Front Right: Playback 0 [0%] [on]
```

(b) Play mono audio file
```
$ aplay -D default ringtone.wav
Playing WAVE 'ringtone.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Mono
```


### Request
(1) Is it by design expected ? 
(2) Is there a way to prevent this phenomenon (command option) ?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/55
Repository URL: https://github.com/alsa-project/alsa-utils
