Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C71552019
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:14:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92BBE1EEF;
	Mon, 20 Jun 2022 17:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92BBE1EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738061;
	bh=WiYHecA31lANfuQ3YMDGsbDx0FoZHlWR6XeIIsKJHDg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxheS2HSCOwdDAUoC1Skbx2AAGjqKr3dS85AH+vuBiogowQcv0TPndxWygU3kS2+C
	 MaoS9libGXliyK6bai+o4cS7DgMLQ/eGE3QRfOlSpFvYXB55kzfRV0L7bjZltOyaVd
	 Ot16+ogF+aMmY6+N97KptNLFm3Wp7bqiIOg9LKLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 336E2F805E6;
	Mon, 20 Jun 2022 17:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03FADF805C2; Thu, 16 Jun 2022 16:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20358F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20358F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iHp7L1eF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07C8027888;
 Thu, 16 Jun 2022 09:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8Jk9hCbOsuYwm0RYQaJwiZ5tuQRLpnFj2YNVDn9mPS8=;
 b=iHp7L1eFGG3w4R1gJZ7svezdIg2n8c1IoX+LpD9yIl5HyWma98qrDD3wdw1321cTL0tM
 kgji9flINp3lVkyIp5tMh41FYe6FsziM9gDhF7+6XB1RsvhUrU+AAbnnI91EzvS6wQp8
 87jckojpIZseCVI4jHmyq1iTzO37UFHOHoQZofHJd0BXypBQjN1O3Bl09UGK9cTm0LtK
 zNK6qL92/sAR72fjwU4M71iAn3sfC21yNbfV+KDB8VYTlt0nK0P4B3P91w7nhqmlzSnw
 NZ8QZH23awCoA15qHCa0ZhIQ9ca3FrHVna6365VpjylCkElgK90Eh24BcJULcIFdecYs +A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B532E11D3;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 10/96] ASoC: sh: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:03 +0100
Message-ID: <20220616143429.1324494-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pks9M87GbJ1NhtR99gCkFJVek6Qn3se_
X-Proofpoint-ORIG-GUID: pks9M87GbJ1NhtR99gCkFJVek6Qn3se_
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sh/hac.c       |  3 ++-
 sound/soc/sh/rcar/core.c | 11 ++++++-----
 sound/soc/sh/rz-ssi.c    |  9 +++++----
 sound/soc/sh/siu_pcm.c   | 17 +++++++++--------
 sound/soc/sh/ssi.c       |  3 ++-
 5 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sh/hac.c b/sound/soc/sh/hac.c
index 475fc984f8c51..46d145cbaf297 100644
--- a/sound/soc/sh/hac.c
+++ b/sound/soc/sh/hac.c
@@ -307,7 +307,8 @@ static struct snd_soc_dai_driver sh4_hac_dai[] = {
 };
 
 static const struct snd_soc_component_driver sh4_hac_component = {
-	.name		= "sh4-hac",
+	.name			= "sh4-hac",
+	.legacy_dai_naming	= 1,
 };
 
 static int hac_soc_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index a4180dc5a59ba..4973f94a21446 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1813,11 +1813,12 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
  *		snd_soc_component
  */
 static const struct snd_soc_component_driver rsnd_soc_component = {
-	.name		= "rsnd",
-	.probe		= rsnd_debugfs_probe,
-	.hw_params	= rsnd_hw_params,
-	.hw_free	= rsnd_hw_free,
-	.pointer	= rsnd_pointer,
+	.name			= "rsnd",
+	.probe			= rsnd_debugfs_probe,
+	.hw_params		= rsnd_hw_params,
+	.hw_free		= rsnd_hw_free,
+	.pointer		= rsnd_pointer,
+	.legacy_dai_naming	= 1,
 };
 
 static int rsnd_rdai_continuance_probe(struct rsnd_priv *priv,
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index beaf1a8d6da10..0d0594a0e4f6c 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -906,10 +906,11 @@ static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
 };
 
 static const struct snd_soc_component_driver rz_ssi_soc_component = {
-	.name		= "rz-ssi",
-	.open		= rz_ssi_pcm_open,
-	.pointer	= rz_ssi_pcm_pointer,
-	.pcm_construct	= rz_ssi_pcm_new,
+	.name			= "rz-ssi",
+	.open			= rz_ssi_pcm_open,
+	.pointer		= rz_ssi_pcm_pointer,
+	.pcm_construct		= rz_ssi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 static int rz_ssi_probe(struct platform_device *pdev)
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 0a8a3c314a73d..f15ff36e79345 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -540,13 +540,14 @@ static void siu_pcm_free(struct snd_soc_component *component,
 }
 
 const struct snd_soc_component_driver siu_component = {
-	.name		= DRV_NAME,
-	.open		= siu_pcm_open,
-	.close		= siu_pcm_close,
-	.prepare	= siu_pcm_prepare,
-	.trigger	= siu_pcm_trigger,
-	.pointer	= siu_pcm_pointer_dma,
-	.pcm_construct	= siu_pcm_new,
-	.pcm_destruct	= siu_pcm_free,
+	.name			= DRV_NAME,
+	.open			= siu_pcm_open,
+	.close			= siu_pcm_close,
+	.prepare		= siu_pcm_prepare,
+	.trigger		= siu_pcm_trigger,
+	.pointer		= siu_pcm_pointer_dma,
+	.pcm_construct		= siu_pcm_new,
+	.pcm_destruct		= siu_pcm_free,
+	.legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(siu_component);
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index bf7a3c69920a6..96cf523c22734 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -377,7 +377,8 @@ static struct snd_soc_dai_driver sh4_ssi_dai[] = {
 };
 
 static const struct snd_soc_component_driver sh4_ssi_component = {
-	.name		= "sh4-ssi",
+	.name			= "sh4-ssi",
+	.legacy_dai_naming	= 1,
 };
 
 static int sh4_soc_dai_probe(struct platform_device *pdev)
-- 
2.30.2

