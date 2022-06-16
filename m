Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A8552041
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAFD21FE0;
	Mon, 20 Jun 2022 17:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAFD21FE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738433;
	bh=lCgTJXX8e961d+iN+nyxazMfjJ1/o+BZO7E/UtyCdzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mk9/r6PuJ+7btaAOQSBLICAa4ybMLcIYHm1QPGDB8hQrKtyxZObGx36+WFLHuyasW
	 /+0BFFrBBUDvCuDY8trWmWE8+qcricX49W+Wch8bC02isiKOhHU4vCl4EkugXhXnkw
	 JwpurHWAvwK8h7AyIxVXMx+hGDQD5o8AbeWeshIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8FBF8067D;
	Mon, 20 Jun 2022 17:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C1CF80536; Thu, 16 Jun 2022 16:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21FB3F80551
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FB3F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XTw7XT5/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaL029573;
 Thu, 16 Jun 2022 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lUR098xjWteEbH1+FUtUPo6I+j1bPK4ArKFxC7siG8M=;
 b=XTw7XT5/tRoU84b9ZED4jcQzVAKM2wCORBLfUZzoaYCwk6YYNSTc/N8eNgdo4wuSf9nz
 bqBPAIb31fQtnDqkFfEPYgMzwMyz7O1XIAw1i6O2d+2xmg/eyCeD48Y/9UXyybOOX2z0
 lfxdgyIS411qSriRX8SAKQQ8pL4N2fyX04qvTtg26VWVALzzYzFrzrsdGEEXyl/h9usQ
 iIDVOjATlUDrQZuUOkObGSapaNUjTyWCJspLwLw/X7g3TwsqgJzPlfdzwcaOOGXVV3g2
 8Q7MeCade04EvPuxG6QItkoQQo0Uc4OA5/s8HG6HEJUTBGfBxY+APK0/RqLSa66ZaBzg EQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E639A11D4;
 Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 37/96] ASoC: meson: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:30 +0100
Message-ID: <20220616143429.1324494-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nAqQYQX3tRsdxNBDXewgD7kcqwRQfft5
X-Proofpoint-GUID: nAqQYQX3tRsdxNBDXewgD7kcqwRQfft5
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
 sound/soc/meson/aiu-acodec-ctrl.c | 1 -
 sound/soc/meson/aiu-codec-ctrl.c  | 1 -
 sound/soc/meson/g12a-toacodec.c   | 2 --
 sound/soc/meson/g12a-tohdmitx.c   | 1 -
 sound/soc/meson/t9015.c           | 1 -
 5 files changed, 6 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 3776b073a3dbb..d0f0ada5f4bce 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -192,7 +192,6 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 	.num_dapm_routes	= ARRAY_SIZE(aiu_acodec_ctrl_routes),
 	.of_xlate_dai_name	= aiu_acodec_of_xlate_dai_name,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix		= "acodec",
 #endif
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 286ac4983d40c..84c10956c2414 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -139,7 +139,6 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 	.num_dapm_routes	= ARRAY_SIZE(aiu_hdmi_ctrl_routes),
 	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix		= "hdmi",
 #endif
diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 1dfee1396843c..ddc667956cf5e 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -242,7 +242,6 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.dapm_routes		= g12a_toacodec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
@@ -254,7 +253,6 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.dapm_routes		= g12a_toacodec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 6c99052feafd8..579a04ad4d197 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -226,7 +226,6 @@ static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.dapm_routes		= g12a_tohdmitx_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_tohdmitx_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config g12a_tohdmitx_regmap_cfg = {
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index a9b8c4e77d405..9c6b4dac68932 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -234,7 +234,6 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(t9015_dapm_routes),
 	.suspend_bias_off	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config t9015_regmap_config = {
-- 
2.30.2

