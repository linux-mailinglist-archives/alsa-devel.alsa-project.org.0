Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E44D81B78E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 14:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D230DEF;
	Thu, 21 Dec 2023 14:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D230DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703165206;
	bh=VuHXjd3JyRsbGkvWqGSwFa0Rr407d5XjTB9dLo+Bi3U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rwKeN5sVm+sL0nleYRh8EclRXvVNCSHH+ppWV6mb9EOlSnKkH9pLMSkaU86CT3W6I
	 2eACYuoiW5bGSycbo5lulCGy/OPZMT7lBcJia2X1gfh4gwoTcfQuS00GIGPGI5zEbu
	 kDJITG20Gprp2b8nmtE41hEtP6SqjHBJZX4C9mbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CA94F805ED; Thu, 21 Dec 2023 14:25:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A55F805E7;
	Thu, 21 Dec 2023 14:25:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B367F80587; Thu, 21 Dec 2023 14:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFB41F80153
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 14:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB41F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gzl8cOBN
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BL7oFUv019653;
	Thu, 21 Dec 2023 07:25:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=A01iCX0fWBQ9auFL6nMgSjTOC80nxoUOMAEq6yxbr4E=; b=
	gzl8cOBN75CgdEOieBtcm0u+vsy1z70k+1Cg4rH5ozmRDAw9JF1wTJhCaTeGJEWn
	yPPGCUyR6HFNb+Pk/zNpBKbufPCXjKIrKuhFYnYRFmhZb+quaSI3kyLJooar9pWd
	5/mP7mNruj7MX9K+ilK4Rm7Sd5jgBevBeVkNbOGO+mi8EGt2UXt5eT8nCXF0qOpC
	hBf+4u1jBUjTtNjiXQ5J9w2+IXDx0uyytS1CgRNCyKnB5rDH2MM5kBiXnYPqbO41
	1/JuKJ2OTMHVcSZfWK/a0q79b+8/OkoolJGWje9BWArIWVDWzx9e78TdA46DyVm6
	I3PfS0sE10hcv7Px/BHr6A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a627crn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 07:25:27 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Dec
 2023 13:25:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Thu, 21 Dec 2023 13:25:25 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 141AB15B4;
	Thu, 21 Dec 2023 13:25:25 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 1/3] ALSA: hda: cs35l41: Support additional Dell models
 without _DSD
Date: Thu, 21 Dec 2023 13:25:16 +0000
Message-ID: <20231221132518.3213-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
References: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Il5Aq585USwPV-zbIHE6dPZzs-IgGYu1
X-Proofpoint-ORIG-GUID: Il5Aq585USwPV-zbIHE6dPZzs-IgGYu1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LLKVXLUIQNCNDN3BXU7PSPLDHH46N44N
X-Message-ID-Hash: LLKVXLUIQNCNDN3BXU7PSPLDHH46N44N
X-MailFrom: prvs=7719b567d4=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLKVXLUIQNCNDN3BXU7PSPLDHH46N44N/>
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
 sound/pci/hda/cs35l41_hda_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 194e1179a253..5eab2de0d4bb 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -35,6 +35,10 @@ struct cs35l41_config {
 };
 
 static const struct cs35l41_config cs35l41_config_table[] = {
+	{ "10280B27", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
+	{ "10280B28", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
+	{ "10280BEB", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
+	{ "10280C4D", I2C, 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT }, 0, 1, -1, 1000, 4500, 24 },
 /*
  * Device 103C89C6 does have _DSD, however it is setup to use the wrong boost type.
  * We can override the _DSD to correct the boost type here.
@@ -347,6 +351,10 @@ struct cs35l41_prop_model {
 static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
+	{ "CSC3551", "10280B27", generic_dsd_config },
+	{ "CSC3551", "10280B28", generic_dsd_config },
+	{ "CSC3551", "10280BEB", generic_dsd_config },
+	{ "CSC3551", "10280C4D", generic_dsd_config },
 	{ "CSC3551", "103C89C6", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
-- 
2.34.1

