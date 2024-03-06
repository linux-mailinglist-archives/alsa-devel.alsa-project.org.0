Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A9873BE4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:16:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044FD3E8;
	Wed,  6 Mar 2024 17:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044FD3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741801;
	bh=RMQmLYTq+/lca1JA6Zn12GvSI8xskgbIRo9zEF+OM+U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f6vDx/QRsVRFY6vFHQHt4Ui+zgXuQozrCybCmHeVNxXFBg8d+9qKElbNkD9+a2+87
	 GSUFZfwADlzMs7b+ka4AITFVKkQrafSFKzCtdF1ovmRKhwPICB6v9cOsM6b9xgf1Q9
	 6sg/sZTIv1GrdWsaWl8Vxdn/euAqCb9CWSdr5Ar8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78609F8062E; Wed,  6 Mar 2024 17:15:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F14BDF80610;
	Wed,  6 Mar 2024 17:15:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86422F805C9; Wed,  6 Mar 2024 17:15:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25E27F801F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E27F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Yxr2izgv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4265UZQj010435;
	Wed, 6 Mar 2024 10:15:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=2EYpIdLCLpu/Qfdxs7ZcC2sdIWeueyqtT7yWJw24UdI=; b=
	Yxr2izgvWnvIXEAv+/AgNeH3mFypNJerj0Ku9cYA+ai/uqu60rCo6udHh1DE5XoR
	aUEASdBg7jsLjAB4PAPFChbUP5pHzq/uHU/klTOuECzeIm77SIy8LMIQKj//R+jL
	xMxBoNNO2jYKLNVszi0Dml6stGNxFqSKApcBKcceHYnOK/DAk4W50Hl7Q+7UR7Ml
	3X1iHT8rqcn3I39No05fDSfUZw24Tq52tVYzL0IW4PI5n5JdNhE/79D4N2UTcpER
	tx66c34JTYcvPitlfbrDE6Hq09scvOCrsQ+UrH2eqeCJx5eH1xZrLJjWOljMNMEc
	F6H5zvESrzgpDW8nIKcnQg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wm2d2mwg1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 10:15:07 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Mar 2024
 16:15:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Wed, 6 Mar 2024 16:15:06 +0000
Received: from ediswws08.ad.cirrus.com (ediswws08.ad.cirrus.com
 [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E33D6820243;
	Wed,  6 Mar 2024 16:15:06 +0000 (UTC)
From: Stuart Henderson <stuarth@opensource.cirrus.com>
To: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        "Stuart
 Henderson" <stuarth@opensource.cirrus.com>
Subject: [PATCH 3/5] ASoC: fsl: Fix up mclk_id for fsl,imx-audio-wm8962
Date: Wed, 6 Mar 2024 16:14:37 +0000
Message-ID: <20240306161439.1385643-3-stuarth@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Zq9cizakeBP__Op7gmoYpMpTME1TrWbh
X-Proofpoint-GUID: Zq9cizakeBP__Op7gmoYpMpTME1TrWbh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: D4H7WYO4XYAPX372GTQR7LH3XUY7LTRP
X-Message-ID-Hash: D4H7WYO4XYAPX372GTQR7LH3XUY7LTRP
X-MailFrom: prvs=079554e8cd=stuarth@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4H7WYO4XYAPX372GTQR7LH3XUY7LTRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wm8962_set_fll is currently incorrect, and largely ignores the source
parameter.  This patch fixes this use of wm8962_set_fll in preparation
for fixing this.  Previously we were using WM8962_SYSCLK_MCLK (0), but
wm8962_set_fll ends up using the fll_id (in this case WM8962_FLL = 1).
Change this to WM8962_FLL_MCLK (1) instead.

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bc07f26ba303..2781fd8d198e 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -656,7 +656,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
 		codec_dai_name = "wm8962";
-		priv->codec_priv.mclk_id = WM8962_SYSCLK_MCLK;
+		priv->codec_priv.mclk_id = WM8962_FLL_MCLK;
 		priv->codec_priv.fll_id = WM8962_SYSCLK_FLL;
 		priv->codec_priv.pll_id = WM8962_FLL;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
-- 
2.39.2

