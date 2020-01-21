Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56067144371
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED3E9168E;
	Tue, 21 Jan 2020 18:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED3E9168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628430;
	bh=CQq3DP0hkAnpaqL4Wgh3BM0sHbaXiPXcz/puU5dxGhI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nd/7XgBtrK794URNUwE1Mk6wHIIBz3ed/8/GyOcsbteBiI3c16CqI7wpB2PF4Yjq0
	 URjsNpwT0jj9/mKQJHDUYahNdbHuUpyo0/NvQFd3asA8Jqf/qSOZkYogOW/JKDKpVu
	 PqC6ee3YjDszD+dTzhsCEyH+4BY1Mmi7H/1A0yZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FB8F8034C;
	Tue, 21 Jan 2020 18:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 010DCF80304; Tue, 21 Jan 2020 18:28:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3E232F80321
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E232F80321
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BCA01007;
 Tue, 21 Jan 2020 09:28:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA833F6C4;
 Tue, 21 Jan 2020 09:28:45 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e1nym4e.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-877e1nym4e.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: move .suspend/.resume to
	component" to the asoc tree
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

   ASoC: mediatek: move .suspend/.resume to component

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

From 7ec6b43125c070fadf389b80083d939014e13ac9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:04:01 +0900
Subject: [PATCH] ASoC: mediatek: move .suspend/.resume to component

There is no big difference at implementation for .suspend/.resume
between DAI driver and Component driver.
But because some driver is using DAI version, thus ALSA SoC needs
to keep supporting it, hence, framework becoming verbose.
If we can switch all DAI driver .suspend/.resume to Component driver,
we can remove verbose code from ALSA SoC.

Driver is getting its private data via dai->dev.
But dai->dev and component->dev are same dev, thus, we can convert
these. For same reason, we can convert dai->active to
component->active if necessary.

This patch moves DAI driver .suspend/.resume to Component driver

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e1nym4e.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 12 ++++++------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  4 ++--
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 14 ++------------
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 10 ++++------
 4 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 8f314e15ce73..4254f3a954dd 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -319,9 +319,9 @@ int mtk_dynamic_irq_release(struct mtk_base_afe *afe, int irq_id)
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_release);
 
