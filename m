Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A96195A84
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 17:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8BCE16AF;
	Fri, 27 Mar 2020 16:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8BCE16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324846;
	bh=ExG+ByK619js+DtA9hwaAZvTUSuowScq+lGQJgFQ1zc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tIKtrELHhR7bt9P6BssQ1C4O6+KI9mmP0PsMM2s3wMzmbFjsP18vwlS7XEyungC/v
	 ywzfXH/rTnFqObVGmdxxadkzwsq2IlaS7GXUCtZFGSyJei9m2CqyGVWbbgrTERgZPn
	 CZhm7++6tHSy5Dq8AFCesbiciURAE34mnJX757Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58CD8F80492;
	Fri, 27 Mar 2020 16:36:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B00BF80492; Fri, 27 Mar 2020 16:36:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DCC23F8047F
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC23F8047F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49A591FB;
 Fri, 27 Mar 2020 08:36:41 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C206F3F71F;
 Fri, 27 Mar 2020 08:36:40 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:36:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: amd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <874kufk5uu.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-874kufk5uu.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: amd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From b09b22fcf9fb8a3186ad0e09aedfa9e119520c43 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:17:13 +0900
Subject: [PATCH] ASoC: amd: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/874kufk5uu.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp-da7219-max98357a.c | 2 +-
 sound/soc/amd/acp-rt5645.c           | 4 ++--
 sound/soc/amd/acp3x-rt5682-max9836.c | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 7a5621e5e233..9414d7269c4f 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -54,7 +54,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 91abeb92b648..73b31f88a6b5 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -48,7 +48,7 @@ static int cz_aif1_hw_params(struct snd_pcm_substream *substream,
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5645_PLL1_S_MCLK,
 				  CZ_PLAT_CLK, params_rate(params) * 512);
@@ -73,7 +73,7 @@ static int cz_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card;
 	struct snd_soc_component *codec;
 
-	codec = rtd->codec_dai->component;
+	codec = asoc_rtd_to_codec(rtd, 0)->component;
 	card = rtd->card;
 
 	ret = snd_soc_card_jack_new(card, "Headset Jack",
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 8f71c3f7ef79..024a7ee54cd5 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -35,7 +35,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
@@ -183,7 +183,7 @@ static int acp3x_ec_dmic0_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
@@ -198,7 +198,7 @@ static int acp3x_ec_dmic1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
-- 
2.20.1

