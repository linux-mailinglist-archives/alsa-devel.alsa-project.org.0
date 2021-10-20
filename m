Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F443478B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 11:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353D416CD;
	Wed, 20 Oct 2021 11:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353D416CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634720547;
	bh=BoRayrrsaVGleg1HdSrMpI2Y+1wdA5vQKjwkJoKSaYY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZBBVNX6PFEMF8+rYlOafxCNLKKkDXLTRI9l/tMNMdtR5KPqXhnlju8ZkTe3qKMzN
	 L7Y0ePj6qvhoL4oC7pQWftnWiJ+2mYgF9Trh1CMsaGiO9fZajsje6VJdEQb8OqWTGv
	 C66ocImnVP7XvhC6b8zrfHuUHtFX4MyTKcafrrl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC34F804EC;
	Wed, 20 Oct 2021 11:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B90CFF804E5; Wed, 20 Oct 2021 11:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C061F804B2
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 11:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C061F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DeTaS6OZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19K5NeVY008304; 
 Wed, 20 Oct 2021 04:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BRB15INUzbwgExlLEwJMjzHHvgiQARdV2CIXbCq4f98=;
 b=DeTaS6OZqt5p4ZZuOYrge9xq2+RqPkcItJyQOtJy2K6RaDL3GiK8to09z7qgI/irwybS
 6nokCwLDzkZH/lmMBWUVZVXDQr3NV0clsaFDcEsFHpAGySmJ6AdrufT2HSmCc15zpIqi
 N2IG8mJ7bgKhi9mmeYXyFfT+PB/wFp8RFpDbX6o2yvGrzcsP0R6zuY9Zq9X6g+G/Ya8P
 DoBgG8vs3pMZnPDqOduDOAAVBoQiinoJTJAS/95l8SaQGdtYrsu8DycSLCdBUb8zLmhB
 wiYmQqMzdiLMcNOxGAUdLvcm2YHt6l997689T+z1WZa0K43dQh/gJrohQHi4EyFXvODl Rg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bt9k0gcqs-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 20 Oct 2021 04:00:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 20 Oct
 2021 09:59:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 20 Oct 2021 09:59:47 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.166])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3F41411DA;
 Wed, 20 Oct 2021 08:59:47 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Len Brown <lenb@kernel.org>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [RFC PATCH v2 3/3] ACPI / scan: Create platform device for INT3515
 ACPI nodes
Date: Wed, 20 Oct 2021 09:59:44 +0100
Message-ID: <20211020085944.17577-4-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020085944.17577-1-tanureal@opensource.cirrus.com>
References: <20211020085944.17577-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5MX4qB7iondzzwsyrMViwtIQPcIq5Kpy
X-Proofpoint-ORIG-GUID: 5MX4qB7iondzzwsyrMViwtIQPcIq5Kpy
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com
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

The ACPI device with CLSA0100 is a sound card with multiple
instances of CS35L41.

We add an ID to the I2C multi instantiate list to enumerate
all I2C slaves correctly.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/acpi/scan.c                          | 1 +
 drivers/platform/x86/i2c-multi-instantiate.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 5b54c80b9d32..c1c27a408420 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1703,6 +1703,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"BSG2150", },
 		{"INT33FE", },
 		{"INT3515", },
+		{"CLSA0100", },
 		{}
 	};
 
diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index a50153ecd560..b61f7e30d42a 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -139,6 +139,12 @@ static const struct i2c_inst_data bsg2150_data[]  = {
 	{}
 };
 
+static const struct i2c_inst_data clsa0100_data[]  = {
+	{ "cs35l41", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41", IRQ_RESOURCE_GPIO, 0 },
+	{}
+};
+
 /*
  * Device with _HID INT3515 (TI PD controllers) has some unresolved interrupt
  * issues. The most common problem seen is interrupt flood.
@@ -170,6 +176,7 @@ static const struct i2c_inst_data bsg2150_data[]  = {
 static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
+	{ "CLSA0100", (unsigned long)clsa0100_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
-- 
2.33.1

