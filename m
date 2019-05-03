Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A113540
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65AE182B;
	Sat,  4 May 2019 00:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65AE182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921409;
	bh=xEyi2TwkT59rMOxbEP3p6cPXbzFJUFyjFn2+IsyswUs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSz/INmAU0vMj5ngjmDlt6XkDJt58JFjbO4UNTxjxbiRH8N7Pl8JbMDz5Wvj6/vet
	 yoLXkJCha/NPA63J/qABxAVYaT+UwX5VmLzU9Sc0f2UiZpoYUK+9kE1GxciROV/BWk
	 BofBheZA3JPa1iSGRcX+ru50ZwHhBgdF8PeRQVcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B52CDF89758;
	Sat,  4 May 2019 00:03:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E27F89739; Sat,  4 May 2019 00:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B8BF896E2
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B8BF896E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EjKwPGCs"
Received: by mail-pf1-x441.google.com with SMTP id v80so3540573pfa.3
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Egt+s52dQG9eH0skde5B48O/Z/VpY0b6FfwVDwMGURs=;
 b=EjKwPGCs0LSjtMEPQucZNlHZZttpHzAQjPOFnQuP1Hqi8z9LEUziGwrGcTqFx7YV0X
 lrYsr0/Y/YljqDBFpxluEA/GwnYztg/CTGCc6a5lWeC557leKs5PcKNWALDpHxFs8Bab
 TNWoYH9j91Mt86ogZNJ+gVt301yewprHVZhLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Egt+s52dQG9eH0skde5B48O/Z/VpY0b6FfwVDwMGURs=;
 b=MiG4rgwdjFT5qbmDPrPGKeTj3r6vbqbMRCgsQdmdhagXYYgC7yrSL4824I21lf8gIj
 gROPHJxBGYzRe77n8pvCyT/anCvefefIw4bbgExlo+W3JsuNIsAMlxmxcaWs0Z8PiUK/
 fbHcRAy5qRT2xlDID2tvrZydiGQe717Zfu1bCQOjg99IOCLcJIvMEk3NcKi6x0ocU4mO
 0JFAxJOjwDCaKyr9HH4SX/1174K4QCGwKnJN5bKD2LNrFNP0DdwSJIRjOxMDSTb3ClX2
 LlRPgjtYmEg/acokJ2cRifLh9yQ2dBQwkjirQ5r+Ld3WRysux3JzW7QnCi6/i3zZNIPt
 LKtg==
X-Gm-Message-State: APjAAAUBlj2SqFcV/KJP86krnv34y3vfwpuVfLbd3jjQFiOYLpgvqiys
 3TCkYWx87qpHWMJ6MZnSviEG4w==
X-Google-Smtp-Source: APXvYqyXUU4R6fS5yhtw5PjmBJSi+rLqMS0f4l8SNgmv/I9ieoJqDItoRKhfRcbtxpKdekJCDTAYvg==
X-Received: by 2002:a63:5953:: with SMTP id j19mr13675507pgm.260.1556920979764; 
 Fri, 03 May 2019 15:02:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id t9sm3388801pgp.66.2019.05.03.15.02.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:02:59 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:13 -0700
Message-Id: <20190503220233.64546-11-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 10/30] mfd: cros_ec: Add Flash V2 commands
	API
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

