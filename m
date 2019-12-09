Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D313B116A49
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:55:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC8C1660;
	Mon,  9 Dec 2019 10:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC8C1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885302;
	bh=F9Rl7ew5Z6wPxsdbT76MQYDVssTgw5MEP36YYDX9An4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSh9QykHaiLPy2QAzS8CfCKM+amYsXAkpIlnSVHjm7/GqW9KqCobG/1sNbqNHii5D
	 h7r3tER70j9YfyE0/7SxDz5r+plypIwscOYrYgqWhrzntOO3Wd+dMyzA+mmruoscym
	 UJTofQeWzF6e6kYTZGJ36Sua/9H4RoOin2E+rziY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EE3F80316;
	Mon,  9 Dec 2019 10:50:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A67AF802F7; Mon,  9 Dec 2019 10:49:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FB17F8023E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FB17F8023E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66029B28D
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:34 +0100
Message-Id: <20191209094943.14984-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 02/71] ALSA: aaci: Use managed buffer
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
snd_pcm_lib_free_pages() calls are dropped, and the if block is
flattened accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/aaci.c | 40 +++++++++++++++-------------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index b5399b0090a7..1e9ea0fe4f49 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -483,11 +483,6 @@ static int aaci_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_ac97_pcm_close(aacirun->pcm);
 	aacirun->pcm_open = 0;
 
-	/*
-	 * Clear out the DMA and any allocated buffers.
-	 */
-	snd_pcm_lib_free_pages(substream);
-
 	return 0;
 }
 
@@ -502,6 +497,7 @@ static int aaci_pcm_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
 	struct aaci_runtime *aacirun = substream->runtime->private_data;
+	struct aaci *aaci = substream->private_data;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	int dbl = rate > 48000;
@@ -517,25 +513,19 @@ static int aaci_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (dbl && channels != 2)
 		return -EINVAL;
 
-	err = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(params));
-	if (err >= 0) {
-		struct aaci *aaci = substream->private_data;
+	err = snd_ac97_pcm_open(aacirun->pcm, rate, channels,
+				aacirun->pcm->r[dbl].slots);
 
-		err = snd_ac97_pcm_open(aacirun->pcm, rate, channels,
-					aacirun->pcm->r[dbl].slots);
+	aacirun->pcm_open = err == 0;
+	aacirun->cr = CR_FEN | CR_COMPACT | CR_SZ16;
+	aacirun->cr |= channels_to_slotmask[channels + dbl * 2];
 
-		aacirun->pcm_open = err == 0;
-		aacirun->cr = CR_FEN | CR_COMPACT | CR_SZ16;
-		aacirun->cr |= channels_to_slotmask[channels + dbl * 2];
-
-		/*
-		 * fifo_bytes is the number of bytes we transfer to/from
-		 * the FIFO, including padding.  So that's x4.  As we're
-		 * in compact mode, the FIFO is half the size.
-		 */
-		aacirun->fifo_bytes = aaci->fifo_depth * 4 / 2;
-	}
+	/*
+	 * fifo_bytes is the number of bytes we transfer to/from
+	 * the FIFO, including padding.  So that's x4.  As we're
+	 * in compact mode, the FIFO is half the size.
+	 */
+	aacirun->fifo_bytes = aaci->fifo_depth * 4 / 2;
 
 	return err;
 }
@@ -937,9 +927,9 @@ static int aaci_init_pcm(struct aaci *aaci)
 
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &aaci_playback_ops);
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &aaci_capture_ops);
-		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-						      aaci->card->dev,
-						      0, 64 * 1024);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					       aaci->card->dev,
+					       0, 64 * 1024);
 	}
 
 	return ret;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
