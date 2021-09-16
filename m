Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11440DDE6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68AAF18D2;
	Thu, 16 Sep 2021 17:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68AAF18D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805717;
	bh=rnjN7iOhBDdByPh3TYUSvkl1EUQIgxSOMgKiuHLdc5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGwaYb9DR0s8TXp1Nxa15xKUXb7H6FWDUW9mKOXDizTEl32RlsajjEiLF2Ttr4h+c
	 VUjXGlYr4VLPzC4BHZ890f0ZmAP9hH4dcrq+Wpuxjxn198uB9sNTxQfpTKKfhqx8bk
	 URGo6UKsU5fuAdbGKNz8GENIBKTiqGJwPRZnQUNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3BB0F804FC;
	Thu, 16 Sep 2021 17:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4AA2F804FD; Thu, 16 Sep 2021 17:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEB15F804F2
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB15F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AkkG5Vey"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99E9560F4A;
 Thu, 16 Sep 2021 15:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805542;
 bh=rnjN7iOhBDdByPh3TYUSvkl1EUQIgxSOMgKiuHLdc5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AkkG5VeyG3phuYWiQ0IzfN5awRMQ/mPPCv+lrAVnW1DQ0zdFApEXn5ecME1Oo5Wqr
 pH58wCc8VG3jZ+jgWCLhjcBn7k14Tda8dHiG4UBurT3FS8eV/33RRnl5P+4P9JvOgH
 bTPUOgKXXHX3v5zY/i0OXWWyJRYYNEAIJ4S1Ytj0bg+5GXVtxs0exicOcSgESOMceZ
 fhrm2ioxmQ70uvoiZzkxSmF/iesArBVYJYA7vC5vKn0AgC47fLtFq3TgxyqCgQUf9m
 dnxlqTzcZd7RnKcuzo25iDWtRNd84nZrWyjZnrrhdcsv6xhNWo4s7jTWfD9PJMUlay
 aFQMlONtBsrtg==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/6] ASoC: adau1977: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 16:18:05 +0100
Message-Id: <20210916151806.20756-5-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916151806.20756-1-broonie@kernel.org>
References: <20210916151806.20756-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3811; h=from:subject;
 bh=rnjN7iOhBDdByPh3TYUSvkl1EUQIgxSOMgKiuHLdc5E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1+rdI/Pw3bbFQY7bPHig99uq7fwNCC4i3qiZ5w7
 QC6466CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNfqwAKCRAk1otyXVSH0A5UB/
 4oJLnLw8QTdMIa+LJvR4PSheWjLnaeiTGEyrpz0cCLmY3X3YyrokFwa8E4hCLp7gp445teNamoceNa
 mIuLpexCTfigbo/n/UwWmhqB4auGTFvOQWDRIfPliPMw8goUm+JxY3X0J5Us6EAU5b+RUrtgrpaBTW
 MC85aE5d2p+B7nH7Ij/RU6unDDiaj/Wz1zkCk39YZMU6BIeSje17tWlgYyOOc/2bY8puzR3Ie0wImN
 nXVXl31aD31M+NFm98fuj3KOwQm6l8Tt82fqkP+IAtnP8gegKg9ueFm/bBT+WLRSi0d2PYs7ogJ1EC
 pxVXPJDs5PfTpJde8A50SH7HLx1UTz
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
the adau1977 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau1977.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index e347a48131d1..5fcbdf2ec313 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -124,10 +124,10 @@ struct adau1977 {
 	struct device *dev;
 	void (*switch_mode)(struct device *dev);
 
-	unsigned int max_master_fs;
+	unsigned int max_clock_provider_fs;
 	unsigned int slot_width;
 	bool enabled;
-	bool master;
+	bool clock_provider;
 };
 
 static const struct reg_default adau1977_reg_defaults[] = {
@@ -330,7 +330,7 @@ static int adau1977_hw_params(struct snd_pcm_substream *substream,
 		ctrl0_mask |= ADAU1977_SAI_CTRL0_FMT_MASK;
 	}
 
-	if (adau1977->master) {
+	if (adau1977->clock_provider) {
 		switch (params_width(params)) {
 		case 16:
 			ctrl1 = ADAU1977_SAI_CTRL1_DATA_WIDTH_16BIT;
@@ -504,7 +504,7 @@ static int adau1977_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	if (slots == 0) {
 		/* 0 = No fixed slot width */
 		adau1977->slot_width = 0;
-		adau1977->max_master_fs = 192000;
+		adau1977->max_clock_provider_fs = 192000;
 		return regmap_update_bits(adau1977->regmap,
 			ADAU1977_REG_SAI_CTRL0, ADAU1977_SAI_CTRL0_SAI_MASK,
 			ADAU1977_SAI_CTRL0_SAI_I2S);
@@ -533,7 +533,7 @@ static int adau1977_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		break;
 	case 24:
 		/* We can only generate 16 bit or 32 bit wide slots */
-		if (adau1977->master)
+		if (adau1977->clock_provider)
 			return -EINVAL;
 		ctrl1 = ADAU1977_SAI_CTRL1_SLOT_WIDTH_24;
 		break;
@@ -593,8 +593,8 @@ static int adau1977_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 
 	adau1977->slot_width = width;
 
-	/* In master mode the maximum bitclock is 24.576 MHz */
-	adau1977->max_master_fs = min(192000, 24576000 / width / slots);
+	/* In clock provider mode the maximum bitclock is 24.576 MHz */
+	adau1977->max_clock_provider_fs = min(192000, 24576000 / width / slots);
 
 	return 0;
 }
@@ -620,13 +620,13 @@ static int adau1977_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	bool invert_lrclk;
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		adau1977->master = false;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		adau1977->clock_provider = false;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl1 |= ADAU1977_SAI_CTRL1_MASTER;
-		adau1977->master = true;
+		adau1977->clock_provider = true;
 		break;
 	default:
 		return -EINVAL;
@@ -714,9 +714,10 @@ static int adau1977_startup(struct snd_pcm_substream *substream,
 	snd_pcm_hw_constraint_list(substream->runtime, 0,
 		SNDRV_PCM_HW_PARAM_RATE, &adau1977->constraints);
 
-	if (adau1977->master)
+	if (adau1977->clock_provider)
 		snd_pcm_hw_constraint_minmax(substream->runtime,
-			SNDRV_PCM_HW_PARAM_RATE, 8000, adau1977->max_master_fs);
+			SNDRV_PCM_HW_PARAM_RATE, 8000,
+					     adau1977->max_clock_provider_fs);
 
 	if (formats != 0)
 		snd_pcm_hw_constraint_mask64(substream->runtime,
@@ -913,7 +914,7 @@ int adau1977_probe(struct device *dev, struct regmap *regmap,
 	adau1977->type = type;
 	adau1977->regmap = regmap;
 	adau1977->switch_mode = switch_mode;
-	adau1977->max_master_fs = 192000;
+	adau1977->max_clock_provider_fs = 192000;
 
 	adau1977->constraints.list = adau1977_rates;
 	adau1977->constraints.count = ARRAY_SIZE(adau1977_rates);
-- 
2.20.1

