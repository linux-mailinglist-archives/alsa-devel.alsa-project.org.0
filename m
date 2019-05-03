Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04DF13573
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755751885;
	Sat,  4 May 2019 00:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755751885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556922184;
	bh=miH0z1haBHg8WNgcy18duxMqQ8801gO+FN72RHFwOm4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvZGs1DaolPisbgMEdKc1zzdnoMtj3bp2BEFiCuirN20DjAm1cmOpG/3Z/tFdv7F4
	 aFPlcFUaQD7MgekPN46V4nratHLBALORs3b/h35I+L3+DQ7zABWkKi7UhZwbrUbkje
	 20lW5jgoyPJup/oFdOxD31JYIY6rpd5s9QZ+8b+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A961F897C4;
	Sat,  4 May 2019 00:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F16DF89765; Sat,  4 May 2019 00:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E21BF80720
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E21BF80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZK/hzflX"
Received: by mail-pf1-x441.google.com with SMTP id j11so3516132pff.13
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0KFNP7GDxDVEn9/0waadn8XQgo26+DaIg8QC4SSrhCE=;
 b=ZK/hzflXSHwQRNZeB46eyN2GXgSBKKeiaOpn5NHjSmqIYS9P9eFF3ToPrx1GTh79p2
 WwZNTz9Yek/pFQYTn5TE7LHgN9CjYGtxFaiBZhHrKL8mcriCNUMzixDU10G5nFOCYF+c
 3/IiRWIx0oqqukDwrGHdT+zMeBVH/we05f8XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0KFNP7GDxDVEn9/0waadn8XQgo26+DaIg8QC4SSrhCE=;
 b=Ca8nlj4KdCg9xmqbbcAeNudQpteqxLy4d6P50BVgub8dRnncRL2KzJp2kG5EwcLztP
 xiamklCsaHeZlPhv0BirBhpOvDpJHy3DqrWVx9Wt1032RV97/nzjg8i2dQQFAibKf+Vg
 MUJedbrTB+yBR3hKS1FC92yngpzzgpKg75FgRbx0hO7Zo/FbaefYZgZ8XYcoPKZfgYHE
 ayqK8AAWSV5gYX4FWZXDvoQENHXbq6bx2ZGwAOJR2b9jZa+QmH5FvWTd1YtWMxnNUtpJ
 byRBOCRf+WNYpz2DoZfQFMgwsHKPSO/M18G48drfVm8w0wwHanpMXUoWxVjIJ0pWDGR1
 FtsA==
X-Gm-Message-State: APjAAAWFair4gx1pqa8d1Bye5yDDpXBB1Xu9EjOWwgmsdXyE50X54F2a
 UwgzBoJN1HVqaoa092u6k3k6Jw==
X-Google-Smtp-Source: APXvYqx5VrA3v5VfP99PPmGv2TIOUjM51+ZlFhs4G5gk2qqiWd7NEl4qs6v558WRJ3QSesV2tF1dOw==
X-Received: by 2002:a63:31d7:: with SMTP id x206mr13546801pgx.74.1556921008643; 
 Fri, 03 May 2019 15:03:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id g63sm6073757pfc.127.2019.05.03.15.03.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:27 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:31 -0700
Message-Id: <20190503220233.64546-29-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 28/30] mfd: cros_ec: Add SKU ID and Secure
	storage API
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

Add API to store SKU, Cros board information in EC flash memory.
Add API to store security data in EC.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 107 +++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 3d3a37b11002..860a76274334 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -1292,6 +1292,17 @@ struct ec_response_get_features {
 	uint32_t flags[2];
 } __ec_align4;
 
+/*****************************************************************************/
+/* Get the board's SKU ID from EC */
+#define EC_CMD_GET_SKU_ID 0x000E
+
+/* Set SKU ID from AP */
+#define EC_CMD_SET_SKU_ID 0x000F
+
+struct ec_sku_id_info {
+	uint32_t sku_id;
+} __ec_align4;
+
 /*****************************************************************************/
 /* Flash commands */
 
@@ -2902,6 +2913,49 @@ struct ec_response_port80_last_boot {
 	uint16_t code;
 } __ec_align2;
 
