Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13883DEF1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:41:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80727F8;
	Fri, 26 Jan 2024 17:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80727F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706287265;
	bh=HJ7kwhHPw8ESJ22WUO9RMBE6xL5q0eTOX/Cpi6rSi10=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B+UQhSjQpyf8PAqTeVzpkEQW8nvaZZ40AYylhIUSkU7RzemYou4Z9t9jBD5+dLrxU
	 oWjvo9NHboNAXyRroWkshzJf+wpuADfEWRbgFJBp5iMM4NZUM5TukPwLyDnYDn6DuJ
	 WqJlBOby0mnc/mO4jQZ3FpHNr+AgKXxF9z4t5aTw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FB27F80571; Fri, 26 Jan 2024 17:40:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78586F80579;
	Fri, 26 Jan 2024 17:40:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3700DF804E7; Fri, 26 Jan 2024 17:40:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C6D3F8022B
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 17:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C6D3F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bH5A6W+v
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QCpkOx002374;
	Fri, 26 Jan 2024 10:40:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=7uq1CqVNlpi3ICWvwksEDM+iaXgEodV7Ok10dAjdLXg=; b=
	bH5A6W+vAv0fJfOp1nAxpFmf407iIhlVUX0ttU3siq221b7y1X83QCtlmzdKNGgU
	42Fial/a+rqSCSBH/8r7Ws536NYaxttZrwr8mZvRdQwm1oaDeuPEIGDr01BK7JaW
	66FnfQc+X1uxwvyN75phfLKEsA+yu1fWhPHFyfZM50pWNXvk6QmGUt9jZCzHLZT+
	9zylPHhniYE29XTtonx3U6+FbqF96cBGh4iq4XB+/Jc1gVlAopircE9wEOEe4SAa
	Lgl5kLNqlCYUhU1rAz9LR5yVIrT7TMZSlGMECEfjAvVsfotWqvXzJeSMfX1I5RGH
	zRU4Evm0qUI58aPLMpjndA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9v1ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 10:40:16 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:40:14 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 26 Jan 2024 16:40:14 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (LONNG2L6RQ3.ad.cirrus.com
 [198.90.238.116])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9AED6820246;
	Fri, 26 Jan 2024 16:40:14 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/4] ALSA: hda: cs35l41: Support additional HP Envy Models
Date: Fri, 26 Jan 2024 16:40:03 +0000
Message-ID: <20240126164005.367021-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126164005.367021-1-sbinding@opensource.cirrus.com>
References: <20240126164005.367021-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MCI5lz2hnqUWlwNFA7tnsAXWYDIeWZO-
X-Proofpoint-ORIG-GUID: MCI5lz2hnqUWlwNFA7tnsAXWYDIeWZO-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KDPKWA2MZLQXESOQGQVS55EO563LJYJJ
X-Message-ID-Hash: KDPKWA2MZLQXESOQGQVS55EO563LJYJJ
X-MailFrom: prvs=8755fd102d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDPKWA2MZLQXESOQGQVS55EO563LJYJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new model entries into configuration table.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 34 +++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 87edf0d2fbb0..6714740b85c8 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -51,19 +51,30 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8A2E", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8A30", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8A31", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A6E", 4, EXTERNAL, { CS35L41_LEFT, CS35L41_LEFT, CS35L41_RIGHT, CS35L41_RIGHT }, 0, -1, -1, 0, 0, 0 },
 	{ "103C8BB3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BB4", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BDF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BE0", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BE1", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BE2", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
-	{ "103C8BE9", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
-	{ "103C8BDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
-	{ "103C8BDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BE3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BE5", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8BE6", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE7", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE8", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE9", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8B3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8C15", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8C16", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8C17", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8C4F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8C50", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -381,19 +392,30 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8A2E", generic_dsd_config },
 	{ "CSC3551", "103C8A30", generic_dsd_config },
 	{ "CSC3551", "103C8A31", generic_dsd_config },
+	{ "CSC3551", "103C8A6E", generic_dsd_config },
 	{ "CSC3551", "103C8BB3", generic_dsd_config },
 	{ "CSC3551", "103C8BB4", generic_dsd_config },
+	{ "CSC3551", "103C8BDD", generic_dsd_config },
+	{ "CSC3551", "103C8BDE", generic_dsd_config },
 	{ "CSC3551", "103C8BDF", generic_dsd_config },
 	{ "CSC3551", "103C8BE0", generic_dsd_config },
 	{ "CSC3551", "103C8BE1", generic_dsd_config },
 	{ "CSC3551", "103C8BE2", generic_dsd_config },
-	{ "CSC3551", "103C8BE9", generic_dsd_config },
-	{ "CSC3551", "103C8BDD", generic_dsd_config },
-	{ "CSC3551", "103C8BDE", generic_dsd_config },
 	{ "CSC3551", "103C8BE3", generic_dsd_config },
 	{ "CSC3551", "103C8BE5", generic_dsd_config },
 	{ "CSC3551", "103C8BE6", generic_dsd_config },
+	{ "CSC3551", "103C8BE7", generic_dsd_config },
+	{ "CSC3551", "103C8BE8", generic_dsd_config },
+	{ "CSC3551", "103C8BE9", generic_dsd_config },
 	{ "CSC3551", "103C8B3A", generic_dsd_config },
+	{ "CSC3551", "103C8C15", generic_dsd_config },
+	{ "CSC3551", "103C8C16", generic_dsd_config },
+	{ "CSC3551", "103C8C17", generic_dsd_config },
+	{ "CSC3551", "103C8C4F", generic_dsd_config },
+	{ "CSC3551", "103C8C50", generic_dsd_config },
+	{ "CSC3551", "103C8C51", generic_dsd_config },
+	{ "CSC3551", "103C8CDD", generic_dsd_config },
+	{ "CSC3551", "103C8CDE", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.34.1

