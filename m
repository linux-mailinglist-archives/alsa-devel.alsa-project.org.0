Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458D86E4E7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 17:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03427E7F;
	Fri,  1 Mar 2024 17:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03427E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709309002;
	bh=+4VNy0TOtFIyKSFFXCMTWjkpBmVv68Q+Pn3KnKddvuk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p8tEmSSr3tc01qqJfoYzWmLP5uZRrp7x94vSjdkmPiFMgYb/XMxFyLxcIahb/+S0r
	 odGI2xi7YFyzA8XE66+ZGIcVZWH4kpcLUQ7UtUW52B8FEIFN5zKHTUIsVcTw+zxg/k
	 Bu6F8n4wbgvEifYgOOPpWcA9jIEV6Xv7A761yo0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07916F805F8; Fri,  1 Mar 2024 17:02:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B595AF805E1;
	Fri,  1 Mar 2024 17:02:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAC78F8024C; Fri,  1 Mar 2024 17:02:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 19A13F8013D
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 17:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19A13F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qnd5SErE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421Ewl9M003471;
	Fri, 1 Mar 2024 10:02:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=XyNIpKTLAge1DZ1X01S3EuqQI4WXcmS7YFnVAjWSw0Q=; b=
	qnd5SErE+4U3+LyRYyCLaRRzPLiKlbLdpyU51jj9KSvk+DexLxMYjsK1t1ITwaSw
	7EQNGMhcy4h9xAMbBWXCuG3IW0W4mGTF+T1YmOeurbIoxA1YCP7OMojOVIzAQ+q8
	z/PYd0zF/dX0hZUudkhjRMboZVL6eQOVyzDyTe9dZ9YGlCr3aQMwnuQHby4uods7
	6TbJwsTepOyJ4v1YGxm3G9aceP1BkSiDF30PrgIk6ejSoCjm2lEtwwbmM7kDCwMW
	ldosw2umfK8bEIkmwqnA6UrcnazFISPHKMjP6A2nZeNXXWWl0mZvmaOpQt01ZaIG
	UsQ97ngb/44hoUcozj8NOA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wkh8r02na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 10:02:14 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 16:02:11 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 1 Mar 2024 16:02:11 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 00DAD82024C;
	Fri,  1 Mar 2024 16:02:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/3] ALSA: hda: cs35l41: Support Lenovo Thinkbook 16P
Date: Fri, 1 Mar 2024 16:01:52 +0000
Message-ID: <20240301160154.158398-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
References: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: U-0f3Mt3eJ7MKblN5vv-rmt5w1FUf25Q
X-Proofpoint-GUID: U-0f3Mt3eJ7MKblN5vv-rmt5w1FUf25Q
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UWEBX6QEN7GRAF3ZYBFIYBKZG6UGE77S
X-Message-ID-Hash: UWEBX6QEN7GRAF3ZYBFIYBKZG6UGE77S
X-MailFrom: prvs=079039dfa1=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWEBX6QEN7GRAF3ZYBFIYBKZG6UGE77S/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds sound support for 2 Lenovo Thinkbook 16P laptops using CS35L41
HDA with External Boost.

SSIDs:
- 17AA38A9
- 17AA38AB

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218437

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index b1a5c0ec2b55..38a19752cb6c 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -108,6 +108,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
+	{ "17AA38AB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
@@ -493,6 +495,8 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
 	{ "CSC3551", "17AA386F", generic_dsd_config },
+	{ "CSC3551", "17AA38A9", generic_dsd_config },
+	{ "CSC3551", "17AA38AB", generic_dsd_config },
 	{ "CSC3551", "17AA38B4", generic_dsd_config },
 	{ "CSC3551", "17AA38B5", generic_dsd_config },
 	{ "CSC3551", "17AA38B6", generic_dsd_config },
-- 
2.34.1