+/*****************************************************************************/
+/* Temporary secure storage for host verified boot use */
+
+/* Number of bytes in a vstore slot */
+#define EC_VSTORE_SLOT_SIZE 64
+
+/* Maximum number of vstore slots */
+#define EC_VSTORE_SLOT_MAX 32
+
+/* Get persistent storage info */
+#define EC_CMD_VSTORE_INFO 0x0049
+struct ec_response_vstore_info {
+	/* Indicates which slots are locked */
+	uint32_t slot_locked;
+	/* Total number of slots available */
+	uint8_t slot_count;
+} __ec_align_size1;
+
+/*
+ * Read temporary secure storage
+ *
+ * Response is EC_VSTORE_SLOT_SIZE bytes of data.
+ */
+#define EC_CMD_VSTORE_READ 0x004A
+
+struct ec_params_vstore_read {
+	uint8_t slot; /* Slot to read from */
+} __ec_align1;
+
+struct ec_response_vstore_read {
+	uint8_t data[EC_VSTORE_SLOT_SIZE];
+} __ec_align1;
+
+/*
+ * Write temporary secure storage and lock it.
+ */
+#define EC_CMD_VSTORE_WRITE 0x004B
+
+struct ec_params_vstore_write {
+	uint8_t slot; /* Slot to write to */
+	uint8_t data[EC_VSTORE_SLOT_SIZE];
+} __ec_align1;
+
 /*****************************************************************************/
 /* Thermal engine commands. Note that there are two implementations. We'll
  * reuse the command number, but the data and behavior is incompatible.
@@ -5069,6 +5123,59 @@ struct ec_params_efs_verify {
 	uint8_t region;		/* enum ec_flash_region */
 } __ec_align1;
 
+/*
+ * Retrieve info from Cros Board Info store. Response is based on the data
+ * type. Integers return a uint32. Strings return a string, using the response
+ * size to determine how big it is.
+ */
+#define EC_CMD_GET_CROS_BOARD_INFO	0x011F
+/*
+ * Write info into Cros Board Info on EEPROM. Write fails if the board has
+ * hardware write-protect enabled.
+ */
+#define EC_CMD_SET_CROS_BOARD_INFO	0x0120
+
+enum cbi_data_tag {
+	CBI_TAG_BOARD_VERSION = 0, /* uint32_t or smaller */
+	CBI_TAG_OEM_ID = 1,        /* uint32_t or smaller */
+	CBI_TAG_SKU_ID = 2,        /* uint32_t or smaller */
+	CBI_TAG_DRAM_PART_NUM = 3, /* variable length ascii, nul terminated. */
+	CBI_TAG_OEM_NAME = 4,      /* variable length ascii, nul terminated. */
+	CBI_TAG_MODEL_ID = 5,      /* uint32_t or smaller */
+	CBI_TAG_COUNT,
+};
+
+/*
+ * Flags to control read operation
+ *
+ * RELOAD:  Invalidate cache and read data from EEPROM. Useful to verify
+ *          write was successful without reboot.
+ */
+#define CBI_GET_RELOAD		BIT(0)
+
+struct ec_params_get_cbi {
+	uint32_t tag;		/* enum cbi_data_tag */
+	uint32_t flag;		/* CBI_GET_* */
+} __ec_align4;
+
+/*
+ * Flags to control write behavior.
+ *
+ * NO_SYNC: Makes EC update data in RAM but skip writing to EEPROM. It's
+ *          useful when writing multiple fields in a row.
+ * INIT:    Need to be set when creating a new CBI from scratch. All fields
+ *          will be initialized to zero first.
+ */
+#define CBI_SET_NO_SYNC		BIT(0)
+#define CBI_SET_INIT		BIT(1)
+
+struct ec_params_set_cbi {
+	uint32_t tag;		/* enum cbi_data_tag */
+	uint32_t flag;		/* CBI_SET_* */
+	uint32_t size;		/* Data size */
+	uint8_t data[];		/* For string and raw data */
+} __ec_align1;
+
 /*****************************************************************************/
 /* Fingerprint MCU commands: range 0x0400-0x040x */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