Added for supporting larger embedded controller flash.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 150 ++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 2e5c93d858d8..393c5abab7a0 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -1108,6 +1108,7 @@ struct ec_response_get_features {
 
 /* Get flash info */
 #define EC_CMD_FLASH_INFO 0x0010
+#define EC_VER_FLASH_INFO 2
 
 /**
  * struct ec_response_flash_info - Response to the flash info command.
@@ -1134,6 +1135,15 @@ struct ec_response_flash_info {
  */
 #define EC_FLASH_INFO_ERASE_TO_0 BIT(0)
 
+/*
+ * Flash must be selected for read/write/erase operations to succeed.  This may
+ * be necessary on a chip where write/erase can be corrupted by other board
+ * activity, or where the chip needs to enable some sort of programming voltage,
+ * or where the read/write/erase operations require cleanly suspending other
+ * chip functionality.
+ */
+#define EC_FLASH_INFO_SELECT_REQUIRED BIT(1)
+
 /**
  * struct ec_response_flash_info_1 - Response to the flash info v1 command.
  * @flash_size: Usable flash size in bytes.
@@ -1156,6 +1166,12 @@ struct ec_response_flash_info {
  * gcc anonymous structs don't seem to get along with the __packed directive;
  * if they did we'd define the version 0 structure as a sub-structure of this
  * one.
+ *
+ * Version 2 supports flash banks of different sizes:
+ * The caller specified the number of banks it has preallocated
+ * (num_banks_desc)
+ * The EC returns the number of banks describing the flash memory.
+ * It adds banks descriptions up to num_banks_desc.
  */
 struct ec_response_flash_info_1 {
 	/* Version 0 fields; see above for description */
@@ -1169,6 +1185,42 @@ struct ec_response_flash_info_1 {
 	uint32_t flags;
 } __ec_align4;
 
+struct ec_params_flash_info_2 {
+	/* Number of banks to describe */
+	uint16_t num_banks_desc;
+	/* Reserved; set 0; ignore on read */
+	uint8_t reserved[2];
+} __ec_align4;
+
+struct ec_flash_bank {
+	/* Number of sector is in this bank. */
+	uint16_t count;
+	/* Size in power of 2 of each sector (8 --> 256 bytes) */
+	uint8_t size_exp;
+	/* Minimal write size for the sectors in this bank */
+	uint8_t write_size_exp;
+	/* Erase size for the sectors in this bank */
+	uint8_t erase_size_exp;
+	/* Size for write protection, usually identical to erase size. */
+	uint8_t protect_size_exp;
+	/* Reserved; set 0; ignore on read */
+	uint8_t reserved[2];
+};
+
+struct ec_response_flash_info_2 {
+	/* Total flash in the EC. */
+	uint32_t flash_size;
+	/* Flags; see EC_FLASH_INFO_* */
+	uint32_t flags;
+	/* Maximum size to use to send data to write to the EC. */
+	uint32_t write_ideal_size;
+	/* Number of banks present in the EC. */
+	uint16_t num_banks_total;
+	/* Number of banks described in banks array. */
+	uint16_t num_banks_desc;
+	struct ec_flash_bank banks[0];
+} __ec_align4;
+
 /*
  * Read flash
  *
@@ -1208,7 +1260,7 @@ struct ec_params_flash_write {
 #define EC_CMD_FLASH_ERASE 0x0013
 
 /**
- * struct ec_params_flash_erase - Parameters for the flash erase command.
+ * struct ec_params_flash_erase - Parameters for the flash erase command, v0.
  * @offset: Byte offset to erase.
  * @size: Size to erase in bytes.
  */
@@ -1217,6 +1269,43 @@ struct ec_params_flash_erase {
 	uint32_t size;
 } __ec_align4;
 
+/*
+ * v1 add async erase:
+ * subcommands can returns:
+ * EC_RES_SUCCESS : erased (see ERASE_SECTOR_ASYNC case below).
+ * EC_RES_INVALID_PARAM : offset/size are not aligned on a erase boundary.
+ * EC_RES_ERROR : other errors.
+ * EC_RES_BUSY : an existing erase operation is in progress.
+ * EC_RES_ACCESS_DENIED: Trying to erase running image.
+ *
+ * When ERASE_SECTOR_ASYNC returns EC_RES_SUCCESS, the operation is just
+ * properly queued. The user must call ERASE_GET_RESULT subcommand to get
+ * the proper result.
+ * When ERASE_GET_RESULT returns EC_RES_BUSY, the caller must wait and send
+ * ERASE_GET_RESULT again to get the result of ERASE_SECTOR_ASYNC.
+ * ERASE_GET_RESULT command may timeout on EC where flash access is not
+ * permitted while erasing. (For instance, STM32F4).
+ */
+enum ec_flash_erase_cmd {
+	FLASH_ERASE_SECTOR,     /* Erase and wait for result */
+	FLASH_ERASE_SECTOR_ASYNC,  /* Erase and return immediately. */
+	FLASH_ERASE_GET_RESULT,  /* Ask for last erase result */
+};
+
+/**
+ * struct ec_params_flash_erase_v1 - Parameters for the flash erase command, v1.
+ * @cmd: One of ec_flash_erase_cmd.
+ * @reserved: Pad byte; currently always contains 0.
+ * @flag: No flags defined yet; set to 0.
+ * @params: Same as v0 parameters.
+ */
+struct ec_params_flash_erase_v1 {
+	uint8_t  cmd;
+	uint8_t  reserved;
+	uint16_t flag;
+	struct ec_params_flash_erase params;
+} __ec_align4;
+
 /*
  * Get/set flash protection.
  *
@@ -1252,6 +1341,15 @@ struct ec_params_flash_erase {
 #define EC_FLASH_PROTECT_ERROR_INCONSISTENT BIT(5)
 /* Entire flash code protected when the EC boots */
 #define EC_FLASH_PROTECT_ALL_AT_BOOT        BIT(6)
+/* RW flash code protected when the EC boots */
+#define EC_FLASH_PROTECT_RW_AT_BOOT         BIT(7)
+/* RW flash code protected now. */
+#define EC_FLASH_PROTECT_RW_NOW             BIT(8)
+/* Rollback information flash region protected when the EC boots */
+#define EC_FLASH_PROTECT_ROLLBACK_AT_BOOT   BIT(9)
+/* Rollback information flash region protected now */
+#define EC_FLASH_PROTECT_ROLLBACK_NOW       BIT(10)
+
 
 /**
  * struct ec_params_flash_protect - Parameters for the flash protect command.
@@ -1290,16 +1388,31 @@ struct ec_response_flash_protect {
 enum ec_flash_region {
 	/* Region which holds read-only EC image */
 	EC_FLASH_REGION_RO = 0,
-	/* Region which holds rewritable EC image */
-	EC_FLASH_REGION_RW,
+	/*
+	 * Region which holds active RW image. 'Active' is different from
+	 * 'running'. Active means 'scheduled-to-run'. Since RO image always
+	 * scheduled to run, active/non-active applies only to RW images (for
+	 * the same reason 'update' applies only to RW images. It's a state of
+	 * an image on a flash. Running image can be RO, RW_A, RW_B but active
+	 * image can only be RW_A or RW_B. In recovery mode, an active RW image
+	 * doesn't enter 'running' state but it's still active on a flash.
+	 */
+	EC_FLASH_REGION_ACTIVE,
 	/*
 	 * Region which should be write-protected in the factory (a superset of
 	 * EC_FLASH_REGION_RO)
 	 */
 	EC_FLASH_REGION_WP_RO,
+	/* Region which holds updatable (non-active) RW image */
+	EC_FLASH_REGION_UPDATE,
 	/* Number of regions */
 	EC_FLASH_REGION_COUNT,
 };
+/*
+ * 'RW' is vague if there are multiple RW images; we mean the active one,
+ * so the old constant is deprecated.
+ */
+#define EC_FLASH_REGION_RW EC_FLASH_REGION_ACTIVE
 
 /**
  * struct ec_params_flash_region_info - Parameters for the flash region info
@@ -1334,6 +1447,37 @@ struct ec_response_vbnvcontext {
 	uint8_t block[EC_VBNV_BLOCK_SIZE];
 } __ec_align4;
 
+
+/* Get SPI flash information */
+#define EC_CMD_FLASH_SPI_INFO 0x0018
+
+struct ec_response_flash_spi_info {
+	/* JEDEC info from command 0x9F (manufacturer, memory type, size) */
+	uint8_t jedec[3];
+
+	/* Pad byte; currently always contains 0 */
+	uint8_t reserved0;
+
+	/* Manufacturer / device ID from command 0x90 */
+	uint8_t mfr_dev_id[2];
+
+	/* Status registers from command 0x05 and 0x35 */
+	uint8_t sr1, sr2;
+} __ec_align1;
+
+
+/* Select flash during flash operations */
+#define EC_CMD_FLASH_SELECT 0x0019
+
+/**
+ * struct ec_params_flash_select - Parameters for the flash select command.
+ * @select: 1 to select flash, 0 to deselect flash
+ */
+struct ec_params_flash_select {
+	uint8_t select;
+} __ec_align4;
+
+
 /*****************************************************************************/
 /* PWM commands */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
