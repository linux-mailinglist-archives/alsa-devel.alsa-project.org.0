Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E512D0D8
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2019 15:37:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7351714;
	Mon, 30 Dec 2019 15:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7351714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577716674;
	bh=YQrGuKkYsE/aVLJk/zu9N7I9ar+TBqTroC7Y6wgWiUs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MBQAlpTGzSCxtrQ830QAPRNzu9DuWnbvTF4Zc9Cjpl1UCa9GAyesMADDoNlYdTbPE
	 sqN6vlANI7FYP+N9gMOPy3ommF6kjea3doRpxW28mD552bO9mF8+/Nc08Tz/XNb6Bf
	 ewxZGF6xm2KaAgBSBSqU/i0WOIn3gocdqx7Dqr+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9203EF80258;
	Mon, 30 Dec 2019 15:35:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35D10F8015C; Mon, 30 Dec 2019 15:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62773F80126
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 15:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62773F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O23cuBOG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBUESoK6030698; Mon, 30 Dec 2019 08:35:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=wBChptEB5/IFN2Ccjz7xkcQ0R6AEU8gcWkqTBKpuSI8=;
 b=O23cuBOGOwvopFBMW64zPOard6zGGcjrEEmJVunDwSxWqQE/2jLJswPDoYVDzYQlHrGL
 B5+NfJ1im88WM3iPy/5bZm9i3v5xL+Q/8l/UrTGtXtPv87g1IUnIlTWtTo0GQrhn4sFT
 XSe0ncIA0BSNSJbL/bJBsxQ+aW/7VmiJdcJej/GESJesA/dIjAwMNbdbVL4zVLcAMiaN
 gOumnK4C8602tvTUlqGt1JT0yHPjhVmxklxBepeuMmfDZAS4Fdd9wTPVPppL1TIy3TNq
 JnnI55vXWU/9DIT4gOFaJrBgTNzhVLq9RfHPKFjeGwJbYS7JrhyC2/F5yTTB6GtpwsxE sA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 2x65b7adt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 Dec 2019 08:35:19 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 30 Dec
 2019 14:35:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 30 Dec 2019 14:35:17 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D725C2A1;
 Mon, 30 Dec 2019 14:35:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Mon, 30 Dec 2019 14:35:16 +0000
