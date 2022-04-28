Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E5513A4B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 18:47:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5598E12;
	Thu, 28 Apr 2022 18:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5598E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651164472;
	bh=5f/pjr5Snhj5VXAfibnfWnc1to2KPR4vug+MPnz3PMw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nl6fbFQLxjVQ9Gn1kcHq8aYjHH+l9G2qebvo2Exi7Z1XCI8KNN83jGD7RaOph/Qei
	 dmKm5pT6mTpbaYjcTEVTpXPb1uaUJ4coYYzRVarGqjM4zik7gkk4G152T7WLHIBNZt
	 vx1xGKa/Xfv09wgpFWDfxHWNzHytRJdmBZNQXixc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 363E8F800F2;
	Thu, 28 Apr 2022 18:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1386F8016E; Thu, 28 Apr 2022 18:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A813F800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 18:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A813F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="StUK12CG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1651164406;
 x=1682700406;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=A0D1aJpKJgI/DwNftkavkxMKb2zU/9N58rFz8OhTGQ8=;
 b=StUK12CGV17BD0W0CDXb8K9R3mJ1CxZYbUyYAseVJgUi5bpyh7DMIfNi
 b+h/XfbjkmeySYLzUoKUbDRCxCU9qLMntipnhGrwjZVtxQcFvikY5qT/4
 6aGGNRgnrHxEc5s4dAci0GbXU3e4N1r18F9ocnL3WfsemBX/BHU6gKayU
 1bm2s9X/GT8yxdFTIhWjYNs2v72a4YkCMGVCxKRdNSKVl5GT8mKH0Dm3q
 VegG+TA0JGKKo8oqyZLB2dwNEQQd/TAfNzRl/IObsHFi3EOtpRHwXfriH
 psYmI806mO+g5LcyuWydGkysKVmutlrd2FMhQwQlX+M/FW0aHAtbHvfWA Q==;
Date: Thu, 28 Apr 2022 18:46:35 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: adau1761: Add ADAU1761-as-ADAU1361 compatibility
 mode
Message-ID: <alpine.DEB.2.21.2204281841290.5574@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail06w.axis.com (10.20.40.12) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>
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


During probe, determine if the chip is in fact an ADAU1761
even though an ADAU1361 is specified, and perform additional
operations to enable the ADAU1761 to behave as an ADAU1361,
i.e. disregarding the DSP and setting up routing and PM
transparently.

