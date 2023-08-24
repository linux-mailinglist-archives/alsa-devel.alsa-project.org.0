Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21456786CEB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 12:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E5C846;
	Thu, 24 Aug 2023 12:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E5C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692873610;
	bh=0UGk2E3SRkllHFHIiA0vP4H3ajfpwvBYVDAEp1ZR5TI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GYfdwtDbifzhTRsuTy26wEVhqDFZT38hQKvu1s9OGoW3kqyGNgT6lZcKR/mDVeHP7
	 zSsMmzwrY/CSpAQqbXhsPjIZKd6eViqmwf0zTdgNYudLVN8STn0rRrNniLaJBfJMp5
	 CkOqi/ZpmmfZpovsiAF0Y/BT3plWTLUKsAq5ExvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 369B0F8022B; Thu, 24 Aug 2023 12:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A69A1F80074;
	Thu, 24 Aug 2023 12:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86E86F80158; Thu, 24 Aug 2023 12:39:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A7ECF800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 12:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A7ECF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=piY2l1iK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37O6M19d012786;
	Thu, 24 Aug 2023 05:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=L
	HOtCYFnfnuUa5woTMyCEd1kylTAIWtI73sOxSlodvA=; b=piY2l1iKNCq7/SuT2
	KROqiINDhkcPYoHw1pcVP7eW536rqErhA+rkvi9RJvsiHJgoMyR6Qghxaxt4wyQj
	dpGTjjNR80fibbW109mk/TIjwP8ulxUWoo3iFHKq3goOwS4OLPa4Q6O81rQRIta7
	uTQu+Kuz75whcdEx03piXm5+DOjF1c4GeAUjyZ/qT+UNK6Jt4qbAIhmmluGfdZGn
	o/J+/wDucq/I3VuzEfxeNrUhVaDmhp8c2FNBMSJ2/DyMLEKQXMYWBDuPohnAHWo2
	FRBs2IYUKAIgB69R/qMTJx/BD7uichCuLASLKrXAFRZCFBOaqwxt+hQapklOhZ3H
	kdSSw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sp1rbg87q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 05:39:04 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 24 Aug
 2023 11:39:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 24 Aug 2023 11:39:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2A16B11CD;
	Thu, 24 Aug 2023 10:39:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Use new-style PM runtime macros
Date: Thu, 24 Aug 2023 11:39:02 +0100
Message-ID: <20230824103902.1606288-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5YxsUykVgp2KaEJBbiOrP6gis2VuULOK
X-Proofpoint-GUID: 5YxsUykVgp2KaEJBbiOrP6gis2VuULOK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HFQOJIVDEARQUNYAVRLV4XZ2ROWMA5GN
X-Message-ID-Hash: HFQOJIVDEARQUNYAVRLV4XZ2ROWMA5GN
X-MailFrom: prvs=3600b2e858=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFQOJIVDEARQUNYAVRLV4XZ2ROWMA5GN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update to the newer style PM runtime macros, no functional change.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 18178ffa82f21..24e718e511746 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2238,7 +2238,7 @@ static int cs42l43_codec_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused cs42l43_codec_runtime_resume(struct device *dev)
+static int cs42l43_codec_runtime_resume(struct device *dev)
 {
 	struct cs42l43_codec *priv = dev_get_drvdata(dev);
 
@@ -2250,9 +2250,8 @@ static int __maybe_unused cs42l43_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops cs42l43_codec_pm_ops = {
-	SET_RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
-};
+DEFINE_RUNTIME_DEV_PM_OPS(cs42l43_codec_pm_ops, NULL,
+			  cs42l43_codec_runtime_resume, NULL);
 
 static const struct platform_device_id cs42l43_codec_id_table[] = {
 	{ "cs42l43-codec", },
-- 
2.30.2