Message-ID: <20191230143517.21005-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912300133
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: madera: Enable clocks for input pins
	when used as a direct clock
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When one of the MCLK pins is used to supply an internal clock directly
enable the source clock for that pin.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs47l15.c |  8 ++++---
 sound/soc/codecs/cs47l35.c |  6 +++--
 sound/soc/codecs/cs47l85.c | 11 +++++----
 sound/soc/codecs/cs47l90.c | 11 +++++----
 sound/soc/codecs/cs47l92.c | 58 ++++++++++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/madera.c  | 53 ++++++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/madera.h  |  2 ++
 7 files changed, 129 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index ece1276f38eb9..513e2875e4c6e 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -438,11 +438,13 @@ static const struct snd_kcontrol_new cs47l15_aec_loopback_mux[] = {
 static const struct snd_soc_dapm_widget cs47l15_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD1", 20, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index d396a8545d518..ba7aa6b31205c 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -521,11 +521,13 @@ static const struct snd_kcontrol_new cs47l35_aec_loopback_mux[] = {
 static const struct snd_soc_dapm_widget cs47l35_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
-		    0, NULL, 0),
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD2", 0, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD1", 20, 0),
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 32fe7ffb75268..f85581a97bdc3 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -790,15 +790,18 @@ static const struct snd_kcontrol_new cs47l85_output_anc_src[] = {
 static const struct snd_soc_dapm_widget cs47l85_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("ASYNCCLK", MADERA_ASYNC_CLOCK_1,
-		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, NULL, 0),
+		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("ASYNCOPCLK", MADERA_OUTPUT_ASYNC_CLOCK,
 		    MADERA_OPCLK_ASYNC_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD2", 0, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD3", 0, 0),
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 67cac60a859dd..c3b6f4d41005b 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -744,15 +744,18 @@ static const struct snd_kcontrol_new cs47l90_output_anc_src[] = {
 static const struct snd_soc_dapm_widget cs47l90_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("ASYNCCLK", MADERA_ASYNC_CLOCK_1,
-		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, NULL, 0),
+		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("ASYNCOPCLK", MADERA_OUTPUT_ASYNC_CLOCK,
 		    MADERA_OPCLK_ASYNC_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD2", 0, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD3", 0, 0),
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index d50f75f3b3e41..663ce2b5605c2 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -163,6 +163,51 @@ static int cs47l92_adsp_power_ev(struct snd_soc_dapm_widget *w,
 	return wm_adsp_early_event(w, kcontrol, event);
 }
 
+static int cs47l92_outclk_ev(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
+	struct madera_priv *priv = &cs47l92->core;
+	struct madera *madera = priv->madera;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(madera->regmap, MADERA_OUTPUT_RATE_1, &val);
+	if (ret) {
+		dev_err(madera->dev, "Failed to read OUTCLK source: %d\n", ret);
+		return ret;
+	}
+
+	val &= MADERA_OUT_CLK_SRC_MASK;
+
+	switch (val) {
+	case MADERA_OUTCLK_MCLK1:
+	case MADERA_OUTCLK_MCLK2:
+	case MADERA_OUTCLK_MCLK3:
+		val -= (MADERA_OUTCLK_MCLK1 - MADERA_MCLK1);
+
+		switch (event) {
+		case SND_SOC_DAPM_PRE_PMU:
+			ret = clk_prepare_enable(madera->mclk[val].clk);
+			if (ret)
+				return ret;
+			break;
+		case SND_SOC_DAPM_POST_PMD:
+			clk_disable_unprepare(madera->mclk[val].clk);
+			break;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	return madera_domain_clk_ev(w, kcontrol, event);
+}
+
 #define CS47L92_NG_SRC(name, base) \
 	SOC_SINGLE(name " NG HPOUT1L Switch",  base,  0, 1, 0), \
 	SOC_SINGLE(name " NG HPOUT1R Switch",  base,  1, 1, 0), \
@@ -615,15 +660,18 @@ static const struct snd_kcontrol_new cs47l92_aec_loopback_mux =
 static const struct snd_soc_dapm_widget cs47l92_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("ASYNCCLK", MADERA_ASYNC_CLOCK_1,
-		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, NULL, 0),
+		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("ASYNCOPCLK", MADERA_OUTPUT_ASYNC_CLOCK,
 		    MADERA_OPCLK_ASYNC_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD1", 20, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD2", 20, 0),
@@ -666,7 +714,7 @@ SND_SOC_DAPM_SUPPLY("ISRC2CLK", SND_SOC_NOPM,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OUTCLK", SND_SOC_NOPM,
 		    MADERA_DOM_GRP_OUT, 0,
-		    madera_domain_clk_ev,
+		    cs47l92_outclk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("SPDCLK", SND_SOC_NOPM,
 		    MADERA_DOM_GRP_SPD, 0,
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 52639811cc525..9b4b4c52b9e4b 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -163,6 +163,48 @@ static const int madera_dsp_bus_error_irqs[MADERA_MAX_ADSP] = {
 	MADERA_IRQ_DSP7_BUS_ERR,
 };
 
+int madera_clk_ev(struct snd_soc_dapm_widget *w,
+		  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
+	struct madera *madera = priv->madera;
+	unsigned int val;
+	int clk_idx;
+	int ret;
+
+	ret = regmap_read(madera->regmap, w->reg, &val);
+	if (ret) {
+		dev_err(madera->dev, "Failed to check clock source: %d\n", ret);
+		return ret;
+	}
+
+	switch ((val & MADERA_SYSCLK_SRC_MASK) >> MADERA_SYSCLK_SRC_SHIFT) {
+	case MADERA_CLK_SRC_MCLK1:
+		clk_idx = MADERA_MCLK1;
+		break;
+	case MADERA_CLK_SRC_MCLK2:
+		clk_idx = MADERA_MCLK2;
+		break;
+	case MADERA_CLK_SRC_MCLK3:
+		clk_idx = MADERA_MCLK3;
+		break;
+	default:
+		return 0;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return clk_prepare_enable(madera->mclk[clk_idx].clk);
+	case SND_SOC_DAPM_POST_PMD:
+		clk_disable_unprepare(madera->mclk[clk_idx].clk);
+		return 0;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL_GPL(madera_clk_ev);
+
 static void madera_spin_sysclk(struct madera_priv *priv)
 {
 	struct madera *madera = priv->madera;
@@ -193,9 +235,16 @@ int madera_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 
-	madera_spin_sysclk(priv);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+	case SND_SOC_DAPM_PRE_PMD:
+		madera_spin_sysclk(priv);
+		break;
+	default:
+		break;
+	}
 
-	return 0;
+	return madera_clk_ev(w, kcontrol, event);
 }
 EXPORT_SYMBOL_GPL(madera_sysclk_ev);
 
diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index 6d8938a3fb647..49a8f68ec43da 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -383,6 +383,8 @@ int madera_eq_coeff_put(struct snd_kcontrol *kcontrol,
 int madera_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol);
 
+int madera_clk_ev(struct snd_soc_dapm_widget *w,
+		  struct snd_kcontrol *kcontrol, int event);
 int madera_sysclk_ev(struct snd_soc_dapm_widget *w,
 		     struct snd_kcontrol *kcontrol, int event);
 int madera_spk_ev(struct snd_soc_dapm_widget *w,
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
