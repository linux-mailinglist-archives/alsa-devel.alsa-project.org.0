Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E795873BE1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:16:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D6D209;
	Wed,  6 Mar 2024 17:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D6D209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741770;
	bh=NL/0kJLMNB3af/nPrZVGA4zsieNtor+zdkiPluqcrOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JvUNG0SUbWn/9nWjwkhyHlts2ehZG7gx4x0PeQRlMVWiVi6eJPCOU/zZ+kX5hH86m
	 w7Aus6sqRCla7I0lha58xZoqHR384ka/nL+9sZxrGYufufRYK5YZjsOlNDSB+jabMM
	 pmFb8rwlczYyK6eBI9Fqn9QhSNJhts89TlaOv294=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7118DF805F0; Wed,  6 Mar 2024 17:15:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40783F805F7;
	Wed,  6 Mar 2024 17:15:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E07F805B1; Wed,  6 Mar 2024 17:15:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B54A8F8058C
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B54A8F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WRxLoTK3
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4265UZQk010435;
	Wed, 6 Mar 2024 10:15:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=VZNrVFRkfXL9w5uIYi/FRwxU+dWrhc/p57PfZFvalls=; b=
	WRxLoTK3l9ZH4Y7a6CbeC65EN2kWfgDWIcKEW6+y020QvLT7GRYPUFUSme9nDEKH
	nBBs9inOwKpGCm5Sc6CFVq6xX01GJYesK56CGjb4kvQ+t8HHsqpuA7+eRlN2TMeF
	NdjqrSZQK3Sx50M0gBK1/902hf+AhiUXH9xPmHryZe46N6/EQoLu0ATKhu8+HZrt
	rIfzqDESazRjC18IOLhN2B97Pc9bzZ3Zw2UPchcXCzKZ1ww7sn9zAAn6m6wu+rQr
	53OOan5DC7EMuXLy8+zNBtOK67ohdPAd6w56owdnq4nLlWEra15HEni6gSQIXHa3
	tmzMm28SY+VqGCQbOyyffQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wm2d2mwg1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 10:15:08 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Mar 2024
 16:15:08 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Wed, 6 Mar 2024 16:15:08 +0000
Received: from ediswws08.ad.cirrus.com (ediswws08.ad.cirrus.com
 [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EB68082024D;
	Wed,  6 Mar 2024 16:15:07 +0000 (UTC)
From: Stuart Henderson <stuarth@opensource.cirrus.com>
To: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        "Stuart
 Henderson" <stuarth@opensource.cirrus.com>
Subject: [PATCH 4/5] ASoC: wm8962: Fix wm8962_set_fll to use source instead of
 fll_id
Date: Wed, 6 Mar 2024 16:14:38 +0000
Message-ID: <20240306161439.1385643-4-stuarth@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fpMeca3XnbrZ1u6BZ8CozMD4xQPnsanN
X-Proofpoint-GUID: fpMeca3XnbrZ1u6BZ8CozMD4xQPnsanN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LTNQNQDLCP4LUK6R7BYCLMO6WCQJ5EA3
X-Message-ID-Hash: LTNQNQDLCP4LUK6R7BYCLMO6WCQJ5EA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTNQNQDLCP4LUK6R7BYCLMO6WCQJ5EA3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previously wm8962_set_fll was using fll_id to configure the source.
This change is problematic, but it looks like there's limited
users of this driver, and luckily they all seem to be intending to
use WM8962_FLL_MCLK as the source which happens to have the same
value as WM8962_FLL.

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
---
 sound/soc/codecs/wm8962.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 2256cc0a37eb..24bd818c3345 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2890,6 +2890,14 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 	int ret;
 	int fll1 = 0;
 
+	switch (fll_id) {
+	case WM8962_FLL:
+		break;
+	default:
+		dev_err(component->dev, "Unknown FLL ID %d\n", fll_id);
+		return -EINVAL;
+	}
+
 	/* Any change? */
 	if (source == wm8962->fll_src && Fref == wm8962->fll_fref &&
 	    Fout == wm8962->fll_fout)
@@ -2916,13 +2924,13 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 	/* Parameters good, disable so we can reprogram */
 	snd_soc_component_update_bits(component, WM8962_FLL_CONTROL_1, WM8962_FLL_ENA, 0);
 
-	switch (fll_id) {
+	switch (source) {
 	case WM8962_FLL_MCLK:
 	case WM8962_FLL_BCLK:
-		fll1 |= (fll_id - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
+		fll1 |= (source - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
 		break;
 	case WM8962_FLL_OSC:
-		fll1 |= (fll_id - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
+		fll1 |= (source - 1) << WM8962_FLL_REFCLK_SRC_SHIFT;
 		snd_soc_component_update_bits(component, WM8962_PLL2,
 					      WM8962_OSC_ENA, WM8962_OSC_ENA);
 		break;
-- 
2.39.2

