Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0C012054C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 13:18:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2E8167B;
	Mon, 16 Dec 2019 13:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2E8167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576498696;
	bh=ZlPl0SSWYKPVHAegEDmV+Xhd4qbBGuy85m+NFWx2JWM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=A89xdTCr7v31h5YPTaPytXpCKsvqh3TGXhSdoMVJ3hkqg6denr2uTKq5HAOOffavD
	 hZFGfV6xbHQ9RJdTNt2657VzFFh6y5Os92OhK/IQvWf0Cdy9OAOHD0uxTCGD6CL5D4
	 gY9R0qILJqP9Zd2sfHhYkN60Xm59PIwhRBdTb0io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AE6F80346;
	Mon, 16 Dec 2019 13:05:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7869EF80322; Mon, 16 Dec 2019 13:05:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 89FCDF80307
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FCDF80307
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 794CE11B3;
 Mon, 16 Dec 2019 04:05:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED1D83F719;
 Mon, 16 Dec 2019 04:05:42 -0800 (PST)
Date: Mon, 16 Dec 2019 12:05:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191211172019.23206-1-tiwai@suse.de>
Message-Id: <applied-20191211172019.23206-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: Use managed buffer
	allocation" to the asoc tree
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

   ASoC: mediatek: Use managed buffer allocation

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

From bf523463d8c38cd92424ed011b90769c29ef99ce Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 11 Dec 2019 18:20:18 +0100
Subject: [PATCH] ASoC: mediatek: Use managed buffer allocation

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped, as well as the superfluous
snd_pcm_lib_preallocate_free_for_all() call.  As of the result,
hw_free and pcm_destruct ops became empty and got removed.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191211172019.23206-1-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index 86c09165fae1..44dfef713905 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,24 +120,16 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
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
index cd7c5fabc605..378bfc16ef52 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -714,7 +714,6 @@ static const struct snd_soc_component_driver mt6797_afe_component = {
 	.probe		= mt6797_afe_component_probe,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
-	.pcm_destruct	= mtk_afe_pcm_free,
 };
 
 static int mt6797_dai_memif_register(struct mtk_base_afe *afe)
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index f6a0fadeb3cc..6e2270bbb10e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1052,7 +1052,6 @@ static const struct snd_soc_component_driver mt8183_afe_component = {
 	.probe		= mt8183_afe_component_probe,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
-	.pcm_destruct	= mtk_afe_pcm_free,
 };
 
 static int mt8183_dai_memif_register(struct mtk_base_afe *afe)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
