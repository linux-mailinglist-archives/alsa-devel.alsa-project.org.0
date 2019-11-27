Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4D10AE80
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 12:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75D31706;
	Wed, 27 Nov 2019 12:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75D31706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574852927;
	bh=NvlVQyg40knZWqXXhStcvwM0WVAdveOTLhu9e7rqFCE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YHzmKooob85Oy3K95jzZ/m/BOJn92cluvaD/SsHegO2m8775i71WVdl20t4kVcfD3
	 e/vhTa5cG+XfXwuV5QCBROUoIInbtXyHbxqSBUMwM/ygpowsarMO9u3+Ke1roGaxvS
	 xeV3b9NpucMeNWP5ATAqNt29I0MznKIsIqgnLOlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2DAF8013B;
	Wed, 27 Nov 2019 12:07:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA9BF8014D; Wed, 27 Nov 2019 12:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37F06F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F06F800CE
IronPort-SDR: Ffl5xjbWYZSJTNusHvJ1OX412QmOISR0YJSAAJVejLXTMqCFa4Ax2V1h0IMwSOebCBEC4gZ37p
 Zg0qFO5XQzvKeIrSB8gHNdaGVAVSmc6WfZqQAESgVgWaF4vpcDQGVnAe1vkhR2ieY8hDcYkk0+
 XmgNIS8UsTpFGPzzz1ECDiSf7X5Jg/JT8AMZ3RrEO9rAtM+Av7hgmwbwEHT4YodSLiD8ti7YBd
 gzhi8BA8GsEhJqcZTVCPhN173pXaV2ec/6TTbLIVHdUAP/CEXT/mr1fJaLqAKgdXColYsdwusC
 xC4=
X-IronPort-AV: E=Sophos;i="5.69,249,1571731200"; d="scan'208";a="43561050"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 27 Nov 2019 03:06:53 -0800
IronPort-SDR: u9bLZta3qFDdDn6N2mrrxy/SSduvpuQXHCs4GzEAimH8hT9GV/ZDtuYTMeaNTxiKsxAJe7CtJP
 zUihfbkrxFMmtK5aDg68fMXYy/NQ1FAx7FzEsguO69B+ZeJn//7bunzdnv0ZcUmPEx0P1xp9iJ
 HJZLf2XdThAbRjL0eKSq4qBai6cke5owvWvF105W965Olfp6EzEnvtW7yHhyAeE3wuAHTi369n
 SG+QXifuJMQ2gL3iR7fr16+D9IKsU3c4jA/fnY5MXsGDbm6fCHmcZHXdYQ0TIqkWqEB1f9iPVT
 9X8=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Eugeniu Rosca
 <erosca@de.adit-jv.com>, Timo Wischer <twischer@de.adit-jv.com>, Andrew
 Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 27 Nov 2019 05:06:22 -0600
Message-ID: <20191127110622.26105-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH] ALSA: aloop: Avoid pointer dereference before
	null-check
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

Static analysis tools (cppcheck and PVS Studio) report an error
in loopback_snd_timer_period_elapsed() regarding dpcm_play pointer
dereference earlier than its null-check. And although this is a result
of a formal check, and the pointer correctness is also protected
by having a corresponding bit set in the "running" mask, re-ordering
of the lines can imake the code even formally correct and eliminate
those static analysis error reports.

Fixes: 26c53379f98d ("ALSA: aloop: Support selection of snd_timer instead of jiffies")
Reported-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 0ebfbe70db00..6bb46423f5ae 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -727,10 +727,6 @@ static void loopback_snd_timer_period_elapsed(struct loopback_cable *cable,
 
 	dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
-	substream_play = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
-			dpcm_play->substream : NULL;
-	substream_capt = (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) ?
-			dpcm_capt->substream : NULL;
 
 	if (event == SNDRV_TIMER_EVENT_MSTOP) {
 		if (!dpcm_play ||
@@ -741,6 +737,10 @@ static void loopback_snd_timer_period_elapsed(struct loopback_cable *cable,
 		}
 	}
 
+	substream_play = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
+			dpcm_play->substream : NULL;
+	substream_capt = (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) ?
+			dpcm_capt->substream : NULL;
 	valid_runtime = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
 				dpcm_play->substream->runtime :
 				dpcm_capt->substream->runtime;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
