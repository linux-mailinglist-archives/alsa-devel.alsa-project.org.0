Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B202249A2
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jul 2020 09:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20627167D;
	Sat, 18 Jul 2020 09:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20627167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595056987;
	bh=OsyX/2Ni5MN9reb2buLOoRn8jZpQSHA6HP6vb/ervyM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1ETDo+XE2pDD4ElKT4xK/JT0o4xUD5RhS22tnZvaDG3X3EzqVcQLeX62x0n1Fab8
	 C4uCrzYbGNA9WL40JLTtWgEJdv23vd7Wyjnr74nECGJXHY0puNDMab1e2I8wxS5as5
	 j5RHKXqO237MQhxt11nODl+fQY1uoYLdyD8/0/go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54DC0F80141;
	Sat, 18 Jul 2020 09:21:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9BA2F8016F; Sat, 18 Jul 2020 09:21:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DDE78F800E4
 for <alsa-devel@alsa-project.org>; Sat, 18 Jul 2020 09:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE78F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595056874223562002-webhooks-bot@alsa-project.org>
References: <1595056874223562002-webhooks-bot@alsa-project.org>
Subject: snd_pcm_avail() returned a value that is exceptionally large
Message-Id: <20200718072121.E9BA2F8016F@alsa1.perex.cz>
Date: Sat, 18 Jul 2020 09:21:21 +0200 (CEST)
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

alsa-project/alsa-lib issue #68 was opened from reezer:

I hope this is the right place to report this. This occurred in relation to a crash.
http://alsa-project.org/db/?f=52e8505d884682fc06adac4ab8ce92a4ca3e0870


```
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: snd_pcm_avail() returned a value that is exceptionally large: 177312 bytes (923 ms).
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: Most likely this is a bug in the ALSA driver 'snd_hda_intel'. Please report this issue to the ALSA developers.
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: snd_pcm_dump():
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: Soft volume PCM
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: Control: PCM Playback Volume
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: min_dB: -51
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: max_dB: 0
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: resolution: 256
E: [alsa-sink-ALC887-VD Analog] alsa-util.c: Its setup is:
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   stream       : PLAYBACK
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   access       : MMAP_INTERLEAVED
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   format       : S16_LE
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   subformat    : STD
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   channels     : 2
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   rate         : 48000
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   exact rate   : 48000 (48000/1)
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   msbits       : 16
E: [alsa-sink-ALC887-VD Analog] alsa-util.c:   buffer_size  : 4800
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/68
Repository URL: https://github.com/alsa-project/alsa-lib
