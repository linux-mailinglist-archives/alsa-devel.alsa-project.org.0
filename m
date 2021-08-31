Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56B3FCCEC
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 20:20:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC97016E3;
	Tue, 31 Aug 2021 20:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC97016E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630434016;
	bh=4Jsu7rrLk+5aC0lbz+W9L7qrwwMV5M4zJS6ATMlWpBg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wvj7/PlwTOsvWzB9GzKKI7+8R+VWrsvn/SoAVgblJKVyVLXtDJN7ZI8GbiVw8vqY5
	 eWA+qEjBnIbAEk5MimdXMHb4y6691zSIyk5oAAi5ySbs1arewiaTeXIqdVZYD13U63
	 mA3QD1EHmcQQLu55Jb2hZE1sFYa0PDTS6ZaJFn1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4436DF800BE;
	Tue, 31 Aug 2021 20:18:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52231F8025B; Tue, 31 Aug 2021 20:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CFA52F80127
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 20:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA52F80127
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630433929608411074-webhooks-bot@alsa-project.org>
References: <1630433929608411074-webhooks-bot@alsa-project.org>
Subject: Sample rate issues with M-Audio M-Track 2x2M
Message-Id: <20210831181857.52231F8025B@alsa1.perex.cz>
Date: Tue, 31 Aug 2021 20:18:57 +0200 (CEST)
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

alsa-project/alsa-lib issue #176 was edited from powerjungle:

At random points the sample rate changes, but the applications continue to use the previous rate. This results in sound being lower/higher pitch then normal. My own voice when using the application [Mumble](https://github.com/mumble-voip/mumble) consistently becomes higher pitch and sounds pretty funny, friends had a good laugh. I have some diffs of ALSA dumps.

My output is to headphones. My input is XLR.

Here for example I open the GNOME settings for "Sound" and my output becomes lower pitch:

```diff
6c6
< !!Script ran on: Sun Aug 29 19:56:57 UTC 2021
---
> !!Script ran on: Sun Aug 29 19:58:27 UTC 2021
1287c1287
<     Momentary freq = 48000 Hz (0x6.0000)
---
>     Momentary freq = 44101 Hz (0x5.8338)
1304c1304,1308
<   Status: Stop
---
>   Status: Running
>     Interface = 2
>     Altset = 1
>     Packet Size = 72
>     Momentary freq = 44100 Hz (0x5.8333)
1346c1350
< crw-rw----+ 1 root audio 116, 12 Aug 29 21:15 /dev/snd/pcmC1D0c
---
> crw-rw----+ 1 root audio 116, 12 Aug 29 21:58 /dev/snd/pcmC1D0c
1400c1404
<   Subdevices: 1/1
---
>   Subdevices: 0/1
2057,2058c2061,2062
< 		value.0 0
< 		value.1 0
---
> 		value.0 3
> 		value.1 4
```

Afterwards at a random point the output gets fixed, but the sample rate that gets logged is weird:

```diff
6c6
< !!Script ran on: Sun Aug 29 19:58:27 UTC 2021
---
> !!Script ran on: Sun Aug 29 20:33:14 UTC 2021
78c78
<       Running - No
---
>       Running - Yes
1287c1287
<     Momentary freq = 44101 Hz (0x5.8338)
---
>     Momentary freq = 47999 Hz (0x5.fff8)
1304,1308c1304
<   Status: Running
<     Interface = 2
<     Altset = 1
<     Packet Size = 72
<     Momentary freq = 44100 Hz (0x5.8333)
---
>   Status: Stop
1351c1347
< crw-rw----+ 1 root audio 116, 11 Aug 29 21:56 /dev/snd/pcmC1D0p
---
> crw-rw----+ 1 root audio 116, 11 Aug 29 22:32 /dev/snd/pcmC1D0p
1404c1400
<   Subdevices: 0/1
---
>   Subdevices: 1/1
2061,2062c2057,2058
< 		value.0 3
< 		value.1 4
---
> 		value.0 0
> 		value.1 0
```

Also sometimes when listening to music in Youtube using Firefox, the sound becomes higher pitch, but I cannot reproduce it, can't find the cause.

I'm running OpenSUSE Tumbleweed 5.13.13-1-default.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/176
Repository URL: https://github.com/alsa-project/alsa-lib
