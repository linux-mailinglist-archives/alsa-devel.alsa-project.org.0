Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB68118A740
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 22:44:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123D9173E;
	Wed, 18 Mar 2020 22:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123D9173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584567852;
	bh=nMjIsklxCd3S37mFBSyAWNRDRIuPEOZT9quj6s/qhjE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=igb67SDoAe7ulHV3cZved4nD/K7X0o4uJm7Yu5WfpaUhKPs+M7nmrTrIywzSU5G9E
	 eUZelrXTvZ1YM2rYmYuSR0qTjd9kDafPkAMsysEc6fn/6/DEbe1FZr784zgeRH0fwu
	 Ekc+vYSH9/hA8RRzy+04QcgW6c8LXW8UxgqZ8ygg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A7ACF80212;
	Wed, 18 Mar 2020 22:41:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A00F801F9; Wed, 18 Mar 2020 22:41:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 23E04F80139
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 22:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E04F80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9094FFEC;
 Wed, 18 Mar 2020 14:41:43 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13C463F67D;
 Wed, 18 Mar 2020 14:41:42 -0700 (PDT)
Date: Wed, 18 Mar 2020 21:41:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: qcom: sdm845: handle soundwire stream" to the asoc tree
In-Reply-To: <20200317151233.8763-2-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200317151233.8763-2-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
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

   ASoC: qcom: sdm845: handle soundwire stream

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

From 1b93a88431470ea0b943157999084d9c7e6e3bd3 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 17 Mar 2020 15:12:32 +0000
Subject: [PATCH] ASoC: qcom: sdm845: handle soundwire stream

In existing setup WSA881x codec handles soundwire stream,
however DB845c and other machines based on SDM845c have 2
instances for WSA881x codec. This will force soundwire stream
to be prepared/enabled twice or multiple times.
Handling SoundWire Stream in machine driver would fix this issue.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200317151233.8763-2-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/Kconfig  |  2 +-
 sound/soc/qcom/sdm845.c | 67 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 6530d2462a9e..f51b28d1b94d 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -99,7 +99,7 @@ config SND_SOC_MSM8996
 
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
-	depends on QCOM_APR && CROS_EC && I2C
+	depends on QCOM_APR && CROS_EC && I2C && SOUNDWIRE
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 3ac02204a706..67a55edf755f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -11,6 +11,7 @@
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
+#include <linux/soundwire/sdw.h>
 #include <uapi/linux/input-event-codes.h>
 #include "common.h"
 #include "qdsp6/q6afe.h"
@@ -31,10 +32,12 @@
 struct sdm845_snd_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	bool stream_prepared[SLIM_MAX_RX_PORTS];
 	struct snd_soc_card *card;
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
+	struct sdw_stream_runtime *sruntime[SLIM_MAX_RX_PORTS];
 };
 
 static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
@@ -45,11 +48,18 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
+	struct sdw_stream_runtime *sruntime;
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
+						      substream->stream);
+		if (sruntime != ERR_PTR(-ENOTSUPP))
+			pdata->sruntime[cpu_dai->id] = sruntime;
+
 		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
@@ -425,8 +435,65 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	}
 }
 
+static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	int ret;
+
+	if (!sruntime)
+		return 0;
+
+	if (data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
+	}
+
+	ret = sdw_prepare_stream(sruntime);
+	if (ret)
+		return ret;
+
+	/**
+	 * NOTE: there is a strict hw requirement about the ordering of port
+	 * enables and actual WSA881x PA enable. PA enable should only happen
+	 * after soundwire ports are enabled if not DC on the line is
+	 * accumulated resulting in Click/Pop Noise
+	 * PA enable/mute are handled as part of codec DAPM and digital mute.
+	 */
+
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	data->stream_prepared[cpu_dai->id] = true;
+
+	return ret;
+}
+
+static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	if (sruntime && data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_ops sdm845_be_ops = {
 	.hw_params = sdm845_snd_hw_params,
+	.hw_free = sdm845_snd_hw_free,
+	.prepare = sdm845_snd_prepare,
 	.startup = sdm845_snd_startup,
 	.shutdown = sdm845_snd_shutdown,
 };
-- 
2.20.1

