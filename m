Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7D478AB9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 13:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1801627F3;
	Fri, 17 Dec 2021 12:59:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1801627F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639742421;
	bh=U7hQvHDdeBofF3dRTy6aDABESpHYa3kkAjgoadpEA+E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRQni9lmaPclDy++eJIrGqiIbJm8urB/b9x8plqu0BQ6oLB+AtZBibk/yIgpGyFq1
	 EtGbyFjTY8VvM5fIZctglA+HynO0+XzF6HBhPgElAxV3nikuvTkXA71NdhFQk0fdAb
	 aCUxxwLIvVOvEr8uSgcLHLd+v+pMC+gM2PoU9j4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F552F8051D;
	Fri, 17 Dec 2021 12:57:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E733F804F2; Fri, 17 Dec 2021 12:57:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 643C3F802A0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 12:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 643C3F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Zc8Cfjyr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BH6BOD4024878;
 Fri, 17 Dec 2021 05:57:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=be1YA6C5MtqQT+lNNFlBqI02z6qBHSQQVqkasPJelNY=;
 b=Zc8CfjyrAhgkduejHb26l27Oc5C2J4BhwDtmvbjSUFheNm4Ub60QuV7VjRwHtq5B/Txu
 b+fj66qscnXsF32jBpsgmc56q0DsfJteu8SUWcIuO4xKJj2zYxmp/B0/6OAYUkc5bKN9
 FYjYNFqXV2o2bX1DT2ks+nSNSv8GMZqr0PPjxOYZr3RrPqkuOKsMmAMTd6lk6eapd3Ly
 Lsy9Hx2kMmbqNgaNM4KVA1gRH/VP1CbGk/o+VFaIZ2yLdYAwLGEyFrFoLQehDiyDd0No
 zQ1wYbnu4EOe4IlziObtghUxiAJT0O0nrRPy5ENWZzUihku5WNl2txlIvn55FfafmSI5 +A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cymsc2f3k-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Dec 2021 05:57:26 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 11:57:24 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 11:57:23 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8E18111CB;
 Fri, 17 Dec 2021 11:57:23 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 08/10] ACPI / scan: Create platform device for CLSA0100 and
 CSC3551 ACPI nodes
Date: Fri, 17 Dec 2021 11:57:06 +0000
Message-ID: <20211217115708.882525-9-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JxPEaeZVVeKZ151ZIqhiz5WFZQaDfHpM
X-Proofpoint-ORIG-GUID: JxPEaeZVVeKZ151ZIqhiz5WFZQaDfHpM
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
index b7a6b982226e..8740cfa11f59 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1712,8 +1712,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
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

