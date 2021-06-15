Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC13A84A1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016561691;
	Tue, 15 Jun 2021 17:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016561691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772194;
	bh=qna0s9b3nXSCyr1sPmpyt8aI5vVVDvjz9OIvUIi7AhQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doweIotljJ1EwsCyTL6RFSd7loXt/55f7Pj/xG6wHitAwgpj2kS9wxPzM6Uj6559t
	 cTmD6a6LO00vSJkGeQ86jor4hY3esqoQh4gxoAIFEheWhhviN6K63vrITOTKkVd27r
	 aPWL1B8Thj1ofm9hMRwcJ2Phkx1WjxKN4yZUxGC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89EAEF804D8;
	Tue, 15 Jun 2021 17:48:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08449F804D9; Tue, 15 Jun 2021 17:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B62F804D1
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B62F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dl6CjtBF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29BA861628;
 Tue, 15 Jun 2021 15:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772110;
 bh=qna0s9b3nXSCyr1sPmpyt8aI5vVVDvjz9OIvUIi7AhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dl6CjtBFJ2MVxHk4eOxPsh3ECy09KG7VkOo2Mk1r++GN58VlHyhQVpnP6w3O58j0s
 RjxLZRlw2kPmfNLdrV69daHTM/I2Tv0vWC/XU+on1C1rkaC1PBDVR8yqX0BKboQhfB
 NtrK5DnoT6xB3QwGeq/gtJDQKg0swJaHtDapJbhClrrF2gZ96Azm36MDxRj9CGFJ9n
 k1hV+OUW9iDrLFakGTKmG2+RdHZI12DRIXDuIj+hdvrY83JbrE9LzL59DN9ZgPbZjs
 WlJ7zeL/9YrTEczH68NfIzJLUChrLceAh/7zjunQmMGrLlKkekrLakLwUR1riTlNn3
 BiX/dUQM0dBpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 05/33] ASoC: rt5659: Fix the lost powers for the
 HDA header
Date: Tue, 15 Jun 2021 11:47:56 -0400
Message-Id: <20210615154824.62044-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>
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

From: Jack Yu <jack.yu@realtek.com>

[ Upstream commit 6308c44ed6eeadf65c0a7ba68d609773ed860fbb ]

The power of "LDO2", "MICBIAS1" and "Mic Det Power" were powered off after
the DAPM widgets were added, and these powers were set by the JD settings
"RT5659_JD_HDA_HEADER" in the probe function. In the codec probe function,
these powers were ignored to prevent them controlled by DAPM.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Jack Yu <jack.yu@realtek.com>
Message-Id: <15fced51977b458798ca4eebf03dafb9@realtek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5659.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 91a4ef7f620c..a9b079d56fd6 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -2433,13 +2433,18 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static const struct snd_soc_dapm_widget rt5659_dapm_widgets[] = {
+static const struct snd_soc_dapm_widget rt5659_particular_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("LDO2", RT5659_PWR_ANLG_3, RT5659_PWR_LDO2_BIT, 0,
 		NULL, 0),
-	SND_SOC_DAPM_SUPPLY("PLL", RT5659_PWR_ANLG_3, RT5659_PWR_PLL_BIT, 0,
-		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MICBIAS1", RT5659_PWR_ANLG_2, RT5659_PWR_MB1_BIT,
+		0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("Mic Det Power", RT5659_PWR_VOL,
 		RT5659_PWR_MIC_DET_BIT, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_widget rt5659_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("PLL", RT5659_PWR_ANLG_3, RT5659_PWR_PLL_BIT, 0,
+		NULL, 0),
 	SND_SOC_DAPM_SUPPLY("Mono Vref", RT5659_PWR_ANLG_1,
 		RT5659_PWR_VREF3_BIT, 0, NULL, 0),
 
@@ -2464,8 +2469,6 @@ static const struct snd_soc_dapm_widget rt5659_dapm_widgets[] = {
 		RT5659_ADC_MONO_R_ASRC_SFT, 0, NULL, 0),
 
 	/* Input Side */
-	SND_SOC_DAPM_SUPPLY("MICBIAS1", RT5659_PWR_ANLG_2, RT5659_PWR_MB1_BIT,
-		0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MICBIAS2", RT5659_PWR_ANLG_2, RT5659_PWR_MB2_BIT,
 		0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MICBIAS3", RT5659_PWR_ANLG_2, RT5659_PWR_MB3_BIT,
@@ -3660,10 +3663,23 @@ static int rt5659_set_bias_level(struct snd_soc_component *component,
 
 static int rt5659_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
 
 	rt5659->component = component;
 
+	switch (rt5659->pdata.jd_src) {
+	case RT5659_JD_HDA_HEADER:
+		break;
+
+	default:
+		snd_soc_dapm_new_controls(dapm,
+			rt5659_particular_dapm_widgets,
+			ARRAY_SIZE(rt5659_particular_dapm_widgets));
+		break;
+	}
+
 	return 0;
 }
 
-- 
2.30.2

