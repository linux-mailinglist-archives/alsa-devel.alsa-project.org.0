Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438C552020
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:16:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8705185C;
	Mon, 20 Jun 2022 17:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8705185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738167;
	bh=ImNTqvb0vOQ/1SpA9cYAtBu4EFocsxlDL+a4y1+TH4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHEJWRSaOwMF6xhoaUKYV1Cv8YUG6p/apFLHbP2SUzYY6jRS7R3bk2d3MW4LVXA3D
	 4DaoNGOr/RR4IBByW6EhbcLa0ohAaWo9zuDtUg46Cqk5YUxr/0dPXziCAzQPe8LmDV
	 hCH+sNYoocd1rE0UsKdrPUPDL5igO8rgmrGzzaX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A37F8060A;
	Mon, 20 Jun 2022 17:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E4CBF80537; Thu, 16 Jun 2022 16:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3111F8053C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3111F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AMQdjrgA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CD027888;
 Thu, 16 Jun 2022 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Tu/WQm2FL2SPUViv8WWXoQaXIl+eGAzL/AaxkzkbEBw=;
 b=AMQdjrgAqwJ/4AsYDmuhjYwlEV3icOOcP06EzuAVCHrAQMPlCpQnC+0THfD5Buzd09e8
 +mTNrKwE32cQbYffRwT87jH28EUE7M+yvE+6+pTIG8LJfwvP3Q32d5vPZagE/EKZ+J6m
 wwgLlgXylhY30+u9mkW5iP7sHRMW6y5IYsl8UeMzG1wFSDWN2koZpIeB+yjuTGds33Vt
 G+VMlTbVXsfjWCAHDB3mPGkg2FFhcXuiZl9/h5UTyx4JNA7pevI04N8x0yjCiUY86KEg
 LqFZkv7T3wk4A0z4yQ1Y4wmwWmU0RCfhtdO9/UqRu1eZ9iGgsKasUz4tuHI4PPcCLphu 0g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CF8A511D4;
 Thu, 16 Jun 2022 14:34:31 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 24/96] ASoC: qcom: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:17 +0100
Message-ID: <20220616143429.1324494-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UENYE4qDSpHk7ZiegPp51XCrz9nX_mX8
X-Proofpoint-ORIG-GUID: UENYE4qDSpHk7ZiegPp51XCrz9nX_mX8
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
 sound/soc/qcom/lpass-cpu.c       |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e6846ad2b5fa4..6f1cd38000016 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -472,6 +472,7 @@ static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
 	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.legacy_dai_naming = 1,
 };
 
 static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b74b67720ef43..5fc8088e63c81 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1205,17 +1205,18 @@ static const struct snd_soc_dapm_widget q6asm_dapm_widgets[] = {
 };
 
 static const struct snd_soc_component_driver q6asm_fe_dai_component = {
-	.name		= DRV_NAME,
-	.open		= q6asm_dai_open,
-	.hw_params	= q6asm_dai_hw_params,
-	.close		= q6asm_dai_close,
-	.prepare	= q6asm_dai_prepare,
-	.trigger	= q6asm_dai_trigger,
-	.pointer	= q6asm_dai_pointer,
-	.pcm_construct	= q6asm_dai_pcm_new,
-	.compress_ops	= &q6asm_dai_compress_ops,
-	.dapm_widgets	= q6asm_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(q6asm_dapm_widgets),
+	.name			= DRV_NAME,
+	.open			= q6asm_dai_open,
+	.hw_params		= q6asm_dai_hw_params,
+	.close			= q6asm_dai_close,
+	.prepare		= q6asm_dai_prepare,
+	.trigger		= q6asm_dai_trigger,
+	.pointer		= q6asm_dai_pointer,
+	.pcm_construct		= q6asm_dai_pcm_new,
+	.compress_ops		= &q6asm_dai_compress_ops,
+	.dapm_widgets		= q6asm_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(q6asm_dapm_widgets),
+	.legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
-- 
2.30.2

