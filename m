Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBA6B7C6A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 16:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BD81140;
	Mon, 13 Mar 2023 16:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BD81140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678722670;
	bh=9fy/ZKG/u1kGJRzmWFgjJVVRDFLYz+eczG7xJ7zR+p4=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=G3naNQ0E/ulyCUXZpJ6m3/rrWzbJ2atYD7+nj/j3E0T4MWIFRz+/n0XfK03ChRy8w
	 0Ilb7FcR/E9Kes6jlXH+zqaJV8h/rzZxHZ7pdHkrwRs4d1xkb5HBjMSazn4gLn+E5u
	 9xU0/8gYDohm2KvXfbnqgfZN/k/IoqW304OWM6WU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 032CFF80520;
	Mon, 13 Mar 2023 16:50:20 +0100 (CET)
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 3/8] firmware: cs_dsp: Support DSPs that don't require
 firmware download
Date: Mon, 13 Mar 2023 15:49:50 +0000
In-Reply-To: <20230313154955.4268-1-rf@opensource.cirrus.com>
References: <20230313154955.4268-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBDVEWFAL4VWWE5EFYBTUJMYYX73BOVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167872261955.26.17198056302167871204@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F1E7F80527; Mon, 13 Mar 2023 16:50:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54E5CF80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 16:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E5CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=kGObCyT8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32D5bF4B000339;
	Mon, 13 Mar 2023 10:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KSx4vfnoG0hKeX0+I8Xc6vC4Q61Hdoi1UYzczfNsx1Y=;
 b=kGObCyT8HDSo3bqsnFcpTx3x8hkeu6dvBqFi4dqTMpoaoH8waBP4fYgGO7lTRHWvpg7V
 5WMKkdAtNASodLRPckCaDQ5LxGOEKnbPRb0l7IDOYGCYIV4+1Oyy5q7GMHim+4R1+iwc
 h9I8j/xuZPDuuKansrp+NYIHMednQZLvspVB0KC6gkn1mP0pnuuN0hvnauDQn44Htwbw
 35qgNqLSD/e3VK+3STcZl1xTLbg3v7MiHzOg3YCguRckCbLBZFmgKoIHPr7ILQrNnf6m
 HG2K1xYZ4KcpJppSXfpIUGiOZoljvxDWXf5hwBk7a3x5jjFYIHpdTWt0TPtbsGNlgRjD pg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3p8pxvb6hn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 10:50:06 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 13 Mar
 2023 10:50:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Mon, 13 Mar 2023 10:50:05 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.92])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DCC311D4;
	Mon, 13 Mar 2023 15:50:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 3/8] firmware: cs_dsp: Support DSPs that don't require
 firmware download
Date: Mon, 13 Mar 2023 15:49:50 +0000
Message-ID: <20230313154955.4268-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230313154955.4268-1-rf@opensource.cirrus.com>
References: <20230313154955.4268-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fx62dAPgC7-5CX24XJT20l2I_acxx3Xp
X-Proofpoint-GUID: fx62dAPgC7-5CX24XJT20l2I_acxx3Xp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OBDVEWFAL4VWWE5EFYBTUJMYYX73BOVD
X-Message-ID-Hash: OBDVEWFAL4VWWE5EFYBTUJMYYX73BOVD
X-MailFrom: prvs=843636b565=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBDVEWFAL4VWWE5EFYBTUJMYYX73BOVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

When a DSP can self-boot from ROM it is not necessary to download
firmware during the powering up sequence.

A DSP that required firmware download would fail in a previous
configuration step if firmware was not available.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 97b73a254380..513136a924cf 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1301,6 +1301,9 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 	int regions = 0;
 	int ret, offset, type;
 
+	if (!firmware)
+		return 0;
+
 	ret = -EINVAL;
 
 	pos = sizeof(*header) + sizeof(*adsp1_sizes) + sizeof(*footer);
-- 
2.30.2

