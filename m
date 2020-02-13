Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D73815BF7E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:36:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308C783A;
	Thu, 13 Feb 2020 14:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308C783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581601017;
	bh=5bL70ueFawRpJST9uvpaBGMLme8RL2dRSN/UwWDmJ6c=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kwIsqMy5oFYwmXWkeJR/lER9f6QX9OipXq2Tof/gAcFDUjthnHQP479b9oM61m8F1
	 KrvrkGaQZ6onoEjvAB0vcEv7Asae8pCsYZaqeoapH6euLb7YRbVodEoopkOuroly8U
	 X1l17bdrG/raLTkUkIYwec7A/59EETXjFF5JhtjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7EFF8029B;
	Thu, 13 Feb 2020 14:32:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F70F8029A; Thu, 13 Feb 2020 14:32:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8FA3AF80292
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA3AF80292
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E5EE1045;
 Thu, 13 Feb 2020 05:32:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 033BE3F6CF;
 Thu, 13 Feb 2020 05:32:20 -0800 (PST)
Date: Thu, 13 Feb 2020 13:32:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183-da7219: change
	supported formats of DL2 and UL1" to the asoc tree
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

   ASoC: mediatek: mt8183-da7219: change supported formats of DL2 and UL1

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

From ec7ba9e1500b0af5bf30b4e56bfaaf3a88850bbf Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 11:27:25 +0800
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: change supported formats of
 DL2 and UL1

DL2 and UL1 are for BTSCO.  Provides only 16-bit, mono, 8kHz and
16kHz to userspace.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200213112003.1.Ie5aedb9d34ebfc7f05ceb382bfe346c45331cd63@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 1626541cc0d6..b52ffed882a7 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -116,6 +116,46 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int
+mt8183_da7219_max98357_bt_sco_startup(
+	struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		8000, 16000
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const unsigned int channels[] = {
+		1,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list = channels,
+		.mask = 0,
+	};
+
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_list(runtime, 0,
+			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
+	runtime->hw.channels_max = 1;
+	snd_pcm_hw_constraint_list(runtime, 0,
+			SNDRV_PCM_HW_PARAM_CHANNELS,
+			&constraints_channels);
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8183_da7219_max98357_bt_sco_ops = {
+	.startup = mt8183_da7219_max98357_bt_sco_startup,
+};
+
 /* FE */
 SND_SOC_DAILINK_DEFS(playback1,
 	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
@@ -222,6 +262,7 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	{
@@ -240,6 +281,7 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
