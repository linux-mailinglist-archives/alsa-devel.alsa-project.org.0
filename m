Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0CF58CA46
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5124986F;
	Mon,  8 Aug 2022 16:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5124986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659968171;
	bh=Zz3z/FXY8rYsvNDqZ8F9rvnBnwGTqRqrNOvbqIH6ja8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FaVGB/OUlilOXahJmIdO3EpwLnEbKz/2rdyeBOUImoJwVwdBMYPFvLcl2qZ0bfl1P
	 WPpltCD4h4LZdMO4NclzNqfxatUrpomQsdr/sLlg1w9FAAo0XOUQeIC05TDHVlbj39
	 AMMq4pTN5XC7u1wEMZZEq4jX3vRX0/dZTMbcd5V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E17F80553;
	Mon,  8 Aug 2022 16:14:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA4FFF80430; Mon,  8 Aug 2022 16:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A4FEF8049C
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 16:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4FEF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="OGE7d3z2"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1659968029; bh=odD+Lb+pa0FPCQEPZICIcBt216AndpEzsCiglXQnk/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OGE7d3z2O8XJcQmoM5601IiE2Xiju0oxCBly/qlfwnFY8j5zXzb3CXklNCjrPsFyF
 ZzCK3r0P7R4iCmu3IENMVP5V3BNaTAKV81/fXGQGMfXlgK9K4qVH+ByupYIBToJczY
 o38yTQKeCAMJ6atW62jIifEl6412rVq7UzcIB6WM=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/4] ASoC: tas2770: Drop conflicting set_bias_level power
 setting
Date: Mon,  8 Aug 2022 16:12:45 +0200
Message-Id: <20220808141246.5749-4-povik+lin@cutebit.org>
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 asahi@lists.linux.dev,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index db446db88df5..10a79f8139be 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -46,38 +46,6 @@ static void tas2770_reset(struct tas2770_priv *tas2770)
 	usleep_range(1000, 2000);
 }
 
-static int tas2770_set_bias_level(struct snd_soc_component *component,
-				 enum snd_soc_bias_level level)
-{
-	struct tas2770_priv *tas2770 =
-			snd_soc_component_get_drvdata(component);
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					      TAS2770_PWR_CTRL_MASK,
-					      TAS2770_PWR_CTRL_ACTIVE);
-		break;
-	case SND_SOC_BIAS_STANDBY:
-	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					      TAS2770_PWR_CTRL_MASK,
-					      TAS2770_PWR_CTRL_MUTE);
-		break;
-	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					      TAS2770_PWR_CTRL_MASK,
-					      TAS2770_PWR_CTRL_SHUTDOWN);
-		break;
-
-	default:
-		dev_err(tas2770->dev, "wrong power level setting %d\n", level);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 #ifdef CONFIG_PM
 static int tas2770_codec_suspend(struct snd_soc_component *component)
 {
@@ -555,7 +523,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
 	.probe			= tas2770_codec_probe,
 	.suspend		= tas2770_codec_suspend,
 	.resume			= tas2770_codec_resume,
-	.set_bias_level = tas2770_set_bias_level,
 	.controls		= tas2770_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas2770_snd_controls),
 	.dapm_widgets		= tas2770_dapm_widgets,
-- 
2.33.0

