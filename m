Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39A195A4E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:52:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 793B2168C;
	Fri, 27 Mar 2020 16:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 793B2168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324350;
	bh=p9nHq3jroGQHjbC/Qk4t6s5eU6+faTcFBOxfuhI10E4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dT2FfaKJfDhhIeQ6lMv39MUiWqaG5H00bLBeuIlEa07lr6huRlQ0EXfzGM5yyJerx
	 VPAyH/BgYJ+HbnMySZMMt3C6X2YW0Asqte3At7hIFPgT5/34vlvM2PO91bvQDDyg93
	 m7rIgDbis0g41uL/RVN4M7kLEQfuNF2MCbyS348k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB79F803CD;
	Fri, 27 Mar 2020 16:35:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A34BF803AE; Fri, 27 Mar 2020 16:35:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1CEA8F803AE
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CEA8F803AE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 857C231B;
 Fri, 27 Mar 2020 08:35:37 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F1B3F71F;
 Fri, 27 Mar 2020 08:35:36 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: pxa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <87k13bir62.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87k13bir62.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: pxa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 8d8fef280c94869a4a96c2ac77aea435516fd838 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:19:49 +0900
Subject: [PATCH] ASoC: pxa: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87k13bir62.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/brownstone.c     | 4 ++--
 sound/soc/pxa/corgi.c          | 4 ++--
 sound/soc/pxa/hx4700.c         | 4 ++--
 sound/soc/pxa/imote2.c         | 4 ++--
 sound/soc/pxa/magician.c       | 8 ++++----
 sound/soc/pxa/mioa701_wm9713.c | 4 ++--
 sound/soc/pxa/mmp-pcm.c        | 2 +-
 sound/soc/pxa/mmp-sspa.c       | 2 +-
 sound/soc/pxa/poodle.c         | 4 ++--
 sound/soc/pxa/pxa2xx-i2s.c     | 2 +-
 sound/soc/pxa/spitz.c          | 4 ++--
 sound/soc/pxa/ttc-dkb.c        | 2 +-
 sound/soc/pxa/z2.c             | 4 ++--
 sound/soc/pxa/zylonite.c       | 6 +++---
 14 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/sound/soc/pxa/brownstone.c b/sound/soc/pxa/brownstone.c
