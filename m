Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EEE3DD12A
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB9617E4;
	Mon,  2 Aug 2021 09:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB9617E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889457;
	bh=V50JuiDbEvdSwHhifyRxaD0OCcNUG/ee+BUoACLLILY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tzqwJx4kpXxpHVOAobPGVF9dHblZIQBIpRXgpvejS2MAxSOpOrhjUYe3TFZRSoWYk
	 K6cHb5K4TJEqRcyCVAkdPwgoCczb0tewP+5vduGkD4EK1z5lFToWoXUVTrL0XSbBhS
	 BeoGiev5t2i17fxpjonrJM30V/P6b9YB6dn72hE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F81F804E2;
	Mon,  2 Aug 2021 09:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4874F804EB; Mon,  2 Aug 2021 09:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CE28F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CE28F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yNcUwrQT"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="dcCSf0B0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 023621FF36;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=medMf15SqWRW+2TGgnDX55CtdJten4VcbwizfAEbFuE=;
 b=yNcUwrQTlg0NuyvGW7dmGxmaWy7RSjJ89RylbZeaQZfUXrhU89XTQK6R50ictVkTmMl9OU
 Bwj78BEwXHwOdbIBm3+ToWmrxbLXbKwHrE0V/75buTG6RIClyKj9XUd5VbXIQbVWGMgNvJ
 NXf+m5E1q8IeqMyaCb6+LTdc9epLJCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=medMf15SqWRW+2TGgnDX55CtdJten4VcbwizfAEbFuE=;
 b=dcCSf0B0Cg2Ek8ayNrtMyNsU2Z6KpyTnmroGUwArfbpcWenN/6m+2bbKmCYjBdBQ2bSoVa
 JCJER9KyFujsimAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E1CDEA3B85;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/15] ALSA: pxa2xx: Use managed PCM buffer allocation
Date: Mon,  2 Aug 2021 09:28:05 +0200
Message-Id: <20210802072815.13551-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210802072815.13551-1-tiwai@suse.de>
References: <20210802072815.13551-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>
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

Now with the recent addition of WC buffer allocation support, we can
use the standard PCM buffer allocation helpers for pxa2xx drivers.
This allows us to remove lots of superfluous code.

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pxa2xx-lib.h  | 13 +-----
 sound/arm/pxa2xx-ac97.c     | 18 ++------
 sound/arm/pxa2xx-pcm-lib.c  | 90 +++----------------------------------
 sound/soc/pxa/pxa-ssp.c     |  3 --
 sound/soc/pxa/pxa2xx-ac97.c |  3 --
 sound/soc/pxa/pxa2xx-i2s.c  |  3 --
 sound/soc/pxa/pxa2xx-pcm.c  |  3 --
 7 files changed, 10 insertions(+), 123 deletions(-)

diff --git a/include/sound/pxa2xx-lib.h b/include/sound/pxa2xx-lib.h
index 0feaf16e6ac0..95100cff25d1 100644
--- a/include/sound/pxa2xx-lib.h
+++ b/include/sound/pxa2xx-lib.h
@@ -14,18 +14,12 @@ struct snd_soc_component;
 
 extern int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params);
-extern int pxa2xx_pcm_hw_free(struct snd_pcm_substream *substream);
 extern int pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd);
 extern snd_pcm_uframes_t pxa2xx_pcm_pointer(struct snd_pcm_substream *substream);
 extern int pxa2xx_pcm_prepare(struct snd_pcm_substream *substream);
 extern int pxa2xx_pcm_open(struct snd_pcm_substream *substream);
 extern int pxa2xx_pcm_close(struct snd_pcm_substream *substream);
-extern int pxa2xx_pcm_mmap(struct snd_pcm_substream *substream,
-	struct vm_area_struct *vma);
-extern int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream);
-extern void pxa2xx_pcm_free_dma_buffers(struct snd_pcm *pcm);
-extern void pxa2xx_soc_pcm_free(struct snd_soc_component *component,
-				struct snd_pcm *pcm);
+extern int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm);
 extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
 			      struct snd_soc_pcm_runtime *rtd);
 extern int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
@@ -35,8 +29,6 @@ extern int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
 extern int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
 				    struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params);
