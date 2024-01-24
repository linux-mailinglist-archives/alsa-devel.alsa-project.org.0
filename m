Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C083AD61
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:31:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E4B820;
	Wed, 24 Jan 2024 16:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E4B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706110315;
	bh=KirQojbILq0HAmMclkCbeSctz6QKZqPebV16z8U1rCA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qXiscUOaCRUjasGQhZFPva9QgnfSItV3qZalEMkaJQ2vNT9L+xOq1Xs7L5NLzliJS
	 s0YYLvbBCXAi9Np4IdokfNgtw/AKJ1CwKTvBI2qAcQirwsFrGpejUmtNs1bdr59IXZ
	 UUBakWsCi91Bbd5hlpkY1zGzA7wp+Y51aOdVzJe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7776DF80609; Wed, 24 Jan 2024 16:30:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC139F80603;
	Wed, 24 Jan 2024 16:30:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B453F8055B; Wed, 24 Jan 2024 16:30:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1021EF802BE
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1021EF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CftZTG/A
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O8MvMo030107;
	Wed, 24 Jan 2024 09:30:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=KBAeivo/+2imYGWU1iaqRu5IzYuy5Ccsg353C7Igfzw=; b=
	CftZTG/AoqBl2k33U8oOEErFJ72SPYJ8m6262mB6YLRaRKJrpqiqdpqBLL9mqbWf
	o2UR7mo1VfQ4A46k02AoYi4kao101WcNpX+C+agj3WCkepDjUyhRd4JLLxK8WHvd
	vscmRAgL7gqp1VKio1a4ZU7jQBcyJofH8rEqbUBrBiR9DWvX0KVvkNfT70RlW79j
	7yp5RbFgJsMdGLOz/IhzWbDEatSvRUIWnQSbnj4+Oc/jbwOxBeJu1TUOmJwcFbRO
	4yfyX8MzM+N6ANjlpYbUupblxAzZD317za3dG1nOe9qy/iyIN3+6ayJ6F+6m9ovz
	lbJ3bKITt5PTsWda/jDpaw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9ryqc-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:30:20 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:30:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:30:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AE640820248;
	Wed, 24 Jan 2024 15:30:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v2 3/6] mfd: cs42l43: Use __u8 type rather than u8 for
 firmware interface
Date: Wed, 24 Jan 2024 15:30:13 +0000
Message-ID: <20240124153016.1541616-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OzuVkBAJQGDzU3QMoK397vMH9JOK5CcU
X-Proofpoint-ORIG-GUID: OzuVkBAJQGDzU3QMoK397vMH9JOK5CcU
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: B7HWLVZLMURZHQQDKBIPCSHRHG3ZHLNU
X-Message-ID-Hash: B7HWLVZLMURZHQQDKBIPCSHRHG3ZHLNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7HWLVZLMURZHQQDKBIPCSHRHG3ZHLNU/>
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

No changes since v1.

 drivers/mfd/cs42l43.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 4e2bc5ad244a5..65a331481d975 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -55,8 +55,8 @@
 struct cs42l43_patch_header {
 	__le16 version;
 	__le16 size;
-	u8 reserved;
-	u8 secure;
+	__u8 reserved;
+	__u8 secure;
 	__le16 bss_size;
 	__le32 apply_addr;
 	__le32 checksum;
-- 
2.30.2

