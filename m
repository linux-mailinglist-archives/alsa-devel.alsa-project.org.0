Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA5118AFB
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 408AF16B6;
	Tue, 10 Dec 2019 15:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 408AF16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988451;
	bh=Wt4hcvGm+sumrfZTIH3/kz06Of+LvlEtYH5a2sFM0Lk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlub2vESPPJNPBsmkqiWrnOc/N5sMmob/YEF8KPPpSk+qwiwd8o0O6ddcAe9QRR3z
	 3Astm9lXJz68mtTzBlgWR3tV8UWkWVNQzplabRM6y46Z8atcseGn6+ZvpSLVs4Dq3I
	 RZ85JPOOoKQl2YaG+swabsncB0nMMX83YqJB8wuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE930F802D2;
	Tue, 10 Dec 2019 15:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A36C4F8028C; Tue, 10 Dec 2019 15:26:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F363F80256
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F363F80256
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12FFCB200;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:25:59 +0100
Message-Id: <20191210142614.19405-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 08/23] ASoC: rcar: Use managed buffer
	allocation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sh/rcar/core.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 399dc6e9bde5..bb840be5e591 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1223,10 +1223,10 @@ static int rsnd_preallocate_pages(struct snd_soc_pcm_runtime *rtd,
 	for (substream = rtd->pcm->streams[stream].substream;
 	     substream;
 	     substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream,
-					      SNDRV_DMA_TYPE_DEV,
-					      dev,
-					      PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
+		snd_pcm_set_managed_buffer(substream,
+					   SNDRV_DMA_TYPE_DEV,
+					   dev,
+					   PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
 	}
 
 	return 0;
@@ -1405,7 +1405,6 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
 	struct snd_soc_pcm_runtime *fe = substream->private_data;
-	int ret;
 
 	/*
 	 * rsnd assumes that it might be used under DPCM if user want to use
@@ -1438,12 +1437,7 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 			dev_dbg(dev, "convert rate     = %d\n", io->converted_rate);
 	}
 
-	ret = rsnd_dai_call(hw_params, io, substream, hw_params);
-	if (ret)
-		return ret;
-
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
+	return rsnd_dai_call(hw_params, io, substream, hw_params);
 }
 
 static int rsnd_hw_free(struct snd_soc_component *component,
@@ -1452,13 +1446,8 @@ static int rsnd_hw_free(struct snd_soc_component *component,
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
-	int ret;
-
-	ret = rsnd_dai_call(hw_free, io, substream);
-	if (ret)
-		return ret;
 
-	return snd_pcm_lib_free_pages(substream);
+	return rsnd_dai_call(hw_free, io, substream);
 }
 
 static snd_pcm_uframes_t rsnd_pointer(struct snd_soc_component *component,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
