Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DB45B523
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6160A179C;
	Wed, 24 Nov 2021 08:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6160A179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738162;
	bh=7Rw1ffYahKkJZDwt3NjmEQk7ocr4eLU6cKtBwpnrErQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxZAOjYGDy+sFjhxZuLZr15ZgSvirhT+83tFaUaL3AO8bEG7pq3T8NdLo7Mqg+69N
	 il9MkXvguJAmPorwhRhFoMlEuLSE35zS0NEmyeISPpPT4gkD0sFEsiTC8roZjQ8IMp
	 bEDZMC5ycgX8s830yLiEy013mMiWITyCpMA64kl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C44F805E0;
	Wed, 24 Nov 2021 08:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8807F80508; Tue, 23 Nov 2021 17:32:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B032F804F2
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B032F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VjpG9+6D"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN7k0BE013868;
 Tue, 23 Nov 2021 10:32:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zTvX3xmW1j7PMsCMC/sWgFDFnNOPnSVkuP7cBcpOjiA=;
 b=VjpG9+6Donsn5jZ0iAdMdWwXGRhpRwqD95zWZpcAJQOefokuqFed94Nd14tNOdNc6dTX
 jJ8KABmsCJAbivc0jo4K0I/lN38GTOBoGyVUYVTWU1541/mbnp+xcuujJP9utOQ/lBh+
 Fdj0tcpI/vMTDP02B7qlrjvySwggPGRm6vdz8VTuFOjbSFZtLs/0182kwkS3WaV/fr9I
 9vKjFRnAZsWX8lKA0Hh5bnWFSeVa+o7rL0v4UXuow0VvGWJGXz2YD5DPmziptHHty0/s
 VPXPcYRlwqyD7OygYn9eo7Y4TSLDdR9bbQgJHrHKQRAykgi71QACynffLxwz1ZEteIMv CA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cg3v7a220-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 10:32:04 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 16:31:59 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 16:31:59 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8F3B92A3;
 Tue, 23 Nov 2021 16:31:58 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <david.rhodes@cirrus.com>, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PATCH 11/11] ACPI / scan: Create platform device for CLSA0100 ACPI
 nodes
Date: Tue, 23 Nov 2021 16:31:49 +0000
Message-ID: <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SYKjTyKFonnmZRNs79UK8MH84V-Bv9wr
X-Proofpoint-ORIG-GUID: SYKjTyKFonnmZRNs79UK8MH84V-Bv9wr
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jack Yu <jack.yu@realtek.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Szu <jeremy.szu@canonical.com>,
 patches@opensource.cirrus.com, Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-acpi@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 linux-kernel@vger.kernel.org
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
index 2c80765670bc..16827a33e93b 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1708,6 +1708,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"BSG2150", },
 		{"INT33FE", },
 		{"INT3515", },
+		{"CLSA0100", },
 		{}
 	};
 
diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 4956a1df5b90..ed25a0adc656 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
 	{}
 };
 
+static const struct i2c_inst_data clsa0100_data[]  = {
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
+	{}
+};
+
 /*
  * Note new device-ids must also be added to i2c_multi_instantiate_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -155,6 +161,7 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
 	{ "INT3515", (unsigned long)int3515_data },
+	{ "CLSA0100", (unsigned long)clsa0100_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
-- 
2.34.0