index 53b1435ced3f..016a91199485 100644
--- a/sound/soc/pxa/brownstone.c
+++ b/sound/soc/pxa/brownstone.c
@@ -44,8 +44,8 @@ static int brownstone_wm8994_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int freq_out, sspa_mclk, sysclk;
 
 	if (params_rate(params) > 11025) {
diff --git a/sound/soc/pxa/corgi.c b/sound/soc/pxa/corgi.c
index d81082323fb4..6fbef9a0afa7 100644
--- a/sound/soc/pxa/corgi.c
+++ b/sound/soc/pxa/corgi.c
@@ -116,8 +116,8 @@ static int corgi_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret = 0;
 
diff --git a/sound/soc/pxa/hx4700.c b/sound/soc/pxa/hx4700.c
index 0139343dbcce..b4da9a9a6521 100644
--- a/sound/soc/pxa/hx4700.c
+++ b/sound/soc/pxa/hx4700.c
@@ -54,8 +54,8 @@ static int hx4700_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	/* set the I2S system clock as output */
diff --git a/sound/soc/pxa/imote2.c b/sound/soc/pxa/imote2.c
index 514e17724fc3..3014e8244ab4 100644
--- a/sound/soc/pxa/imote2.c
+++ b/sound/soc/pxa/imote2.c
@@ -12,8 +12,8 @@ static int imote2_asoc_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret;
 
diff --git a/sound/soc/pxa/magician.c b/sound/soc/pxa/magician.c
index 6483cff5b73d..1b926a5bfb50 100644
--- a/sound/soc/pxa/magician.c
+++ b/sound/soc/pxa/magician.c
@@ -83,8 +83,8 @@ static int magician_playback_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int width;
 	int ret = 0;
 
@@ -121,8 +121,8 @@ static int magician_capture_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	/* set codec DAI configuration */
diff --git a/sound/soc/pxa/mioa701_wm9713.c b/sound/soc/pxa/mioa701_wm9713.c
index 76e054d514a8..bf27b277c01f 100644
--- a/sound/soc/pxa/mioa701_wm9713.c
+++ b/sound/soc/pxa/mioa701_wm9713.c
@@ -73,7 +73,7 @@ static int rear_amp_event(struct snd_soc_dapm_widget *widget,
 	struct snd_soc_component *component;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = rtd->codec_dai->component;
+	component = asoc_rtd_to_codec(rtd, 0)->component;
 	return rear_amp_power(component, SND_SOC_DAPM_EVENT_ON(event));
 }
 
@@ -117,7 +117,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static int mioa701_wm9713_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	/* Prepare GPIO8 for rear speaker amplifier */
 	snd_soc_component_update_bits(component, AC97_GPIO_CFG, 0x100, 0x100);
diff --git a/sound/soc/pxa/mmp-pcm.c b/sound/soc/pxa/mmp-pcm.c
index 287b5da739e5..3fe6c4c5a3ab 100644
--- a/sound/soc/pxa/mmp-pcm.c
+++ b/sound/soc/pxa/mmp-pcm.c
@@ -112,7 +112,7 @@ static int mmp_pcm_open(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct platform_device *pdev = to_platform_device(component->dev);
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct mmp_dma_data dma_data;
 	struct resource *r;
 
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index e701637a9ae9..3548a2634a63 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -251,7 +251,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sspa_priv *sspa_priv = snd_soc_dai_get_drvdata(dai);
 	struct ssp_device *sspa = sspa_priv->sspa;
 	struct snd_dmaengine_dai_dma_data *dma_params;
diff --git a/sound/soc/pxa/poodle.c b/sound/soc/pxa/poodle.c
index 59ef04d0467a..287984a564c8 100644
--- a/sound/soc/pxa/poodle.c
+++ b/sound/soc/pxa/poodle.c
@@ -90,8 +90,8 @@ static int poodle_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret = 0;
 
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 5f1c477b5833..9a32bf72127a 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -96,7 +96,7 @@ static int pxa2xx_i2s_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	if (IS_ERR(clk_i2s))
 		return PTR_ERR(clk_i2s);
diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index f7babffb7228..6d8174f62935 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -117,8 +117,8 @@ static int spitz_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret = 0;
 
diff --git a/sound/soc/pxa/ttc-dkb.c b/sound/soc/pxa/ttc-dkb.c
index d8f79e2266b1..d5f2961b1a3e 100644
--- a/sound/soc/pxa/ttc-dkb.c
+++ b/sound/soc/pxa/ttc-dkb.c
@@ -61,7 +61,7 @@ static const struct snd_soc_dapm_route ttc_audio_map[] = {
 
 static int ttc_pm860x_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	/* Headset jack detection */
 	snd_soc_card_jack_new(rtd->card, "Headphone Jack", SND_JACK_HEADPHONE |
diff --git a/sound/soc/pxa/z2.c b/sound/soc/pxa/z2.c
index f9a33cb36f5b..6eee1aefc89a 100644
--- a/sound/soc/pxa/z2.c
+++ b/sound/soc/pxa/z2.c
@@ -34,8 +34,8 @@ static int z2_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret = 0;
 
diff --git a/sound/soc/pxa/zylonite.c b/sound/soc/pxa/zylonite.c
index 567dc133ea92..447b59b8bd33 100644
--- a/sound/soc/pxa/zylonite.c
+++ b/sound/soc/pxa/zylonite.c
@@ -66,7 +66,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 static int zylonite_wm9713_init(struct snd_soc_pcm_runtime *rtd)
 {
 	if (clk_pout)
-		snd_soc_dai_set_pll(rtd->codec_dai, 0, 0,
+		snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0), 0, 0,
 				    clk_get_rate(pout), 0);
 
 	return 0;
@@ -76,8 +76,8 @@ static int zylonite_voice_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int wm9713_div = 0;
 	int ret = 0;
 	int rate = params_rate(params);
-- 
2.20.1

