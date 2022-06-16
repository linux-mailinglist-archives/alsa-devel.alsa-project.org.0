Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C7552036
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B751FBB;
	Mon, 20 Jun 2022 17:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B751FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738384;
	bh=Mi9DSwds60AkWLBJiYf/7YV4YrsggOaCsaVsok2qZcQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7nb9DKY0s7uHZOPoWVGzbQMjTvzwI2vGgAxEd9uGdIuFQUl67aZhj4XhIBBmpSz2
	 r7MxO3dTHoyBwDlsSJTnFSLSkFtlA7d2HtriFoDyRVFqSVqrRMupOTNDQDmut5qMnu
	 5dxT/E3LyatNxnSBEwpl56t6zJYsOGynu2Pwp3Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1185F80671;
	Mon, 20 Jun 2022 17:07:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD2F4F801D8; Thu, 16 Jun 2022 16:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E87F80423
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E87F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k/9ab/S2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBe030693;
 Thu, 16 Jun 2022 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KldRAQaWlyO+eIosBDd1bGZgvOmvQGtuzz10esRY5l4=;
 b=k/9ab/S2XbU350x3WZAVH6h3cC08n3Wdy7SKnthddTO+4NQK7o5wFpBUuTQG4u6yqKI8
 OmZ5LxgOP7fNZD5i1IlQ4aqMMqV0tF1GOUC77KqVCXrD38hUQ219BOHLfQf7C4q/FNRt
 VtOXh26JMgoHmxSWZN58TQxw50iixwi1XPCV6ShMEd55iRuaifeciEzRsLujnVp3EBYz
 HSqOQigA3fjw8sU3dNwbsd2dnOfKIC8t0mEUMxA4mzE8Gac/FZHCkt6uBkOLJ947wSgo
 wRxft1LQLiSfvM3yBTa1et0CqJCeLVeAROsh3Mqi3En6eHK7yqIp59ZXbm6O6bTmdZOC tQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A41F611D4;
 Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 46/96] ASoC: ad*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:39 +0100
Message-ID: <20220616143429.1324494-47-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5GsZk63Ebre3qby9lir0QAv1OankcQSo
X-Proofpoint-ORIG-GUID: 5GsZk63Ebre3qby9lir0QAv1OankcQSo
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:45 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/ad1836.c   | 1 -
 sound/soc/codecs/ad193x.c   | 1 -
 sound/soc/codecs/ad1980.c   | 1 -
 sound/soc/codecs/ad73311.c  | 1 -
 sound/soc/codecs/adau1373.c | 1 -
 sound/soc/codecs/adau1701.c | 1 -
 sound/soc/codecs/adau1761.c | 1 -
 sound/soc/codecs/adau1781.c | 1 -
 sound/soc/codecs/adau1977.c | 1 -
 sound/soc/codecs/adau7002.c | 1 -
 sound/soc/codecs/adau7118.c | 1 -
 sound/soc/codecs/adav80x.c  | 1 -
 12 files changed, 12 deletions(-)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 29e1689da67ff..2c64df96b5ce9 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -332,7 +332,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad1836 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct reg_default ad1836_reg_defaults[] = {
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 30b98b4267e13..1d3c4d94b4ae9 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -523,7 +523,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad193x = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 const struct regmap_config ad193x_regmap_config = {
diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index 9fd2023da218f..5e777d7fd5d91 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -302,7 +302,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad1980 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ad1980_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/ad73311.c b/sound/soc/codecs/ad73311.c
index b98bf19f594e0..f6090ac57e937 100644
--- a/sound/soc/codecs/ad73311.c
+++ b/sound/soc/codecs/ad73311.c
@@ -58,7 +58,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad73311 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ad73311_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index a9032b5c8d782..7f832d00ab177 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1470,7 +1470,6 @@ static const struct snd_soc_component_driver adau1373_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(adau1373_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int adau1373_i2c_probe(struct i2c_client *client)
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 98768e5300f09..135a7db7fcf95 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -772,7 +772,6 @@ static const struct snd_soc_component_driver adau1701_component_drv = {
 	.set_sysclk		= adau1701_set_sysclk,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config adau1701_regmap = {
diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 8f887227981f1..3ccc7acac2056 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -930,7 +930,6 @@ static const struct snd_soc_component_driver adau1761_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #define ADAU1761_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
diff --git a/sound/soc/codecs/adau1781.c b/sound/soc/codecs/adau1781.c
index 74dc3344b2590..ff6be24863bfb 100644
--- a/sound/soc/codecs/adau1781.c
+++ b/sound/soc/codecs/adau1781.c
@@ -439,7 +439,6 @@ static const struct snd_soc_component_driver adau1781_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #define ADAU1781_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index 5fcbdf2ec313c..7a9672f94fc6c 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -876,7 +876,6 @@ static const struct snd_soc_component_driver adau1977_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(adau1977_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int adau1977_setup_micbias(struct adau1977 *adau1977)
diff --git a/sound/soc/codecs/adau7002.c b/sound/soc/codecs/adau7002.c
index 0e00de6ce3fb1..401bafabc8eb4 100644
--- a/sound/soc/codecs/adau7002.c
+++ b/sound/soc/codecs/adau7002.c
@@ -91,7 +91,6 @@ static const struct snd_soc_component_driver adau7002_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int adau7002_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 841229dcbca10..bbb0972498876 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -442,7 +442,6 @@ static const struct snd_soc_component_driver adau7118_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(adau7118_widgets),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void adau7118_regulator_disable(void *data)
diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 90f3a5e9e31f4..fcff35f26cecb 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -842,7 +842,6 @@ static const struct snd_soc_component_driver adav80x_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int adav80x_bus_probe(struct device *dev, struct regmap *regmap)
-- 
2.30.2

