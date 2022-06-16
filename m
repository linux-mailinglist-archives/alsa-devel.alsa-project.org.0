Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B276555208A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456C32032;
	Mon, 20 Jun 2022 17:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456C32032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738605;
	bh=HM8jS997qwvNdkgOR4i3nenuM9fR4XKdzp7YPY908vc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYPQB58mXjIrJMvy0HHG112wkck1IaHFoze2hDFXg9OZMnxx4DnRXg50n9eRl3xSi
	 RqSBOOrQ7rJF7HqOOmv7D2IOTQeZSmdNFMUljbojHL+/9k1jOGLmLg+wvkxhbJyf7Y
	 5kZfeZPezOfc7qzFxR1AMKN4MXkNiTmAQZ0MvBC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02056F80746;
	Mon, 20 Jun 2022 17:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 553B4F8052F; Thu, 16 Jun 2022 16:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910A7F804E0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910A7F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gNhnSgre"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJm015765;
 Thu, 16 Jun 2022 09:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LQthqukNyA3pYgiRvP4CphcDficzMhOY41++Ct87+s4=;
 b=gNhnSgre1rLw5TNX7Stxy5WvoV14CMkk7N0sHfusmI2bOFU/+hgKKq1M030QTIOOFlfS
 5ZJtb+2blbeCGTj1XAwuW7cyI0gjmguEO1LLzUDUlJwWzXaoYWY/9XqXWyYLDs075Umi
 VdzSA0H/+KZC767A94bN5/CvZCSPo/q593xtDw6HAwAmOPdApR06AtL/4bNeCj4Vty+o
 P8QTRMsBA8cBg+v1NsTmLOFSOJOe2wys9x3jgVFkvjOXO6Tl48CQ54iE5QhtQFKvh4Xe
 5L5RCBkuc3hZj17kwGXcgTwia/L0hba36l5e6slFa+adDcEVPmSROoUV8JP6JJwfCDjx ZQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:34 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6789811D4;
 Thu, 16 Jun 2022 14:34:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 56/96] ASoC: rt*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:49 +0100
