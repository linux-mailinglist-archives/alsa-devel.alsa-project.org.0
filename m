Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 693CB144361
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:36:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E1931670;
	Tue, 21 Jan 2020 18:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E1931670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628194;
	bh=6PwclXlPInIJLdq3prNtFBMJ/Ur/uERGN4d1DUQ8C5w=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=n6yTXYZcVo34sXG4HeJcR/bNL2ly4DZG1RNCus6/k1xulFONMhFOXF2RDheNyUZQo
	 VVPg5JbgZqf44tuMosoxRTA14DE8D3h0w7gQrAzQBJO7KR2PqNwwXrgKkCUsbWIsDU
	 kqYlexJDhK4rYvsOwL5JF7UPuIr+kbzjc6jA2u8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC05F802F8;
	Tue, 21 Jan 2020 18:28:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55265F802FB; Tue, 21 Jan 2020 18:28:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D90FF8028B
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D90FF8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3025328;
 Tue, 21 Jan 2020 09:28:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70EC53F6C4;
 Tue, 21 Jan 2020 09:28:33 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhejx7j4.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87zhejx7j4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: uniphier: move .suspend/.resume to
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

   ASoC: uniphier: move .suspend/.resume to component

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

From 9b79b1cd164f4ec64dc0847b03297095e39cdee9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:04:31 +0900
Subject: [PATCH] ASoC: uniphier: move .suspend/.resume to component

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
Link: https://lore.kernel.org/r/87zhejx7j4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/uniphier/aio-cpu.c  | 31 +++++++++++++++++++++++++++----
 sound/soc/uniphier/aio-ld11.c | 18 ------------------
 sound/soc/uniphier/aio-pxs2.c | 14 --------------
 sound/soc/uniphier/aio.h      |  2 --
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 2ae582a99b63..fdaa6522720f 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -420,25 +420,37 @@ int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(uniphier_aio_dai_remove);
 
-int uniphier_aio_dai_suspend(struct snd_soc_dai *dai)
+static void uniphier_aio_dai_suspend(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 
+	if (!dai->active)
+		return;
+
 	aio->chip->num_wup_aios--;
 	if (!aio->chip->num_wup_aios) {
 		reset_control_assert(aio->chip->rst);
 		clk_disable_unprepare(aio->chip->clk);
 	}
+}
+
+static int uniphier_aio_suspend(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai;
 
+	for_each_component_dais(component, dai)
+		uniphier_aio_dai_suspend(dai);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(uniphier_aio_dai_suspend);
 
-int uniphier_aio_dai_resume(struct snd_soc_dai *dai)
+static int uniphier_aio_dai_resume(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 	int ret, i;
 
+	if (!dai->active)
+		return 0;
+
 	if (!aio->chip->active)
 		return 0;
 
@@ -484,7 +496,16 @@ int uniphier_aio_dai_resume(struct snd_soc_dai *dai)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(uniphier_aio_dai_resume);
+
+static int uniphier_aio_resume(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai;
+	int ret = 0;
+
+	for_each_component_dais(component, dai)
+		ret |= uniphier_aio_dai_resume(dai);
+	return ret;
+}
 
 static int uniphier_aio_vol_info(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_info *uinfo)
@@ -596,6 +617,8 @@ static const struct snd_soc_component_driver uniphier_aio_component = {
 	.name = "uniphier-aio",
 	.controls = uniphier_aio_controls,
 	.num_controls = ARRAY_SIZE(uniphier_aio_controls),
+	.suspend = uniphier_aio_suspend,
+	.resume  = uniphier_aio_resume,
 };
 
 int uniphier_aio_probe(struct platform_device *pdev)
diff --git a/sound/soc/uniphier/aio-ld11.c b/sound/soc/uniphier/aio-ld11.c
index de962df245ba..8b44f8dc4970 100644
--- a/sound/soc/uniphier/aio-ld11.c
+++ b/sound/soc/uniphier/aio-ld11.c
@@ -218,8 +218,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_GNAME_HDMI,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -242,8 +240,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_PCMIN2,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.capture = {
 			.stream_name = AUD_NAME_PCMIN2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -257,8 +253,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_GNAME_LINE,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -279,8 +273,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_HPCMOUT1,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_HPCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -294,8 +286,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_PCMOUT3,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT3,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -309,8 +299,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_HIECOUT1,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_HIECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -324,8 +312,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_EPCMOUT2,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_EPCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -341,8 +327,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_EPCMOUT3,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_EPCMOUT3,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -358,8 +342,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 		.name    = AUD_NAME_HIECCOMPOUT1,
 		.probe   = uniphier_aio_ld11_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_HIECCOMPOUT1,
diff --git a/sound/soc/uniphier/aio-pxs2.c b/sound/soc/uniphier/aio-pxs2.c
index 69cd5b0af948..a1d05fe9d3c2 100644
--- a/sound/soc/uniphier/aio-pxs2.c
+++ b/sound/soc/uniphier/aio-pxs2.c
@@ -171,8 +171,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_GNAME_HDMI,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_HPCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -186,8 +184,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_GNAME_LINE,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -208,8 +204,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_GNAME_AUX,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -230,8 +224,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_NAME_HIECOUT1,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_HIECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -245,8 +237,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_NAME_IECOUT1,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.playback = {
 			.stream_name = AUD_NAME_IECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -260,8 +250,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_NAME_HIECCOMPOUT1,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_HIECCOMPOUT1,
@@ -274,8 +262,6 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 		.name    = AUD_NAME_IECCOMPOUT1,
 		.probe   = uniphier_aio_pxs2_probe,
 		.remove  = uniphier_aio_dai_remove,
-		.suspend = uniphier_aio_dai_suspend,
-		.resume  = uniphier_aio_dai_resume,
 		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_IECCOMPOUT1,
diff --git a/sound/soc/uniphier/aio.h b/sound/soc/uniphier/aio.h
index a7ff7e556429..694ac030950e 100644
--- a/sound/soc/uniphier/aio.h
+++ b/sound/soc/uniphier/aio.h
@@ -308,8 +308,6 @@ extern const struct snd_compr_ops uniphier_aio_compr_ops;
 
 int uniphier_aio_dai_probe(struct snd_soc_dai *dai);
 int uniphier_aio_dai_remove(struct snd_soc_dai *dai);
-int uniphier_aio_dai_suspend(struct snd_soc_dai *dai);
-int uniphier_aio_dai_resume(struct snd_soc_dai *dai);
 int uniphier_aio_probe(struct platform_device *pdev);
 int uniphier_aio_remove(struct platform_device *pdev);
 extern const struct snd_soc_dai_ops uniphier_aio_i2s_ops;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
