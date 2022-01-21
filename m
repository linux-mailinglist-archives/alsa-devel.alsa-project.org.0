Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8184963EB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 18:27:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 087072B27;
	Fri, 21 Jan 2022 18:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 087072B27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642786042;
	bh=g8JY68aw5kNpF376d0IfKzBP01yaALOhuQWoJvdAN2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HCp1cQU0i1mNtSkBl6uYP+9Jmv0jeKkqx1qU+wEXERIc63a4C3h4eo+BkSkbC4Wrj
	 iBlDgNEG/rRv7ILKKI8sGfxNG2i1fRlZqzAeGt19lLzJxGmd1edfvPoHJ2zKHIPnhp
	 LYC6Dzi8o/kKGlu/ppZCS8O2TYuxVKrSG3aA0w58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E54EF80519;
	Fri, 21 Jan 2022 18:25:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F9D2F8047C; Fri, 21 Jan 2022 18:25:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7154FF80508
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 18:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7154FF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="apYGzumx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LH9K5G013193;
 Fri, 21 Jan 2022 11:24:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=esQa06hrgOMJ8WsoJmpq9RLqCEOqwnnCnVua0114bvg=;
 b=apYGzumxPAaG4NV9XFYCRtjgx9/wFlQIUhkVHyK6jcbcJluI6GG5lGK6JtNpPBDSbQgh
 Rq+u67Y05OUC5k3sKobW7QF0vRcB8FBQuBd9YANgFiCqyAUxw5rksvQnzPTU//YYiO9x
 sXto1i7nPsVoEg9mZF/G8h4WxVC+X2o3H8SSGMr6lyP3aIEDudC46+p/GhExX1eESEj6
 LXyhprXLzH4xLg60q2/BVDEhAEUvHxI14CoR4S0G+sgP8+XW/r/0iRWBqFBiB8Z8ylww
 C+ZwbpobL/Sy63J4E0tCGzUdWT1ZuNlU6aDCy61487F2teu129qnBb8ex0Irv/JXG27B OQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhynrw8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 11:24:51 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 17:24:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 17:24:50 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F122B0E;
 Fri, 21 Jan 2022 17:24:49 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 2/9] spi: Create helper API to lookup ACPI info for spi
 device
Date: Fri, 21 Jan 2022 17:24:24 +0000
Message-ID: <20220121172431.6876-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8bb6J0N7VfGZFvd5MF1j64IEo8fjc7R9
X-Proofpoint-GUID: 8bb6J0N7VfGZFvd5MF1j64IEo8fjc7R9
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>,
 linux-spi@vger.kernel.org
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

This can then be used to find a spi resource inside an
ACPI node, and allocate a spi device.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/spi/spi.c       | 46 ++++++++++++++++++++++++++++++++---------
 include/linux/spi/spi.h |  6 ++++++
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1eb84101c4ad..13f4701f0694 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2410,8 +2410,18 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
 	return 1;
 }
 
-static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
-					    struct acpi_device *adev)
+/**
+ * acpi_spi_device_alloc - Allocate a spi device, and fill it in with ACPI information
+ * @ctlr: controller to which the spi device belongs
+ * @adev: ACPI Device for the spi device
+ *
+ * This should be used to allocate a new spi device from and ACPI Node.
+ * The caller is responsible for calling spi_add_device to register the spi device.
+ *
+ * Return: a pointer to the new device, or ERR_PTR on error.
+ */
+struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
+					 struct acpi_device *adev)
 {
 	acpi_handle parent_handle = NULL;
 	struct list_head resource_list;
@@ -2419,10 +2429,6 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 	struct spi_device *spi;
 	int ret;
 
-	if (acpi_bus_get_status(adev) || !adev->status.present ||
-	    acpi_device_enumerated(adev))
-		return AE_OK;
-
 	lookup.ctlr		= ctlr;
 	lookup.irq		= -1;
 
@@ -2433,7 +2439,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 
 	if (ret < 0)
 		/* found SPI in _CRS but it points to another controller */
-		return AE_OK;
+		return ERR_PTR(-ENODEV);
 
 	if (!lookup.max_speed_hz &&
 	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
@@ -2443,16 +2449,15 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 	}
 
 	if (!lookup.max_speed_hz)
-		return AE_OK;
+		return ERR_PTR(-ENODEV);
 
 	spi = spi_alloc_device(ctlr);
 	if (!spi) {
 		dev_err(&ctlr->dev, "failed to allocate SPI device for %s\n",
 			dev_name(&adev->dev));
-		return AE_NO_MEMORY;
+		return ERR_PTR(-ENOMEM);
 	}
 
-
 	ACPI_COMPANION_SET(&spi->dev, adev);
 	spi->max_speed_hz	= lookup.max_speed_hz;
 	spi->mode		|= lookup.mode;
@@ -2460,6 +2465,27 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 	spi->bits_per_word	= lookup.bits_per_word;
 	spi->chip_select	= lookup.chip_select;
 
+	return spi;
+}
+EXPORT_SYMBOL_GPL(acpi_spi_device_alloc);
+
+static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
+					    struct acpi_device *adev)
+{
+	struct spi_device *spi;
+
+	if (acpi_bus_get_status(adev) || !adev->status.present ||
+	    acpi_device_enumerated(adev))
+		return AE_OK;
+
+	spi = acpi_spi_device_alloc(ctlr, adev);
+	if (IS_ERR(spi)) {
+		if (PTR_ERR(spi) == -ENOMEM)
+			return AE_NO_MEMORY;
+		else
+			return AE_OK;
+	}
+
 	acpi_set_modalias(adev, acpi_device_hid(adev), spi->modalias,
 			  sizeof(spi->modalias));
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 0346a3ff27fd..d159cef12f1a 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -16,6 +16,7 @@
 #include <linux/gpio/consumer.h>
 
 #include <uapi/linux/spi/spi.h>
+#include <linux/acpi.h>
 
 struct dma_chan;
 struct software_node;
@@ -759,6 +760,11 @@ extern int devm_spi_register_controller(struct device *dev,
 					struct spi_controller *ctlr);
 extern void spi_unregister_controller(struct spi_controller *ctlr);
 
+#if IS_ENABLED(CONFIG_ACPI)
+extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
+						struct acpi_device *adev);
+#endif
+
 /*
  * SPI resource management while processing a SPI message
  */
-- 
2.25.1

