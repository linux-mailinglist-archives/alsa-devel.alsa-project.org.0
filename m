Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F111BA4C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B84F16BC;
	Wed, 11 Dec 2019 18:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B84F16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576085365;
	bh=r7KfazuQcb+TpirZCA4K7WHmN6NupSsvZDwHnuRPLq8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R/b31N8fSq8zH/nYh6QAr+YGpRYL7NE5QLrx/KlIRcvwx8NzrOTb1WlLK6gAQSgkX
	 OZBD8/0AFmyQbj8KP5ljRNbVnBh1CA8LA9fXb6IN92ZUY7O+ZbFzpz3uDRXZIiqWBZ
	 KL3NiKbSuy2aV4tU5pCOBVAQ6N47HpozyYyTQq4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AABF8F80276;
	Wed, 11 Dec 2019 18:20:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E1E1F8023E; Wed, 11 Dec 2019 18:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD2BF8023E
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 18:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD2BF8023E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D744AD73;
 Wed, 11 Dec 2019 17:20:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2019 18:20:18 +0100
Message-Id: <20191211172019.23206-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: mediatek: Use managed buffer
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c          |  6 +-----
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 12 ++----------
 sound/soc/mediatek/common/mtk-afe-platform-driver.h |  2 --
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c          |  1 -
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          |  1 -
 5 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index e761cb66be5d..8f314e15ce73 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -129,10 +129,6 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	snd_pcm_format_t format = params_format(params);
 
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0)
-		return ret;
-
 	if (afe->request_dram_resource)
 		afe->request_dram_resource(afe->dev);
 
@@ -193,7 +189,7 @@ int mtk_afe_fe_hw_free(struct snd_pcm_substream *substream,
 	if (afe->release_dram_resource)
 		afe->release_dram_resource(afe->dev);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_free);
 
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
