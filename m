Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD817FF93
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0624783A;
	Tue, 10 Mar 2020 14:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0624783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848563;
	bh=InRrojU/BQwFhSE6BgGcrbBU4S1QOLhbg4cR+YXjl+Q=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vWtEwgE3m5a5oaiZxyGmv+fkWLyWaDB3IWIYwiuRyyJSVchMSQm4/Z8xF4sV12axm
	 cYY2XwPvXd0nZgy4DejODda4z9wnruqgMtJ58DX72TbITTdo8wHydaXU0K5ye97v4m
	 YRx6KufYHCOnBrEvzol3KaWJ6owODyl9VU7cb7/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8487F802C2;
	Tue, 10 Mar 2020 14:51:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C068CF8028E; Tue, 10 Mar 2020 14:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E695CF8028E
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E695CF8028E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DDF830E;
 Tue, 10 Mar 2020 06:51:34 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 019F73F6CF;
 Tue, 10 Mar 2020 06:51:33 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: qcom: use for_each_rtd_codecs/cpus_dai() macro" to the
 asoc tree
In-Reply-To: <87wo7ugogy.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87wo7ugogy.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: qcom: use for_each_rtd_codecs/cpus_dai() macro

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

From c998ee30e493ea3de0e52f0ec57995905d5ba43d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:07:57 +0900
Subject: [PATCH] ASoC: qcom: use for_each_rtd_codecs/cpus_dai() macro

This patch switch to use plural form macro.

	- for_each_rtd_codec_dai()
	+ for_each_rtd_codec_dais()

	- for_each_rtd_codec_dai_rollback()
	+ for_each_rtd_codec_dais_rollback()

	- for_each_rtd_cpu_dai()
	+ for_each_rtd_cpu_dais()

	- for_each_rtd_cpu_dai_rollback()
	+ for_each_rtd_cpu_dais_rollback()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87wo7ugogy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/soundwire/qcom.c     | 2 +-
 sound/soc/qcom/apq8016_sbc.c | 2 +-
 sound/soc/qcom/sdm845.c      | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fb30bbec999a..440effed6df6 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -603,7 +603,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 
 	ctrl->sruntime[dai->id] = sruntime;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_sdw_stream(codec_dai, sruntime,
 						 substream->stream);
 		if (ret < 0 && ret != -ENOTSUPP) {
diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 2d064f3bc9b6..7647af3e51f6 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -90,7 +90,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 		pdata->jack_setup = true;
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 
 		component = codec_dai->component;
 		/* Set default mclk for internal codec */
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 5a23597261ac..3ac02204a706 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -49,7 +49,7 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
@@ -126,7 +126,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	for_each_rtd_codec_dai(rtd, j, codec_dai) {
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
 			ret = snd_soc_dai_set_tdm_slot(
@@ -265,7 +265,7 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 		}
 		break;
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			rval = snd_soc_dai_set_channel_map(codec_dai,
 							  ARRAY_SIZE(tx_ch),
 							  tx_ch,
@@ -344,7 +344,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
 
-		for_each_rtd_codec_dai(rtd, j, codec_dai) {
+		for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 			if (!strcmp(codec_dai->component->name_prefix,
 				    "Left")) {
-- 
2.20.1

