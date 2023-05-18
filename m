Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A170848E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 17:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B43C3E8;
	Thu, 18 May 2023 17:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B43C3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684422256;
	bh=l3daJNWGegZLobyS+ov/3vUKMlFuFKS35b61iLEl6k0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kt9pGKUS7tAkcTzqTVjpzoOxZyDQPuh4HDebCnpUlFXsFpUBkAiSEkwSJHuwHF8Nj
	 dJhcPh9fnfeWbOU2YsaEQmDq0/5eHk9unR4HO6tjgYIev37t/RLi0QjKXFRcNFXRHt
	 qBkXQ+MHG5AMHDIePcYLiwH9MP6BCdkJYMbcvZgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51E83F80272; Thu, 18 May 2023 17:03:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95473F80272;
	Thu, 18 May 2023 17:03:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09FDCF8053D; Thu, 18 May 2023 17:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15D29F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 17:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15D29F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VTVOmCuo
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34IBl9Gk018534;
	Thu, 18 May 2023 10:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NDpb5Ha4ivNLgiiO+Ax/3NhCQbVV5MgVjXtVoyK70Bw=;
 b=VTVOmCuoH2nRtMoZQXsgWZl4NyutzptR8Po4MDKYqOfAT1qs07vAZ/SLU3xllQ0b0UxG
 wci6CGWk3t6edH4WzMYSsJ6Yk+svcu1ySuAwpsP/fmS3V9L/1GN8aWqP+oqQx53KnRsA
 m4iuBWSSfvzDKldb5wmplMZpu/dXbjHP7m7leAyW+qKhq6/6TP0Q9FVcYX8MxaDP6+yb
 RTlJlEHeDK4FUTaugA5C0vzBtZ4uFaE9aOBAk02th897rXRx7U0oXjRaFjVnrzm8M/Gj
 ePrUYoLMWIel7JDCiQMixEnRiFv8ytaMrZpa/7JBopKY/fNi3fDnHIA3TCMQL7NObu1u EA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qngq1ghun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:02:51 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 18 May
 2023 10:02:50 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 18 May 2023 10:02:50 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C21015A2;
	Thu, 18 May 2023 15:02:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 1/3] ASoC: cs35l56: Move DSP part string generation so that it
 is done only once
Date: Thu, 18 May 2023 16:02:48 +0100
Message-ID: <20230518150250.1121006-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230518150250.1121006-1-rf@opensource.cirrus.com>
References: <20230518150250.1121006-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cPFI_s6E6LErWfHaMMWNtxjjOKU7s3cM
X-Proofpoint-ORIG-GUID: cPFI_s6E6LErWfHaMMWNtxjjOKU7s3cM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FJHIZAMA5BPQCZBB6A6MIT5BBX62TEG2
X-Message-ID-Hash: FJHIZAMA5BPQCZBB6A6MIT5BBX62TEG2
X-MailFrom: prvs=05023014f4=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJHIZAMA5BPQCZBB6A6MIT5BBX62TEG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Each time we go through dsp_work() it does a devm_kasprintf() to
allocate memory to hold the part name string. It's not strictly a memory
leak because devm will free it all if the driver is removed. But we keep
allocating more and more memory to hold the same string.

Move the allocation so that it is performed after the version and
secured state information is gathered and handle allocation errors.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index d1677d76d018..906aa416879b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -837,12 +837,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	if (!cs35l56->init_done)
 		return;
 
-	cs35l56->dsp.part = devm_kasprintf(cs35l56->dev, GFP_KERNEL, "cs35l56%s-%02x",
-					   cs35l56->secured ? "s" : "", cs35l56->rev);
-
-	if (!cs35l56->dsp.part)
-		return;
-
 	pm_runtime_get_sync(cs35l56->dev);
 
 	/*
@@ -1508,6 +1502,12 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	dev_info(cs35l56->dev, "Cirrus Logic CS35L56%s Rev %02X OTP%d\n",
 		 cs35l56->secured ? "s" : "", cs35l56->rev, otpid);
 
+	/* Populate the DSP information with the revision and security state */
+	cs35l56->dsp.part = devm_kasprintf(cs35l56->dev, GFP_KERNEL, "cs35l56%s-%02x",
+					   cs35l56->secured ? "s" : "", cs35l56->rev);
+	if (!cs35l56->dsp.part)
+		return -ENOMEM;
+
 	/* Wake source and *_BLOCKED interrupts default to unmasked, so mask them */
 	regmap_write(cs35l56->regmap, CS35L56_IRQ1_MASK_20, 0xffffffff);
 	regmap_update_bits(cs35l56->regmap, CS35L56_IRQ1_MASK_1,
-- 
2.30.2

