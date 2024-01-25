Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37B83BEDF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:32:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691AC741;
	Thu, 25 Jan 2024 11:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691AC741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706178775;
	bh=vSJibILx1FQQKeQdHPnJ863kMO9AQhrPccT6H3AnZP0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dfclfgkNh8gP9YGdGzZWIzWMyPaFhzMDw1t2wriiLtATUvBkA9w5/TYWD/f2OvXAo
	 Ym9sdq7q/MBwwr7jufk2v7ZvLoNo5FvEIjDQb9uRpXL+hNueouddyZWXv39wFw/Icu
	 4PGccpfDiucp0Cl9kv+XESsW/7K2PzaLZQXh+GeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D2DF805FC; Thu, 25 Jan 2024 11:31:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3629AF805FA;
	Thu, 25 Jan 2024 11:31:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D70CF805AA; Thu, 25 Jan 2024 11:31:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80536F802E8
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80536F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MT7fEFNw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P6oFQ7010841;
	Thu, 25 Jan 2024 04:31:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=4jDna+FV0NsPQi6M7P1oE7gYF+t382pNOxgF0rN3KAM=; b=
	MT7fEFNwMzyfq4xwAMny8RuNox/MxQ15BkD02tC4bhXFQYoK4TM4B6Jy/MfyKCbZ
	UuJTIZd9AGaVm3CVmHFLG9Vo90yaLjM3QRf5ZKbJMSVrYX5HHDVhK2TjdSiqgly/
	D55YYRYoqUafWdHN5uq+RhUF8a5hHKX9kyXMPtPujURg0u3TEFhWO/Dsv6DouMsU
	NizZTZtu2vVda3ljxOMPtecbtcCObuQMVCQYBy3BTFoRxBIJDlR9ZzjF6TnWFtsS
	AWfO/J01LzO6OLabYxA7W+0RcH0vT9Zyqytnln3Ms0mHnNwAYS+bKCrrL/1RN5c+
	VdFiae4yQj0rv0rGsVEe6Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:22 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 90AF782024A;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard
 coding
Date: Thu, 25 Jan 2024 10:31:15 +0000
Message-ID: <20240125103117.2622095-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tCXoiafLFG6En8yssmyX7Q14oZ6b4o4a
X-Proofpoint-GUID: tCXoiafLFG6En8yssmyX7Q14oZ6b4o4a
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DLFIPDHSQ7LDEGJDD34OM77ZSRPCOHWR
X-Message-ID-Hash: DLFIPDHSQ7LDEGJDD34OM77ZSRPCOHWR
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLFIPDHSQ7LDEGJDD34OM77ZSRPCOHWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use USEC_PER_MSEC rather than the hard coded value of 1000.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added commit message

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 67ccdc8bab6f6..901b9dbcf5854 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/time.h>
 #include <linux/workqueue.h>
 #include <sound/control.h>
 #include <sound/jack.h>
@@ -647,7 +648,7 @@ static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
 static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
-	int timeout_ms = ((2 * priv->detect_us) / 1000) + 200;
+	int timeout_ms = ((2 * priv->detect_us) / USEC_PER_MSEC) + 200;
 	unsigned int type = 0xff;
 	unsigned long time_left;
 
-- 
2.30.2

