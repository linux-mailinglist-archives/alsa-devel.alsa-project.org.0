Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA6D561EB2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 17:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D39116BB;
	Thu, 30 Jun 2022 17:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D39116BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656601405;
	bh=3Gw8mNBaMVaHjZFQT4QI2XXL9OzIW3W+zawyP1YjZDY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rBDKI3ngHslG4klkznVOpRhxaZwW4JNAaItWk0OHfaQtmOKgAkUGG8nznYTCVFaiB
	 kCbH1vaox4XMS97DcJXdDtD7H3jkz3O86h2M2d1RNXF8CbHBURdZ4mUzfMVt10jnNj
	 zD/jnPzYlZkv2/YpApwGZJOAsi4tHrrc3qcqh1IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB52BF804FE;
	Thu, 30 Jun 2022 17:01:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C3CEF80107; Thu, 30 Jun 2022 17:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6489DF80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6489DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gFn8y3W0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UDjbTf004680;
 Thu, 30 Jun 2022 10:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=o9h3Q2NuFGYiveug+sv1cJnnsi9uUYbi5OiOlMr7DjE=;
 b=gFn8y3W0M3iFDzL2JcgRxbGQkqs9I2a9CqGkoLsBPspRMZEKbI4wI4c8ZH/yPILgSzkG
 vhkFybQCemeCqiNcqDQTzfEOSoN4oKet2M0Xk0lTU5f1EIx7LplfDwSTh92z0yGkXnMm
 GmdPO8+C9SrMD++D0kaJYxcLuDGs7PhTiZDEF8DGI4BE7rIZctBe64B1NHaHV1aEfBj+
 B0MqjjBJDwpPgpQHjrmgIsnjrgYANOceUH0vgEAGo2BBtVjxpXiwO1VUCu5zS/l3V7O+
 NSwbc2jVChECdpF2kXR+tNWM0AuQ0yt2Xg3aLFzk0sKNYkQh0HyU2/BTC101LN0LdOzH tg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq6r1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jun 2022 10:01:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 16:01:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 30 Jun 2022 16:01:40 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.163])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 336BB2D4;
 Thu, 30 Jun 2022 15:01:40 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 1/2] ACPI: utils: Add api to read _SUB from ACPI
Date: Thu, 30 Jun 2022 16:01:34 +0100
Message-ID: <20220630150135.1799535-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630150135.1799535-1-sbinding@opensource.cirrus.com>
References: <20220630150135.1799535-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hOXpgJi2F5kzzZg_5sT1pWmu-NyWAcLI
X-Proofpoint-ORIG-GUID: hOXpgJi2F5kzzZg_5sT1pWmu-NyWAcLI
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
index 3a9773a09e19..394954f4b6ef 100644
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
+			acpi_handle_err(handle, "ACPI _SUB Length %zu is Invalid\n",
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
index 7b96a8bff6d2..7651198ad6f5 100644
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

