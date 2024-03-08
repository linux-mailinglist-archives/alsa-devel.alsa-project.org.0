Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F48765D6
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 15:00:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523CE820;
	Fri,  8 Mar 2024 14:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523CE820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709906402;
	bh=HzZKrx49LiRP/+hcIzJU2iSsH5lHFHAgWUTmrOHqJA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q815uE6vRl5CsLDoojKaE1+A0JV8QTs/p8iEmY4IstBX3KskRu+qPwt7i0dOa4PDn
	 wGfEhHgvqhWQLu2r5VL0KwyBu6/Jtv+YDXQcK3OIOw569HzeFPUe/toaRGjJ0N/UIB
	 Oap37zcA4Okr9pPoU/8eRHaxvAL3kghK6nhk0NP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DC49F805B1; Fri,  8 Mar 2024 14:59:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB98F805C7;
	Fri,  8 Mar 2024 14:59:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECDB5F80494; Fri,  8 Mar 2024 14:59:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CEFFF8024E
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 14:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CEFFF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P1bChyYR
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4286juhV000826;
	Fri, 8 Mar 2024 07:59:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=vKtp8NdI4gfP7EyQ9JqAfx+6vw1jGJ8EZbr9OryAfjM=; b=
	P1bChyYR6lkCXXWbDGP1V48AtQirhi7u4OEch7je9K2gLBfsw6hcTU5a+bh3vOGu
	2gyB29BdsDM3SC4989JW9FXkKeMQS5Cl+N0MnlseM1QpLxN2M4cBfzFbPy5UQl5E
	TFTWqeDKbywt28KLMPVBGSP8hjr9TMcXFwS2zHT7QXj/cS051/9lW22waHgm8ygE
	LneX5no1oYVcrUFBjkrhJNiB18d7o2pFxM4pIbQKe/eg9eK+Gg6A2i1So9+xWMQ8
	sRmuFB/71tmlBCyk0NxcAJWm2sew8Fw9KIYJv3Dx0gwDV+WBrCbVzsMac+JU/Xgv
	zExJKPpiMBQV7ApCKj/xgA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn933f32-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 07:59:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Mar 2024
 13:59:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Fri, 8 Mar 2024 13:59:01 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D90D3820257;
	Fri,  8 Mar 2024 13:59:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <hdegoede@redhat.com>,
        <lenb@kernel.org>, <rafael@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <platform-driver-x86@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 3/3] platform/x86: serial-multi-instantiate: Add support for
 CS35L54 and CS35L57
Date: Fri, 8 Mar 2024 13:59:00 +0000
Message-ID: <20240308135900.603192-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240308135900.603192-1-rf@opensource.cirrus.com>
References: <20240308135900.603192-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iNXoHlDy2aTNEf_aR3-MYCRTWOPI73CI
X-Proofpoint-ORIG-GUID: iNXoHlDy2aTNEf_aR3-MYCRTWOPI73CI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: V7V3UURJV65QBEOYJQMM26KMX76WWKP4
X-Message-ID-Hash: V7V3UURJV65QBEOYJQMM26KMX76WWKP4
X-MailFrom: prvs=07979bcd0a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7V3UURJV65QBEOYJQMM26KMX76WWKP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Add the ACPI HIDs and smi_node descriptions for the CS35L54 and CS35L57
Boosted Smart Amplifiers.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
This patch doesn't have any build dependencies on the ASOC/HDA code so
can be take separately.
---
 drivers/acpi/scan.c                           |  2 ++
 .../platform/x86/serial-multi-instantiate.c   | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index e6ed1ba91e5c..091c501bed1f 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1725,7 +1725,9 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"BSG1160", },
 		{"BSG2150", },
 		{"CSC3551", },
+		{"CSC3554", },
 		{"CSC3556", },
+		{"CSC3557", },
 		{"INT33FE", },
 		{"INT3515", },
 		/* Non-conforming _HID for Cirrus Logic already released */
diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 8158e3cf5d6d..97b9c6392230 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -329,6 +329,19 @@ static const struct smi_node cs35l41_hda = {
 	.bus_type = SMI_AUTO_DETECT,
 };
 
+static const struct smi_node cs35l54_hda = {
+	.instances = {
+		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
+		/* a 5th entry is an alias address, not a real device */
+		{ "cs35l54-hda_dummy_dev" },
+		{}
+	},
+	.bus_type = SMI_AUTO_DETECT,
+};
+
 static const struct smi_node cs35l56_hda = {
 	.instances = {
 		{ "cs35l56-hda", IRQ_RESOURCE_AUTO, 0 },
@@ -342,6 +355,19 @@ static const struct smi_node cs35l56_hda = {
 	.bus_type = SMI_AUTO_DETECT,
 };
 
+static const struct smi_node cs35l57_hda = {
+	.instances = {
+		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
+		/* a 5th entry is an alias address, not a real device */
+		{ "cs35l57-hda_dummy_dev" },
+		{}
+	},
+	.bus_type = SMI_AUTO_DETECT,
+};
+
 /*
  * Note new device-ids must also be added to ignore_serial_bus_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -350,7 +376,9 @@ static const struct acpi_device_id smi_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)&bsg1160_data },
 	{ "BSG2150", (unsigned long)&bsg2150_data },
 	{ "CSC3551", (unsigned long)&cs35l41_hda },
+	{ "CSC3554", (unsigned long)&cs35l54_hda },
 	{ "CSC3556", (unsigned long)&cs35l56_hda },
+	{ "CSC3557", (unsigned long)&cs35l57_hda },
 	{ "INT3515", (unsigned long)&int3515_data },
 	/* Non-conforming _HID for Cirrus Logic already released */
 	{ "CLSA0100", (unsigned long)&cs35l41_hda },
-- 
2.30.2

