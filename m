Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D67BBD23
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 18:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B68100;
	Fri,  6 Oct 2023 18:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B68100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696610717;
	bh=yvhNsLnwiyr48VtlTcC6g0J3+g5Eo4mUItGUwTt7yjo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PIDy2QJ50PtsU0Y7m/xHN95sy0PZg7JV4DAhMsEeJZTx1/JKFo7BIm8aatpglqfab
	 7i5xbNhQJ8pqvloN419oRIGRZwaol9SPC2k1TrMSwNO4MwnoYWlF5Cx4WsrZPj+NgP
	 xVqB0qXTB5ZXfTXx/vcAxy7UsiIvbCDpfri7ZptI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8979F80551; Fri,  6 Oct 2023 18:44:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74CC8F80310;
	Fri,  6 Oct 2023 18:44:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4780F8047D; Fri,  6 Oct 2023 18:44:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 351A0F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 18:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 351A0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hN1uLARq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3965fxui025983;
	Fri, 6 Oct 2023 11:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=p
	H+b7cTnbRfSavq8cBv4h/A1y4bvx50yn5YvvvNOCj0=; b=hN1uLARqUxZxNaej5
	5gux3uKBYvy/j2b8lnFGtq4n8vdSjuXAnXV/WZIHiS9XabcXwFE5sRogoiHpeBs0
	UpYYbxzylxn54K2IkLihlN4tQOOjfc6GOf0YeJ/J7ZVi4+hWewm2uzNq9YEBLBFc
	2x9nzxNKOH8n2iHpCTAnJ6qm4VoBKgiB6JcXmCe6txiPllpKKrXQooZGJX6xAK9p
	cKdy9z4WUwinbqPVeOevciZE+9OCz4+hji5A5pDIXlW6yTxNt73Y7DjY/dWlJxbH
	Td/obIFZ7TCI+6BSQv7vwTUseKAZtOUuLRoCdVcHsyOMilaGRkxf3SJynoRxpPWl
	y5LZg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3th2dtc30q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 11:44:10 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 6 Oct
 2023 17:44:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 6 Oct 2023 17:44:08 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0E3B2B2F;
	Fri,  6 Oct 2023 16:44:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Fix illegal use of init_completion()
Date: Fri, 6 Oct 2023 17:44:05 +0100
Message-ID: <20231006164405.253796-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: y9UfC_QQ_r_8KptxzeJwrtZ5C0U7ECQu
X-Proofpoint-GUID: y9UfC_QQ_r_8KptxzeJwrtZ5C0U7ECQu
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UKJPGZFTFDBJJPVJRTQREDLMRVXQESAO
X-Message-ID-Hash: UKJPGZFTFDBJJPVJRTQREDLMRVXQESAO
X-MailFrom: prvs=5643372036=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKJPGZFTFDBJJPVJRTQREDLMRVXQESAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix cs35l56_patch() to call reinit_completion() to reinitialize
the completion object.

It was incorrectly using init_completion().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 232af4e8faa4..8ccdd3f134a5 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -708,3 +708,3 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 
-	init_completion(&cs35l56->init_completion);
+	reinit_completion(&cs35l56->init_completion);
 
-- 
2.30.2

