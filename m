Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241768FE81F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F03B6A;
	Thu,  6 Jun 2024 15:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F03B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717681526;
	bh=vzv7fzOnv1xAOkXEu4BYsIBQKuKerxMCA5GOWF98fJc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LclFnyt+dPWwPOGDgMz0NJT6y3tC6hzDi8gyOeM/lp9kk+bfzDq2cp56IoytJUE8m
	 UdCNzrVSJqHfTNSbImZein+OKxi26VX7M/U2W1YIYIWyf7vA/lcaJDDi+nxP7iZ+Rn
	 5VtW4krw5hunhoUHJCVDdd/eT/prvzLqBRoqOy3A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA264F805B1; Thu,  6 Jun 2024 15:44:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C33F2F8058C;
	Thu,  6 Jun 2024 15:44:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F048F804FD; Thu,  6 Jun 2024 15:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CC80F804B2
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC80F804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SkuJynWq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4565uen8010646;
	Thu, 6 Jun 2024 08:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=F233C1P+w3bhjzR7UkxNmcjydh72Lcx37IOjcnR3h0I=; b=
	SkuJynWqWhsxDXzzHDm2JN3JZOItxD8SoseiTV+S93kJ/Iu0Rnp/R4VjP1nW9Jyu
	4YHriI13KnmHIXNG0bWk+Uwe5G8H0JV0toxheSy5CpOvb21TvsfXl3Bs0Rz2Aco9
	xCnQV2reTZYhDYu9n3ycEPS+1BXX76AR2Hci2S6X0PzHG7mBj7dCYvXpTdgpvpL5
	8xQvMdbI8WTMSEIFTOEegmFTrCDe5DhCZTVPH25FHGO4WRFD+BY6hkpP7DhEycDv
	HG+BCOs5M4I/0bKQIEvtYBiv06Vs3X3z4OxkedYsrIugdljGfSBxk72iqlSO9TXz
	8IpFPwnk4J6AxoRE7+4ZbQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xw66m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 08:04:05 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 14:03:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 6 Jun 2024 14:03:57 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.44])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F40A6820259;
	Thu,  6 Jun 2024 13:03:56 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/4] ALSA: hda: cs35l41: Support Lenovo Thinkbook 16P Gen 5
Date: Thu, 6 Jun 2024 14:03:48 +0100
Message-ID: <20240606130351.333495-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
References: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BN6R2ycMVBwHtGE8ytKA-ESAw3kbfeL7
X-Proofpoint-ORIG-GUID: BN6R2ycMVBwHtGE8ytKA-ESAw3kbfeL7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JLN2T6XVOJ3C5EZMDIH5YDIPARJISZEM
X-Message-ID-Hash: JLN2T6XVOJ3C5EZMDIH5YDIPARJISZEM
X-MailFrom: prvs=388799c159=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLN2T6XVOJ3C5EZMDIH5YDIPARJISZEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This laptop does not contain _DSD so needs to be supported using the
configuration table.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 6a7a6d486916..046a94250683 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -128,6 +128,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
+	{ "17AA38F9", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
+	{ "17AA38FA", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{}
 };
 
@@ -529,6 +531,8 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "17AA38B5", generic_dsd_config },
 	{ "CSC3551", "17AA38B6", generic_dsd_config },
 	{ "CSC3551", "17AA38B7", generic_dsd_config },
+	{ "CSC3551", "17AA38F9", generic_dsd_config },
+	{ "CSC3551", "17AA38FA", generic_dsd_config },
 	{}
 };
 
-- 
2.34.1

