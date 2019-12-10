Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2D118B17
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B275C16B3;
	Tue, 10 Dec 2019 15:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B275C16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988656;
	bh=0Gg44kKuUEhysgZ3HfGMoXk3dZ+WMQ3fhvihXcgcMIg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ckn+AsskHya5aDAJfEAJzw1VyPMzmCYB3mhfWxaCOmh3jIFNhhoQRcfBxMMKFQJ2p
	 QFEI/hINyGZ3AyEyLogXkarLuRXA01s3dS6G3DXJVcp/0R1Vv8AVjfnmEhfV2dWih1
	 az+kfgOpiwZ+7xvtKRiaPfuRx/eWsBpnLuGkvZfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 428EBF80306;
	Tue, 10 Dec 2019 15:27:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ACD1F8029A; Tue, 10 Dec 2019 15:26:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 974DDF80257
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974DDF80257
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E0B2B203;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:03 +0100
Message-Id: <20191210142614.19405-13-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>
Subject: [alsa-devel] [PATCH for-5.6 12/23] ASoC: stm32: Use managed buffer
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

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped, as well as the superfluous
snd_pcm_lib_preallocate_free_for_all() call.  As of the result,
hw_free and pcm_destruct ops became empty and got removed.

Cc: Olivier Moysan <olivier.moysan@st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
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
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
