Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F361189DC
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:31:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 596571654;
	Tue, 10 Dec 2019 14:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 596571654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984716;
	bh=8gVCbmVA4lMTLxpJUz4CAJ+3Z0IjJoPBj0at7hoOLDM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lD1NKwAjkTNJhZlvAPbUUZTc3aIZ8bA8e8g4Oqn2DDT0Hr98TOf7eEZXdeorcmNUl
	 xyDmt/VdXg4vkBeXWVY1iIjd/1oeyW6XMxh7Ly/gMcqwhIKtRGgSQvH+oWCxt7ves8
	 TRqJgjdH+Bk/oyqsNVZQXGxp71n4EalnvPdgPeTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF955F802E7;
	Tue, 10 Dec 2019 14:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 702ABF802E0; Tue, 10 Dec 2019 14:23:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id ADA34F802C2
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA34F802C2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C862111B3;
 Tue, 10 Dec 2019 05:22:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45AE53F52E;
 Tue, 10 Dec 2019 05:22:59 -0800 (PST)
Date: Tue, 10 Dec 2019 13:22:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a781yq67.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87a781yq67.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: find rtd via dai_link pointer
	at snd_soc_get_pcm_runtime()" to the asoc tree
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

   ASoC: soc-core: find rtd via dai_link pointer at snd_soc_get_pcm_runtime()

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

From 4468189ff307f294491628a49702a04de22bffb8 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 10 Dec 2019 09:34:08 +0900
Subject: [PATCH] ASoC: soc-core: find rtd via dai_link pointer at
 snd_soc_get_pcm_runtime()

Current snd_soc_get_pcm_runtime() is finding rtd by checking dai_link
name. But, it is strange and waste of CPU power, because its user want
to get from rtd from dai_link, not from dai_link name.
This patch find rtd via dai_link pointer instead of its name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87a781yq67.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h            |  2 +-
 sound/soc/fsl/fsl-asoc-card.c  |  2 +-
 sound/soc/pxa/mioa701_wm9713.c |  2 +-
 sound/soc/samsung/bells.c      | 12 ++++++------
 sound/soc/samsung/littlemill.c | 10 +++++-----
 sound/soc/samsung/snow.c       |  2 +-
 sound/soc/samsung/speyside.c   |  4 ++--
 sound/soc/samsung/tm2_wm5110.c |  6 +++---
 sound/soc/samsung/tobermory.c  |  6 +++---
 sound/soc/soc-core.c           |  8 ++++----
 sound/soc/tegra/tegra_wm8903.c |  2 +-
 11 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 68ec5a051afe..40c2a677f531 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -465,7 +465,7 @@ static inline int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 void snd_soc_disconnect_sync(struct device *dev);
 
 struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
-		const char *dai_link);
+				struct snd_soc_dai_link *dai_link);
 
 bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd);
 void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream);
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 39ea9bda1394..9ce55feaac22 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -256,7 +256,7 @@ static int fsl_asoc_card_set_bias_level(struct snd_soc_card *card,
 	unsigned int pll_out;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	codec_dai = rtd->codec_dai;
 	if (dapm->dev != codec_dai->dev)
 		return 0;
diff --git a/sound/soc/pxa/mioa701_wm9713.c b/sound/soc/pxa/mioa701_wm9713.c
index 129eb5251a5f..76e054d514a8 100644
--- a/sound/soc/pxa/mioa701_wm9713.c
+++ b/sound/soc/pxa/mioa701_wm9713.c
@@ -72,7 +72,7 @@ static int rear_amp_event(struct snd_soc_dapm_widget *widget,
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	component = rtd->codec_dai->component;
 	return rear_amp_power(component, SND_SOC_DAPM_EVENT_ON(event));
 }
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index b60b2268b608..58d8a81aa0ea 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -59,7 +59,7 @@ static int bells_set_bias_level(struct snd_soc_card *card,
 	struct bells_drvdata *bells = card->drvdata;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[DAI_DSP_CODEC].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
 	codec_dai = rtd->codec_dai;
 	component = codec_dai->component;
 
@@ -105,7 +105,7 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	struct bells_drvdata *bells = card->drvdata;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[DAI_DSP_CODEC].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
 	codec_dai = rtd->codec_dai;
 	component = codec_dai->component;
 
@@ -151,10 +151,10 @@ static int bells_late_probe(struct snd_soc_card *card)
 	struct snd_soc_dai *wm9081_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[DAI_AP_DSP].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_AP_DSP]);
 	wm0010 = rtd->codec_dai->component;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[DAI_DSP_CODEC].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
 	component = rtd->codec_dai->component;
 	aif1_dai = rtd->codec_dai;
 