-extern int pxa2xx_soc_pcm_hw_free(struct snd_soc_component *component,
-				  struct snd_pcm_substream *substream);
 extern int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream);
 extern int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
@@ -44,9 +36,6 @@ extern int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
 extern snd_pcm_uframes_t
 pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
 		       struct snd_pcm_substream *substream);
-extern int pxa2xx_soc_pcm_mmap(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream,
-			       struct vm_area_struct *vma);
 
 /* AC97 */
 
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index a67e6685b00c..c17a19fe59ed 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -172,38 +172,28 @@ static const struct snd_pcm_ops pxa2xx_ac97_pcm_ops = {
 	.open		= pxa2xx_ac97_pcm_open,
 	.close		= pxa2xx_ac97_pcm_close,
 	.hw_params	= pxa2xx_pcm_hw_params,
-	.hw_free	= pxa2xx_pcm_hw_free,
 	.prepare	= pxa2xx_ac97_pcm_prepare,
 	.trigger	= pxa2xx_pcm_trigger,
 	.pointer	= pxa2xx_pcm_pointer,
-	.mmap		= pxa2xx_pcm_mmap,
 };
 
 
 static int pxa2xx_ac97_pcm_new(struct snd_card *card)
 {
 	struct snd_pcm *pcm;
-	int stream, ret;
+	int ret;
 
 	ret = snd_pcm_new(card, "PXA2xx-PCM", 0, 1, 1, &pcm);
 	if (ret)
 		goto out;
 
-	pcm->private_free = pxa2xx_pcm_free_dma_buffers;
-
 	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
 	if (ret)
 		goto out;
 
-	stream = SNDRV_PCM_STREAM_PLAYBACK;
-	snd_pcm_set_ops(pcm, stream, &pxa2xx_ac97_pcm_ops);
-	ret = pxa2xx_pcm_preallocate_dma_buffer(pcm, stream);
-	if (ret)
-		goto out;
-
-	stream = SNDRV_PCM_STREAM_CAPTURE;
-	snd_pcm_set_ops(pcm, stream, &pxa2xx_ac97_pcm_ops);
-	ret = pxa2xx_pcm_preallocate_dma_buffer(pcm, stream);
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pxa2xx_ac97_pcm_ops);
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pxa2xx_ac97_pcm_ops);
+	ret = pxa2xx_pcm_preallocate_dma_buffer(pcm);
 	if (ret)
 		goto out;
 
diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index e81083e1bc68..0a48805e513a 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -54,19 +54,10 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
 	return 0;
 }
 EXPORT_SYMBOL(pxa2xx_pcm_hw_params);
 
-int pxa2xx_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	snd_pcm_set_runtime_buffer(substream, NULL);
-	return 0;
-}
-EXPORT_SYMBOL(pxa2xx_pcm_hw_free);
-
 int pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	return snd_dmaengine_pcm_trigger(substream, cmd);
@@ -131,56 +122,14 @@ int pxa2xx_pcm_close(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(pxa2xx_pcm_close);
 
-int pxa2xx_pcm_mmap(struct snd_pcm_substream *substream,
-	struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	return dma_mmap_wc(substream->pcm->card->dev, vma, runtime->dma_area,
-			   runtime->dma_addr, runtime->dma_bytes);
-}
-EXPORT_SYMBOL(pxa2xx_pcm_mmap);
-
-int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
+int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm)
 {
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
 	size_t size = pxa2xx_pcm_hardware.buffer_bytes_max;
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->private_data = NULL;
-	buf->area = dma_alloc_wc(pcm->card->dev, size, &buf->addr, GFP_KERNEL);
-	if (!buf->area)
-		return -ENOMEM;
-	buf->bytes = size;
-	return 0;
-}
-EXPORT_SYMBOL(pxa2xx_pcm_preallocate_dma_buffer);
 
-void pxa2xx_pcm_free_dma_buffers(struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-	int stream;
-
-	for (stream = 0; stream < 2; stream++) {
-		substream = pcm->streams[stream].substream;
-		if (!substream)
-			continue;
-		buf = &substream->dma_buffer;
-		if (!buf->area)
-			continue;
-		dma_free_wc(pcm->card->dev, buf->bytes, buf->area, buf->addr);
-		buf->area = NULL;
-	}
-}
-EXPORT_SYMBOL(pxa2xx_pcm_free_dma_buffers);
-
-void pxa2xx_soc_pcm_free(struct snd_soc_component *component,
-			 struct snd_pcm *pcm)
-{
-	pxa2xx_pcm_free_dma_buffers(pcm);
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
+					    pcm->card->dev, size);
 }