This enables either chip to be mounted when an ADAU1361 is specified.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 sound/soc/codecs/adau1761.c | 86 +++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/adau17x1.c | 20 +++++++--
 sound/soc/codecs/adau17x1.h |  1 +
 3 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index fb006fc81653..8f887227981f 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -556,8 +556,6 @@ static const struct snd_soc_dapm_route adau1761_dapm_routes[] = {
 	{ "Left DAC", NULL, "Interpolator Resync Clock" },
 	{ "Right DAC", NULL, "Interpolator Resync Clock" },
 
-	{ "DSP", NULL, "Digital Clock 0" },
-
 	{ "Slew Clock", NULL, "Digital Clock 0" },
 	{ "Right Playback Mixer", NULL, "Slew Clock" },
 	{ "Left Playback Mixer", NULL, "Slew Clock" },
@@ -569,6 +567,56 @@ static const struct snd_soc_dapm_route adau1761_dapm_routes[] = {
 	{ "Digital Clock 1", NULL, "SYSCLK" },
 };
 
+static const struct snd_soc_dapm_route adau1761_dapm_dsp_routes[] = {
+	{ "DSP", NULL, "Digital Clock 0" },
+};
+
+static int adau1761_compatibility_probe(struct device *dev)
+{
+	struct adau *adau = dev_get_drvdata(dev);
+	struct regmap *regmap = adau->regmap;
+	int val, ret = 0;
+
+	/* Only consider compatibility mode when ADAU1361 was specified. */
+	if (adau->type != ADAU1361)
+		return 0;
+
+	regcache_cache_bypass(regmap, true);
+
+	/*
+	 * This will enable the core clock and bypass the PLL,
+	 * so that we can access the registers for probing purposes
+	 * (without having to set up the PLL).
+	 */
+	regmap_write(regmap, ADAU17X1_CLOCK_CONTROL,
+		ADAU17X1_CLOCK_CONTROL_SYSCLK_EN);
+
+	/*
+	 * ADAU17X1_SERIAL_SAMPLING_RATE doesn't exist in non-DSP chips;
+	 * reading it results in zero at all times, and write is a no-op.
+	 * Use this register to probe for ADAU1761.
+	 */
+	regmap_write(regmap, ADAU17X1_SERIAL_SAMPLING_RATE, 1);
+	ret = regmap_read(regmap, ADAU17X1_SERIAL_SAMPLING_RATE, &val);
+	if (ret)
+		goto exit;
+	if (val != 1)
+		goto exit;
+	regmap_write(regmap, ADAU17X1_SERIAL_SAMPLING_RATE, 0);
+	ret = regmap_read(regmap, ADAU17X1_SERIAL_SAMPLING_RATE, &val);
+	if (ret)
+		goto exit;
+	if (val != 0)
+		goto exit;
+
+	adau->type = ADAU1761_AS_1361;
+exit:
+	/* Disable core clock after probing. */
+	regmap_write(regmap, ADAU17X1_CLOCK_CONTROL, 0);
+	regcache_cache_bypass(regmap, false);
+	return ret;
+}
+
 static int adau1761_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
@@ -823,7 +871,11 @@ static int adau1761_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	if (adau->type == ADAU1761) {
+	/*
+	 * If we've got an ADAU1761, or an ADAU1761 operating as an
+	 * ADAU1361, we need these non-DSP related DAPM widgets and routes.
+	 */
+	if (adau->type == ADAU1761 || adau->type == ADAU1761_AS_1361) {
 		ret = snd_soc_dapm_new_controls(dapm, adau1761_dapm_widgets,
 			ARRAY_SIZE(adau1761_dapm_widgets));
 		if (ret)
@@ -834,7 +886,29 @@ static int adau1761_component_probe(struct snd_soc_component *component)
 		if (ret)
 			return ret;
 	}
-
+	/*
+	 * These routes are DSP related and only used when we have a
+	 * bona fide ADAU1761.
+	 */
+	if (adau->type == ADAU1761) {
+		ret = snd_soc_dapm_add_routes(dapm, adau1761_dapm_dsp_routes,
+			ARRAY_SIZE(adau1761_dapm_dsp_routes));
+		if (ret)
+			return ret;
+	}
+	/*
+	 * In the ADAU1761, by default, the AIF is routed to the DSP, whereas
+	 * for the ADAU1361, the AIF is permanently routed to the ADC and DAC.
+	 * Thus, if we have an ADAU1761 masquerading as an ADAU1361,
+	 * we need to explicitly route the AIF to the ADC and DAC.
+	 * For the ADAU1761, this is normally done by set_tdm_slot, but this
+	 * function is not necessarily called during stream setup, so set up
+	 * the compatible AIF routings here from the start.
+	 */
+	if  (adau->type == ADAU1761_AS_1361) {
+		regmap_write(adau->regmap, ADAU17X1_SERIAL_INPUT_ROUTE, 0x01);
+		regmap_write(adau->regmap, ADAU17X1_SERIAL_OUTPUT_ROUTE, 0x01);
+	}
 	ret = adau17x1_add_routes(component);
 	if (ret < 0)
 		return ret;
@@ -919,6 +993,10 @@ int adau1761_probe(struct device *dev, struct regmap *regmap,
 	if (ret)
 		return ret;
 
+	ret = adau1761_compatibility_probe(dev);
+	if (ret)
+		return ret;
+
 	/* Enable cache only mode as we could miss writes before bias level
 	 * reaches standby and the core clock is enabled */
 	regcache_cache_only(regmap, true);
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index af05463af4ac..c0f44ecef606 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -334,6 +334,17 @@ static bool adau17x1_has_dsp(struct adau *adau)
 	}
 }
 
+/* Chip has a DSP but we're pretending it doesn't. */
+static bool adau17x1_has_disused_dsp(struct adau *adau)
+{
+	switch (adau->type) {
+	case ADAU1761_AS_1361:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool adau17x1_has_safeload(struct adau *adau)
 {
 	switch (adau->type) {
@@ -516,10 +527,11 @@ static int adau17x1_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(adau->regmap, ADAU17X1_CONVERTER0,
 		ADAU17X1_CONVERTER0_CONVSR_MASK, div);
-	if (adau17x1_has_dsp(adau)) {
+
+	if (adau17x1_has_dsp(adau) || adau17x1_has_disused_dsp(adau))
 		regmap_write(adau->regmap, ADAU17X1_SERIAL_SAMPLING_RATE, div);
+	if (adau17x1_has_dsp(adau))
 		regmap_write(adau->regmap, ADAU17X1_DSP_SAMPLING_RATE, dsp_div);
-	}
 
 	if (adau->sigmadsp) {
 		ret = adau17x1_setup_firmware(component, params_rate(params));
@@ -663,7 +675,7 @@ static int adau17x1_set_dai_tdm_slot(struct snd_soc_dai *dai,
 
 	switch (slot_width * slots) {
 	case 32:
-		if (adau->type == ADAU1761)
+		if (adau->type == ADAU1761 || adau->type == ADAU1761_AS_1361)
 			return -EINVAL;
 
 		ser_ctrl1 = ADAU17X1_SERIAL_PORT1_BCLK32;
@@ -738,7 +750,7 @@ static int adau17x1_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	regmap_update_bits(adau->regmap, ADAU17X1_SERIAL_PORT1,
 		ADAU17X1_SERIAL_PORT1_BCLK_MASK, ser_ctrl1);
 
-	if (!adau17x1_has_dsp(adau))
+	if (!adau17x1_has_dsp(adau) && !adau17x1_has_disused_dsp(adau))
 		return 0;
 
 	if (adau->dsp_bypass[SNDRV_PCM_STREAM_PLAYBACK]) {
diff --git a/sound/soc/codecs/adau17x1.h b/sound/soc/codecs/adau17x1.h
index 98a3b6f5bc96..5e58abfffc3d 100644
--- a/sound/soc/codecs/adau17x1.h
+++ b/sound/soc/codecs/adau17x1.h
@@ -10,6 +10,7 @@
 enum adau17x1_type {
 	ADAU1361,
 	ADAU1761,
+	ADAU1761_AS_1361,
 	ADAU1381,
 	ADAU1781,
 };
-- 
2.20.1


-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