@@ -194,7 +194,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[DAI_CODEC_CP].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_CP]);
 	aif2_dai = rtd->cpu_dai;
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
@@ -206,7 +206,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 	if (card->num_rtd == DAI_CODEC_SUB)
 		return 0;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[DAI_CODEC_SUB].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_SUB]);
 	aif3_dai = rtd->cpu_dai;
 	wm9081_dai = rtd->codec_dai;
 
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 6132cee8550b..59904f44118b 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -22,7 +22,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 	struct snd_soc_dai *aif1_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	aif1_dai = rtd->codec_dai;
 
 	if (dapm->dev != aif1_dai->dev)
@@ -69,7 +69,7 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 	struct snd_soc_dai *aif1_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	aif1_dai = rtd->codec_dai;
 
 	if (dapm->dev != aif1_dai->dev)
@@ -180,7 +180,7 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dai *aif2_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[1].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	aif2_dai = rtd->cpu_dai;
 
 	switch (event) {
@@ -263,11 +263,11 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	struct snd_soc_dai *aif2_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	component = rtd->codec_dai->component;
 	aif1_dai = rtd->codec_dai;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[1].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	aif2_dai = rtd->cpu_dai;
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 8ea7799df028..f075aae9561a 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -106,7 +106,7 @@ static int snow_late_probe(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *codec_dai;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
 	/* In the multi-codec case codec_dais 0 is MAX98095 and 1 is HDMI. */
 	if (rtd->num_codecs > 1)
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 9e58cbed942a..5ccdfe0eb6fe 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -24,7 +24,7 @@ static int speyside_set_bias_level(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[1].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	codec_dai = rtd->codec_dai;
 
 	if (dapm->dev != codec_dai->dev)
@@ -60,7 +60,7 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[1].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	codec_dai = rtd->codec_dai;
 
 	if (dapm->dev != codec_dai->dev)
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index bb9910d4cbe2..10ff14b856f2 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -282,7 +282,7 @@ static int tm2_set_bias_level(struct snd_soc_card *card,
 {
 	struct snd_soc_pcm_runtime *rtd;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
 	if (dapm->dev != rtd->codec_dai->dev)
 		return 0;
@@ -314,7 +314,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	struct snd_soc_dai *aif2_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[TM2_DAI_AIF1].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF1]);
 	aif1_dai = rtd->codec_dai;
 	priv->component = rtd->codec_dai->component;
 
@@ -324,7 +324,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[TM2_DAI_AIF2].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF2]);
 	aif2_dai = rtd->codec_dai;
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index ef51f289fbc7..fdce28cc26c4 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -22,7 +22,7 @@ static int tobermory_set_bias_level(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	codec_dai = rtd->codec_dai;
 
 	if (dapm->dev != codec_dai->dev)
@@ -65,7 +65,7 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	codec_dai = rtd->codec_dai;
 
 	if (dapm->dev != codec_dai->dev)
@@ -180,7 +180,7 @@ static int tobermory_late_probe(struct snd_soc_card *card)
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
-	rtd = snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	component = rtd->codec_dai->component;
 	codec_dai = rtd->codec_dai;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f215a37fd3d6..9ee7d5d118c0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -393,15 +393,15 @@ static const struct snd_soc_ops null_snd_soc_ops;
 
 struct snd_soc_pcm_runtime
 *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
-			 const char *dai_link)
+			 struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
 
 	for_each_card_rtds(card, rtd) {
-		if (!strcmp(rtd->dai_link->name, dai_link))
+		if (rtd->dai_link == dai_link)
 			return rtd;
 	}
-	dev_dbg(card->dev, "ASoC: failed to find rtd %s\n", dai_link);
+	dev_dbg(card->dev, "ASoC: failed to find rtd %s\n", dai_link->name);
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_pcm_runtime);
@@ -1064,7 +1064,7 @@ void snd_soc_remove_dai_link(struct snd_soc_card *card,
 	if (card->remove_dai_link)
 		card->remove_dai_link(card, dai_link);
 
-	rtd = snd_soc_get_pcm_runtime(card, dai_link->name);
+	rtd = snd_soc_get_pcm_runtime(card, dai_link);
 	if (rtd)
 		soc_free_pcm_runtime(rtd);
 }
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 6211dfda2195..f08d3489c3cf 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -186,7 +186,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 static int tegra_wm8903_remove(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd =
-		snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
+		snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_component *component = codec_dai->component;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
