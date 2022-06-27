Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD355BA5A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:13:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68A3168B;
	Mon, 27 Jun 2022 16:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68A3168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656339220;
	bh=g952lUj6oqELkBShnxMfVD+pzDiqDurOdTlLUTMxcTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1cgXzXniPn38j5+r7ToUC6biXcHfobqgMxdHBVLa/QOZEb1LcWw2rj1p5JAg2J4C
	 FMXspW3zGQzWgL9cBnt7GtbWp1IWWKmDykh4UcfY4HhBVcPucuRMWn0Vi3EJ6c8pTS
	 hd8dS/sD6mIl8tF+nITme6pX00gR2bxmlOTd4P5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDDBFF8012F;
	Mon, 27 Jun 2022 16:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 200D8F804FB; Mon, 27 Jun 2022 16:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AABFF8012F
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AABFF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EzWum5sm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RCn06I027978;
 Mon, 27 Jun 2022 09:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MlSBP/F7VDrPTrgH+ofw5XPxgvmlmwggZfsEimmCKQM=;
 b=EzWum5smrDY4VMrOBPCgt3TBYfX/yITpnYWOxDyJiRj9zbFcVA58q3RNAM7u6B1y5Emz
 ZT+jiUDKl9IrcAMP18qKezP8wpkCebfcp12xfW1l/uVtNIkutRu2/O2zUPs0/FMdQj7j
 qW80vSqOSMIn/DZe1eDdzhG8YBwweoDiYOWj+2/a9/XV2iB1YKAtd+nOq2VTwTkURriA
 Imeq7rMPYwgh32m0AEdsg7vzqJD+TnpUK2JT8XF1I3kSaxubkYBmGgusQZg//RO/5Gnp
 4HOB3MBIwE6TFHAtTjKqcAr6J5ZoXYf9OgCbKtD3GgGIY+TDrYEGPwVs/qJuk9DStm91 pg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq2qjm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 09:12:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 15:12:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 27 Jun 2022 15:12:02 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.163])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0D05B11D1;
 Mon, 27 Jun 2022 14:12:02 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/2] ACPI: utils: Add api to read _SUB from ACPI
Date: Mon, 27 Jun 2022 15:11:47 +0100
Message-ID: <20220627141148.804319-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627141148.804319-1-sbinding@opensource.cirrus.com>
References: <20220627141148.804319-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AGgw-DCTO6OuSKekfRjLo7dcmRYjKcYi
X-Proofpoint-ORIG-GUID: AGgw-DCTO6OuSKekfRjLo7dcmRYjKcYi
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
 drivers/acpi/utils.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  6 ++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 3a9773a09e19..4ef9ee4ad0d8 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -291,6 +291,44 @@ int acpi_get_local_address(acpi_handle handle, u32 *addr)
 }
 EXPORT_SYMBOL(acpi_get_local_address);
 
+#define ACPI_MAX_SUB_BUF_SIZE	9
+
+const char *acpi_get_subsystem_id(acpi_handle handle)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	const char *sub;
+
+	status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);
+		return ERR_PTR(-ENODATA);
+	}
+
+	obj = buffer.pointer;
+	if (obj->type == ACPI_TYPE_STRING) {
+		if (strlen(obj->string.pointer) < ACPI_MAX_SUB_BUF_SIZE &&
+		    strlen(obj->string.pointer) > 0) {
+			sub = kstrdup(obj->string.pointer, GFP_KERNEL);
+			if (!sub)
+				sub = ERR_PTR(-ENOMEM);
+		} else {
+			acpi_handle_err(handle, "ACPI _SUB Length %d is Invalid\n",
+					strlen(obj->string.pointer));
+			sub = ERR_PTR(-EINVAL);
+		}
+	} else {
+		acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
+		sub = ERR_PTR(-EINVAL);
+	}
+
+	acpi_os_free(buffer.pointer);
+
+	return sub;
+}
+EXPORT_SYMBOL_GPL(acpi_get_subsystem_id);
+
 acpi_status
 acpi_evaluate_reference(acpi_handle handle,
 			acpi_string pathname,
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4f82a5bc6d98..1c13fc077f42 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -762,6 +762,7 @@ static inline u64 acpi_arch_get_root_pointer(void)
 #endif
 
 int acpi_get_local_address(acpi_handle handle, u32 *addr);
+const char *acpi_get_subsystem_id(acpi_handle handle);
 
 #else	/* !CONFIG_ACPI */
 
@@ -1023,6 +1024,11 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
 	return -ENODEV;
 }
 
+static inline const char *acpi_get_subsystem_id(acpi_handle handle);
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline int acpi_register_wakeup_handler(int wake_irq,
 	bool (*wakeup)(void *context), void *context)
 {
-- 
2.25.1

