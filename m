Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC45A12EE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F9DE0E;
	Thu, 25 Aug 2022 16:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F9DE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661436267;
	bh=NokknhhlXeZGge4U1Y4cyDKoBNteti0fEstnvN9lsgQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1hIfqyk4LO+5JgdSDOJrU8cL3EznLHYKkGC0m9Vid2gVvdyfiIS0Q4mAD6m/MIVK
	 21VPgVIYyjOUtCF8SS2H/ROwsoLYXzW47oHDgCA7wdEwcvmfKqqnodlX22rzhTfk2Y
	 34dysJtDSj03jmkJGwj8Qe2vch6XbcS4DD0XjM8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB161F80529;
	Thu, 25 Aug 2022 16:03:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30540F80526; Thu, 25 Aug 2022 16:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9965F800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9965F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="LHGby8B8"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661436171; bh=A9R4hsRTvVB+CrLnhrK0/t3nKWg2k/rONUmXMJ9jpVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LHGby8B8IcDmmOS1FOMosJ6vI7W8wtjCj7+SfXrLtlAQo8Pr1wmcg3VgVN/wOhoL4
 YAANjMKAJcSmfGKZtIxqdplAFBp487sEvBJdS0aC5Hj3/UiUEcpZB0UEa282q/xdcc
 ty3QyWHySBBoaKjjEpnEj1V9gpHG3lWq8XqJWEag=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: tas2764: Drop conflicting set_bias_level power
 setting
Date: Thu, 25 Aug 2022 16:02:38 +0200
Message-Id: <20220825140241.53963-3-povik+lin@cutebit.org>
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 navada@ti.com, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asyrus@ti.com, shenghao-ding@ti.com, raphael-xu@ti.com,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Stephen Kitt <steve@sk2.org>, Dan Murphy <dmurphy@ti.com>
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

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 0df5d975c3c9..f4ac6edefdc0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -50,38 +50,6 @@ static void tas2764_reset(struct tas2764_priv *tas2764)
 	usleep_range(1000, 2000);
 }
 
-static int tas2764_set_bias_level(struct snd_soc_component *component,
-				 enum snd_soc_bias_level level)
-{
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_ACTIVE);
-		break;
-	case SND_SOC_BIAS_STANDBY:
-	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_MUTE);
-		break;
-	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_SHUTDOWN);
-		break;
-
-	default:
-		dev_err(tas2764->dev,
-				"wrong power level setting %d\n", level);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 #ifdef CONFIG_PM
 static int tas2764_codec_suspend(struct snd_soc_component *component)
 {
@@ -549,7 +517,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
 	.probe			= tas2764_codec_probe,
 	.suspend		= tas2764_codec_suspend,
 	.resume			= tas2764_codec_resume,
-	.set_bias_level		= tas2764_set_bias_level,
 	.controls		= tas2764_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas2764_snd_controls),
 	.dapm_widgets		= tas2764_dapm_widgets,
-- 
2.33.0

