Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1FD67227E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684B76F8A;
	Wed, 18 Jan 2023 17:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684B76F8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058045;
	bh=RXJzK+HrPVqPFjcX3D3K4hc39G+f4irx10zIeYSJ8rA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jQgrKabnHkwf3cLN0qUjmfq38hUV5FeHTtLu1Fi1CU3PF/JGV9KPN1qnu6IWaMoKu
	 QNipwAolQxcx/noF5AZ6rAxfRMhH1+SQREgbGgpA0SJHbAz/DxZHWE9BD2aqvugSDk
	 4389y1jqj7ksoWbTDHl3HYcGVkU9J2SvO3qyl7kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAAE4F8055A;
	Wed, 18 Jan 2023 17:05:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC4FF80549; Wed, 18 Jan 2023 17:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7783AF80482
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7783AF80482
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HVG3RfRt
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IEEjlA023722; Wed, 18 Jan 2023 10:05:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=TTC47bgNB45idzSbfNOI1xh6OyXSxo6PonYazO3r2IQ=;
 b=HVG3RfRt9/sRcEmYkIYY0FFCi3Z2tAhh+vV8bgoC/S32GKGiIBTaYxJhWXTnjs31G4aE
 z7s0Z36WLmeDQbXU5ksNlxE1Tgv1dRrVAQvX+kFIFYwoR0TLWI3N3kFw2D2J3Y2XJ/CB
 Gx/EPnHFYfo/doylK2SFXMBVushbVDoSuXEg30/RF7subvCVYlTesaIXroMbh4ckIs6C
 6UYPSpkEJKwVlUJxpENZ2V4b1wDo6xXRk4lOaVs1JzyfeK4MePzR21mArY7I21qK72z+
 aVpJadUmHdxqQf9X6lKPphfCGgLAPo2fCHNsfYM51hmT1seL0+yE0JwxYC1i8dFwROVR TQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spx6vk8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 10:05:02 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 18 Jan
 2023 10:04:57 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Wed, 18 Jan 2023 10:04:57 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 702B0B12;
 Wed, 18 Jan 2023 16:04:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 4/8] ASoC: cs42l42: Separate ASP config from PLL config
Date: Wed, 18 Jan 2023 16:04:48 +0000
Message-ID: <20230118160452.2385494-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4pwKZYdmdN9L1uDQbYMxmLtOSsLXRyNt
X-Proofpoint-ORIG-GUID: 4pwKZYdmdN9L1uDQbYMxmLtOSsLXRyNt
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Setup of the ASP (audio serial port) was being done as a side-effect of
cs42l42_pll_config() and forces a restriction on the ratio of sample_rate
to bit_clock that is invalid for Soundwire.

Move the ASP setup into a dedicated function.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 81 +++++++++++++++++++++-----------------
 sound/soc/codecs/cs42l42.h |  1 -
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 939f8bcc222c0..d81c6eb1c1e59 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -658,7 +658,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
-	u32 fsync;
 
 	/* Don't reconfigure if there is an audio stream running */
 	if (cs42l42->stream_use) {
@@ -684,40 +683,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
 					(pll_ratio_table[i].mclk_int !=
 					24000000)) <<
 					CS42L42_INTERNAL_FS_SHIFT);
