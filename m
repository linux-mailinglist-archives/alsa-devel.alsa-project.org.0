Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8520496120
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 15:34:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65BE72B60;
	Fri, 21 Jan 2022 15:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65BE72B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642775657;
	bh=uT3WW6jAIFAY7/Xf9tds0wxTilEh1fPM2aPHnOZSIbE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYqJjxYGTga1bGbvXVhOy+YW4ma0aooY2VBm1ejywy+UX7NybRIThlDMhV6sDhEY1
	 UJJ9C+NDddCGyZrxRC5OCe6aRE6dPZ3nlVXbfmMpbF/Ynd3Y4dMJRiCONOVX58dWPO
	 +QpjIQK9LlQZFK8MhxWuNCeeN9ZiEXdqbRFiiLnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD34F8051B;
	Fri, 21 Jan 2022 15:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28BDBF8051B; Fri, 21 Jan 2022 15:33:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DF39F8047C
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 15:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DF39F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JdMyAcEk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L6W2WT017662;
 Fri, 21 Jan 2022 08:32:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rnCBUrcHxzyIdUNa/FPu7w14BdmJjhGgvRwHWbTMLhU=;
 b=JdMyAcEk9lxHjvlSdnaPXZkYf+Yzn/0ZUfg5AzsL9H3YzZ4TxebxJiyL56/mDCfemDel
 HFx9Sid+ImTaY3fAo88EXE/HO0zfenTEPJ0c8hzgrZX+Sa97ZXDNJ1FxYb3c8+liMEBZ
 SVrkVFTeRSKeAkF10odLCKQ1SRNvcq2mAAZ4kEmIowgWD4hUOGFmvHKkKaUeE3Zsr8KP
 EEACbUZYVV+MKnIVZTolhRGQOkoNanWbJcm/Syxjxnmdt/MbeepDzj+2a4iGHEB1gP2A
 TdTIdod76kWyl9h0Nm9JNFBaToWCR129JeVvx2d3fbNRbJpmSzGSOZdZrhv4lgyM8gCl pQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq0up3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 08:32:59 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 14:32:57 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 14:32:57 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1707045D;
 Fri, 21 Jan 2022 14:32:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 3/9] spi: Support selection of the index of the ACPI Spi
 Resource before alloc
Date: Fri, 21 Jan 2022 14:32:48 +0000
Message-ID: <20220121143254.6432-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WqpJwWXd8eP5ceZkBZj2e1Vp0jqpsNZ9
X-Proofpoint-ORIG-GUID: WqpJwWXd8eP5ceZkBZj2e1Vp0jqpsNZ9
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

If a node contains more than one Spi Resources, it may be necessary to
use an index to select which one you want to allocate a spi device for.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/spi/spi.c       | 51 +++++++++++++++++++++++++++++++++++------
 include/linux/spi/spi.h |  3 ++-
 2 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 13f4701f0694..06c0a308b38b 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2320,6 +2320,8 @@ struct acpi_spi_lookup {
 	int			irq;
 	u8			bits_per_word;
 	u8			chip_select;
+	int			n;
+	int			index;
 };
 
 static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
@@ -2351,6 +2353,8 @@ static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
 		lookup->mode |= SPI_CPHA;
 }
 
+static struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
+
 static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
 {
 	struct acpi_spi_lookup *lookup = data;
@@ -2364,14 +2368,35 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
 		sb = &ares->data.spi_serial_bus;
 		if (sb->type == ACPI_RESOURCE_SERIAL_TYPE_SPI) {
 
+			if (lookup->index != -1 && lookup->n++ != lookup->index)
+				return 1;
+
+			if (lookup->index == -1 && !ctlr)
+				return -ENODEV;
+
 			status = acpi_get_handle(NULL,
 						 sb->resource_source.string_ptr,
 						 &parent_handle);
 
-			if (ACPI_FAILURE(status) ||
-			    ACPI_HANDLE(ctlr->dev.parent) != parent_handle)
+			if (ACPI_FAILURE(status))
 				return -ENODEV;
 
+			if (ctlr) {
+				if (ACPI_HANDLE(ctlr->dev.parent) != parent_handle)
+					return -ENODEV;
+			} else {
+				struct acpi_device *adev;
+
+				if (acpi_bus_get_device(parent_handle, &adev))
+					return -ENODEV;
+
+				ctlr = acpi_spi_find_controller_by_adev(adev);
+				if (!ctlr)
+					return -ENODEV;
+
+				lookup->ctlr = ctlr;
+			}
+
 			/*
 			 * ACPI DeviceSelection numbering is handled by the
 			 * host controller driver in Windows and can vary
@@ -2414,14 +2439,21 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
  * acpi_spi_device_alloc - Allocate a spi device, and fill it in with ACPI information
  * @ctlr: controller to which the spi device belongs
  * @adev: ACPI Device for the spi device
+ * @index: Index of the spi resource inside the ACPI Node
  *
  * This should be used to allocate a new spi device from and ACPI Node.
  * The caller is responsible for calling spi_add_device to register the spi device.
  *
+ * If ctlr is set to NULL, the Controller for the spi device will be looked up
+ * using the resource.
+ * If index is set to -1, index is not used.
+ * Note: If index is -1, ctlr must be set.
+ *
  * Return: a pointer to the new device, or ERR_PTR on error.
  */
 struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
-					 struct acpi_device *adev)
+					 struct acpi_device *adev,
+					 int index)
 {
 	acpi_handle parent_handle = NULL;
 	struct list_head resource_list;
@@ -2429,8 +2461,13 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 	struct spi_device *spi;
 	int ret;
 
+	if (!ctlr && index == -1)
+		return ERR_PTR(-EINVAL);
+
 	lookup.ctlr		= ctlr;
 	lookup.irq		= -1;
+	lookup.index		= index;
+	lookup.n		= 0;
 
 	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_resources(adev, &resource_list,
@@ -2443,7 +2480,7 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 
 	if (!lookup.max_speed_hz &&
 	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
-	    ACPI_HANDLE(ctlr->dev.parent) == parent_handle) {
+	    ACPI_HANDLE(lookup.ctlr->dev.parent) == parent_handle) {
 		/* Apple does not use _CRS but nested devices for SPI slaves */
 		acpi_spi_parse_apple_properties(adev, &lookup);
 	}
@@ -2451,9 +2488,9 @@ struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 	if (!lookup.max_speed_hz)
 		return ERR_PTR(-ENODEV);
 
-	spi = spi_alloc_device(ctlr);
+	spi = spi_alloc_device(lookup.ctlr);
 	if (!spi) {
-		dev_err(&ctlr->dev, "failed to allocate SPI device for %s\n",
+		dev_err(&lookup.ctlr->dev, "failed to allocate SPI device for %s\n",
 			dev_name(&adev->dev));
 		return ERR_PTR(-ENOMEM);
 	}
@@ -2478,7 +2515,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 	    acpi_device_enumerated(adev))
 		return AE_OK;
 
-	spi = acpi_spi_device_alloc(ctlr, adev);
+	spi = acpi_spi_device_alloc(ctlr, adev, -1);
 	if (IS_ERR(spi)) {
 		if (PTR_ERR(spi) == -ENOMEM)
 			return AE_NO_MEMORY;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index d159cef12f1a..e5bbb9cbd3d7 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -762,7 +762,8 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
 
 #if IS_ENABLED(CONFIG_ACPI)
 extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
-						struct acpi_device *adev);
+						struct acpi_device *adev,
+						int index);
 #endif
 
 /*
-- 
2.25.1

