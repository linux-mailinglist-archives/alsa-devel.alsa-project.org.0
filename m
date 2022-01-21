Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFF4963F1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 18:28:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 284DD1E83;
	Fri, 21 Jan 2022 18:27:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 284DD1E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642786092;
	bh=uFP+GM9og1X1KbuSIM1VapGRcASo72XZ5lKNYTmaDtE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UA/zRpNNPFefR7O/7UPj4kBM9ha9qHkp8AANofqvNyG5dAWiz3cI25lyqHNWLarBd
	 bsbdsStDWkbJRL+8f6LpJYNnWuEnLV2stECv3tefkAAGy3xXWOo19DjWFHCl+kt4FV
	 1g0cx1bW2cvGZibVhuHBrxi0BT9FTOSdBKVRg1LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834DDF80529;
	Fri, 21 Jan 2022 18:25:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0E2F80507; Fri, 21 Jan 2022 18:25:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D594F804AB
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 18:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D594F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Tveup9Vi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LH9VJI024708;
 Fri, 21 Jan 2022 11:24:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hpkiyedjwFNaW1dW6W1BZYk7mgOTqs24UOHKVbPt4Kk=;
 b=Tveup9VixYFgvsFajz2UDU8As2rAH6nxp/QAHXj89fz5LG5/QEFz8t1LxJgEf7jbhMYX
 7L59aZ+n/UuRMIdSyH/wiUsBOzMduLl7sNQfPg1NAcBz7Lr0DoJm6eCRBjpuYywbdbsQ
 j1CZgOTvYT6rQMz5G6t7T3926wE4+ERjzuIGeVSQRLNW6JUzf48FT3pfv0lX/GiieIaW
 F4wBfxTJwroG5feMpHG6XYNYE/GVLzz2/9fBZdXG/07Yvw2Lmy1NFEFFQZBHYG+7Edpa
 gUa/alFfYnXzM1gI+Hm0ofm27GwUUL02w0w1MMv5jBLq+p3FaHC39UGEHCD1YB22r1r6 7g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq14dj-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 11:24:53 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 17:24:51 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 17:24:51 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A8A24B0E;
 Fri, 21 Jan 2022 17:24:50 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 4/9] spi: Add API to count spi acpi resources
Date: Fri, 21 Jan 2022 17:24:26 +0000
Message-ID: <20220121172431.6876-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wf1JZMEjUye3AQSKUYY9uG558fsI8n5Z
X-Proofpoint-ORIG-GUID: wf1JZMEjUye3AQSKUYY9uG558fsI8n5Z
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

Some ACPI nodes may have more than one Spi Resource.
To be able to handle these case, its necessary to have
a way of counting these resources.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/spi/spi.c       | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/spi/spi.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 06c0a308b38b..ec9f2ed579e3 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2324,6 +2324,46 @@ struct acpi_spi_lookup {
 	int			index;
 };
 
+static int acpi_spi_count(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_spi_serialbus *sb;
+	int *count = data;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
+		return 1;
+
+	sb = &ares->data.spi_serial_bus;
+	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_SPI)
+		return 1;
+
+	*count = *count + 1;
+
+	return 1;
+}
+
+/**
+ * acpi_spi_count_resources - Count the number of SpiSerialBus resources
+ * @adev:	ACPI device
+ *
+ * Returns the number of SpiSerialBus resources in the ACPI-device's
+ * resource-list; or a negative error code.
+ */
+int acpi_spi_count_resources(struct acpi_device *adev)
+{
+	LIST_HEAD(r);
+	int count = 0;
+	int ret;
+
+	ret = acpi_dev_get_resources(adev, &r, acpi_spi_count, &count);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&r);
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(acpi_spi_count_resources);
+
 static void acpi_spi_parse_apple_properties(struct acpi_device *dev,
 					    struct acpi_spi_lookup *lookup)
 {
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e5bbb9cbd3d7..394b4241d989 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -764,6 +764,7 @@ extern void spi_unregister_controller(struct spi_controller *ctlr);
 extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 						struct acpi_device *adev,
 						int index);
+int acpi_spi_count_resources(struct acpi_device *adev);
 #endif
 
 /*
-- 
2.25.1

