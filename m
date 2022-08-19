Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D480E599C3F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:54:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D351632;
	Fri, 19 Aug 2022 14:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D351632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913663;
	bh=zcUbqZgW7PtUZxfy6ieM2KdkGh73/EurAk/BDWW2M1I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vbyx5attWpaxfroXoLQCV2dRKqm/69KkGVujFxvgtwXV8R6eRujJk+z+TAdHCj01F
	 M5xeHCHkpqT5NfiOSYqWfXnr+f2QVO6cHfvxUBV/JGF3GImnNEAKX/+Y7z1SNLSQFL
	 ahjL0PRYmR9eX6x4xwwopbiUb7GbMQiAvHlKw98Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B64E5F8052F;
	Fri, 19 Aug 2022 14:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A31F80526; Fri, 19 Aug 2022 14:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E16BF800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E16BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DIFGxJiK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JBix0Q020060;
 Fri, 19 Aug 2022 07:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=nKtJZgoVT5msd6d2g2FF3eUTwfX6urlD3iU/MkRT4Ow=;
 b=DIFGxJiK1LabfmgyE6ysA2LXVuQ6SFYPkvYOvc6XP0XOt3vXgCCIfOgYx8eeu7FKCytN
 +SRg9IMu2MvwreA3vOffGlSEb4U6QGh+AztP6PjLYjITvF4420IUZ7bXhUKydLP03urT
 ERkaOXndxklQYvBdxV/d8Ec1INJB3YBuMWChXDUej9H7jDORi4flNfMp4hKWzmpPdXsj
 xvTa/07OhsaLvTL6YXxSBtlD52zctqI7M3KNel+hBUzy595TcPSfHRE5F3p2/JssgacX
 FjuZ9dCcgOUC/T0Xpi+nE5k4Q4pluS2J2aKrd17qsruU7Rhzyv9cwZUxtExXYgYlgvuM yQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpfuvn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:36 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:34 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4A43B0E;
 Fri, 19 Aug 2022 12:52:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/12] ASoC: cs42l42: Separate ASP config from PLL config
Date: Fri, 19 Aug 2022 13:52:22 +0100
Message-ID: <20220819125230.42731-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nlssAeiSidrrLH-vAN240o8wIKYT_HaR
X-Proofpoint-GUID: nlssAeiSidrrLH-vAN240o8wIKYT_HaR
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Setup of the ASP (audio serial port) was being done as a side-effect of
cs42l42_pll_config() and forces a restriction on the ratio of sample_rate
to bit_clock that is invalid for Soundwire.

Move the ASP setup into a dedicated function.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 81 +++++++++++++++++++++-----------------
 sound/soc/codecs/cs42l42.h |  1 -
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 66c10d24169d..946b2a935256 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -654,7 +654,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
-	u32 fsync;
 
 	/* Don't reconfigure if there is an audio stream running */
 	if (cs42l42->stream_use) {
@@ -680,40 +679,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
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
@@ -805,6 +770,46 @@ static void cs42l42_src_config(struct snd_soc_component *component, unsigned int
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
@@ -900,8 +905,6 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int bclk;
 	int ret;
 
-	cs42l42->srate = params_rate(params);
-
 	if (cs42l42->sclk) {
 		/* machine driver has set the SCLK */
 		bclk = cs42l42->sclk;
@@ -959,6 +962,10 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	ret = cs42l42_asp_config(component, bclk, sample_rate);
+	if (ret)
+		return ret;
+
 	cs42l42_src_config(component, sample_rate);
 
 	return 0;
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index b4ba1467c558..2e4e01f9e389 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -31,7 +31,6 @@ struct  cs42l42_private {
 	struct mutex irq_lock;
 	int pll_config;
 	u32 sclk;
-	u32 srate;
 	u8 plug_state;
 	u8 hs_type;
 	u8 ts_inv;
-- 
2.30.2

