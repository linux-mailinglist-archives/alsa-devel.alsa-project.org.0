Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B73288BFF9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 11:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649D82353;
	Tue, 26 Mar 2024 11:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649D82353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711450602;
	bh=XSnm+C1nDuZv8ACHR6TW5mpdhHiNy+THkei+tTtuni0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F/PawcJtN25DsRsWtyadTA+6lous01CTsRPWS/DBEaa9LKDpSyqvn59kGKUGxmNla
	 7WsNGnKb/ff5kH089Bhs0F7P05o/qS1o1JwdXs5njFaekocoPd9uFIrvWKMz4z7C3Z
	 hCepI/aE3jrhrwMerv/VMF+nD/UIjZZM8A9EsnAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9437BF8058C; Tue, 26 Mar 2024 11:56:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 996EEF805A1;
	Tue, 26 Mar 2024 11:56:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67BD8F8025F; Tue, 26 Mar 2024 11:54:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A09A3F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 11:54:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A09A3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=B3o5c6gQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42Q6ktLw006401;
	Tue, 26 Mar 2024 05:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=c
	g2ExQSlUl6TK2A9b6Qbr/F6lta6jp4WdUYMfj1xQBE=; b=B3o5c6gQQiVr9kwKH
	inU+XGYIAORQ3dlva+6FnN2DG61EPVHUB+xD8xQpUaH/8RnAkvzHm2ZxXGX0Qeag
	Rh9EBIdy0pCw2lv141xlU4v7wGTpa2P+2TxgR6VQInAc4cz4pdFybnK09zeJmJmQ
	1FojjWP9gYQtJEbhzIrJ9kJGxr9JTYdOvNPfQN5CEOn/YApT5dKYVnEX8XAS3Jtm
	IQ7NIL+p4Mm/CB4uADsRwH3Yg3IifImb+wLT+B1ntKSKFuJGqcHy+SgCrA8uLTkx
	E+1UMIi0jar7oLUBmOBpxq2+MrA/WfCKNdAC8FR/LTnlaoSBuO6wO+ubUnkMNZx2
	f25gw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyd13g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:54:37 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Mar
 2024 10:54:35 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 26 Mar 2024 10:54:35 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id ECB0D820241;
	Tue, 26 Mar 2024 10:54:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Correct extraction of data pointer in
 suspend/resume
Date: Tue, 26 Mar 2024 10:54:34 +0000
Message-ID: <20240326105434.852907-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NEaJDqAYYEktuuKwybFOc8vE10B7Ze_U
X-Proofpoint-GUID: NEaJDqAYYEktuuKwybFOc8vE10B7Ze_U
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LKDH7U2FU27YMS7C6QC4CQQZ5ZU3ZU6U
X-Message-ID-Hash: LKDH7U2FU27YMS7C6QC4CQQZ5ZU3ZU6U
X-MailFrom: prvs=0815d824d0=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKDH7U2FU27YMS7C6QC4CQQZ5ZU3ZU6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current code is pulling the wrong pointer causing it to disable the
wrong IRQ. Correct the code to pull the correct cs42l43 core data
pointer.

Fixes: 64353af49fec ("ASoC: cs42l43: Add system suspend ops to disable IRQ")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 860d5cda67bf..94685449f0f4 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2364,7 +2364,8 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
 
 static int cs42l43_codec_suspend(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	disable_irq(cs42l43->irq);
 
@@ -2373,7 +2374,8 @@ static int cs42l43_codec_suspend(struct device *dev)
 
 static int cs42l43_codec_suspend_noirq(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	enable_irq(cs42l43->irq);
 
@@ -2382,7 +2384,8 @@ static int cs42l43_codec_suspend_noirq(struct device *dev)
 
 static int cs42l43_codec_resume(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	enable_irq(cs42l43->irq);
 
@@ -2391,7 +2394,8 @@ static int cs42l43_codec_resume(struct device *dev)
 
 static int cs42l43_codec_resume_noirq(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	disable_irq(cs42l43->irq);
 
-- 
2.39.2

