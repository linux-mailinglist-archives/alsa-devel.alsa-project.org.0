Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2B494F52
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 14:46:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00152F0D;
	Thu, 20 Jan 2022 14:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00152F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642686359;
	bh=6VviOEBgpwjV38q1rPUsZcyk4gWLTlCoVEqE7VqRiCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jp90qk/+ZQGEnNgUMX15ksVChh6SCzFmIlTk/I2r69r7LsVxcZovnavHraiw01nQK
	 4wtnBIpDU9sc5J9zUA9pjSeSd/LTfQYoYozscH/DRnIZC2F/kLoHEaI520ozDL2xeZ
	 l9PFe6P0WvQDHN0XkGJyAZ5yTJ1lJ/+nS/xEg7mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD24EF80517;
	Thu, 20 Jan 2022 14:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB89DF8050F; Thu, 20 Jan 2022 14:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2236AF80128
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 14:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2236AF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jYuA4PnF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K4mpgo024668;
 Thu, 20 Jan 2022 07:43:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=r1QsPUe+mR02d07aDE3r/XJQmdN13xFv+KvrQ+fIJg8=;
 b=jYuA4PnFrke2slTZ73rHYoJAIRvukwsOVQWHROvZIhlPHk0DTqR/J5SJGpkroZgdqTp9
 gzSl+LN5jeIyGoka8eUAY7ZOetVLkRySp2sCt1+eMCEpqGGPXO9pbADJklZsD7u3p3kt
 RQLawVQHOlWOuhZXlbA4sbNq7XdJH+iXYD0WkGhi97bOUZ8souDlT1gMQtMcKflOmBaC
 y8MejBhEIACTGSZsEQZ6yIjw8bivB3iAgdBtVQMok6gSmCCVImg9YovYRmT+Ft2mtO6i
 WFLJ/58TKekt1rja49s9vFCBEL4PvVVbeftvNB0ELAanHTxhV/RAaFYqrCXkVgULs8qN vw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dpk9mh838-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jan 2022 07:43:44 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 13:43:43 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 20 Jan 2022 13:43:43 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0C51346D;
 Thu, 20 Jan 2022 13:43:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 9/9] ACPI / scan: Create platform device for CS35L41
Date: Thu, 20 Jan 2022 13:43:26 +0000
Message-ID: <20220120134326.5295-10-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qQcJQLtTU6padvhcrx3b833Y5MFG8T5h
X-Proofpoint-GUID: qQcJQLtTU6padvhcrx3b833Y5MFG8T5h
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-spi@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Lucas Tanure <tanureal@opensource.cirrus.com>

The ACPI device with CSC3551 or CLSA0100 are sound cards
with multiple instances of CS35L41 connectec by I2C or SPI
to the main CPU.

We add an ID to the ignore_serial_bus_ids list to enumerate
all I2C or SPI devices correctly.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/acpi/scan.c                          |  3 +++
 drivers/platform/x86/bus-multi-instantiate.c | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 4fd1346d6e1f..2f2210c969c8 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1744,8 +1744,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	 */
 		{"BSG1160", },
 		{"BSG2150", },
+		{"CSC3551", },
 		{"INT33FE", },
 		{"INT3515", },
+	/* Non-conforming _HID for Cirrus Logic already released */
+		{"CLSA0100", },
 	/*
 	 * HIDs of device with an UartSerialBusV2 resource for which userspace
 	 * expects a regular tty cdev to be created (instead of the in kernel
diff --git a/drivers/platform/x86/bus-multi-instantiate.c b/drivers/platform/x86/bus-multi-instantiate.c
index 05bc941a38fd..7a394b671f5a 100644
--- a/drivers/platform/x86/bus-multi-instantiate.c
+++ b/drivers/platform/x86/bus-multi-instantiate.c
@@ -328,6 +328,17 @@ static const struct bmi_node int3515_data = {
 	.bus_type = BMI_I2C,
 };
 
+static const struct bmi_node cs35l41_hda = {
+	.instances = {
+		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+		{}
+	},
+	.bus_type = BMI_AUTO_DETECT,
+};
+
 /*
  * Note new device-ids must also be added to bus_multi_instantiate_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -336,6 +347,9 @@ static const struct acpi_device_id bmi_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)&bsg1160_data },
 	{ "BSG2150", (unsigned long)&bsg2150_data },
 	{ "INT3515", (unsigned long)&int3515_data },
+	{ "CSC3551", (unsigned long)&cs35l41_hda },
+	/* Non-conforming _HID for Cirrus Logic already released */
+	{ "CLSA0100", (unsigned long)&cs35l41_hda },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bmi_acpi_ids);
-- 
2.25.1

