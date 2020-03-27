Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60482195A4B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 032381692;
	Fri, 27 Mar 2020 16:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 032381692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324312;
	bh=xHTSgikC4xhwvyrpkOVMlYeArZaq5ddvL+oP9Bd/l2o=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bfM6VHcXOGUWEiIsmYTzE08cSbhwHT2+d4dV5lKjjbdiyG9eTrGoFkpIrENTGDuRE
	 KcX233UQlep0MSATj4VYBGljDLVhxxGbhL0M+b6BrUhLHO777KjbAcONnDbGG/tsOS
	 hG6v/sVPnG/9eezoXc+YYcOgeyTRW9jnSadNO/2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCE0F803BD;
	Fri, 27 Mar 2020 16:35:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8931CF803B2; Fri, 27 Mar 2020 16:35:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 312DFF8038F
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312DFF8038F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E5631FB;
 Fri, 27 Mar 2020 08:35:28 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20E883F71F;
 Fri, 27 Mar 2020 08:35:27 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: rockchip: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87h7yfir5i.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87h7yfir5i.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: rockchip: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From a7ff526814d5be3cf38bafdbdb1217225cd12922 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:20:09 +0900
Subject: [PATCH] ASoC: rockchip: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87h7yfir5i.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c |  4 ++--
 sound/soc/rockchip/rk3399_gru_sound.c   | 16 ++++++++--------
 sound/soc/rockchip/rockchip_max98090.c  |  6 +++---
 sound/soc/rockchip/rockchip_rt5645.c    |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 767700c34ee2..01078155a914 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -67,8 +67,8 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int mclk;
 
 	switch (params_rate(params)) {
diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index d951100bf770..f45e5aaa4b30 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -57,7 +57,7 @@ static int rockchip_sound_max98357a_hw_params(struct snd_pcm_substream *substrea
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
 				__func__, mclk, ret);
@@ -71,8 +71,8 @@ static int rockchip_sound_rt5514_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int mclk;
 	int ret;
 
@@ -103,8 +103,8 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int mclk, ret;
 
 	/* in bypass mode, the mclk has to be one of the frequencies below */
@@ -153,8 +153,8 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
 
 static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dais[0]->component;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* We need default MCLK and PLL settings for the accessory detection */
@@ -206,7 +206,7 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
 				__func__, mclk, ret);
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 60930fa85aa4..1f527d3763ce 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -146,8 +146,8 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int mclk;
 
 	switch (params_rate(params)) {
@@ -227,7 +227,7 @@ static struct snd_soc_jack rk_hdmi_jack;
 static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 	int ret;
 
 	/* enable jack detection */
diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index 26b67b245484..0617ccf4e42c 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -56,8 +56,8 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int mclk;
 
 	switch (params_rate(params)) {
@@ -113,7 +113,7 @@ static int rk_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return rt5645_set_jack_detect(runtime->codec_dai->component,
+	return rt5645_set_jack_detect(asoc_rtd_to_codec(runtime, 0)->component,
 				     &headset_jack,
 				     &headset_jack,
 				     &headset_jack);
-- 
2.20.1