Message-ID: <20220616143429.1324494-57-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5cX10b7kcU6N5_HAURa3nLkqpjHgIL8A
X-Proofpoint-GUID: 5cX10b7kcU6N5_HAURa3nLkqpjHgIL8A
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
 sound/soc/codecs/rt1011.c  | 1 -
 sound/soc/codecs/rt1015.c  | 1 -
 sound/soc/codecs/rt1015p.c | 1 -
 sound/soc/codecs/rt1016.c  | 1 -
 sound/soc/codecs/rt1019.c  | 1 -
 sound/soc/codecs/rt1305.c  | 1 -
 sound/soc/codecs/rt1308.c  | 1 -
 sound/soc/codecs/rt274.c   | 1 -
 sound/soc/codecs/rt286.c   | 1 -
 sound/soc/codecs/rt298.c   | 1 -
 sound/soc/codecs/rt5514.c  | 1 -
 sound/soc/codecs/rt5616.c  | 1 -
 sound/soc/codecs/rt5631.c  | 1 -
 sound/soc/codecs/rt5640.c  | 2 --
 sound/soc/codecs/rt5645.c  | 1 -
 sound/soc/codecs/rt5651.c  | 1 -
 sound/soc/codecs/rt5659.c  | 1 -
 sound/soc/codecs/rt5660.c  | 1 -
 sound/soc/codecs/rt5663.c  | 1 -
 sound/soc/codecs/rt5665.c  | 1 -
 sound/soc/codecs/rt5668.c  | 1 -
 sound/soc/codecs/rt5670.c  | 1 -
 sound/soc/codecs/rt5677.c  | 1 -
 sound/soc/codecs/rt5682.c  | 1 -
 sound/soc/codecs/rt5682s.c | 1 -
 25 files changed, 26 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 08dbaef84d4e1..c1568216126ef 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2176,7 +2176,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt1011 = {
 	.set_pll = rt1011_set_component_pll,
 	.use_pmdown_time = 1,
 	.endianness = 1,
-	.non_legacy_dai_naming = 1,
 };
 
 static const struct regmap_config rt1011_regmap = {
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 7a06f2654afb0..57d0f1c69e46c 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1071,7 +1071,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt1015 = {
 	.set_pll = rt1015_set_component_pll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt1015_regmap = {
diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 415cfb3b2f0d0..06800dad87981 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -89,7 +89,6 @@ static const struct snd_soc_component_driver rt1015p_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver rt1015p_dai_driver = {
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index e31c4736627f0..37eeec650f035 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -595,7 +595,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt1016 = {
 	.set_pll = rt1016_set_component_pll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt1016_regmap = {
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index f3f15fbe85d0e..b66bfecbb879b 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -522,7 +522,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
 	.num_dapm_widgets	= ARRAY_SIZE(rt1019_dapm_widgets),
 	.dapm_routes		= rt1019_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(rt1019_dapm_routes),
-	.non_legacy_dai_naming	= 1,
 	.endianness		= 1,
 };
 
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 58d97e3c5087d..5b39a440b6dc1 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -946,7 +946,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt1305 = {
 	.set_pll = rt1305_set_component_pll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt1305_regmap = {
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index eec2b17604089..d2a8e9fe3e234 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -765,7 +765,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt1308 = {
 	.set_pll = rt1308_set_component_pll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt1308_regmap = {
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index a5615e94ec7d0..6b208f9eb5035 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1072,7 +1072,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt274 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt274_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt274_regmap = {
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 0534a073ee695..b2b0b2b1e4d06 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1058,7 +1058,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt286 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt286_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt286_regmap = {
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 1a27e5e63289c..266a2cc55b8d6 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1123,7 +1123,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt298 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt298_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt298_regmap = {
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index be8ece4630df5..b9bcf04d4dc93 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1173,7 +1173,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5514 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5514_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5514_i2c_regmap = {
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 37f1bf552eff4..970d6c4a358e0 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1304,7 +1304,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5616 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5616_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5616_regmap = {
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index c941e878471c1..957f6b19beec9 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1666,7 +1666,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5631 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id rt5631_i2c_id[] = {
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 69c80d80ed9d5..56008e4518f3d 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2867,8 +2867,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5640 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5640_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-
 };
 
 static const struct regmap_config rt5640_regmap = {
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 507aba8de3cc9..8635bc6567dce 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3534,7 +3534,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5645 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5645_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5645_regmap = {
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index d11d201b1d03e..df90af906563a 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2161,7 +2161,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5651 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5651_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5651_regmap = {
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 6efa90f46362b..5e21e3c37ab57 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3801,7 +3801,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5659 = {
 	.set_pll		= rt5659_set_component_pll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index d5f9926625d23..341baa29fdb18 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1208,7 +1208,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5660 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5660_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5660_regmap = {
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index e51eed8a79ab7..ca981b374b0c8 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3258,7 +3258,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5663 = {
 	.set_jack		= rt5663_set_jack_detect,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5663_v2_regmap = {
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 4a8d62e1dd2b5..6e66cc218fa8d 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4617,7 +4617,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5665 = {
 	.set_jack		= rt5665_set_jack_detect,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 01566f036ca17..beb0951ff680b 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2362,7 +2362,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5668 = {
 	.set_jack = rt5668_set_jack_detect,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5668_regmap = {
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 8a97f6db04d56..60dbfa2a54f1b 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2852,7 +2852,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5670 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5670_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5670_regmap = {
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 4a8c267d4fbc8..31a2dd0aafb64 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5189,7 +5189,6 @@ static const struct snd_soc_component_driver soc_component_dev_rt5677 = {
 	.num_dapm_routes	= ARRAY_SIZE(rt5677_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config rt5677_regmap_physical = {
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 2b6c6d6b9771e..2df95e792900c 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3064,7 +3064,6 @@ const struct snd_soc_component_driver rt5682_soc_component_dev = {
 	.set_jack = rt5682_set_jack_detect,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_soc_component_dev);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 4d44eddee901c..eb47e7cd485aa 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2893,7 +2893,6 @@ static const struct snd_soc_component_driver rt5682s_soc_component_dev = {
 	.set_jack = rt5682s_set_jack_detect,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int rt5682s_parse_dt(struct rt5682s_priv *rt5682s, struct device *dev)
-- 
2.30.2

