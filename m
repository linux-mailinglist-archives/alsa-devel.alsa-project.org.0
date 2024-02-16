Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39814857A20
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 11:17:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C15BE68;
	Fri, 16 Feb 2024 11:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C15BE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708078670;
	bh=ddSHJRLWu0hndL+TKATWxu/fkQ5Cgt2wZVl4XXmBDmc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p3/WfaK4vHTOkAQTXJFi4TRbcqFPHEjHWBUpAanMDPyMLdAXEKlITPSTan0tNYSwH
	 hlbYdzSEFx4Sl+nIzyYchMjcf04NNgreg5qn2ukvPLfUx/rqEGAV/OHTA6bw1FzUiZ
	 RWe+4UNBS7ngs4QFat1Z0qGnqmvWfT8HE/S4bqOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13DA7F80570; Fri, 16 Feb 2024 11:17:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 057CAF805A0;
	Fri, 16 Feb 2024 11:17:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0452CF8025A; Fri, 16 Feb 2024 11:12:55 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 72911F8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 11:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72911F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cCCU8feS
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G7jo54008245;
	Fri, 16 Feb 2024 04:12:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=y
	Bl3sKU+2L8E6Xmqeuy6j40kaWR7Rwcru9wjT8+Wxww=; b=cCCU8feS682LwGXVU
	IhIxI/WXeHUTfJbWYlekatdSIv9LSdHNPSjZaPs5IouL3/mrjG71XQXkplkPcC+t
	IkgXebFAcKHC3cVmRZh3fUvEcHMV4rAajVR95R7HBJhUAoX1g3kjDba1blEy1Njk
	At5AJffR2hPIdDB7cW6NMPVQAqmNcDDY9xOYP7mfdJ14TJ6a8dVHqwkKtCX+7ood
	4oLP9d78pfl0fBFKgo2bBA80DrvHRYiN9aDNwhruDg0dCzZ0dr7c6Bd7XwDoNuqy
	GAuaNuQFN4NmuUsiIGCXA2Y9NcyFFsL/WWc+0lQQF7V830IHhpiUpXvFTrWhOup2
	3KwVw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e26w8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 04:12:34 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 10:12:32 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 16 Feb 2024 10:12:32 +0000
Received: from lon-bigdaddy.ad.cirrus.com (unknown [198.61.65.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4C923820242;
	Fri, 16 Feb 2024 10:12:32 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        "Vitaly
 Rodionov" <vitalyr@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l42: Remove redundant delays in suspend().
Date: Fri, 16 Feb 2024 10:11:57 +0000
Message-ID: <20240216101157.23176-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SPHtKxswNvwdYnim-ycZigmdJQrTo97J
X-Proofpoint-GUID: SPHtKxswNvwdYnim-ycZigmdJQrTo97J
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: L6XYIO4VZOA4BPNLF3AJHS56JL4CGXTP
X-Message-ID-Hash: L6XYIO4VZOA4BPNLF3AJHS56JL4CGXTP
X-MailFrom: prvs=9776d32253=vitalyr@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6XYIO4VZOA4BPNLF3AJHS56JL4CGXTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch will remove redundant delay and minimise
total suspend() function call time.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs42l42.h    | 5 ++---
 sound/soc/codecs/cs42l42.c | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index 3994e933db19..1bd8eee54f66 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -809,8 +809,7 @@
 #define CS42L42_PLL_LOCK_TIMEOUT_US	1250
 #define CS42L42_HP_ADC_EN_TIME_US	20000
 #define CS42L42_PDN_DONE_POLL_US	1000
-#define CS42L42_PDN_DONE_TIMEOUT_US	200000
-#define CS42L42_PDN_DONE_TIME_MS	100
-#define CS42L42_FILT_DISCHARGE_TIME_MS	46
+#define CS42L42_PDN_DONE_TIMEOUT_US	235000
+#define CS42L42_PDN_DONE_TIME_MS	65
 
 #endif /* __CS42L42_H */
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2d11c5125f73..60d366e53526 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2195,7 +2195,6 @@ int cs42l42_suspend(struct device *dev)
 	/* Discharge FILT+ */
 	regmap_update_bits(cs42l42->regmap, CS42L42_PWR_CTL2,
 			   CS42L42_DISCHARGE_FILT_MASK, CS42L42_DISCHARGE_FILT_MASK);
-	msleep(CS42L42_FILT_DISCHARGE_TIME_MS);
 
 	regcache_cache_only(cs42l42->regmap, true);
 	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
-- 
2.40.1

