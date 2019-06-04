Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B745234B5D
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 17:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83FBE168A;
	Tue,  4 Jun 2019 17:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83FBE168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559660533;
	bh=jcQWRkbaltj56B6u53qPo56/CJ02WurlIK94j95c6aw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AYqfQLClYcE35CbcE1Aev9a9US8QZRYssBq/0ug/lKUxeVqBw0Z9wqdAJRyzQwcAW
	 MgUo6KXOBsR/mbw8sNDzeEA8nQ7dNqz/YJayopZ67LfiVV7NN0s5kLbo8HO+yV5u6H
	 d7+LX6C936lCNfXWih0Y9sPNFL6b4/67IrOFl4yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A17F8971F;
	Tue,  4 Jun 2019 16:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E716F89734; Tue,  4 Jun 2019 16:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAFF2F896EF
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAFF2F896EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Jk4+vG07"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Ku3UQVhn3QtqnNYqlvNTKjJgO8njy3oc7bW5TPKpNrU=; b=Jk4+vG07Jq4E
 h2/LKS9YICjTpenQySEB0AZKdQ7+euDYhkdMfeJ5jUDTHSyV7P8M+DY1dAWgDV1uoYbUGcK2jISWi
 mrNDHmAJwD3TjbblP8VTPMqlsZ27OJbA/TUUdjqjSE2It5PQNW1vvPmART5/AWmndalBrdUTs1CGt
 S2NgA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYAtw-0006Ea-7s; Tue, 04 Jun 2019 14:59:00 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C6FEA440046; Tue,  4 Jun 2019 15:58:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190604111249.17893-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190604145859.C6FEA440046@finisterre.sirena.org.uk>
Date: Tue,  4 Jun 2019 15:58:59 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Implement set_tdm_slot
	callback" to the asoc tree
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

   ASoC: pcm3168a: Implement set_tdm_slot callback

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 9b8e8b893ff52264df2b54a6820ae3c4bb820624 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 4 Jun 2019 14:12:49 +0300
Subject: [PATCH] ASoC: pcm3168a: Implement set_tdm_slot callback

Initially we only going to care about the slot_width as for example
DSP_A/B needs 32 bclk per slots and to be able to use TDM mode the codec
(and CPU) needs to use DSP_A/B modes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 60 ++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index e0d5839fe1a7..9eb24ca09793 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -56,6 +56,9 @@ struct pcm3168a_priv {
 	unsigned long sysclk;
 	unsigned int adc_fmt;
 	unsigned int dac_fmt;
+	int tdm_slots;
+	u32 tdm_mask[2];
+	int slot_width;
 };
 
 static const char *const pcm3168a_roll_off[] = { "Sharp", "Slow" };
@@ -387,6 +390,41 @@ static int pcm3168a_set_dai_fmt_adc(struct snd_soc_dai *dai,
 	return pcm3168a_set_dai_fmt(dai, format, false);
 }
 
+static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+				 unsigned int rx_mask, int slots,
+				 int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
+
+	if (tx_mask >= (1<<slots) || rx_mask >= (1<<slots)) {
+		dev_err(component->dev,
+			"Bad tdm mask tx: 0x%08x rx: 0x%08x slots %d\n",
+			tx_mask, rx_mask, slots);
+		return -EINVAL;
+	}
+
+	if (slot_width &&
+	    (slot_width != 16 && slot_width != 24 && slot_width != 32 )) {
+		dev_err(component->dev, "Unsupported slot_width %d\n",
+			slot_width);
+		return -EINVAL;
+	}
+
+	pcm3168a->tdm_slots = slots;
+	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
+	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
+
+	if (pcm3168a->slot_width && pcm3168a->slot_width != slot_width) {
+		dev_err(component->dev, "Not matching slot_width %d vs %d\n",
+			pcm3168a->slot_width, slot_width);
+		return -EINVAL;
+	}
+
+	pcm3168a->slot_width = slot_width;
+	return 0;
+}
+
 static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -431,22 +469,26 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	min_frame_size = params_width(params) * 2;
+	if (pcm3168a->slot_width)
+		min_frame_size = pcm3168a->slot_width;
+	else
+		min_frame_size = params_width(params);
+
 	switch (min_frame_size) {
-	case 32:
+	case 16:
 		if (master_mode || (fmt != PCM3168A_FMT_RIGHT_J)) {
-			dev_err(component->dev, "32-bit frames are supported only for slave mode using right justified\n");
+			dev_err(component->dev, "16-bit slots are supported only for slave mode using right justified\n");
 			return -EINVAL;
 		}
 		fmt = PCM3168A_FMT_RIGHT_J_16;
 		break;
-	case 48:
+	case 24:
 		if (master_mode || (fmt & PCM3168A_FMT_DSP_MASK)) {
-			dev_err(component->dev, "48-bit frames not supported in master mode, or slave mode using DSP\n");
+			dev_err(component->dev, "24-bit slots not supported in master mode, or slave mode using DSP\n");
 			return -EINVAL;
 		}
 		break;
-	case 64:
+	case 32:
 		break;
 	default:
 		dev_err(component->dev, "unsupported frame size: %d\n", min_frame_size);
@@ -554,14 +596,16 @@ static const struct snd_soc_dai_ops pcm3168a_dac_dai_ops = {
 	.set_fmt	= pcm3168a_set_dai_fmt_dac,
 	.set_sysclk	= pcm3168a_set_dai_sysclk,
 	.hw_params	= pcm3168a_hw_params,
-	.digital_mute	= pcm3168a_digital_mute
+	.digital_mute	= pcm3168a_digital_mute,
+	.set_tdm_slot	= pcm3168a_set_tdm_slot,
 };
 
 static const struct snd_soc_dai_ops pcm3168a_adc_dai_ops = {
 	.startup	= pcm3168a_startup,
 	.set_fmt	= pcm3168a_set_dai_fmt_adc,
 	.set_sysclk	= pcm3168a_set_dai_sysclk,
-	.hw_params	= pcm3168a_hw_params
+	.hw_params	= pcm3168a_hw_params,
+	.set_tdm_slot	= pcm3168a_set_tdm_slot,
 };
 
 static struct snd_soc_dai_driver pcm3168a_dais[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
