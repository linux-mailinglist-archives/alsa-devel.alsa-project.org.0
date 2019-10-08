Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1482ECFAD7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1A84167D;
	Tue,  8 Oct 2019 15:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1A84167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539772;
	bh=rtzgwSSxr4Gaxu4DfdJ83ejUl3tWvejHPlCK6sGazVQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=u0xEddQG4rbtIfxGEpWYcfSkSAUBIOnwU5mXah/UMV0hMFoIFtKSkS9yVkYrSa23o
	 GQq/AwKWCNelpw6EvwB210It9ZZRT2Wn/3t4DKKKKpwnKBbAlINNrWgH0yZYni/GCt
	 Iw366hjZLLmRTW2Ki9DcL7s2hRSTgXnv0QWJFysI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F91F80746;
	Tue,  8 Oct 2019 14:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C2CF8068A; Tue,  8 Oct 2019 14:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E219F80322
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E219F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rPcJJUx3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=m1tVcyK82gakXH0sVmKtLvrwu/aXBpvq1f4wW4IcEoE=; b=rPcJJUx3EvvW
 ZtCHtFD7Oq9cpFAd2tIEQC/hM0anTjxKVKAqHgdwz1+vuVFZrrfkWmuieMkCKKD7//HM6Of2880Bo
 Ltg1gVCCrJBDu5bkSS8RpBTUY3+5gD7GA8bbuSiv3cUHFTkW2qW3z+6rEOWllmyYgGIWTRu1aOj3l
 uaIIU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozX-0008Mu-TQ; Tue, 08 Oct 2019 12:53:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6262F2740D4B; Tue,  8 Oct 2019 13:53:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k19n90du.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125327.6262F2740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: remove snd_pcm_ops" to the
	asoc tree
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

   ASoC: mediatek: remove snd_pcm_ops

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 1fddf424b3c49a475ca7c23662f515b53f884172 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:05 +0900
Subject: [PATCH] ASoC: mediatek: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87k19n90du.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 28 ++++++++-----------
 .../mediatek/common/mtk-afe-platform-driver.h | 10 ++++---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    | 11 ++++----
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 11 ++++----
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 3ce527ce30ce..b6624d8d084b 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -77,11 +77,10 @@ int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
 
-static snd_pcm_uframes_t mtk_afe_pcm_pointer
-			 (struct snd_pcm_substream *substream)
+snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
 	const struct mtk_base_memif_data *memif_data = memif->data;
@@ -111,18 +110,13 @@ static snd_pcm_uframes_t mtk_afe_pcm_pointer
 POINTER_RETURN_FRAMES:
 	return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
 }
+EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
 
-const struct snd_pcm_ops mtk_afe_pcm_ops = {
-	.ioctl = snd_pcm_lib_ioctl,
-	.pointer = mtk_afe_pcm_pointer,
-};
-EXPORT_SYMBOL_GPL(mtk_afe_pcm_ops);
-
-int mtk_afe_pcm_new(struct snd_soc_pcm_runtime *rtd)
+int mtk_afe_pcm_new(struct snd_soc_component *component,
+		    struct snd_soc_pcm_runtime *rtd)
 {
 	size_t size;
 	struct snd_pcm *pcm = rtd->pcm;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
@@ -132,17 +126,19 @@ int mtk_afe_pcm_new(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
-void mtk_afe_pcm_free(struct snd_pcm *pcm)
+void mtk_afe_pcm_free(struct snd_soc_component *component,
+		      struct snd_pcm *pcm)
 {
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_free);
 
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
-	.name = AFE_PCM_NAME,
-	.ops = &mtk_afe_pcm_ops,
-	.pcm_new = mtk_afe_pcm_new,
-	.pcm_free = mtk_afe_pcm_free,
+	.name		= AFE_PCM_NAME,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.pointer	= mtk_afe_pcm_pointer,
+	.pcm_construct	= mtk_afe_pcm_new,
+	.pcm_destruct	= mtk_afe_pcm_free,
 };
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_platform);
 
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
index 88df6797732f..e550d11568c3 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
@@ -10,7 +10,6 @@
 #define _MTK_AFE_PLATFORM_DRIVER_H_
 
 #define AFE_PCM_NAME "mtk-afe-pcm"
-extern const struct snd_pcm_ops mtk_afe_pcm_ops;
 extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
 
 struct mtk_base_afe;
@@ -18,9 +17,12 @@ struct snd_pcm;
 struct snd_soc_component;
 struct snd_soc_pcm_runtime;
 
-
-int mtk_afe_pcm_new(struct snd_soc_pcm_runtime *rtd);
-void mtk_afe_pcm_free(struct snd_pcm *pcm);
+snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream);
+int mtk_afe_pcm_new(struct snd_soc_component *component,
+		    struct snd_soc_pcm_runtime *rtd);
+void mtk_afe_pcm_free(struct snd_soc_component *component,
+		      struct snd_pcm *pcm);
 
 int mtk_afe_combine_sub_dai(struct mtk_base_afe *afe);
 int mtk_afe_add_sub_dai_control(struct snd_soc_component *component);
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index e52c032d53aa..033c07fb599c 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -710,11 +710,12 @@ static int mt6797_afe_component_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver mt6797_afe_component = {
-	.name = AFE_PCM_NAME,
-	.ops = &mtk_afe_pcm_ops,
-	.pcm_new = mtk_afe_pcm_new,
-	.pcm_free = mtk_afe_pcm_free,
-	.probe = mt6797_afe_component_probe,
+	.name		= AFE_PCM_NAME,
+	.probe		= mt6797_afe_component_probe,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.pointer	= mtk_afe_pcm_pointer,
+	.pcm_construct	= mtk_afe_pcm_new,
+	.pcm_destruct	= mtk_afe_pcm_free,
 };
 
 static int mt6797_dai_memif_register(struct mtk_base_afe *afe)
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 721632386a50..76af09d8f1af 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1048,11 +1048,12 @@ static int mt8183_afe_component_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver mt8183_afe_component = {
-	.name = AFE_PCM_NAME,
-	.ops = &mtk_afe_pcm_ops,
-	.pcm_new = mtk_afe_pcm_new,
-	.pcm_free = mtk_afe_pcm_free,
-	.probe = mt8183_afe_component_probe,
+	.name		= AFE_PCM_NAME,
+	.probe		= mt8183_afe_component_probe,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.pointer	= mtk_afe_pcm_pointer,
+	.pcm_construct	= mtk_afe_pcm_new,
+	.pcm_destruct	= mtk_afe_pcm_free,
 };
 
 static int mt8183_dai_memif_register(struct mtk_base_afe *afe)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
