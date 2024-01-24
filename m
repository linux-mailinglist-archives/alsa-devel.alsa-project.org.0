Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E161F83AEE5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 17:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F9D83E;
	Wed, 24 Jan 2024 17:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F9D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706115472;
	bh=/pWbttwiVFqyzU/ga3b2z9b+79klev0KH/busw3OVWc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aKfj6sXpFAOD/u+6tVIRV2/a1LadTLgGkuV2y7n3/Oep+CBgjI8Mm4TJB0Jt8YnSh
	 /3ZgcwzrEFOul5Zk3Hkeu5YwksKUMRzk57PnQCHwwHS/2NbkLjyoVPPSPlt3X9+rlQ
	 tfjjrgcTvduv+3WaNvR9v7KHOsxRAp5zUfUaiNTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C67F8063E; Wed, 24 Jan 2024 17:56:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD21F80610;
	Wed, 24 Jan 2024 17:56:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BDF1F8025F; Wed, 24 Jan 2024 17:56:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 049C1F802BE
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 17:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 049C1F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZgjyqDES
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O6Pu39003749;
	Wed, 24 Jan 2024 10:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=nlLlsNCSpaOmPb1UHn6JHOCtAJ0NsxCp2Jj9FnLQWWU=; b=
	ZgjyqDESZK8q5cg5lJzyAFGWpTSIMLgsX2/WaGNbholUx76JADOerFkz04pX5LQz
	y20Mbn3/w9lHNXD4k0b3cU+Tl712MPLKFcJk7Z4qiYni0W416J5b7kXI+8r/SBC8
	kva1WB9VEMcjyvknEevB2wuKNlv0q3kq/D7jFw6acC4Qb8HHWvMcO1pgIUY5Kjiy
	vfv97Mo7VqG3UX1Af+IWz+sLoCXVGBxTZyqeLRwBfLYtj1gF+iwapT5CvakNABnO
	X9WWrYuZgP1vtVb6aQEUOevoJgrBVIQzBZtFFgts1Ete9UwCfsGeKzfYZiNvveOf
	5CU1ztVqlzIL6F6BBE7uCQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44r-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 18122820270;
	Wed, 24 Jan 2024 16:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 7/7] ASoC: cs42l43: Use fls to calculate the pre-divider for
 the PLL
Date: Wed, 24 Jan 2024 16:55:58 +0000
Message-ID: <20240124165558.1876407-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 934ndI-eOfSMlnBIa0sWJ-vOVgV6wF3O
X-Proofpoint-GUID: 934ndI-eOfSMlnBIa0sWJ-vOVgV6wF3O
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 443Q4AKYGHMR7U3HSGDBYVJLWZNRJC6W
X-Message-ID-Hash: 443Q4AKYGHMR7U3HSGDBYVJLWZNRJC6W
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/443Q4AKYGHMR7U3HSGDBYVJLWZNRJC6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 05ca20d4fd622..ef154aa76d576 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1336,10 +1336,9 @@ static int cs42l43_enable_pll(struct cs42l43_codec *priv)
 
 	dev_dbg(priv->dev, "Enabling PLL at %uHz\n", freq);
 
-	while (freq > cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq) {
-		div++;
-		freq /= 2;
-	}
+	div = fls(freq) -
+	      fls(cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq);
+	freq /= 1 << div;
 
 	if (div <= CS42L43_PLL_REFCLK_DIV_MASK) {
 		int i;
-- 
2.30.2

