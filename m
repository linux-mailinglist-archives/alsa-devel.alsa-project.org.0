Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E414434A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2287167B;
	Tue, 21 Jan 2020 18:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2287167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579627943;
	bh=zPIRF17gQS09EMgr1+bfBP6o4sJyJYKL9qZz37j/IFE=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JWNWhR8/7HxYGcN4xG37HQIrQjQGoOgA0DlXExl+kmNaPYJ3gJnfiBTlICqZWZEkF
	 k3+AGhT6+vxR9P+cVUflLu/7FiEVNEQJzMZb53H7FGj0zkwI4QxjGYw1yPfjd16Q4d
	 gK0H5Lf6jR9ACfkBoZtwlQBHqhCDZFprHuWjoSm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10625F80291;
	Tue, 21 Jan 2020 18:28:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54EEFF8027D; Tue, 21 Jan 2020 18:28:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7C749F80272
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C749F80272
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A0A4328;
 Tue, 21 Jan 2020 09:28:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 189E13F6C4;
 Tue, 21 Jan 2020 09:28:15 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnffx7i4.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87pnffx7i4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove bus_control" to the
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

   ASoC: soc-core: remove bus_control

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

From 250a15cf575a655097151ad887cea02dd0977136 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:05:07 +0900
Subject: [PATCH] ASoC: soc-core: remove bus_control

