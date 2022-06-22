Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D88554A84
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 15:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C6D1F25;
	Wed, 22 Jun 2022 15:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C6D1F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655903379;
	bh=tgLVT54RPo6tM2ma/VFS72AQD27XLaNTdQHT4KOIHOA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MdYq5jmeFw1wPGU6mfj6ajPtx2hA7FdoCUdxwOk20aPpssRD4pUfrjSsXVrZ36HRq
	 o1CNDTx4ME8RgmPwz4ummDmwZ+iytSNxeuk8NemnalbZJThV+Ol2SjZs2nTIcflcyE
	 GXoKAayVSBrk2KLeTevQfEq29SuNQsWP4Yz/BJDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD388F804AC;
	Wed, 22 Jun 2022 15:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD14DF8019B; Wed, 22 Jun 2022 15:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C44F8019B
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 15:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C44F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="V1vqjGNa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M8oRuP016502;
 Wed, 22 Jun 2022 08:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ntxFv34fd+vFLPQPi1Xmyq/mW6Q27ifhC5yz+XojRyE=;
 b=V1vqjGNaFSkM+gdJj+xs+Z8tnK5DsQR46sXTEh/ke1Fa11WYcY6/tGv94NscN2IGw+I7
 zBMSV9c/+p/zQ+PMSrLuUxtl6mvIW5q6Hwqv6aPmWn0qtW3upwKvt117Q1n8o8zXHzK/
 Kcl75B+j3cTC80guD2jZPjvezp+VdsaHQeye25CcNSOh92VTIgfMNJxhq/kidYjwnfbs
 CyUogcZq8Xz7DZhtn/AD5MhRsNiP20b/UN4h6bGX/4IcC5lv5mK0zumWNTa0BNtEq7n2
 A4jyQLOYtkthki8dl3aon3K4CGhF52CBmcRwaGG+t5RZy3CjfDGLsPUSDHgonTRw5SCH 6Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41d2wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jun 2022 08:07:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 22 Jun
 2022 14:07:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Wed, 22 Jun 2022 14:07:55 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.151])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 35A7A478;
 Wed, 22 Jun 2022 13:07:53 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 1/2] ACPI: utils: Add api to read _SUB from ACPI
Date: Wed, 22 Jun 2022 14:07:29 +0100
Message-ID: <20220622130730.1573747-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622130730.1573747-1-sbinding@opensource.cirrus.com>
References: <20220622130730.1573747-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OtYPNvyMW17wUUEj7zk8fODjthptNpou
X-Proofpoint-ORIG-GUID: OtYPNvyMW17wUUEj7zk8fODjthptNpou
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
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

Add a wrapper function to read the _SUB string from ACPI.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/acpi/utils.c | 26 ++++++++++++++++++++++++++
 include/linux/acpi.h |  8 ++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 3a9773a09e19..5d1bdb79e372 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -291,6 +291,32 @@ int acpi_get_local_address(acpi_handle handle, u32 *addr)
 }
 EXPORT_SYMBOL(acpi_get_local_address);
 
+int acpi_get_sub(acpi_handle handle, char *sub, size_t size)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int ret;
+
+	status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
+	if (!ACPI_SUCCESS(status)) {
+		acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);
+		return -ENOENT;
+	}
+
+	obj = buffer.pointer;
+	if (obj->type == ACPI_TYPE_STRING) {
+		ret = strscpy(sub, obj->string.pointer, size);
+	} else {
+		acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
+		ret = -EINVAL;
+	}
+	acpi_os_free(buffer.pointer);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(acpi_get_sub);
+
 acpi_status
 acpi_evaluate_reference(acpi_handle handle,
 			acpi_string pathname,
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4f82a5bc6d98..9bf18adf5920 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -21,6 +21,8 @@
 #endif
 #include <acpi/acpi.h>
 
+#define ACPI_MAX_SUB_BUF_SIZE	9
+
 #ifdef	CONFIG_ACPI
 
 #include <linux/list.h>
@@ -762,6 +764,7 @@ static inline u64 acpi_arch_get_root_pointer(void)
 #endif
 
 int acpi_get_local_address(acpi_handle handle, u32 *addr);
+int acpi_get_sub(acpi_handle handle, char *sub, size_t size);
 
 #else	/* !CONFIG_ACPI */
 
@@ -1023,6 +1026,11 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
 	return -ENODEV;
 }
 
+static int acpi_get_sub(acpi_handle handle, char *sub, size_t size)
+{
+	return -ENODEV;
+}
+
 static inline int acpi_register_wakeup_handler(int wake_irq,
 	bool (*wakeup)(void *context), void *context)
 {
-- 
2.25.1

