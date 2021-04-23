Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D1369AF6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 21:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3041729;
	Fri, 23 Apr 2021 21:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3041729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619206493;
	bh=Jsxyqdxkhb7V8Yk0xUHEkT/k32LnbeF3ZT5x6bOvWBM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoAFSDabXcKY88X/5iESYADRoCfvmPrAj84X0p9UT4ge40qfnM0OKx5Vzyr72+Oor
	 L1foWJgL87cagTTvEFJWfX5Bw79BRdQXPdDcQawYANwMfLAN8GqpK6IoJ5KBOTdJ3m
	 W77lrEepLkJcG2RKLJBSlR75IEhCAY5nNf0TvqGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE9AF800E3;
	Fri, 23 Apr 2021 21:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C06F80227; Fri, 23 Apr 2021 21:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6B498F80117
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 21:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B498F80117
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1619206393614866972-webhooks-bot@alsa-project.org>
References: <1619206393614866972-webhooks-bot@alsa-project.org>
Subject: Warnings on startup
Message-Id: <20210423193323.58C06F80227@alsa1.perex.cz>
Date: Fri, 23 Apr 2021 21:33:23 +0200 (CEST)
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

alsa-project/alsa-plugins issue #20 was opened from bramtayl:

I've been trying to get Julia's PortAudio to load alsa-plugins (it's been a process). I thought I might as well see if I can cut down on the warnings on start up (`using PortAudio` from Julia) and some of them I've been able to knock out but some of them not so much:

These ones 

```
ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
```

I got rid of by commenting out lines in my alsa.conf file:

```
# pcm.rear cards.pcm.rear
# pcm.center_lfe cards.pcm.center_lfe
# pcm.side cards.pcm.side
```

This one

```
ALSA lib pcm_route.c:877:(find_matching_chmap) Found no matching channel map
```

I got rid of by commening out:

```
# pcm.surround21 cards.pcm.surround21
# pcm.surround40 cards.pcm.surround40
# pcm.surround41 cards.pcm.surround41
# pcm.surround50 cards.pcm.surround50
# pcm.surround51 cards.pcm.surround51
# pcm.surround71 cards.pcm.surround71
```

I'm not sure if these work arounds are the best solutions...shouldn't alsa be able to tell that my laptop doesn't have surround sound?

This one is expected, I haven't yet figured out how to build jack on Julia's BinaryBuilder:

```
ALSA lib dlmisc.c:339:(snd_dlobj_cache_get0) Cannot open shared library libasound_module_pcm_jack.so (/home/brandon/.julia/artifacts/d587f48a6815c72dec4b083bf297caec7a8e3f4b/lib/alsa-lib/libasound_module_pcm_jack.so: cannot open shared object file: No such file or directory)
```

These ones are a bit confusing; 

```
ALSA lib pcm_oss.c:377:(_snd_pcm_oss_open) Unknown field port
ALSA lib pcm_usb_stream.c:486:(_snd_pcm_usb_stream_open) Invalid type for card
```

Is it possible that `oss/50-oss.conf` and `usb_stream/98-usb-stream.conf` need to get updated?

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/20
Repository URL: https://github.com/alsa-project/alsa-plugins