-EXPORT_SYMBOL(pxa2xx_soc_pcm_free);
+EXPORT_SYMBOL(pxa2xx_pcm_preallocate_dma_buffer);
 
 int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
@@ -193,21 +142,7 @@ int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = pxa2xx_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			goto out;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = pxa2xx_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE);
-		if (ret)
-			goto out;
-	}
- out:
-	return ret;
+	return pxa2xx_pcm_preallocate_dma_buffer(pcm);
 }
 EXPORT_SYMBOL(pxa2xx_soc_pcm_new);
 
@@ -233,13 +168,6 @@ int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL(pxa2xx_soc_pcm_hw_params);
 
-int pxa2xx_soc_pcm_hw_free(struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
-{
-	return pxa2xx_pcm_hw_free(substream);
-}
-EXPORT_SYMBOL(pxa2xx_soc_pcm_hw_free);
-
 int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
@@ -262,14 +190,6 @@ pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL(pxa2xx_soc_pcm_pointer);
 
-int pxa2xx_soc_pcm_mmap(struct snd_soc_component *component,
-			struct snd_pcm_substream *substream,
-			struct vm_area_struct *vma)
-{
-	return pxa2xx_pcm_mmap(substream, vma);
-}
-EXPORT_SYMBOL(pxa2xx_soc_pcm_mmap);
-
 MODULE_AUTHOR("Nicolas Pitre");
 MODULE_DESCRIPTION("Intel PXA2xx sound library");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 939e7e28486a..7f13a35e9cc1 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -850,15 +850,12 @@ static struct snd_soc_dai_driver pxa_ssp_dai = {
 static const struct snd_soc_component_driver pxa_ssp_component = {
 	.name		= "pxa-ssp",
 	.pcm_construct	= pxa2xx_soc_pcm_new,
-	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
-	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
 	.trigger	= pxa2xx_soc_pcm_trigger,
 	.pointer	= pxa2xx_soc_pcm_pointer,
-	.mmap		= pxa2xx_soc_pcm_mmap,
 	.suspend	= pxa_ssp_suspend,
 	.resume		= pxa_ssp_resume,
 };
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 4240fde6aae8..58f8541ba55c 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -202,15 +202,12 @@ static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 static const struct snd_soc_component_driver pxa_ac97_component = {
 	.name		= "pxa-ac97",
 	.pcm_construct	= pxa2xx_soc_pcm_new,
-	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
-	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
 	.trigger	= pxa2xx_soc_pcm_trigger,
 	.pointer	= pxa2xx_soc_pcm_pointer,
-	.mmap		= pxa2xx_soc_pcm_mmap,
 };
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index bcde4a96c168..5bfc1a966532 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -359,15 +359,12 @@ static struct snd_soc_dai_driver pxa_i2s_dai = {
 static const struct snd_soc_component_driver pxa_i2s_component = {
 	.name		= "pxa-i2s",
 	.pcm_construct	= pxa2xx_soc_pcm_new,
-	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
-	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
 	.trigger	= pxa2xx_soc_pcm_trigger,
 	.pointer	= pxa2xx_soc_pcm_pointer,
-	.mmap		= pxa2xx_soc_pcm_mmap,
 	.suspend	= pxa2xx_soc_pcm_suspend,
 	.resume		= pxa2xx_soc_pcm_resume,
 };
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 2b7839715dd5..9d6c41f775e5 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -19,15 +19,12 @@
 
 static const struct snd_soc_component_driver pxa2xx_soc_platform = {
 	.pcm_construct	= pxa2xx_soc_pcm_new,
-	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
-	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
 	.trigger	= pxa2xx_soc_pcm_trigger,
 	.pointer	= pxa2xx_soc_pcm_pointer,
-	.mmap		= pxa2xx_soc_pcm_mmap,
 };
 
 static int pxa2xx_soc_platform_probe(struct platform_device *pdev)
-- 
2.26.2

