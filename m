Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02C118AED
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:32:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4392B1661;
	Tue, 10 Dec 2019 15:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4392B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988366;
	bh=SPgvFIKmVpw/pKQnExDSqy6xVxXSd4NwOCs5gH6mYgA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2mDTy0uTIU5HjBmpmjxGE9vyuvd7WoxuCkFz3OzvbYYXTt42Hh/dJlE8amadhYx5
	 qkq1KkeJF1sxBQmmzQHz4ApLpaonxGwBKc/OoIgdOGgbaeRuNr7vP9LvqdtCVIvHfx
	 nYEEJJRXmO5ds0AN0nhlCsytB+a4rwNC0jdaefIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A203F8029A;
	Tue, 10 Dec 2019 15:26:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D7BBF8027B; Tue, 10 Dec 2019 15:26:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C032AF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C032AF800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD7EBB1DB;
 Tue, 10 Dec 2019 14:26:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:25:55 +0100
Message-Id: <20191210142614.19405-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 04/23] ASoC: mediatek: Use managed
	buffer allocation
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c          | 14 +-------------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h          |  2 --
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 12 ++----------
 sound/soc/mediatek/common/mtk-afe-platform-driver.h |  2 --
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c          |  2 --
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c          |  1 -
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          |  1 -
 7 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 10ea4fdbeb1e..f3af396da392 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -122,11 +122,7 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
 	int msb_at_bit33 = 0;
-	int ret, fs = 0;
-
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0)
-		return ret;
+	int fs = 0;
 
 	msb_at_bit33 = upper_32_bits(substream->runtime->dma_addr) ? 1 : 0;
 	memif->phys_buf_addr = lower_32_bits(substream->runtime->dma_addr);
@@ -169,13 +165,6 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_params);
 
-int mtk_afe_fe_hw_free(struct snd_pcm_substream *substream,
-		       struct snd_soc_dai *dai)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_free);
-
 int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		       struct snd_soc_dai *dai)
 {
@@ -275,7 +264,6 @@ const struct snd_soc_dai_ops mtk_afe_fe_ops = {
 	.startup	= mtk_afe_fe_startup,
 	.shutdown	= mtk_afe_fe_shutdown,
 	.hw_params	= mtk_afe_fe_hw_params,
-	.hw_free	= mtk_afe_fe_hw_free,
 	.prepare	= mtk_afe_fe_prepare,
 	.trigger	= mtk_afe_fe_trigger,
 };
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index 55074fb9861a..5263690e225d 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -20,8 +20,6 @@ void mtk_afe_fe_shutdown(struct snd_pcm_substream *substream,
 int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params,
 			 struct snd_soc_dai *dai);
-int mtk_afe_fe_hw_free(struct snd_pcm_substream *substream,
-		       struct snd_soc_dai *dai);
 int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai);
 int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index b6624d8d084b..719d43bb0b8f 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,25 +120,17 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      afe->dev, size, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       afe->dev, size, size);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
-void mtk_afe_pcm_free(struct snd_soc_component *component,
-		      struct snd_pcm *pcm)
-{
-	snd_pcm_lib_preallocate_free_for_all(pcm);
-}
-EXPORT_SYMBOL_GPL(mtk_afe_pcm_free);
-
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
-	.pcm_destruct	= mtk_afe_pcm_free,
 };
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_platform);
 
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
index e550d11568c3..fcc923b88f12 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
@@ -21,8 +21,6 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream);
 int mtk_afe_pcm_new(struct snd_soc_component *component,
 		    struct snd_soc_pcm_runtime *rtd);
-void mtk_afe_pcm_free(struct snd_soc_component *component,
-		      struct snd_pcm *pcm);
 
 int mtk_afe_combine_sub_dai(struct mtk_base_afe *afe);
 int mtk_afe_add_sub_dai_control(struct snd_soc_component *component);
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 76502ba261c8..7318d452b764 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -515,7 +515,6 @@ static const struct snd_soc_dai_ops mt2701_single_memif_dai_ops = {
 	.startup	= mt2701_simple_fe_startup,
 	.shutdown	= mtk_afe_fe_shutdown,
 	.hw_params	= mt2701_simple_fe_hw_params,
-	.hw_free	= mtk_afe_fe_hw_free,
 	.prepare	= mtk_afe_fe_prepare,
 	.trigger	= mtk_afe_fe_trigger,
 };
@@ -524,7 +523,6 @@ static const struct snd_soc_dai_ops mt2701_dlm_memif_dai_ops = {
 	.startup	= mt2701_dlm_fe_startup,
 	.shutdown	= mt2701_dlm_fe_shutdown,
 	.hw_params	= mt2701_dlm_fe_hw_params,
-	.hw_free	= mtk_afe_fe_hw_free,
 	.prepare	= mtk_afe_fe_prepare,
 	.trigger	= mt2701_dlm_fe_trigger,
 };
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 033c07fb599c..0743c699d8c1 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -715,7 +715,6 @@ static const struct snd_soc_component_driver mt6797_afe_component = {
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
-	.pcm_destruct	= mtk_afe_pcm_free,
 };
 
 static int mt6797_dai_memif_register(struct mtk_base_afe *afe)
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 76af09d8f1af..6b5f407de3d0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1053,7 +1053,6 @@ static const struct snd_soc_component_driver mt8183_afe_component = {
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
-	.pcm_destruct	= mtk_afe_pcm_free,
 };
 
 static int mt8183_dai_memif_register(struct mtk_base_afe *afe)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
