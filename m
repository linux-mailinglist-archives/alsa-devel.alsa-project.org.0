Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E39C6E8FF9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C314DED5;
	Thu, 20 Apr 2023 12:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C314DED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681986110;
	bh=wVn/ZV/gYTPXC0lVtYQCR23MwgtHqeyx4d4XhzS54+8=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=F/KumzN1nsIiDiqzRcZPsPCfRafLGLgCyxmdBR8RHnSAlL/TlcbsltGQEs554hrE6
	 wPWRbi5kURRi3nEqY2h828O0yp8k+0lszCDCAlRYebR8K0Ecv43mX/PyoAOSK5IZzb
	 MbK5RBdewXwI3ufQueLXMZe832+hNzA58McGoWps=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80987F80149;
	Thu, 20 Apr 2023 12:21:00 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l56: Remove duplicate mbox log messages
Date: Thu, 20 Apr 2023 11:20:43 +0100
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHTRE3AACCI3ZZW7TPQS3AZFDR5VBT5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168198605952.26.13645408104113633580@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A47CF80155; Thu, 20 Apr 2023 12:20:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4626DF800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4626DF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=posfeQSJ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K6k6i2003201;
	Thu, 20 Apr 2023 05:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=nJJCPXtIl/C6W952avjlhhnaG4LWw3Zy1vAZkrF7DVE=;
 b=posfeQSJ45pfCwFvSdJO495aeRAHsRvhhONuUrgs56ra9NjF+/SC7KpdF2MDCQCIfZhq
 N5pPTsvthNpeUFJMT1s/SVo9e6wcPIofB2rcDLyMWjLH5ScfQnGdbovx/bIKbZEl34vJ
 IPQvj5RxNneMEjqDo7ppC1WlZvbwArUcpG8W5TAYHvzWHwpO3KtcfU/qk+5QNwIa1hUe
 ph2Sb071UaArcF6/optPj7jIEE9xy8NpAJiut5zYULC+6B33fFhCu2ums9ILDhQRiqPH
 abGdt+nnHQyCTvlPmFOiiSTD0CB7ytrJteKDGbpJ2rfBRl+AdBHfZ+pC/QpyBPja4L6z hA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pysb50sp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 05:20:45 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 20 Apr
 2023 05:20:43 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 20 Apr 2023 05:20:43 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 79A3BB06;
	Thu, 20 Apr 2023 10:20:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l56: Remove duplicate mbox log messages
Date: Thu, 20 Apr 2023 11:20:43 +0100
Message-ID: <20230420102043.1151830-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6pTqnTm8T_0HTfbl5ajo1im30LO2lRZF
X-Proofpoint-GUID: 6pTqnTm8T_0HTfbl5ajo1im30LO2lRZF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FHTRE3AACCI3ZZW7TPQS3AZFDR5VBT5O
X-Message-ID-Hash: FHTRE3AACCI3ZZW7TPQS3AZFDR5VBT5O
X-MailFrom: prvs=9474375794=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHTRE3AACCI3ZZW7TPQS3AZFDR5VBT5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

cs35l56_mbox_send() logs a warning when sending a mbox command fails so
the callers can be simplified.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index c0a857cfb8cb..46762f7f1449 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -859,10 +859,8 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	}
 
 	ret = cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_SHUTDOWN);
-	if (ret) {
-		dev_dbg(cs35l56->dev, "%s: CS35L56_MBOX_CMD_SHUTDOWN ret %d\n", __func__, ret);
+	if (ret)
 		goto err;
-	}
 
 	if (cs35l56->rev < CS35L56_REVID_B0)
 		reg = CS35L56_DSP1_PM_CUR_STATE_A1;
@@ -1033,9 +1031,7 @@ int cs35l56_runtime_suspend(struct device *dev)
 	 * Enable auto-hibernate. If it is woken by some other wake source
 	 * it will automatically return to hibernate.
 	 */
-	ret = cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE);
-	if (ret)
-		dev_warn(cs35l56->dev, "ALLOW_HIBERNATE failed: %d\n", ret);
+	cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE);
 
 	/*
 	 * Must enter cache-only first so there can't be any more register
-- 
2.30.2

