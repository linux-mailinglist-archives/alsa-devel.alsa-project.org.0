Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CA614437A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3124169B;
	Tue, 21 Jan 2020 18:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3124169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628507;
	bh=U5vXvpIFqOWB8t5K2S/uh9dYT2JiNxEX5vLT6/JwZMQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=m7/N4Pm2NaSR0hTPzvTYyXkMRtf9SB5GlBM2F9f/ygh+CTL0VElxh3/OpqAXOZkeX
	 +qyW14AN1FNwAN6YwzFkQYF1qTYDxUrFPaZqFi+Yjq3l068p2F1R8BRO7pNgMKKX+V
	 KHWPeHHWjqwuNvOUL5AgbguYhxKPDv2mK+2C9FVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15E7F8035F;
	Tue, 21 Jan 2020 18:29:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3451CF80336; Tue, 21 Jan 2020 18:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 12B33F801EC
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B33F801EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B9B630E;
 Tue, 21 Jan 2020 09:28:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8683F6C4;
 Tue, 21 Jan 2020 09:28:50 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a76jym4p.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87a76jym4p.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cirrus: ep93xx-i2s: move
	.suspend/.resume to component" to the asoc tree
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

   ASoC: cirrus: ep93xx-i2s: move .suspend/.resume to component

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

From 7b6e7b137e2ae5f789d2c8ab7df9f3650b5deaf1 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:03:50 +0900
Subject: [PATCH] ASoC: cirrus: ep93xx-i2s: move .suspend/.resume to component

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
Link: https://lore.kernel.org/r/87a76jym4p.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/cirrus/ep93xx-i2s.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 7d9cf67129d4..723f4cf19467 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -364,11 +364,11 @@ static int ep93xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
 }
 
 #ifdef CONFIG_PM
-static int ep93xx_i2s_suspend(struct snd_soc_dai *dai)
+static int ep93xx_i2s_suspend(struct snd_soc_component *component)
 {
-	struct ep93xx_i2s_info *info = snd_soc_dai_get_drvdata(dai);
+	struct ep93xx_i2s_info *info = snd_soc_component_get_drvdata(component);
 
-	if (!dai->active)
+	if (!component->active)
 		return 0;
 
 	ep93xx_i2s_disable(info, SNDRV_PCM_STREAM_PLAYBACK);
@@ -377,11 +377,11 @@ static int ep93xx_i2s_suspend(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static int ep93xx_i2s_resume(struct snd_soc_dai *dai)
+static int ep93xx_i2s_resume(struct snd_soc_component *component)
 {
-	struct ep93xx_i2s_info *info = snd_soc_dai_get_drvdata(dai);
+	struct ep93xx_i2s_info *info = snd_soc_component_get_drvdata(component);
 
-	if (!dai->active)
+	if (!component->active)
 		return 0;
 
 	ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_PLAYBACK);
@@ -406,8 +406,6 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 static struct snd_soc_dai_driver ep93xx_i2s_dai = {
 	.symmetric_rates= 1,
 	.probe		= ep93xx_i2s_dai_probe,
-	.suspend	= ep93xx_i2s_suspend,
-	.resume		= ep93xx_i2s_resume,
 	.playback	= {
 		.channels_min	= 2,
 		.channels_max	= 2,
@@ -425,6 +423,8 @@ static struct snd_soc_dai_driver ep93xx_i2s_dai = {
 
 static const struct snd_soc_component_driver ep93xx_i2s_component = {
 	.name		= "ep93xx-i2s",
+	.suspend	= ep93xx_i2s_suspend,
+	.resume		= ep93xx_i2s_resume,
 };
 
 static int ep93xx_i2s_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
