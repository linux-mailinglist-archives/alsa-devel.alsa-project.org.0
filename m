Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C77552030
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E7A1F79;
	Mon, 20 Jun 2022 17:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E7A1F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738305;
	bh=IfZZbS8tn1vPA+04iZIF3zoSWmW1AB7/OPTUEdZUhpg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOidKVSHxHMXlJiVim6yItPP1VEtSpH6th2YBPR6S/FXPiNGKA30H3wdWIv6HP1sb
	 fuDR5FhAlbXuNnSAqq0505RRbwVP8ZexfXGdqpOklaNfr7YfchtIOeIvWl8RHTnlC5
	 XH6ZVQxhwKbuUu/ajKVmePP2eMKi7EzMUbQwWUB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BABF1F80634;
	Mon, 20 Jun 2022 17:07:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A36EF8052E; Thu, 16 Jun 2022 16:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8674EF80538
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8674EF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mgSUGDdD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CB027888;
 Thu, 16 Jun 2022 09:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Jgy4HYvWutWIwNsNORzLVRecig1c5kbslPS86+xHyEg=;
 b=mgSUGDdDdpekTdlEAUpg7wE+LP369Rc3nUTdx/i78NvLL0khdeqZUXymwvnMr/ndg+Y2
 7dM5ha1U1u7v6YOuu7TE17NbtXDOPMIWYYoZFYvW+FAG5dmq5ubNNVGNnMY+oslWNoZO
 ZXdJIind7Vu0pQbk+niy0Nx3sWc+t2yG+6UxyZbdw+fJxiClb9PrVs4YN5HiqA5vayRE
 ugGeyCj2wiCFoQ+qcLJj7dURgtkp7Pgtc3K9WiGxRPbeyRWAeIXAT+0ezNobqDQbvHMA
 S55H5hYo32oL2nZoGifMM0BrTe/JgTks27bX1MtYOhVCKBpuYgD8kmmQx6C13BgS3xa8 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2D276468;
 Thu, 16 Jun 2022 14:34:31 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 16/96] ASoC: meson: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:09 +0100
Message-ID: <20220616143429.1324494-17-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UFBxm3IHq5fcn3nVljfzcgJ60t0r2xj7
X-Proofpoint-ORIG-GUID: UFBxm3IHq5fcn3nVljfzcgJ60t0r2xj7
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
 sound/soc/meson/axg-frddr.c    | 3 +++
 sound/soc/meson/axg-pdm.c      | 4 +++-
 sound/soc/meson/axg-spdifin.c  | 1 +
 sound/soc/meson/axg-spdifout.c | 1 +
 sound/soc/meson/axg-toddr.c    | 3 +++
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 37f4bb3469b5c..61f9d417fd608 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -161,6 +161,7 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data axg_frddr_match_data = {
@@ -286,6 +287,7 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data g12a_frddr_match_data = {
@@ -356,6 +358,7 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data sm1_frddr_match_data = {
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index 672e43a9729dc..88ac58272f95b 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -457,7 +457,9 @@ static struct snd_soc_dai_driver axg_pdm_dai_drv = {
 	.remove		= axg_pdm_dai_remove,
 };
 
-static const struct snd_soc_component_driver axg_pdm_component_drv = {};
+static const struct snd_soc_component_driver axg_pdm_component_drv = {
+	.legacy_dai_naming = 1,
+};
 
 static const struct regmap_config axg_pdm_regmap_cfg = {
 	.reg_bits	= 32,
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index 4ba44e0d65d9f..e2cc4c4be7586 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -390,6 +390,7 @@ static const struct snd_kcontrol_new axg_spdifin_controls[] = {
 static const struct snd_soc_component_driver axg_spdifin_component_drv = {
 	.controls		= axg_spdifin_controls,
 	.num_controls		= ARRAY_SIZE(axg_spdifin_controls),
+	.legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config axg_spdifin_regmap_cfg = {
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index 3960d082e1436..e8a12f15f3b4a 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -383,6 +383,7 @@ static const struct snd_soc_component_driver axg_spdifout_component_drv = {
 	.dapm_routes		= axg_spdifout_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(axg_spdifout_dapm_routes),
 	.set_bias_level		= axg_spdifout_set_bias_level,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config axg_spdifout_regmap_cfg = {
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index d6adf7edea41f..e9208e74e9659 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -182,6 +182,7 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data axg_toddr_match_data = {
@@ -242,6 +243,7 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data g12a_toddr_match_data = {
@@ -312,6 +314,7 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data sm1_toddr_match_data = {
-- 
2.30.2

