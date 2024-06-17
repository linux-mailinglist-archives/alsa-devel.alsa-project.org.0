Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065E90B07C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D4CDE5;
	Mon, 17 Jun 2024 15:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D4CDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718632599;
	bh=OkXAeXiSMR9q2KgPDAvjGfQHai3NsT8ZxFVGcUPxbHs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Gu4hyybjzhSxBkX+HwHwN7Pne5dlixUz2bwFxCeX3GabA4CVBN7yZbbZU6dKniw/3
	 5W1vG22K2lNVe4ld9WPtBIhLhbdNxufaQaJ6+ky6BD6NXbVjWklvQLEx90ZcDlhztk
	 kUxAvFis9iNQsg34ef2X6IkgnyWuWjAVhJnNySBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21D5EF805B5; Mon, 17 Jun 2024 15:56:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A03F805A9;
	Mon, 17 Jun 2024 15:56:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47AE5F8023A; Mon, 17 Jun 2024 15:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02198F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02198F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qjyMtkAk
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45H5aOHK023213;
	Mon, 17 Jun 2024 08:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Q9ihO4w628bMz136
	f8/Vddts0+N5M5iKJ+D+B8in+1I=; b=qjyMtkAkuZEpFWv+s2lo5BBU7LjJrDBS
	ZKCDuUIePqhmbCHI+MojCru3UxTgJFNUI7pcsKAbm17eZOshWtZmk+a0u3VyxDhO
	6ydHByiRmV3reb/rq20JHKYRfyFZwifOiTSSrKFTmxRBaE89IxnfR8JGeKTDH4UG
	kAgV2OTeG9OwjAzm2kAXsQHkpcDyXoaOOJZ+/7tK5Ki1JfGdf0Vsydp3u2+YHZYm
	+/G7sYeNKKrABIR0IxHWsWujQS6573NcLJxl63ZrvEnHOXtiUsG992vdhbXChKmT
	hGauT7JSvWi3dIcZuCKFef7IvbD9dodXcOKHLCM6R3ZUMC/n2ipc5A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by1rbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 08:53:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 14:53:40 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 14:53:40 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 735C5820248;
	Mon, 17 Jun 2024 13:53:40 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ numbers
Date: Mon, 17 Jun 2024 14:53:38 +0100
Message-ID: <20240617135338.82006-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Rn7sdFrjrK0EIUNROXcVN37vn7ZbU_iw
X-Proofpoint-GUID: Rn7sdFrjrK0EIUNROXcVN37vn7ZbU_iw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KWENZNY65ONRP7ANGNXLQ2BHRV6Y34FS
X-Message-ID-Hash: KWENZNY65ONRP7ANGNXLQ2BHRV6Y34FS
X-MailFrom: prvs=389839efd0=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWENZNY65ONRP7ANGNXLQ2BHRV6Y34FS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

IRQ lookup functions such as those in ACPI can return error values when
an IRQ is not defined. The i2c core driver converts the error codes to a
value of 0 and the SPI bus driver passes them unaltered to client device
drivers.

The cs35l56 driver should only accept positive non-zero values as IRQ
numbers.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Fixes: 8a731fd37f8b ("ASoC: cs35l56: Move utility functions to shared file")
---
 sound/soc/codecs/cs35l56-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 27869e14e9c8..880228f89baf 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -397,7 +397,7 @@ int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
 {
 	int ret;
 
-	if (!irq)
+	if (irq < 1)
 		return 0;
 
 	ret = devm_request_threaded_irq(cs35l56_base->dev, irq, NULL, cs35l56_irq,
-- 
2.34.1

