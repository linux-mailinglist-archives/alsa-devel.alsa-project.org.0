Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD64CDC4F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 09:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E2A1664;
	Mon,  7 Oct 2019 09:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E2A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570432688;
	bh=bi0EEH3aoUH6oGT6hmM7skgyJNiKmXiy/QHMDTuHMAU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pRM1jGVJh3cHeR8yROdWkYRXOnUS06yw1URwc3HaAFiloa1MNnX8g0M4dg3NmBLXE
	 99g/C+3tElpOhKt65EIsShg04USnjeT74OQoJ7fA7WQEehGnUfNYjbQJvbyw9cpX6l
	 3t6momdDOD3uTMOD6DDzjhTjhirUpeZmPY14ghUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0760F802BD;
	Mon,  7 Oct 2019 09:16:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5004F802BE; Mon,  7 Oct 2019 09:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37740F80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 09:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37740F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nkMQ8X9C"
Received: by mail-pf1-x443.google.com with SMTP id q12so8032595pff.9
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzfC8RVq1jP1kr40tiN+8WHn9COGwplqh2mQFPqwcC8=;
 b=nkMQ8X9CAoT8fwvh8c2BskmgfPKD8hl3HO2ivNlWnmNsG22vLvXE4w7M6RHR0vJfq4
 l1RI2y6w9uDbcRSFqoli/p50exF0Zidpx6tLxBRqAEOnllb4hf2meGdHc4hE74MeuyLT
 S6OTOePKh8HFHqJSRN736bofzO7OGadxfB06E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzfC8RVq1jP1kr40tiN+8WHn9COGwplqh2mQFPqwcC8=;
 b=OvjykK43J9S06UumlnMLTm2tVjqc6/4prd9INsfRumPQEegyXF+CCumswVLTOcPKhu
 LUknjfxdxmZjg7TC3uDd5o73ajuiA1oissawOonkJN2kVaX1tJdN/0ifDLLq82CW9Y7X
 gukM/BSFGco2gEmnOu3VsDZJX0NM4eWYOhZSoTMUy5E7ms2/F7FSIrkGYb4zA3sqGGX3
 K3zf5t6QTkiSxwvN9sOOym9e8ItEs9NuOQk17gq/QjJkk+e8yimKy8QVw4bmxVwbQds8
 NgPxSRCBWZM7ZQpfhCL/4ImnJxc+swRcUuPnfMxAROW9vksSpJzHDo+WiP9Q3ZLOsdbU
 yy5Q==
X-Gm-Message-State: APjAAAUMe3EcN1beoD8zpDuzxdeapMmtLxr8s+kKKZBftifRny39egIa
 Yhf6+p9GILonETqCDtCgzHU7DA==
X-Google-Smtp-Source: APXvYqwiP0yuYdJ+4gkcqPLdLjqZtNFDPJkZPqAzA+L0Ij6yff4yxpEiwaN/m998Kt1N7CdwNV74Ow==
X-Received: by 2002:a17:90a:256c:: with SMTP id
 j99mr31552845pje.125.1570432576781; 
 Mon, 07 Oct 2019 00:16:16 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id d10sm15020616pfh.8.2019.10.07.00.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 00:16:15 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  7 Oct 2019 15:16:10 +0800
Message-Id: <20191007071610.65714-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 dgreid@chromium.org, Guenter Roeck <linux@roeck-us.net>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read VPD
	value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add an interface for other driver to query VPD value.
This will be used for ASoC machine driver to query calibration
data stored in VPD for smart amplifier speaker resistor
calibration.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 drivers/firmware/google/vpd.c              | 16 ++++++++++++++++
 include/linux/firmware/google/google_vpd.h | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/linux/firmware/google/google_vpd.h

diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index db0812263d46..71e9d2da63be 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -65,6 +65,22 @@ static ssize_t vpd_attrib_read(struct file *filp, struct kobject *kobp,
 				       info->bin_attr.size);
 }
 
+int vpd_attribute_read_value(bool ro, const char *key,
+			     char **value, u32 value_len)
+{
+	struct vpd_attrib_info *info;
+	struct vpd_section *sec = ro ? &ro_vpd : &rw_vpd;
+
+	list_for_each_entry(info, &sec->attribs, list) {
+		if (strcmp(info->key, key) == 0) {
+			*value = kstrndup(info->value, value_len, GFP_KERNEL);
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL(vpd_attribute_read_value);
+
 /*
  * vpd_section_check_key_name()
  *
diff --git a/include/linux/firmware/google/google_vpd.h b/include/linux/firmware/google/google_vpd.h
new file mode 100644
index 000000000000..6f1160f28af8
--- /dev/null
+++ b/include/linux/firmware/google/google_vpd.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Google VPD interface.
+ *
+ * Copyright 2019 Google Inc.
+ */
+
+/* Interface for reading VPD value on Chrome platform. */
+
+#ifndef __GOOGLE_VPD_H
+#define __GOOGLE_VPD_H
+
+#include <linux/types.h>
+
+int vpd_attribute_read_value(bool ro, const char *key,
+			     char **value, u32 value_len);
+
+#endif  /* __GOOGLE_VPD_H */
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
