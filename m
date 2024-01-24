Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E983AEEE
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 17:58:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76EA53E7;
	Wed, 24 Jan 2024 17:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76EA53E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706115507;
	bh=Q598g3ES9DwULDvPn3Tu0gZTULbU0YAUntODedh3iwg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6zaXhZvCEJbQDJw3HzZAhBNtMXIP8W/+hPDZr1sEZJlrMDqAxbPnbZbJc5ivGapF
	 mnEK1bSU6C+2IOh/cxstS2RJ1J6QAPIVeV9xN1MMslC+hkrEZ9PLRfbNRzmNMtvyVB
	 bppnnguxMXSR4BXWaUwI604h58OsCm8mViNxA1S8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0ACBF8064C; Wed, 24 Jan 2024 17:56:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C5BF8067F;
	Wed, 24 Jan 2024 17:56:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CD8CF8057A; Wed, 24 Jan 2024 17:56:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EDB77F804E7
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 17:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB77F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LAb8MMgJ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O7L4kw000450;
	Wed, 24 Jan 2024 10:56:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=przA4QwCommAhJfz+ziW6gvkL1al7pQyEzCeV5NJhkc=; b=
	LAb8MMgJ3s/tPLDHUmCmCEB2Ls9H3/Mm9L4bfGp/fn+Zt5vDzgmwT/XrgKZLIRYJ
	gI2VQy+wUmAxFiJthAoT9/WzZOkmHdru+j0MemFpwsCGfD2XRHmBbeB5U9XvsauR
	jxcSGpuotFaReh6CJvFyfaz2UqmGkquH13ITygF6mTi9YCQbK+8ZDienMRUP2DKN
	Ia1+ZufRjF8J5JvpcO+MVrfK20ks4qLqisgbYoLAq4zP5poBPXknQmBdWM0PArN/
	26fQYz3Kae7wGxpGaagNKAK8BJ243C28fm4wLcsAto38KUjml5c1+xz8cE5V9/5i
	hqVV5XtTn66HZidxWAkI+Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0911782024A;
	Wed, 24 Jan 2024 16:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
Date: Wed, 24 Jan 2024 16:55:56 +0000
Message-ID: <20240124165558.1876407-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Sc98E8Olr60-OpbYMNmPfSJRpSv6PJAM
X-Proofpoint-GUID: Sc98E8Olr60-OpbYMNmPfSJRpSv6PJAM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WIWPIYX76CRFSH6A5EMMXHGPORUELK5J
X-Message-ID-Hash: WIWPIYX76CRFSH6A5EMMXHGPORUELK5J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIWPIYX76CRFSH6A5EMMXHGPORUELK5J/>
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
 sound/soc/codecs/cs42l43-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 147c7017fd8b6..4bcf66cff566a 100644
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

