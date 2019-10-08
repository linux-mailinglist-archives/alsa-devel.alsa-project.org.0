Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FEACF6CE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 12:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE6771657;
	Tue,  8 Oct 2019 12:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE6771657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570529632;
	bh=ewB4t6YJZsc7eAUUfZQVpmDnB9XsgKzamal9SqcJXwI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lu8a/SdJi3BTQHhqw+lvFQo2Gt8K0N3Wb191gTCznIzdBVykTni0TqS1D2emElNub
	 LC1QZX6yyo606SgYrJBqYdSuln98I3mR63irHNiyprREj45RxoRNNvwL0IoRjcb6nz
	 ipJrp7Ciri/sDTjCp93EzAl7Xsp/CCQ/krpgJzeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA3EF8045E;
	Tue,  8 Oct 2019 12:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4AC6F8038F; Tue,  8 Oct 2019 12:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7A3FF800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 12:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7A3FF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Trn1r5D9"
Received: by mail-pf1-x441.google.com with SMTP id x127so10499135pfb.7
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJBL7qyzxoDJRRddYXK54hndGf2KGEetfbRWryMKt2E=;
 b=Trn1r5D9cGQW5wjoTVdST1Vr+Nt4P4YpIV2bWoatnDDPis7Dy9jpi4NP/IkdP5+fej
 ZbRZqPfICPJGzhNgYmI6sibzynWOpiZ5k2L0YfGRG0X9mDpgl5puTbYLT5nXIT88PR7n
 VBfHcTrONdTja6s5V1shQdAHCQFgGN8IIegi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJBL7qyzxoDJRRddYXK54hndGf2KGEetfbRWryMKt2E=;
 b=gL8759uCwNiOUTVMOA/6ubcPondv/HwYLdkHZkrpYzOSxT3j41P+m+0rgAkAJ1jqpR
 2mvhinVolvRRxwGgbRMzsaQUaQwkvipvaD9w/wUC5j8ZyJLm2E58o+hGRpszex07hEW4
 x8gej9I2zKM6aBaolhATWeHPfEUG6QOjN52RnydXLVNlazGnEsuLEbKhGA5jeL89uZ4e
 FAQzQiev2ZtLMEnZf3RsGPszxOc/tYIpM0cNNUxS6BonLfepqrGV0OFO70zSzeaci68S
 uL5iUZ8NLBv/55KyjCeHrpOBAHOg+VVV3p78VTul9rV/AH5JZ/gCp4mswh5Hevtg8QkG
 N2Iw==
X-Gm-Message-State: APjAAAUUodr5Cf/3vR+Lk5Aajuawt5nBYQL6AZE6ir6SqyrhQ/PJ9wSf
 cdMoUDnoCpHL/0Ya5H9Ir+dzzQ==
X-Google-Smtp-Source: APXvYqwuL/NpT53t//3HEQqYcM39S9q70cMotyVyM1K2EG7T0EBBhKzkMC/651IeZcvTwB6aGwIs8A==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr35543545pgo.133.1570529519761; 
 Tue, 08 Oct 2019 03:11:59 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id t3sm1894936pje.7.2019.10.08.03.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 03:11:58 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  8 Oct 2019 18:11:44 +0800
Message-Id: <20191008101144.39342-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>,
 sathya.prakash.m.r@intel.com, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Shuming Fan <shumingf@realtek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, dgreid@chromium.org,
 Guenter Roeck <linux@roeck-us.net>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH v2] firmware: vpd: Add an interface to read VPD
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

The example usage in ASoC machine driver is like:

#define DSM_CALIB_KEY "dsm_calib"
static int load_calibration_data(struct cml_card_private *ctx) {
    char *data = NULL;
    int ret;
    u32 value_len;

    /* Read calibration data from VPD. */
    ret = vpd_attribute_read(1, DSM_CALIB_KEY,
                            (u8 **)&data, &value_len);

    /* Parsing of this string...*/
}


Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
Change from v1 to v2:
- Use kmemdup to copy data.
- Set value_len according to bin_attr.size.
- Check return value of kmemdup.
- Rename the function to vpd_attribute_read.
- Add docstrings for the function.
- Returns -ENOENT when the key is not found.
- Use EXPORT_SYMBOL_GPL.

Note:

The user of this API is in ASoC machine driver cml_rt1011_rt5682.
It is pending on the initial machine driver change

https://patchwork.kernel.org/patch/11161145/

and the codec driver change to provide API to do calibration.

https://patchwork.kernel.org/patch/11179237/

The draft patch of machine driver change which uses this API is at

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1838091



 drivers/firmware/google/vpd.c              | 31 ++++++++++++++++++++++
 include/linux/firmware/google/google_vpd.h | 18 +++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 include/linux/firmware/google/google_vpd.h

diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index db0812263d46..c2be0e756402 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -65,6 +65,37 @@ static ssize_t vpd_attrib_read(struct file *filp, struct kobject *kobp,
 				       info->bin_attr.size);
 }
 
+/**
+ *	vpd_attribute_read - Read VPD value for a key.
+ *	@ro: True for RO section. False for RW section.
+ *	@key: A string for key.
+ *	@value: Where to write the VPD value on success. The caller
+ *	        must free the memory.
+ *	@value_len: The length of value in bytes.
+ *
+ *	Returns 0 on success, -ENOENT when the key is not found, and
+ *	-ENOMEM when failed to allocate memory for value.
+ */
+int vpd_attribute_read(bool ro, const char *key,
+		       u8 **value, u32 *value_len)
+{
+	struct vpd_attrib_info *info;
+	struct vpd_section *sec = ro ? &ro_vpd : &rw_vpd;
+
+	list_for_each_entry(info, &sec->attribs, list) {
+		if (strcmp(info->key, key) == 0) {
+			*value = kmemdup(info->value, info->bin_attr.size,
+					 GFP_KERNEL);
+			if (!*value)
+				return -ENOMEM;
+			*value_len = info->bin_attr.size;
+			return 0;
+		}
+	}
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(vpd_attribute_read);
+
 /*
  * vpd_section_check_key_name()
  *
diff --git a/include/linux/firmware/google/google_vpd.h b/include/linux/firmware/google/google_vpd.h
new file mode 100644
index 000000000000..4364eaa4e1e3
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
+int vpd_attribute_read(bool ro, const char *key,
+		       u8 **value, u32 *value_len);
+
+#endif  /* __GOOGLE_VPD_H */
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
