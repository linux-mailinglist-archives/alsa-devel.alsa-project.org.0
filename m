Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FECF56A6BC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 17:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3F3166A;
	Thu,  7 Jul 2022 17:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3F3166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657206758;
	bh=kmc3wc6ajY9BcICOK/nkuA5qJD8diOKXxI31X5YKy7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0pLk8+4Q8V/yztsbuR7hRXsGn5bND7nMI/iTi6OKfj1usB5PpLfLYp+pcQu6rZHZ
	 XU/oCfHBY80/y/VnWrPPIElYjBuIO3CJIBlfXoink/XwdRBz30FAdFzedKreh8g4Iq
	 e7FCi08RjrkXGN88rFlL/Is/popSUm6P5wqvzxp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA9DF80539;
	Thu,  7 Jul 2022 17:11:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51769F80538; Thu,  7 Jul 2022 17:11:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D161F80137
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 17:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D161F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EM4+LfwL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267BU6Ji020187;
 Thu, 7 Jul 2022 10:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=eI3etg7tS+4dRtyIr56IkjyI/lNnf1+cKi1Idvp6WZ4=;
 b=EM4+LfwLChmNPZqRm9P/dN3McEwRhzyTIcFsUPyeaHPtz7tG7ra5hhgHjXaSKdykhNWl
 jP5doNJbi7XsDnveFSd79Lji/sHT1LrVJxE4v8oR4kXSWOjj1eKwYVhLpVwmDFwulk/R
 WHkI+OOKkMZwyV2qq9YSjURQ+PVTZ6TRsxm17H1xYb7ivCQfIYVLzQF3U4OAqOBkCijB
 XSlLqbx1D8JMjuHSexc8r/Ez57Gx84g17ZSpvIx2i3clKPJ47soxjo5EBtMFRq39KbtO
 ydJGYd/2riMV0+WO4kygzMuH3PR5RUVTZbx8WalNaIlmBbC96y8LGxshUhRmAIcfD0pF 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3h4ucmjr6f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Jul 2022 10:10:47 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 16:10:44 +0100
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1118.9; Thu, 7 Jul 2022
 10:10:44 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 7 Jul 2022 16:10:44 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com
 (NEWBNB750653-PC.ad.cirrus.com [198.90.238.195])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EB38446A;
 Thu,  7 Jul 2022 15:10:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 1/2] ACPI: utils: Add api to read _SUB from ACPI
Date: Thu, 7 Jul 2022 16:10:36 +0100
Message-ID: <20220707151037.3901050-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
References: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nXzdEGsX5TRFa1bZ1Bt_e7IGnOHN5v0e
X-Proofpoint-ORIG-GUID: nXzdEGsX5TRFa1bZ1Bt_e7IGnOHN5v0e
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org, Stefan
 Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
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
index 3a9773a09e19..5a7b8065e77f 100644
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
+	size_t len;
+
+	status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);
+		return ERR_PTR(-ENODATA);
+	}
+
+	obj = buffer.pointer;
+	if (obj->type == ACPI_TYPE_STRING) {
+		len = strlen(obj->string.pointer);
+		if (len < ACPI_MAX_SUB_BUF_SIZE && len > 0) {
+			sub = kstrdup(obj->string.pointer, GFP_KERNEL);
+			if (!sub)
+				sub = ERR_PTR(-ENOMEM);
+		} else {
+			acpi_handle_err(handle, "ACPI _SUB Length %zu is Invalid\n", len);
+			sub = ERR_PTR(-ENODATA);
+		}
+	} else {
+		acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
+		sub = ERR_PTR(-ENODATA);
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
index 2a0e95336094..447898685e09 100644
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
 
+static inline const char *acpi_get_subsystem_id(acpi_handle handle)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline int acpi_register_wakeup_handler(int wake_irq,
 	bool (*wakeup)(void *context), void *context)
 {
-- 
2.25.1

