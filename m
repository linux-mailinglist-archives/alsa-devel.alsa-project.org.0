Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9486E4EB
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 17:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC11B76;
	Fri,  1 Mar 2024 17:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC11B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709309034;
	bh=fH/O3nTPLokLlfy0WR4wG8EDpg7fXKPlNuS++rhMJQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ne2bgnTVKHfRdO+maGNtDDkoZqXK3kOhnWSFPIafHPTFyOJbFPIK7w+25wDq7Jq9e
	 9RpVWxm3qmWA308FR5ai44y7CfYTAX89rJUPg6h1/de/sCgBNsj82D3S5Dl7NVeKWX
	 MGcEBCDQ3gJaUAG3No3/JcSStwhFc9a3Tm8hEruw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0981F8061B; Fri,  1 Mar 2024 17:02:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F20F80614;
	Fri,  1 Mar 2024 17:02:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD04F805A1; Fri,  1 Mar 2024 17:02:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C9FEF80087
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 17:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C9FEF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oTQIPW3U
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421Ewl9O003471;
	Fri, 1 Mar 2024 10:02:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=NpUQHGhUFnK3X1g/dFL1BJRaNu6gls0f1yI+Tqohrqk=; b=
	oTQIPW3UMnOgfq8X1LMhMq/z38B9WiN3vMgpvD4To0LUC2ETxW5zQCRCbruXDCOG
	sJZzxYV5t50L9mic24RLHPzL6oi3qJWGuva65YQJLrVsaXSBVNf0BGrcRR3iVkex
	CQWpkN+BDG/z2LqnkvK0aof1uyujEQtk+F9FtKCLATWydQELtB+xdaQlitRDG2Mk
	OLYqjAT+8PCYFKe+HMrBTWO/tXOUPxgGg95rK00fSBx0pnMvhh+ypmpw/eUvmS9g
	nJQlfkOCLZowitNESKTlhXzO/fV+WH0wPXDkKViHAuXpNlaZ331PHdrCtXaYyPEu
	HvRzFdwCUklZ5HnS8F/4Cg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wkh8r02na-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 10:02:17 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 16:02:11 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 1 Mar 2024 16:02:11 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7325682024C;
	Fri,  1 Mar 2024 16:02:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 3/3] ALSA: hda: cs35l41: Overwrite CS35L41 configuration
 for ASUS UM5302LA
Date: Fri, 1 Mar 2024 16:01:54 +0000
Message-ID: <20240301160154.158398-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
References: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lx9aTi-vftyceYthR7wavwNRtjIGZmHn
X-Proofpoint-GUID: lx9aTi-vftyceYthR7wavwNRtjIGZmHn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IJVR3CJ6XXGXOLXT546XYCYLXMQKCP3A
X-Message-ID-Hash: IJVR3CJ6XXGXOLXT546XYCYLXMQKCP3A
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Whilst this laptop contains _DSD inside the BIOS, there is an error in
this configuration. Override the _DSD in the BIOS with the correct
configuration for this laptop.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 38a19752cb6c..72ec872afb8d 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -94,6 +94,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "104317F3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431863", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "104318D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
+	{ "10431A83", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431C9F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CAF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CCF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
@@ -481,6 +482,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "104317F3", generic_dsd_config },
 	{ "CSC3551", "10431863", generic_dsd_config },
 	{ "CSC3551", "104318D3", generic_dsd_config },
+	{ "CSC3551", "10431A83", generic_dsd_config },
 	{ "CSC3551", "10431C9F", generic_dsd_config },
 	{ "CSC3551", "10431CAF", generic_dsd_config },
 	{ "CSC3551", "10431CCF", generic_dsd_config },
-- 
2.34.1

