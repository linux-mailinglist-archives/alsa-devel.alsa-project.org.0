Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844969B061
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731A9F59;
	Fri, 17 Feb 2023 17:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731A9F59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650518;
	bh=jWXo/OhmaRA96DNh1A80n3xxlghGvIBXz9S6P0kseqo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l9DNaCiCjRSxafuXfce+yTUYfuwdFN0ErDw/Z7Tn6aO9GegA/aeLCae9fhBc9E5lb
	 a7gXqQ5r8cDS4i1u60c7zr0oEV49133a/9a/R0nxZi4j16kAa0yHR8pOzoOHeODeQT
	 g8SzzZQr05ObOVq4/9oYlQ55Y1YT17Qrfh1Jz0qA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 733F1F800E4;
	Fri, 17 Feb 2023 17:14:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6C68F80529; Fri, 17 Feb 2023 17:14:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C180FF800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C180FF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oYNUPI3J
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFgnU4014021;
	Fri, 17 Feb 2023 10:14:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KSx4vfnoG0hKeX0+I8Xc6vC4Q61Hdoi1UYzczfNsx1Y=;
 b=oYNUPI3JkmSKKfpVnMIHi8T4mryop/uePwJerdvurSoCRETK64p29HFMtLcHNTDLoxtP
 8xiYKpSxIp7if4q0eyQXDf5CnlejuhOKTV8vi3emF07jaPSVCU3BQ8xy6mWTSabtSvz0
 QJVwV0RZF6u++10SiK7lhcouHPk55X4k7JqoPZH+b6cJG2+rkzjTPlMtWc47iw2BSUWt
 ivbNySHJ19Ud3ULFB5fLdgxO9hLVObqqDYAoNFJZqng5Tb7EkqpyAroAs9uplSLKHNh9
 HNYqwPQs7q8F6NaBQ3dDs0nZP3TzcqrpzugzROW8v1S7xC5C1xmd98Vbt4eWGpHOQcKb CQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nrm8wm7t6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:12 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 61B9211D3;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 03/10] firmware: cs_dsp: Support DSPs that don't require
 firmware download
Date: Fri, 17 Feb 2023 16:14:03 +0000
Message-ID: <20230217161410.915202-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7jho9u0DN5K2-kFdVLRRTrilrIEX9Xba
X-Proofpoint-ORIG-GUID: 7jho9u0DN5K2-kFdVLRRTrilrIEX9Xba
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Y4ENGWDCXVFAUV2RPDF3WGHRZM5WV3AH
X-Message-ID-Hash: Y4ENGWDCXVFAUV2RPDF3WGHRZM5WV3AH
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4ENGWDCXVFAUV2RPDF3WGHRZM5WV3AH/>
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