-
-			/* Set up the LRCLK */
-			fsync = clk / cs42l42->srate;
-			if (((fsync * cs42l42->srate) != clk)
-				|| ((fsync % 2) != 0)) {
-				dev_err(component->dev,
-					"Unsupported sclk %d/sample rate %d\n",
-					clk,
-					cs42l42->srate);
-				return -EINVAL;
-			}
-			/* Set the LRCLK period */
-			snd_soc_component_update_bits(component,
-					CS42L42_FSYNC_P_LOWER,
-					CS42L42_FSYNC_PERIOD_MASK,
-					CS42L42_FRAC0_VAL(fsync - 1) <<
-					CS42L42_FSYNC_PERIOD_SHIFT);
-			snd_soc_component_update_bits(component,
-					CS42L42_FSYNC_P_UPPER,
-					CS42L42_FSYNC_PERIOD_MASK,
-					CS42L42_FRAC1_VAL(fsync - 1) <<
-					CS42L42_FSYNC_PERIOD_SHIFT);
-			/* Set the LRCLK to 50% duty cycle */
-			fsync = fsync / 2;
-			snd_soc_component_update_bits(component,
-					CS42L42_FSYNC_PW_LOWER,
-					CS42L42_FSYNC_PULSE_WIDTH_MASK,
-					CS42L42_FRAC0_VAL(fsync - 1) <<
-					CS42L42_FSYNC_PULSE_WIDTH_SHIFT);
-			snd_soc_component_update_bits(component,
-					CS42L42_FSYNC_PW_UPPER,
-					CS42L42_FSYNC_PULSE_WIDTH_MASK,
-					CS42L42_FRAC1_VAL(fsync - 1) <<
-					CS42L42_FSYNC_PULSE_WIDTH_SHIFT);
 			if (pll_ratio_table[i].mclk_src_sel == 0) {
 				/* Pass the clock straight through */
 				snd_soc_component_update_bits(component,
@@ -809,6 +774,46 @@ static void cs42l42_src_config(struct snd_soc_component *component, unsigned int
 				      fs << CS42L42_CLK_OASRC_SEL_SHIFT);
 }
 
+static int cs42l42_asp_config(struct snd_soc_component *component,
+			      unsigned int sclk, unsigned int sample_rate)
+{
+	u32 fsync = sclk / sample_rate;
+
+	/* Set up the LRCLK */
+	if (((fsync * sample_rate) != sclk) || ((fsync % 2) != 0)) {
+		dev_err(component->dev,
+			"Unsupported sclk %d/sample rate %d\n",
+			sclk,
+			sample_rate);
+		return -EINVAL;
+	}
+	/* Set the LRCLK period */
+	snd_soc_component_update_bits(component,
+				      CS42L42_FSYNC_P_LOWER,
+				      CS42L42_FSYNC_PERIOD_MASK,
+				      CS42L42_FRAC0_VAL(fsync - 1) <<
+				      CS42L42_FSYNC_PERIOD_SHIFT);
+	snd_soc_component_update_bits(component,
+				      CS42L42_FSYNC_P_UPPER,
+				      CS42L42_FSYNC_PERIOD_MASK,
+				      CS42L42_FRAC1_VAL(fsync - 1) <<
+				      CS42L42_FSYNC_PERIOD_SHIFT);
+	/* Set the LRCLK to 50% duty cycle */
+	fsync = fsync / 2;
+	snd_soc_component_update_bits(component,
+				      CS42L42_FSYNC_PW_LOWER,
+				      CS42L42_FSYNC_PULSE_WIDTH_MASK,
+				      CS42L42_FRAC0_VAL(fsync - 1) <<
+				      CS42L42_FSYNC_PULSE_WIDTH_SHIFT);
+	snd_soc_component_update_bits(component,
+				      CS42L42_FSYNC_PW_UPPER,
+				      CS42L42_FSYNC_PULSE_WIDTH_MASK,
+				      CS42L42_FRAC1_VAL(fsync - 1) <<
+				      CS42L42_FSYNC_PULSE_WIDTH_SHIFT);
+
+	return 0;
+}
+
 static int cs42l42_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = codec_dai->component;
@@ -904,8 +909,6 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int bclk;
 	int ret;
 
-	cs42l42->srate = params_rate(params);
-
 	if (cs42l42->bclk_ratio) {
 		/* machine driver has set the BCLK/samp-rate ratio */
 		bclk = cs42l42->bclk_ratio * params_rate(params);
@@ -966,6 +969,10 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	ret = cs42l42_asp_config(component, bclk, sample_rate);
+	if (ret)
+		return ret;
+
 	cs42l42_src_config(component, sample_rate);
 
 	return 0;
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index a721366641127..17aab06adc8e6 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -36,7 +36,6 @@ struct  cs42l42_private {
 	int pll_config;
 	u32 sclk;
 	u32 bclk_ratio;
-	u32 srate;
 	u8 plug_state;
 	u8 hs_type;
 	u8 ts_inv;
-- 
2.34.1

