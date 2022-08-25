Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 336515A1378
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7AB815E5;
	Thu, 25 Aug 2022 16:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7AB815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661437458;
	bh=cHEfTJuTlgoxPMHR0mPq8LFkKKCefUe5GN1xhRY2NNY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HY/FkW72UTdFzSXkTPP2fKIgzisTurCGbW8PZ3trtNB3f3nFzHSnrWEIV0EDqmd9F
	 y57FwKVlrBNKA0AoefzK/0aeguPkCxMPAeg5THcPrN74I3UhbJ4F0mxETWL4WzQUbC
	 r5Se1QuBzmjNN0CHKIyIbWGkUMlnSk1XuPcP6xiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CF9F800BD;
	Thu, 25 Aug 2022 16:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75198F80271; Thu, 25 Aug 2022 16:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D026F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D026F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="HeX9EviM"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661437361; bh=snL9pkaE4f5TuEA4/RFJEkEJWue+6V9/ZNAvLVwijxo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HeX9EviMcDrqL8Cp3o0I0NsZip/wP6cx8O7XI+5Ljhjl/6Z/SFWupEWE9YXv94xr5
 by5BUoeZ5p1lkrA6B4QHDvACKQx66lA5uSt9vj0SzOH9Iv/f25WY6E8A60Jq468iC1
 2RS9jmNXinNuBKItlDGDRxdntaLPcgp9G1ydugIs=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: tas2562: Drop conflicting set_bias_level power
 setting
Date: Thu, 25 Aug 2022 16:22:25 +0200
Message-Id: <20220825142226.80929-2-povik+lin@cutebit.org>
In-Reply-To: <20220825142226.80929-1-povik+lin@cutebit.org>
References: <20220825142226.80929-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>, navada@ti.com,
 linux-kernel@vger.kernel.org, asyrus@ti.com, shenghao-ding@ti.com,
 raphael-xu@ti.com, =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

The driver is setting the PWR_CTRL field in both the set_bias_level
callback and on DAPM events of the DAC widget (and also in the
mute_stream method). Drop the set_bias_level callback altogether as the
power setting it does is in conflict with the other code paths.

(This mirrors commit c8a6ae3fe1c8 ("ASoC: tas2770: Drop conflicting
set_bias_level power setting") which was a fix to the tas2770 driver.)

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2562.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index dc088a1c6721..2b0cdb6d1600 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -63,39 +63,6 @@ enum tas256x_model {
 	TAS2110,
 };
 
-static int tas2562_set_bias_level(struct snd_soc_component *component,
-				 enum snd_soc_bias_level level)
-{
-	struct tas2562_data *tas2562 =
-			snd_soc_component_get_drvdata(component);
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component,
-			TAS2562_PWR_CTRL,
-			TAS2562_MODE_MASK, TAS2562_ACTIVE);
-		break;
-	case SND_SOC_BIAS_STANDBY:
-	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component,
-			TAS2562_PWR_CTRL,
-			TAS2562_MODE_MASK, TAS2562_MUTE);
-		break;
-	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component,
-			TAS2562_PWR_CTRL,
-			TAS2562_MODE_MASK, TAS2562_SHUTDOWN);
-		break;
-
-	default:
-		dev_err(tas2562->dev,
-				"wrong power level setting %d\n", level);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int tas2562_set_samplerate(struct tas2562_data *tas2562, int samplerate)
 {
 	int samp_rate;
@@ -579,7 +546,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2110 = {
 	.probe			= tas2562_codec_probe,
 	.suspend		= tas2562_suspend,
 	.resume			= tas2562_resume,
-	.set_bias_level		= tas2562_set_bias_level,
 	.controls		= tas2562_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas2562_snd_controls),
 	.dapm_widgets		= tas2110_dapm_widgets,
@@ -618,7 +584,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
 	.probe			= tas2562_codec_probe,
 	.suspend		= tas2562_suspend,
 	.resume			= tas2562_resume,
-	.set_bias_level		= tas2562_set_bias_level,
 	.controls		= tas2562_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas2562_snd_controls),
 	.dapm_widgets		= tas2562_dapm_widgets,
-- 
2.33.0

