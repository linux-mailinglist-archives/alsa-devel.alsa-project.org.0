Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA788FEC9
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 13:15:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0A92C7B;
	Thu, 28 Mar 2024 13:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0A92C7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711628106;
	bh=qfJIVtEGnV5PBDcNxLtv8PQ04/VnkAd3XqvIE+epqb4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D2+YzccPCinc1Jqmkf2r7PLY+yPHDqPLlf4DYJmUPUN67iAup5RmZZn1ql2IE2Fh7
	 lJ2EYSj11j1wlJJVvLKZCXugGC0KdW5Yo5LSbDrer/52mSmGFDjXUSQwV3TokLYzPq
	 Z/wtZyvaqJpmnBwkXrie25pLFfxZ9iyDYBybq2vQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A016DF805AA; Thu, 28 Mar 2024 13:14:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28787F80579;
	Thu, 28 Mar 2024 13:14:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99BAAF8025F; Thu, 28 Mar 2024 13:14:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B23EF80093
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 13:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B23EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K+2h2g3O
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42S80qwZ031605;
	Thu, 28 Mar 2024 07:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=/
	YcgOhBnjkdBqrLgF/BoqdsdMXoJw5NAe63KAucPw24=; b=K+2h2g3OHbggsdkiS
	JyRxNyxDovd/rAg6P/5KnH2l4p2rEmEpKHJJD0tMys3gL3rkiRtMDCNIFSf8mSXr
	NavMOLZYEDG1dV5W0EtwpGKLm/mVlo3qUTYx9azKkVjm87yLZaTA86SlppgAKd4Q
	Od3R1CdlGDSwsUWKPR6MVpXBxwcPxqtrQys+VIhKb8PI1bJmR3H2TQS0n4pOf0Sp
	qQMEKFEeJkfP6YIM4UsL8yfMWkAJv0CHZyaSI6kLOzm6gQHxQhZzYhXgpPjWFt+X
	opiJym64Lzyg8WgPoODE0xXrUxbUyO3AmP/Nv8WD1rFCRoSxgWzS1QvHSR5EpfaL
	IrqjQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x4k7k2ngu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:14:06 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 28 Mar
 2024 12:14:04 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 28 Mar 2024 12:14:04 +0000
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1D93D820243;
	Thu, 28 Mar 2024 12:14:04 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Add ACPI device match tables
Date: Thu, 28 Mar 2024 12:13:55 +0000
Message-ID: <20240328121355.18972-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BzIDj9hR-Rk9Q3hSWONBHy2LpF0DPg7R
X-Proofpoint-ORIG-GUID: BzIDj9hR-Rk9Q3hSWONBHy2LpF0DPg7R
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WIDISQT4YY3JZD6KBKOAEUCYUP6LF7PX
X-Message-ID-Hash: WIDISQT4YY3JZD6KBKOAEUCYUP6LF7PX
X-MailFrom: prvs=1817381878=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIDISQT4YY3JZD6KBKOAEUCYUP6LF7PX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding the ACPI HIDs to the match table triggers the cs35l56-hda modules
to be loaded on boot so that Serial Multi Instantiate can add the
devices to the bus and begin the driver init sequence.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda_i2c.c | 13 +++++++++++--
 sound/pci/hda/cs35l56_hda_spi.c | 13 +++++++++++--
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index 13beee807308..40f2f97944d5 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -56,10 +56,19 @@ static const struct i2c_device_id cs35l56_hda_i2c_id[] = {
 	{}
 };
 
+static const struct acpi_device_id cs35l56_acpi_hda_match[] = {
+	{ "CSC3554", 0 },
+	{ "CSC3556", 0 },
+	{ "CSC3557", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, cs35l56_acpi_hda_match);
+
 static struct i2c_driver cs35l56_hda_i2c_driver = {
 	.driver = {
-		.name		= "cs35l56-hda",
-		.pm		= &cs35l56_hda_pm_ops,
+		.name		  = "cs35l56-hda",
+		.acpi_match_table = cs35l56_acpi_hda_match,
+		.pm		  = &cs35l56_hda_pm_ops,
 	},
 	.id_table	= cs35l56_hda_i2c_id,
 	.probe		= cs35l56_hda_i2c_probe,
diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index a3b2fa76663d..7f02155fe61e 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -56,10 +56,19 @@ static const struct spi_device_id cs35l56_hda_spi_id[] = {
 	{}
 };
 
+static const struct acpi_device_id cs35l56_acpi_hda_match[] = {
+	{ "CSC3554", 0 },
+	{ "CSC3556", 0 },
+	{ "CSC3557", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, cs35l56_acpi_hda_match);
+
 static struct spi_driver cs35l56_hda_spi_driver = {
 	.driver = {
-		.name		= "cs35l56-hda",
-		.pm		= &cs35l56_hda_pm_ops,
+		.name		  = "cs35l56-hda",
+		.acpi_match_table = cs35l56_acpi_hda_match,
+		.pm		  = &cs35l56_hda_pm_ops,
 	},
 	.id_table	= cs35l56_hda_spi_id,
 	.probe		= cs35l56_hda_spi_probe,
-- 
2.34.1

