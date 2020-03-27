Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F57195A17
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D492D1670;
	Fri, 27 Mar 2020 16:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D492D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323782;
	bh=VKpshtolYMFR2a6EXeJWLar10O/uJMEw8X0PwGxRevc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ub40yHwZ/Ey0XXAFZ64JEAEemvnGIPFuAk4T7IH1QAe6FeC9/SGEezw8Pd19GzRBr
	 x6Lv7yU+92c69vDGYsV7NEmJREwgaWMKF2sp3CKhcM+lu9pltzHZl6mIJnH2h9Tnjv
	 JYNyVWSzYP7MQrsXvnPlwzdWAkz2v6++MknL3HOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00B4F80332;
	Fri, 27 Mar 2020 16:34:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B9EF80321; Fri, 27 Mar 2020 16:34:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 58519F80304
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58519F80304
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2D121FB;
 Fri, 27 Mar 2020 08:34:25 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 254AF3F71F;
 Fri, 27 Mar 2020 08:34:25 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: codecs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87wo7bhci3.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87wo7bhci3.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: codecs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From b5cb8558e53d28db571f4ae79b9e9590ed30b280 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:21:56 +0900
Subject: [PATCH] ASoC: codecs: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87wo7bhci3.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs47l15.c |  4 ++--
 sound/soc/codecs/cs47l24.c |  6 +++---
 sound/soc/codecs/cs47l35.c |  6 +++---
 sound/soc/codecs/cs47l85.c |  6 +++---
 sound/soc/codecs/cs47l90.c |  6 +++---
 sound/soc/codecs/cs47l92.c |  4 ++--
 sound/soc/codecs/wm5110.c  |  6 +++---
 sound/soc/codecs/wm_adsp.c | 10 +++++-----
 8 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index e8840dc142ef..8d1869bf7f9c 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1239,12 +1239,12 @@ static int cs47l15_open(struct snd_compr_stream *stream)
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "cs47l15-dsp-trace") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l15-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 25bffc2968f0..6b0570f59630 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1076,14 +1076,14 @@ static int cs47l24_open(struct snd_compr_stream *stream)
 	struct arizona *arizona = priv->core.arizona;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "cs47l24-dsp-voicectrl") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(rtd->codec_dai->name, "cs47l24-dsp-trace") == 0) {
+	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-trace") == 0) {
 		n_adsp = 1;
 	} else {
 		dev_err(arizona->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 3d48a0d9ecc5..18839807c9d1 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1514,14 +1514,14 @@ static int cs47l35_open(struct snd_compr_stream *stream)
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "cs47l35-dsp-voicectrl") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(rtd->codec_dai->name, "cs47l35-dsp-trace") == 0) {
+	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index bef3471f482d..a575113207f0 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2457,14 +2457,14 @@ static int cs47l85_open(struct snd_compr_stream *stream)
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "cs47l85-dsp-voicectrl") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-voicectrl") == 0) {
 		n_adsp = 5;
-	} else if (strcmp(rtd->codec_dai->name, "cs47l85-dsp-trace") == 0) {
+	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 266eade82764..81a1311b14e6 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2368,14 +2368,14 @@ static int cs47l90_open(struct snd_compr_stream *stream)
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "cs47l90-dsp-voicectrl") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-voicectrl") == 0) {
 		n_adsp = 5;
-	} else if (strcmp(rtd->codec_dai->name, "cs47l90-dsp-trace") == 0) {
+	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 942040fd354f..15fc213d178d 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1840,12 +1840,12 @@ static int cs47l92_open(struct snd_compr_stream *stream)
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "cs47l92-dsp-trace") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l92-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 9dc215b5c504..499e87d1dfcc 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2245,14 +2245,14 @@ static int wm5110_open(struct snd_compr_stream *stream)
 	struct arizona *arizona = priv->core.arizona;
 	int n_adsp;
 
-	if (strcmp(rtd->codec_dai->name, "wm5110-dsp-voicectrl") == 0) {
+	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(rtd->codec_dai->name, "wm5110-dsp-trace") == 0) {
+	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(arizona->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			rtd->codec_dai->name);
+			asoc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index ffb9836e0538..1ef69409ccd1 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -3467,22 +3467,22 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
-			 rtd->codec_dai->name);
+			 asoc_rtd_to_codec(rtd, 0)->name);
 		ret = -ENXIO;
 		goto out;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
-			 rtd->codec_dai->name);
+			 asoc_rtd_to_codec(rtd, 0)->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
-		if (!strcmp(tmp->name, rtd->codec_dai->name)) {
+		if (!strcmp(tmp->name, asoc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
-				 rtd->codec_dai->name);
+				 asoc_rtd_to_codec(rtd, 0)->name);
 			ret = -EBUSY;
 			goto out;
 		}
@@ -3496,7 +3496,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	compr->dsp = dsp;
 	compr->stream = stream;
-	compr->name = rtd->codec_dai->name;
+	compr->name = asoc_rtd_to_codec(rtd, 0)->name;
 
 	list_add_tail(&compr->list, &dsp->compr_list);
 
-- 
2.20.1

