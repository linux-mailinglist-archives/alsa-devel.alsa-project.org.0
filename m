Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD54C04B8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4643118A6;
	Tue, 22 Feb 2022 23:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4643118A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645569411;
	bh=k0EDvp3wcgzQ1m9/UbYNFGBRrab4ybuxm/3Rt+ybLL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QkbIuOxVfggLwSKlqpL1BVSslTEqSj7DaBhFiLmr6Fszmn634V4JuPWebQSWHljy4
	 XD3FNsO8pxSbHgJg07vFjXhRhyWDKwfu1TZy1ngYvz81ky2Zf8BOi0lbNKcJiPkxXQ
	 aSEhAyrX7KSHfuCaa598SEWQdecOn3IqKl7CK2Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DF5F80238;
	Tue, 22 Feb 2022 23:36:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D2FFF801EC; Tue, 22 Feb 2022 23:35:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 905E0F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905E0F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WugarVbg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1178460907;
 Tue, 22 Feb 2022 22:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEBFC340E8;
 Tue, 22 Feb 2022 22:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645569354;
 bh=k0EDvp3wcgzQ1m9/UbYNFGBRrab4ybuxm/3Rt+ybLL8=;
 h=From:To:Cc:Subject:Date:From;
 b=WugarVbgyLHvTAkxzvR4yWax5co5UornPes0JTXVEqAdDLd88VCkCdjgQmWN2hN8P
 bmIExWeVDkhu0UvtoDvFnMVsFOXZk4oI0+0koyE4tuBEy08KBxscyhfrj4Jk32oqCx
 yDDZfAs2Hy1LNwD7bZ+l5fu2wa6b7lzBoveSYzwITigcFGLf5YmhyNLpnJIiuL0RSx
 w43jTwBhyb3Cr64PLYd8jMZDnXtikcpPodY2ugFTaQFqWLRfNVdc+7BdmqSJO01sw2
 QiS5hneHJTBJRvnwyVER+nICtsh+8Dsi2jfNjY3PXSimE0FeHwD+2MF7cIXa7/EBwW
 SFFxjllHAhqPg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: es8328: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:35:34 +0000
Message-Id: <20220222223534.3212743-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333; h=from:subject;
 bh=k0EDvp3wcgzQ1m9/UbYNFGBRrab4ybuxm/3Rt+ybLL8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFWUk4BdJ2JpjE0Hpa1vl/l+AeWLWBz8cPf8S5Npq
 EwyOpC2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhVlJAAKCRAk1otyXVSH0JDNB/
 4h9X2peNQg/oBbd2mOxE3IStBGUBAJsoyH7b/He+/M1KoJYaYU5vMJl5MTtDSQvT28SgJB6X1Q8tSM
 7q0dbOd18x93Q3/hMU2kYFHytaQoRLTfEEtcCyESVuWM7u4FHT+CsN7/KeeDK/hX5hCaiVZZz39qxI
 QoXpWfbawY8Cb1eC+Z7ELFaSdEf7nH0qGK7ohNqraicXopv2meLkQmomk2DSfwMRYQq8vOidhkA/er
 bhrNojV23JP3gcqY2rghYnZ7dbDUS8UGq8ttQZShcHk+2O9HjLuYZb/wAHGXatCaSXFaQ4/S1FEJpc
 VqqWXCa2Ev5eHmWbxcDK5pHulvXTwC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
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

As part of moving to remove the old style defines for the bus clocks update
the es8328 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8328.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 9632afc2d4d6..3f00ead97006 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -84,7 +84,7 @@ struct es8328_priv {
 	int mclkdiv2;
 	const struct snd_pcm_hw_constraint_list *sysclk_constraints;
 	const int *mclk_ratios;
-	bool master;
+	bool provider;
 	struct regulator_bulk_data supplies[ES8328_SUPPLY_NUM];
 };
 
@@ -462,7 +462,7 @@ static int es8328_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 
-	if (es8328->master && es8328->sysclk_constraints)
+	if (es8328->provider && es8328->sysclk_constraints)
 		snd_pcm_hw_constraint_list(substream->runtime, 0,
 				SNDRV_PCM_HW_PARAM_RATE,
 				es8328->sysclk_constraints);
@@ -486,7 +486,7 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 	else
 		reg = ES8328_ADCCONTROL5;
 
-	if (es8328->master) {
+	if (es8328->provider) {
 		if (!es8328->sysclk_constraints) {
 			dev_err(component->dev, "No MCLK configured\n");
 			return -EINVAL;
@@ -590,19 +590,19 @@ static int es8328_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u8 dac_mode = 0;
 	u8 adc_mode = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* Master serial port mode, with BCLK generated automatically */
 		snd_soc_component_update_bits(component, ES8328_MASTERMODE,
 				    ES8328_MASTERMODE_MSC,
 				    ES8328_MASTERMODE_MSC);
-		es8328->master = true;
+		es8328->provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		/* Slave serial port mode */
 		snd_soc_component_update_bits(component, ES8328_MASTERMODE,
 				    ES8328_MASTERMODE_MSC, 0);
-		es8328->master = false;
+		es8328->provider = false;
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