-int mtk_afe_dai_suspend(struct snd_soc_dai *dai)
+int mtk_afe_suspend(struct snd_soc_component *component)
 {
-	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct device *dev = afe->dev;
 	struct regmap *regmap = afe->regmap;
 	int i;
@@ -342,11 +342,11 @@ int mtk_afe_dai_suspend(struct snd_soc_dai *dai)
 	afe->runtime_suspend(dev);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(mtk_afe_dai_suspend);
+EXPORT_SYMBOL_GPL(mtk_afe_suspend);
 
-int mtk_afe_dai_resume(struct snd_soc_dai *dai)
+int mtk_afe_resume(struct snd_soc_component *component)
 {
-	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct device *dev = afe->dev;
 	struct regmap *regmap = afe->regmap;
 	int i = 0;
@@ -366,7 +366,7 @@ int mtk_afe_dai_resume(struct snd_soc_dai *dai)
 	afe->suspended = false;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(mtk_afe_dai_resume);
+EXPORT_SYMBOL_GPL(mtk_afe_resume);
 
 int mtk_memif_set_enable(struct mtk_base_afe *afe, int id)
 {
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index 507e3e7c3c7d..8cec90671827 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -31,8 +31,8 @@ extern const struct snd_soc_dai_ops mtk_afe_fe_ops;
 
 int mtk_dynamic_irq_acquire(struct mtk_base_afe *afe);
 int mtk_dynamic_irq_release(struct mtk_base_afe *afe, int irq_id);
-int mtk_afe_dai_suspend(struct snd_soc_dai *dai);
-int mtk_afe_dai_resume(struct snd_soc_dai *dai);
+int mtk_afe_suspend(struct snd_soc_component *component);
+int mtk_afe_resume(struct snd_soc_component *component);
 
 int mtk_memif_set_enable(struct mtk_base_afe *afe, int id);
 int mtk_memif_set_disable(struct mtk_base_afe *afe, int id);
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 76502ba261c8..488603a0c4b1 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -549,8 +549,6 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	{
 		.name = "PCMO0",
 		.id = MT2701_MEMIF_DL1,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.playback = {
 			.stream_name = "DL1",
 			.channels_min = 1,
@@ -565,8 +563,6 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	{
 		.name = "PCM_multi",
 		.id = MT2701_MEMIF_DLM,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.playback = {
 			.stream_name = "DLM",
 			.channels_min = 1,
@@ -582,8 +578,6 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	{
 		.name = "PCM0",
 		.id = MT2701_MEMIF_UL1,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.capture = {
 			.stream_name = "UL1",
 			.channels_min = 1,
@@ -598,8 +592,6 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	{
 		.name = "PCM1",
 		.id = MT2701_MEMIF_UL2,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.capture = {
 			.stream_name = "UL2",
 			.channels_min = 1,
@@ -615,8 +607,6 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	{
 		.name = "PCM_BT_DL",
 		.id = MT2701_MEMIF_DLBT,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.playback = {
 			.stream_name = "DLBT",
 			.channels_min = 1,
@@ -630,8 +620,6 @@ static struct snd_soc_dai_driver mt2701_afe_pcm_dais[] = {
 	{
 		.name = "PCM_BT_UL",
 		.id = MT2701_MEMIF_ULBT,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.capture = {
 			.stream_name = "ULBT",
 			.channels_min = 1,
@@ -982,6 +970,8 @@ static const struct snd_soc_component_driver mt2701_afe_pcm_dai_component = {
 	.num_dapm_widgets = ARRAY_SIZE(mt2701_afe_pcm_widgets),
 	.dapm_routes = mt2701_afe_pcm_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt2701_afe_pcm_routes),
+	.suspend = mtk_afe_suspend,
+	.resume = mtk_afe_resume,
 };
 
 static const struct mtk_base_memif_data memif_data[MT2701_MEMIF_NUM] = {
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 0ee29255e731..461e4de8c918 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -533,8 +533,6 @@ static struct snd_soc_dai_driver mt8173_afe_pcm_dais[] = {
 	{
 		.name = "DL1", /* downlink 1 */
 		.id = MT8173_AFE_MEMIF_DL1,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.playback = {
 			.stream_name = "DL1",
 			.channels_min = 1,
@@ -546,8 +544,6 @@ static struct snd_soc_dai_driver mt8173_afe_pcm_dais[] = {
 	}, {
 		.name = "VUL", /* voice uplink */
 		.id = MT8173_AFE_MEMIF_VUL,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.capture = {
 			.stream_name = "VUL",
 			.channels_min = 1,
@@ -584,8 +580,6 @@ static struct snd_soc_dai_driver mt8173_afe_hdmi_dais[] = {
 	{
 		.name = "HDMI",
 		.id = MT8173_AFE_MEMIF_HDMI,
-		.suspend = mtk_afe_dai_suspend,
-		.resume = mtk_afe_dai_resume,
 		.playback = {
 			.stream_name = "HDMI",
 			.channels_min = 2,
@@ -681,12 +675,16 @@ static const struct snd_soc_component_driver mt8173_afe_pcm_dai_component = {
 	.num_dapm_widgets = ARRAY_SIZE(mt8173_afe_pcm_widgets),
 	.dapm_routes = mt8173_afe_pcm_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt8173_afe_pcm_routes),
+	.suspend = mtk_afe_suspend,
+	.resume = mtk_afe_resume,
 };
 
 static const struct snd_soc_component_driver mt8173_afe_hdmi_dai_component = {
 	.name = "mt8173-afe-hdmi-dai",
 	.dapm_routes = mt8173_afe_hdmi_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt8173_afe_hdmi_routes),
+	.suspend = mtk_afe_suspend,
+	.resume = mtk_afe_resume,
 };
 
 static const char *aud_clks[MT8173_CLK_NUM] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
