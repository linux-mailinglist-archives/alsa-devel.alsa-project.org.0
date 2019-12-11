Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F374B11B993
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:05:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8239C166A;
	Wed, 11 Dec 2019 18:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8239C166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083917;
	bh=pNZViub4yLb15DAmyzANpeHI7wcOA+4y/+dzBIxZxE0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TT9h8SYr66UgCfdI5u+K1zq1BbgzEKwYbhhCwysyjGscmqHqBqCNW9CY0N8B2vPrk
	 NPFrIVOVRwpWd1kwjQI6Ft4FMujzj8boyddye7ZjG72TAMDeT3Vk7rGR+vphQAKjrX
	 C3wByageaYmeMOUc6nvPN3DGIigIp9zIj6gI7PII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 269DBF80337;
	Wed, 11 Dec 2019 17:53:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 224EBF80316; Wed, 11 Dec 2019 17:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E4965F802F9
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4965F802F9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3743F30E;
 Wed, 11 Dec 2019 08:53:44 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB1BC3F52E;
 Wed, 11 Dec 2019 08:53:43 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-13-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-13-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: Olivier Moysan <olivier.moysan@st.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [alsa-devel] Applied "ASoC: stm32: Use managed buffer allocation"
	to the asoc tree
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

The patch

   ASoC: stm32: Use managed buffer allocation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6f7aff352e690bd167d97f8354543855cf6c34b8 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:26:03 +0100
Subject: [PATCH] ASoC: stm32: Use managed buffer allocation

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped, as well as the superfluous
snd_pcm_lib_preallocate_free_for_all() call.  As of the result,
hw_free and pcm_destruct ops became empty and got removed.

Cc: Olivier Moysan <olivier.moysan@st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-13-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_adfsdm.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 81c407da15c5..807fee1eac66 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -252,7 +252,6 @@ static int stm32_adfsdm_pcm_close(struct snd_soc_component *component,
 	struct stm32_adfsdm_priv *priv =
 		snd_soc_dai_get_drvdata(rtd->cpu_dai);
 
-	snd_pcm_lib_free_pages(substream);
 	priv->substream = NULL;
 
 	return 0;
@@ -276,25 +275,13 @@ static int stm32_adfsdm_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
 		snd_soc_dai_get_drvdata(rtd->cpu_dai);
-	int ret;
 
-	ret =  snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0)
-		return ret;
 	priv->pcm_buff = substream->runtime->dma_area;
 
 	return iio_channel_cb_set_buffer_watermark(priv->iio_cb,
 						   params_period_size(params));
 }
 
-static int stm32_adfsdm_pcm_hw_free(struct snd_soc_component *component,
-				    struct snd_pcm_substream *substream)
-{
-	snd_pcm_lib_free_pages(substream);
-
-	return 0;
-}
-
 static int stm32_adfsdm_pcm_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
@@ -303,30 +290,18 @@ static int stm32_adfsdm_pcm_new(struct snd_soc_component *component,
 		snd_soc_dai_get_drvdata(rtd->cpu_dai);
 	unsigned int size = DFSDM_MAX_PERIODS * DFSDM_MAX_PERIOD_SIZE;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      priv->dev, size, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       priv->dev, size, size);
 	return 0;
 }
 
-static void stm32_adfsdm_pcm_free(struct snd_soc_component *component,
-				  struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-
-	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (substream)
-		snd_pcm_lib_preallocate_free_for_all(pcm);
-}
-
 static struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.open		= stm32_adfsdm_pcm_open,
 	.close		= stm32_adfsdm_pcm_close,
 	.hw_params	= stm32_adfsdm_pcm_hw_params,
-	.hw_free	= stm32_adfsdm_pcm_hw_free,
 	.trigger	= stm32_adfsdm_trigger,
 	.pointer	= stm32_adfsdm_pcm_pointer,
 	.pcm_construct	= stm32_adfsdm_pcm_new,
-	.pcm_destruct	= stm32_adfsdm_pcm_free,
 };
 
 static const struct of_device_id stm32_adfsdm_of_match[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
