Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C515A690DEE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:06:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3239BE88;
	Thu,  9 Feb 2023 17:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3239BE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675958811;
	bh=830/n0BH3KpEaWt/aAI7e8HInnZhwG+Jw+/rhJ37eXM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZqHbSSD0Ut2XtVC2fp2+BP4dYXsUNPphOFtpJHPsWO7cGSMm0Q6ekVfy6Dueiimyt
	 VyQ3jxp+wuPlpJyKSkZDlH3HeH9zL/Jyc4hLPl/LjvQm0zLTh9rLzgwMtpsWX3nktH
	 IxwG9RCMOqSclGyrP9/97eifG6Jl3dYFr1uUTFDo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E61F8052D;
	Thu,  9 Feb 2023 17:05:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A22F800B8; Thu,  9 Feb 2023 17:05:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7241DF800E4
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7241DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TJQWjlQ/
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319EawII008427;
	Thu, 9 Feb 2023 10:04:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JeV9DULu/bW1gH3V+k/WF22Dywo9MUNw7IWa7cNIS5U=;
 b=TJQWjlQ/jaZmRV2ARvMnZekQz1N2B79jE+fpKQJIn9mZshynHj99/TeOBzNlN25nLAns
 KKUOJ6iPsjhdzyt3b5hvmHu2xw6uK13ssG/E+XbY0oiifSVK0niGNH5teIxBVOO9Qs6T
 c+QWg7zMPWjanLmHdklHn2eYd7rJLIGp8cuhjwXr9DgjudI6/EsMAfN6eatUWti5hpMk
 4ExOA78uxBJlE1j5awdgnQ8SB2P7Zx6uFrr1re4heFeZXIMwH9nbV/sTFzNPoexAUaxH
 bX3nPo+y7zgWnlz1STN6NGLthAS1Mei8oKpBxjgk2ZN0pvzthmbj1zSUj0hSMuWPoO3B /g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nhnn807j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 10:04:15 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 9 Feb
 2023 10:04:13 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Thu, 9 Feb 2023 10:04:13 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 068972A1;
	Thu,  9 Feb 2023 16:04:13 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/3] ALSA: hda/cs35l41: Fix error condition check
Date: Thu, 9 Feb 2023 16:04:01 +0000
Message-ID: <20230209160403.838326-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209160403.838326-1-sbinding@opensource.cirrus.com>
References: <20230209160403.838326-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RBpoePbzX5-qwAAPv-y7lqG0HAd22aEs
X-Proofpoint-ORIG-GUID: RBpoePbzX5-qwAAPv-y7lqG0HAd22aEs
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6SW53ICCUJZ2WMLOGSJUVGUE5PA7ORD4
X-Message-ID-Hash: 6SW53ICCUJZ2WMLOGSJUVGUE5PA7ORD4
X-MailFrom: prvs=74048fb3a3=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SW53ICCUJZ2WMLOGSJUVGUE5PA7ORD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Function hda_cs_dsp_write_ctl() returns 3 possible values:
0 - no change, 1 - value has changed and -1 - error, so value 1
is not an error.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index f7815ee24f83..4dc57454201e 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -316,27 +316,27 @@ static int cs35l41_apply_calibration(struct cs35l41_hda *cs35l41, unsigned int a
 
 	ret = hda_cs_dsp_write_ctl(&cs35l41->cs_dsp, CAL_AMBIENT_DSP_CTL_NAME, CAL_DSP_CTL_TYPE,
 				   CAL_DSP_CTL_ALG, &ambient, 4);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cs35l41->dev, "Cannot Write Control: %s - %d\n", CAL_AMBIENT_DSP_CTL_NAME,
 			ret);
 		return ret;
 	}
 	ret = hda_cs_dsp_write_ctl(&cs35l41->cs_dsp, CAL_R_DSP_CTL_NAME, CAL_DSP_CTL_TYPE,
 				   CAL_DSP_CTL_ALG, &r0, 4);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cs35l41->dev, "Cannot Write Control: %s - %d\n", CAL_R_DSP_CTL_NAME, ret);
 		return ret;
 	}
 	ret = hda_cs_dsp_write_ctl(&cs35l41->cs_dsp, CAL_STATUS_DSP_CTL_NAME, CAL_DSP_CTL_TYPE,
 				   CAL_DSP_CTL_ALG, &status, 4);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cs35l41->dev, "Cannot Write Control: %s - %d\n", CAL_STATUS_DSP_CTL_NAME,
 			ret);
 		return ret;
 	}
 	ret = hda_cs_dsp_write_ctl(&cs35l41->cs_dsp, CAL_CHECKSUM_DSP_CTL_NAME, CAL_DSP_CTL_TYPE,
 				   CAL_DSP_CTL_ALG, &checksum, 4);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cs35l41->dev, "Cannot Write Control: %s - %d\n", CAL_CHECKSUM_DSP_CTL_NAME,
 			ret);
 		return ret;
-- 
2.34.1

