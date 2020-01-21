Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84B144359
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42C6E167F;
	Tue, 21 Jan 2020 18:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42C6E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628144;
	bh=63SRxY8tHoaaKFpTrb0Y7q50CyypcoFHQT/vb4KyeJI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vMkfSqiOV+Ax/+fvDVwc6G4a5RZxPtIL0i3W3ZN2ttNud3XtsrJ2d/hagIYG46fHF
	 AzVmiEU89T7CRuLTZ242WL4idL8c+smEkicJa/Po5xSZeM8DOVHAmB2LYlACBf3KIJ
	 9g5Liutc222LB5Btr61U7cNQ5iS6mk/ncosvtx5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 789CEF802FF;
	Tue, 21 Jan 2020 18:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0572AF802E9; Tue, 21 Jan 2020 18:28:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D0A5F8028B
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0A5F8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0D530E;
 Tue, 21 Jan 2020 09:28:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4D33F6C4;
 Tue, 21 Jan 2020 09:28:30 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2u3x7iy.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87y2u3x7iy.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: dwc: dwc-i2s: move .suspend/.resume to
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

   ASoC: dwc: dwc-i2s: move .suspend/.resume to component

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

From ef20061a34e0e6822cbfd20c11667ae23a96798d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:04:37 +0900
Subject: [PATCH] ASoC: dwc: dwc-i2s: move .suspend/.resume to component

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
Link: https://lore.kernel.org/r/87y2u3x7iy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/dwc/dwc-i2s.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 65112b9d8588..7eeca2150b2d 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -390,10 +390,6 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.set_fmt	= dw_i2s_set_fmt,
 };
 
-static const struct snd_soc_component_driver dw_i2s_component = {
-	.name		= "dw-i2s",
-};
-
 #ifdef CONFIG_PM
 static int dw_i2s_runtime_suspend(struct device *dev)
 {
@@ -413,26 +409,30 @@ static int dw_i2s_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int dw_i2s_suspend(struct snd_soc_dai *dai)
+static int dw_i2s_suspend(struct snd_soc_component *component)
 {
-	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
 
 	if (dev->capability & DW_I2S_MASTER)
 		clk_disable(dev->clk);
 	return 0;
 }
 
-static int dw_i2s_resume(struct snd_soc_dai *dai)
+static int dw_i2s_resume(struct snd_soc_component *component)
 {
-	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dai *dai;
 
 	if (dev->capability & DW_I2S_MASTER)
 		clk_enable(dev->clk);
 
-	if (dai->playback_active)
-		dw_i2s_config(dev, SNDRV_PCM_STREAM_PLAYBACK);
-	if (dai->capture_active)
-		dw_i2s_config(dev, SNDRV_PCM_STREAM_CAPTURE);
+	for_each_component_dais(component, dai) {
+		if (dai->playback_active)
+			dw_i2s_config(dev, SNDRV_PCM_STREAM_PLAYBACK);
+		if (dai->capture_active)
+			dw_i2s_config(dev, SNDRV_PCM_STREAM_CAPTURE);
+	}
+
 	return 0;
 }
 
@@ -441,6 +441,12 @@ static int dw_i2s_resume(struct snd_soc_dai *dai)
 #define dw_i2s_resume	NULL
 #endif
 
+static const struct snd_soc_component_driver dw_i2s_component = {
+	.name		= "dw-i2s",
+	.suspend	= dw_i2s_suspend,
+	.resume		= dw_i2s_resume,
+};
+
 /*
  * The following tables allow a direct lookup of various parameters
  * defined in the I2S block's configuration in terms of sound system
@@ -629,8 +635,6 @@ static int dw_i2s_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dw_i2s_dai->ops = &dw_i2s_dai_ops;
-	dw_i2s_dai->suspend = dw_i2s_suspend;
-	dw_i2s_dai->resume = dw_i2s_resume;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->i2s_base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