Now, snd_soc_dai_driver::bus_control is used for how to resume.
But, no driver which has bus_control has DAI driver suspend/resume
support.
This patch removes pointless bus_control from ALSA SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnffx7i4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h          |  1 -
 sound/soc/au1x/ac97c.c           |  1 -
 sound/soc/au1x/psc-ac97.c        |  1 -
 sound/soc/cirrus/ep93xx-ac97.c   |  1 -
 sound/soc/fsl/fsl_ssi.c          |  1 -
 sound/soc/fsl/imx-ssi.c          |  1 -
 sound/soc/fsl/mpc5200_psc_ac97.c |  2 --
 sound/soc/pxa/pxa2xx-ac97.c      |  3 ---
 sound/soc/sh/hac.c               |  1 -
 sound/soc/soc-core.c             | 24 +++---------------------
 sound/soc/tegra/tegra20_ac97.c   |  1 -
 sound/soc/txx9/txx9aclc-ac97.c   |  1 -
 12 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 2ccecf3e03d5..eaaeb00e9e84 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -302,7 +302,6 @@ struct snd_soc_dai_driver {
 	unsigned int symmetric_rates:1;
 	unsigned int symmetric_channels:1;
 	unsigned int symmetric_samplebits:1;
-	unsigned int bus_control:1; /* DAI is also used for the control bus */
 
 	/* probe ordering - for components with runtime dependencies */
 	int probe_order;
diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index 0792c40e6cc1..73c6a0edb3d8 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -206,7 +206,6 @@ static int au1xac97c_dai_probe(struct snd_soc_dai *dai)
 
 static struct snd_soc_dai_driver au1xac97c_dai_driver = {
 	.name			= "alchemy-ac97c",
-	.bus_control		= true,
 	.probe			= au1xac97c_dai_probe,
 	.playback = {
 		.rates		= AC97_RATES,
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 08bc04e2da2a..0227993c5da8 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -339,7 +339,6 @@ static const struct snd_soc_dai_ops au1xpsc_ac97_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver au1xpsc_ac97_dai_template = {
-	.bus_control		= true,
 	.probe			= au1xpsc_ac97_probe,
 	.playback = {
 		.rates		= AC97_RATES,
diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index e21eaa1893d1..1c45fb9ff990 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -336,7 +336,6 @@ static const struct snd_soc_dai_ops ep93xx_ac97_dai_ops = {
 static struct snd_soc_dai_driver ep93xx_ac97_dai = {
 	.name		= "ep93xx-ac97",
 	.id		= 0,
-	.bus_control	= true,
 	.probe		= ep93xx_ac97_dai_probe,
 	.playback	= {
 		.stream_name	= "AC97 Playback",
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 537dc69256f0..5c97269be346 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1136,7 +1136,6 @@ static const struct snd_soc_component_driver fsl_ssi_component = {
 };
 
 static struct snd_soc_dai_driver fsl_ssi_ac97_dai = {
-	.bus_control = true,
 	.symmetric_channels = 1,
 	.probe = fsl_ssi_dai_probe,
 	.playback = {
diff --git a/sound/soc/fsl/imx-ssi.c b/sound/soc/fsl/imx-ssi.c
index 42031ba7da31..f8488e8f5f5b 100644
--- a/sound/soc/fsl/imx-ssi.c
+++ b/sound/soc/fsl/imx-ssi.c
@@ -373,7 +373,6 @@ static struct snd_soc_dai_driver imx_ssi_dai = {
 
 static struct snd_soc_dai_driver imx_ac97_dai = {
 	.probe = imx_ssi_dai_probe,
-	.bus_control = true,
 	.playback = {
 		.stream_name = "AC97 Playback",
 		.channels_min = 2,
diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index e5b9c04d1565..a082ae636a4f 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -233,7 +233,6 @@ static const struct snd_soc_dai_ops psc_ac97_digital_ops = {
 static struct snd_soc_dai_driver psc_ac97_dai[] = {
 {
 	.name = "mpc5200-psc-ac97.0",
-	.bus_control = true,
 	.probe	= psc_ac97_probe,
 	.playback = {
 		.stream_name	= "AC97 Playback",
@@ -253,7 +252,6 @@ static struct snd_soc_dai_driver psc_ac97_dai[] = {
 },
 {
 	.name = "mpc5200-psc-ac97.1",
-	.bus_control = true,
 	.playback = {
 		.stream_name	= "AC97 SPDIF",
 		.channels_min   = 1,
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 22fe77955c2c..4240fde6aae8 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -157,7 +157,6 @@ static const struct snd_soc_dai_ops pxa_ac97_mic_dai_ops = {
 static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 {
 	.name = "pxa2xx-ac97",
-	.bus_control = true,
 	.playback = {
 		.stream_name = "AC97 Playback",
 		.channels_min = 2,
@@ -174,7 +173,6 @@ static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 },
 {
 	.name = "pxa2xx-ac97-aux",
-	.bus_control = true,
 	.playback = {
 		.stream_name = "AC97 Aux Playback",
 		.channels_min = 1,
@@ -191,7 +189,6 @@ static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 },
 {
 	.name = "pxa2xx-ac97-mic",
-	.bus_control = true,
 	.capture = {
 		.stream_name = "AC97 Mic Capture",
 		.channels_min = 1,
diff --git a/sound/soc/sh/hac.c b/sound/soc/sh/hac.c
index 17622ceb98c0..475fc984f8c5 100644
--- a/sound/soc/sh/hac.c
+++ b/sound/soc/sh/hac.c
@@ -270,7 +270,6 @@ static const struct snd_soc_dai_ops hac_dai_ops = {
 static struct snd_soc_dai_driver sh4_hac_dai[] = {
 {
 	.name			= "hac-dai.0",
-	.bus_control		= true,
 	.playback = {
 		.rates		= AC97_RATES,
 		.formats	= AC97_FMTS,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b0ec3233125a..f969a3b8c82b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -712,8 +712,6 @@ static void soc_resume_deferred(struct work_struct *work)
 int snd_soc_resume(struct device *dev)
 {
 	struct snd_soc_card *card = dev_get_drvdata(dev);
-	bool bus_control = false;
-	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
 
 	/* If the card is not initialized yet there is nothing to do */
@@ -725,25 +723,9 @@ int snd_soc_resume(struct device *dev)
 		if (component->active)
 			pinctrl_pm_select_default_state(component->dev);
 
-	/*
-	 * DAIs that also act as the control bus master might have other drivers
-	 * hanging off them so need to resume immediately. Other drivers don't
-	 * have that problem and may take a substantial amount of time to resume
-	 * due to I/O costs and anti-pop so handle them out of line.
-	 */
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		bus_control |= cpu_dai->driver->bus_control;
-	}
-	if (bus_control) {
-		dev_dbg(dev, "ASoC: Resuming control bus master immediately\n");
-		soc_resume_deferred(&card->deferred_resume_work);
-	} else {
-		dev_dbg(dev, "ASoC: Scheduling resume work\n");
-		if (!schedule_work(&card->deferred_resume_work))
-			dev_err(dev, "ASoC: resume work item may be lost\n");
-	}
+	dev_dbg(dev, "ASoC: Scheduling resume work\n");
+	if (!schedule_work(&card->deferred_resume_work))
+		dev_err(dev, "ASoC: resume work item may be lost\n");
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 09c8516d7c4d..06c728ae17ed 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -219,7 +219,6 @@ static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 
 static struct snd_soc_dai_driver tegra20_ac97_dai = {
 	.name = "tegra-ac97-pcm",
-	.bus_control = true,
 	.probe = tegra20_ac97_probe,
 	.playback = {
 		.stream_name = "PCM Playback",
diff --git a/sound/soc/txx9/txx9aclc-ac97.c b/sound/soc/txx9/txx9aclc-ac97.c
index bfaa9b3fda43..b1d9615f2375 100644
--- a/sound/soc/txx9/txx9aclc-ac97.c
+++ b/sound/soc/txx9/txx9aclc-ac97.c
@@ -148,7 +148,6 @@ static int txx9aclc_ac97_remove(struct snd_soc_dai *dai)
 }
 
 static struct snd_soc_dai_driver txx9aclc_ac97_dai = {
-	.bus_control		= true,
 	.probe			= txx9aclc_ac97_probe,
 	.remove			= txx9aclc_ac97_remove,
 	.playback = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
