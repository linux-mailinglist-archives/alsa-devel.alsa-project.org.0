Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9716514C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:05:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31CA6169F;
	Wed, 19 Feb 2020 22:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31CA6169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146306;
	bh=cKsn3g1/ftroHIe3l9hEC4/Tehx9V5eKroRO5oayotg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jVUALjJYRVjuXmsOxPjVy53GrkfGpBYUCWtb+LvjXV+dcIiEsDEQBn3vuCZgv2nn5
	 ubGQIgzpYENghdTYQD6sImElwIorr51oXj+r4cRYYBU3LkERJTxU8sRpUGuMOvO08G
	 F+2GXg7AuXKmi7JvlD2cVFJz7GcxjyCh4i5O5e2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 019C8F80305;
	Wed, 19 Feb 2020 21:57:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10358F80304; Wed, 19 Feb 2020 21:57:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 51648F802FE
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51648F802FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DAA41FB;
 Wed, 19 Feb 2020 12:57:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7BA23F68F;
 Wed, 19 Feb 2020 12:57:35 -0800 (PST)
Date: Wed, 19 Feb 2020 20:57:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: qcom: sdm845: use for_each_rtd_codec_dai() macro" to
 the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: qcom: sdm845: use for_each_rtd_codec_dai() macro

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

From a4eb41eef331d31b8593defa10b249e155e0314f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:56:01 +0900
Subject: [PATCH] ASoC: qcom: sdm845: use for_each_rtd_codec_dai() macro

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87mu9fjcb4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/sdm845.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 3b5547a27aad..5a23597261ac 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -43,14 +43,14 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
-	for (i = 0 ; i < dai_link->num_codecs; i++) {
-		ret = snd_soc_dai_get_channel_map(rtd->codec_dais[i],
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
 		if (ret != 0 && ret != -ENOTSUPP) {
@@ -77,6 +77,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 	int channels, slot_width;
 
@@ -125,8 +126,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	for (j = 0; j < rtd->num_codecs; j++) {
-		struct snd_soc_dai *codec_dai = rtd->codec_dais[j];
+	for_each_rtd_codec_dai(rtd, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
 			ret = snd_soc_dai_set_tdm_slot(
@@ -214,7 +214,6 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(card);
 	struct snd_jack *jack;
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	/*
 	 * Codec SLIMBUS configuration
 	 * RX1, RX2, RX3, RX4, RX5, RX6, RX7, RX8, RX9, RX10, RX11, RX12, RX13
@@ -266,8 +265,8 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 		}
 		break;
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
-		for (i = 0 ; i < dai_link->num_codecs; i++) {
-			rval = snd_soc_dai_set_channel_map(rtd->codec_dais[i],
+		for_each_rtd_codec_dai(rtd, i, codec_dai) {
+			rval = snd_soc_dai_set_channel_map(codec_dai,
 							  ARRAY_SIZE(tx_ch),
 							  tx_ch,
 							  ARRAY_SIZE(rx_ch),
@@ -275,7 +274,7 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			if (rval != 0 && rval != -ENOTSUPP)
 				return rval;
 
-			snd_soc_dai_set_sysclk(rtd->codec_dais[i], 0,
+			snd_soc_dai_set_sysclk(codec_dai, 0,
 					       WCD934X_DEFAULT_MCLK_RATE,
 					       SNDRV_PCM_STREAM_PLAYBACK);
 		}
@@ -345,8 +344,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
 
-		for (j = 0; j < rtd->num_codecs; j++) {
-			codec_dai = rtd->codec_dais[j];
+		for_each_rtd_codec_dai(rtd, j, codec_dai) {
 
 			if (!strcmp(codec_dai->component->name_prefix,
 				    "Left")) {
-- 
2.20.1

