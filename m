Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2A477148
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 13:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B74D1F1E;
	Thu, 16 Dec 2021 13:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B74D1F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639656250;
	bh=oSWKT6ZNg3uzJGxn/Q1s2RPT7+QG47JNfy9ytgIp544=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+08YXx9/a+6EPz0TQTz6/9kYR7q4Xv0oOWiKsam5LREhqTBhoZ9ZW4emwlZELyru
	 52GKJ2oQ7Qm4KqPd824zoozma0Al7ezdRAUzQBHMe/FePvfJ+jP1adRQxCWr0KJUqO
	 XW3ufyQskOklXWjDzo8JIMEu8A0i0Ax0fIGKGCMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7982EF8027C;
	Thu, 16 Dec 2021 13:02:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B8ADF80116; Thu, 16 Dec 2021 13:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 439CAF80116
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 13:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 439CAF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="kUEwVVjN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BG6WwLq019726;
 Thu, 16 Dec 2021 05:43:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=le5QrY93oJaQcrGed4nRdWn7iLRo6OoqajMw7T+4nho=;
 b=kUEwVVjNxG2iaZBS+e5BvZzB3J9yqqIqkjg/gbNt47N4/fGYGYIUObws9t60100juuve
 ZMLkna3RHWhERHMcrdxAWC9+HkEnnUsQCRqY4UCTXoc+Larioqyi6BYA4FkQB1U2AHtU
 lkzAXvFpbM3fOlPJ5C6xvmxLohfgAPOClQixziWlgO0oBSatzHSbJ+EaeWpDaqAPiao6
 sRqrh3Qn2VoVkEMtiEYOGzy99Doz/WVFEC5QAgOqxtRhqX8aTJUduTNz/kD1vmsEtxLD
 /BAs1ro0ZIWV6yCoE2KpDi9Nv34Zojm1bYtLf6/UG4IQmE0+89dJYRQAUpvSducEpJ8F ZQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cymsc110q-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Dec 2021 05:43:42 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 11:43:39 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 16 Dec 2021 11:43:39 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E3F12B13;
 Thu, 16 Dec 2021 11:43:38 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 08/10] ACPI / scan: Create platform device for CLSA0100 and
 CSC3551 ACPI nodes
Date: Thu, 16 Dec 2021 11:43:30 +0000
Message-ID: <20211216114332.153409-9-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216114332.153409-1-tanureal@opensource.cirrus.com>
References: <20211216114332.153409-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VIoGxwT42pVH29GOsFdQk2F5396ErKdt
X-Proofpoint-ORIG-GUID: VIoGxwT42pVH29GOsFdQk2F5396ErKdt
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

The ACPI device with CLSA0100 or CSC3551 is a sound card
with multiple instances of CS35L41 connectec by I2C to
the main CPU.

We add an ID to the i2c_multi_instantiate_ids list to enumerate
all I2C slaves correctly.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/acpi/scan.c                          |  3 +++
 drivers/platform/x86/i2c-multi-instantiate.c | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 5991dddbc9ce..333ae8914cf5 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1706,8 +1706,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
 		{"BSG1160", },
 		{"BSG2150", },
+		{"CSC3551", },
 		{"INT33FE", },
 		{"INT3515", },
+		/* Non-conforming _HID for Cirrus Logic already released */
+		{"CLSA0100", },
 		{}
 	};
 
diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 4956a1df5b90..a889789b966c 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -147,6 +147,14 @@ static const struct i2c_inst_data int3515_data[]  = {
 	{}
 };
 
+static const struct i2c_inst_data cs35l41_hda[] = {
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{}
+};
+
 /*
  * Note new device-ids must also be added to i2c_multi_instantiate_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -154,7 +162,10 @@ static const struct i2c_inst_data int3515_data[]  = {
 static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
+	{ "CSC3551", (unsigned long)cs35l41_hda },
 	{ "INT3515", (unsigned long)int3515_data },
+	/* Non-conforming _HID for Cirrus Logic already released */
+	{ "CLSA0100", (unsigned long)cs35l41_hda },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
-- 
2.34.1

