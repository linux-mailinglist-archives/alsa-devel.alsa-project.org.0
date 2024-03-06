Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08FC873BDA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:15:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F6C84A;
	Wed,  6 Mar 2024 17:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F6C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741744;
	bh=N1y4nbPYklUfzjtuyH7rOVJRAsLNFjOy8FvLbQ54CR8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CM/RDpx32Y7iutnVnTPFqu+knTCyK2MAk7w9SQPbFasYHTdHPT2a7UVrUev3DBQ2L
	 p4XHgAdSmFr0QhjQhmdNxNJmm0pXBtsaULQmtSvmi0O6bIAQvLr4F3IWp47DzKR3v+
	 ElBigVRlvv/rmQaEHvhUmMu8QOiQ7tnpIIpzNdLc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04287F805A8; Wed,  6 Mar 2024 17:15:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED828F80093;
	Wed,  6 Mar 2024 17:15:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82B08F80087; Wed,  6 Mar 2024 17:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D4A4F80087
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4A4F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MvRn+r6F
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4268kYKD013643;
	Wed, 6 Mar 2024 10:14:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=v
	EFvDlU/FVBigkdVQeaMuHEzdd7fO0uiPL0OTGnPJUI=; b=MvRn+r6FpAX4yJkdK
	qabSUFdmuX0BCK+QCx3ifQk15WVXIRdIUiM/hmUC4gdVt1wloLNiuSnRW4rQRbr6
	AiDBUf8F1677Xxq3qmDaQHb/JEhoCnPDheNip2dLi9JgomUeUMUoFJpk+85SzTLb
	5gT3hZaI6zf3w8v6mCQPiMmep4XzCiRWrtg69qWl/Q/nqKgWKZMvdnBg3meA4DLI
	F1lsPtrRfRqEx0SVUeXEIRDrJajYo3ivIchfgKYw7P0yqRDDKei7Kdfs8RrfzsvX
	JhrL81Em74UBcSFiuChOB9I3QK7utOFPpj4QAoZU3eVF2Fy9VPxOeNVSg7N8PzsZ
	e0Lig==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn930g9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 10:14:58 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Mar 2024
 16:14:56 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Wed, 6 Mar 2024 16:14:56 +0000
Received: from ediswws08.ad.cirrus.com (ediswws08.ad.cirrus.com
 [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AF89F820243;
	Wed,  6 Mar 2024 16:14:56 +0000 (UTC)
From: Stuart Henderson <stuarth@opensource.cirrus.com>
To: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        "Stuart
 Henderson" <stuarth@opensource.cirrus.com>
Subject: [PATCH 1/5] ASoC: wm8962: Enable oscillator if selecting
 WM8962_FLL_OSC
Date: Wed, 6 Mar 2024 16:14:35 +0000
Message-ID: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: l_UbqcPDYUusJtVyLRYriK-0E3ybHfBm
X-Proofpoint-ORIG-GUID: l_UbqcPDYUusJtVyLRYriK-0E3ybHfBm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GMVD2M3ZEPBXKNMLXO54MSIYACAWPGPE
X-Message-ID-Hash: GMVD2M3ZEPBXKNMLXO54MSIYACAWPGPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMVD2M3ZEPBXKNMLXO54MSIYACAWPGPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
---
 sound/soc/codecs/wm8962.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index fb90ae6a8a34..6d7bb696b135 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2914,8 +2914,12 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 	switch (fll_id) {
 	case WM8962_FLL_MCLK:
 	case WM8962_FLL_BCLK:
+		fll1 |= (fll_id - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
+		break;
 	case WM8962_FLL_OSC:
 		fll1 |= (fll_id - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
+		snd_soc_component_update_bits(component, WM8962_PLL2,
+					      WM8962_OSC_ENA, WM8962_OSC_ENA);
 		break;
 	case WM8962_FLL_INT:
 		snd_soc_component_update_bits(component, WM8962_FLL_CONTROL_1,
-- 
2.39.2

