Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC64928FE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 15:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 951CB18FC;
	Tue, 18 Jan 2022 15:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 951CB18FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642517833;
	bh=XdEmsyrkQ6TYYClvWfs91eyvLy3IgK9UvUTj1n6RDdM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+Vj9VGiRIOweZza7rRmU/0MxKiB3+luGtIlWqqp+m3UR15xgE/Q8ZktQzeg4IVc9
	 eQtQ1tS/JGWW4AM4oXkIzAdhN6L53AeTw/EVPouhi5kHBjTErpbpAIvejfhHdo81A3
	 h75z7LO5PyZWNgTU8xgn9ccKrggJFTV3DqrPUe/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1214F8053C;
	Tue, 18 Jan 2022 15:54:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A017F80534; Tue, 18 Jan 2022 15:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACCF1F80524
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 15:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACCF1F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="awgKG5Yw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20I6SNEE013849;
 Tue, 18 Jan 2022 08:53:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6+/rANZdRrEfJUZ4alDuEZX8fBBnd5Scc+NJ3tIuJJc=;
 b=awgKG5YwMnl+EnZ4Kcqo0ouhel6wo81CXmHGXha1esHm2ZY6DMzL8YRvblG4HXFkA/JL
 hCN0JgJ7+HFU/QWFSVaNKlkG2+xirMLYY4R5+yFGJ8Nnd4Q3JGIndUW5yavt20Luzr1D
 Kd7mK0qLwDuCMZUfd5laJgdQya4ZNIrdzd4ZUIW7AcTuVamHNimN6kqGLflapBOckO6e
 a4yWc3kyJWIyQOVbIUam+JhfVCGI8udgpEn86h65ynwLO7sfePOM6QmEV1PB16TqrKoB
 aPN0VHw71tQ8iE0iPh/qYmtOntfWR/KWV8WB6MTpq1VwLUzWDqpKng53Or6L5pnroXHi 6g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhs9nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jan 2022 08:53:50 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:53:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 18 Jan 2022 14:53:48 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D4E50B13;
 Tue, 18 Jan 2022 14:53:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 10/10] ACPI / scan: Create platform device for CS35L41
Date: Tue, 18 Jan 2022 14:52:51 +0000
Message-ID: <20220118145251.1548-11-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
References: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kwBsGPyxvH_suD7jNMUkws3PVo4gMDXu
X-Proofpoint-ORIG-GUID: kwBsGPyxvH_suD7jNMUkws3PVo4gMDXu
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
 drivers/acpi/bus-multi-instantiate.c | 14 ++++++++++++++
 drivers/acpi/scan.c                  |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/acpi/bus-multi-instantiate.c b/drivers/acpi/bus-multi-instantiate.c
index 05bc941a38fd..7a394b671f5a 100644
--- a/drivers/acpi/bus-multi-instantiate.c
+++ b/drivers/acpi/bus-multi-instantiate.c
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
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 3a92b7bdb91d..6cab6465558d 100644
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
-- 
2.25.1

