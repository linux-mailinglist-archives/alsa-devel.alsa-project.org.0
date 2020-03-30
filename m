Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538F19807D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 18:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90EA3166E;
	Mon, 30 Mar 2020 18:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90EA3166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585584483;
	bh=AmeFGt5JYCj4k+HBQdc0uMjpmnLDDHEKjOl4aRqM6kw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eHBpFwMrpjeXgKAnGqewPcq0VIJZkna80/smhfsyygcPe9j8Wv7dJP2vkMRw7P4qj
	 e+h33Fwkgq6IlRTY51jNkNj0Nln4oD3EiyRWOVfwi+eqw55P04TmJS8vtOm88i7uXQ
	 93ztxJCNiyM5/0TFqmirnegxnTelG5cAKCY3yico=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FF5F800EB;
	Mon, 30 Mar 2020 18:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17CFDF800AA; Mon, 30 Mar 2020 18:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECD1F800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 18:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECD1F800AA
IronPort-SDR: nAnSiGZpac5mddRkPHeD2/lIdvkLgyhoa98HGP9HGEeQI4APpgJoHtwojfEQ9pVsIaein5Esq3
 mbVzpgKJDKwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 09:06:05 -0700
IronPort-SDR: MisFbeaznJ3xS6k0w7VAvZNrqg+n0ut6M4DBsGYS8eUglBk37dAOceh9qvuYfPccLcV4+WFwxn
 NBpDPm3h4+dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="395172611"
Received: from sgobriel-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.145.94])
 by orsmga004.jf.intel.com with ESMTP; 30 Mar 2020 09:06:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-dai: fix DAI startup/shutdown sequence
Date: Mon, 30 Mar 2020 11:06:02 -0500
Message-Id: <20200330160602.10180-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

The addition of a single flag to track the DAI status prevents the DAI
startup sequence from being called on capture if the DAI is already
used for playback.

Fix by extending the existing code with one flag per direction.

Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Tested-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Fixes: b56be800f1292 ("ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-dai.h | 2 +-
 sound/soc/soc-dai.c     | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 78bac995db15..d4825b82c7a3 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -351,7 +351,7 @@ struct snd_soc_dai {
 
 	/* bit field */
 	unsigned int probed:1;
-	unsigned int started:1;
+	unsigned int started[SNDRV_PCM_STREAM_LAST + 1];
 };
 
 static inline struct snd_soc_pcm_stream *
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 19142f6e533c..8f3cad8db89a 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -295,12 +295,12 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 {
 	int ret = 0;
 
-	if (!dai->started &&
+	if (!dai->started[substream->stream] &&
 	    dai->driver->ops->startup)
 		ret = dai->driver->ops->startup(substream, dai);
 
 	if (ret == 0)
-		dai->started = 1;
+		dai->started[substream->stream] = 1;
 
 	return ret;
 }
@@ -308,11 +308,11 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			 struct snd_pcm_substream *substream)
 {
-	if (dai->started &&
+	if (dai->started[substream->stream] &&
 	    dai->driver->ops->shutdown)
 		dai->driver->ops->shutdown(substream, dai);
 
-	dai->started = 0;
+	dai->started[substream->stream] = 0;
 }
 
 int snd_soc_dai_prepare(struct snd_soc_dai *dai,
-- 
2.20.1

