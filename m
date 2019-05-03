Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90A1353A
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:06:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C76E182B;
	Sat,  4 May 2019 00:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C76E182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921188;
	bh=jea942D3zRNXLEMCYBrBsw5GCi3p3siQAT2YNyJPjn0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=swAk4islwG/+nPnCbh9bqayxe6BZeqmq8MYDroAglks6biLx9mA9b3NwpXLJ0mmbn
	 LRVfZrxgCZtWxMapyG8W67WG5hHJ5+1YoI0H7RjnemVdxGtRMks3hBFVRYbtrDsQGa
	 Nas8oWf8ukzZ0U3oDCDTtO7h02r/S/+z1DO+NGEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA6BF89732;
	Sat,  4 May 2019 00:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 013EAF896E2; Sat,  4 May 2019 00:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E58F3F896B9
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58F3F896B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="g1NhTcYt"
Received: by mail-pf1-x441.google.com with SMTP id y13so3526872pfm.11
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KZ7ZFFXG9FmEd4ZAtYZzYgUA5iz2DGOn0dBk9pvKVUQ=;
 b=g1NhTcYtMRpYtte5UQBtSUNhkEwxm7fUiJ3OruF3Dj/lD6yVRRAWPYTqhSz1sSBejH
 0NLwvqQEVfgsuMuoxAizShVsPEbOUjsIZpI0QL0Uuz+f9dhOmPtdENoJ5yOFGqEkUodU
 dqBA3DeZlWBVRdg0mpaPqgKjBOxADH7x4CVtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KZ7ZFFXG9FmEd4ZAtYZzYgUA5iz2DGOn0dBk9pvKVUQ=;
 b=A+El7ZYZU8/kbIKcA1chs5hwCPy1ojxeEXBMyfi1X0AtNqVNecK4y2OkrvzM/p4cCI
 t9A6c+L3IdvWeXNSvWep3NVzVaFWqm2BmXiE0muQDHLd/TnIjzXBOMEikEFVOP4mvsZW
 iU8RHdtW4w8itklk1ikItkMqFaGVajiiYr0YNpseuI0A9w/Vcut9karVTPJQqDA76CyB
 x6z39+ndNbW6WAqG8nDOcRXxakMslYvXNEMkpB3l8tajiHWCzujvgfN32lmncuIs8w4d
 GifGgi3HPARGFYaaDEss/lz8Exfbqp2GU//4iDHxjBW6V9LCaDD18mkh3KUzgwjABedc
 tPlA==
X-Gm-Message-State: APjAAAXdcV9SDue1MWrQ32zGPf0vsgk6pxBUUDkiYfjo37cMZ0sybv3z
 fgul5w6/pN0GHQzjiIoqBd1LlQ==
X-Google-Smtp-Source: APXvYqxiu1XTeCZ582DjAOFx1BHtkCTrv5PcS6CuhJMUetNpsKpA8goHIj17NiSwtnvFeID2kQntRA==
X-Received: by 2002:a62:fb0a:: with SMTP id x10mr14259744pfm.179.1556920967003; 
 Fri, 03 May 2019 15:02:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id p20sm4103985pgj.86.2019.05.03.15.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:02:46 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:06 -0700
Message-Id: <20190503220233.64546-4-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 03/30] mfd: cros_ec: set comments properly
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

Fix comments syntax and spelling errors.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 67 +++++++++++++++++-----------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 374f64caeb5f..43fe1697b18b 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -42,13 +42,16 @@
 /* Protocol version 2 */
 #define EC_LPC_ADDR_HOST_ARGS    0x800  /* And 0x801, 0x802, 0x803 */
 #define EC_LPC_ADDR_HOST_PARAM   0x804  /* For version 2 params; size is
-					 * EC_PROTO2_MAX_PARAM_SIZE */
+					 * EC_PROTO2_MAX_PARAM_SIZE
+					 */
 /* Protocol version 3 */
 #define EC_LPC_ADDR_HOST_PACKET  0x800  /* Offset of version 3 packet */
 #define EC_LPC_HOST_PACKET_SIZE  0x100  /* Max size of version 3 packet */
 
-/* The actual block is 0x800-0x8ff, but some BIOSes think it's 0x880-0x8ff
- * and they tell the kernel that so we have to think of it as two parts. */
+/*
+ * The actual block is 0x800-0x8ff, but some BIOSes think it's 0x880-0x8ff
+ * and they tell the kernel that so we have to think of it as two parts.
+ */
 #define EC_HOST_CMD_REGION0    0x800
 #define EC_HOST_CMD_REGION1    0x880
 #define EC_HOST_CMD_REGION_SIZE 0x80
@@ -324,7 +327,7 @@ struct ec_lpc_host_args {
  * If EC gets a command and this flag is not set, this is an old-style command.
  * Command version is 0 and params from host are at EC_LPC_ADDR_OLD_PARAM with
  * unknown length.  EC must respond with an old-style response (that is,
- * withouth setting EC_HOST_ARGS_FLAG_TO_HOST).
+ * without setting EC_HOST_ARGS_FLAG_TO_HOST).
  */
 #define EC_HOST_ARGS_FLAG_FROM_HOST 0x01
 /*
@@ -511,7 +514,7 @@ struct ec_host_response {
  * Notes on commands:
  *
  * Each command is an 16-bit command value.  Commands which take params or
- * return response data specify structs for that data.  If no struct is
+ * return response data specify structures for that data.  If no structure is
  * specified, the command does not input or output data, respectively.
  * Parameter/response length is implicit in the structs.  Some underlying
  * communication protocols (I2C, SPI) may add length or checksum headers, but
@@ -684,7 +687,7 @@ struct ec_response_get_cmd_versions {
 } __packed;
 
 /*
- * Check EC communcations status (busy). This is needed on i2c/spi but not
+ * Check EC communications status (busy). This is needed on i2c/spi but not
  * on lpc since it has its own out-of-band busy indicator.
  *
  * lpc must read the status from the command register. Attempting this on
@@ -721,7 +724,7 @@ struct ec_response_test_protocol {
 	uint8_t buf[32];
 } __packed;
 
-/* Get prococol information */
+/* Get protocol information */
 #define EC_CMD_GET_PROTOCOL_INFO	0x0b
 
 /* Flags for ec_response_get_protocol_info.flags */
@@ -767,7 +770,7 @@ struct ec_response_get_set_value {
 	uint32_t value;
 } __packed;
 
-/* More than one command can use these structs to get/set paramters. */
+/* More than one command can use these structs to get/set parameters. */
 #define EC_CMD_GSV_PAUSE_IN_S5	0x0c
 
 /*****************************************************************************/
@@ -835,7 +838,7 @@ enum ec_feature_code {
 	 * (Common Smart Battery System Interface Specification)
 	 */
 	EC_FEATURE_SMART_BATTERY = 18,
-	/* EC can dectect when the host hangs. */
+	/* EC can detect when the host hangs. */
 	EC_FEATURE_HANG_DETECT = 19,
 	/* Report power information, for pit only */
 	EC_FEATURE_PMU = 20,
@@ -887,8 +890,10 @@ struct ec_response_flash_info {
 	uint32_t protect_block_size;
 } __packed;
 
-/* Flags for version 1+ flash info command */
-/* EC flash erases bits to 0 instead of 1 */
+/*
+ * Flags for version 1+ flash info command
+ * EC flash erases bits to 0 instead of 1.
+ */
 #define EC_FLASH_INFO_ERASE_TO_0 (1 << 0)
 
 /**
@@ -911,7 +916,8 @@ struct ec_response_flash_info {
  * fields following.
  *
  * gcc anonymous structs don't seem to get along with the __packed directive;
- * if they did we'd define the version 0 struct as a sub-struct of this one.
+ * if they did we'd define the version 0 structure as a sub-structure of this
+ * one.
  */
 struct ec_response_flash_info_1 {
 	/* Version 0 fields; see above for description */
@@ -1006,7 +1012,7 @@ struct ec_params_flash_erase {
  * re-requesting the desired flags, or by a hard reset if that fails.
  */
 #define EC_FLASH_PROTECT_ERROR_INCONSISTENT (1 << 5)
-/* Entile flash code protected when the EC boots */
+/* Entire flash code protected when the EC boots */
 #define EC_FLASH_PROTECT_ALL_AT_BOOT        (1 << 6)
 
 /**
@@ -1599,7 +1605,7 @@ struct ec_response_motion_sensor_data {
 	union {
 		int16_t             data[3];
 		struct {
-			uint16_t    rsvd;
+			uint16_t    reserved;
 			uint32_t    timestamp;
 		} __packed;
 		struct {
@@ -1798,7 +1804,7 @@ struct ec_response_rtc {
 #define EC_CMD_RTC_SET_VALUE 0x46
 #define EC_CMD_RTC_SET_ALARM 0x47
 
-/* Pass as param to SET_ALARM to clear the current alarm */
+/* Pass as time param to SET_ALARM to clear the current alarm */
 #define EC_RTC_ALARM_CLEAR 0
 
 /*****************************************************************************/
@@ -1884,7 +1890,8 @@ enum ec_temp_thresholds {
 	EC_TEMP_THRESH_COUNT
 };
 
-/* Thermal configuration for one temperature sensor. Temps are in degrees K.
+/*
+ * Thermal configuration for one temperature sensor. Temps are in degrees K.
  * Zero values will be silently ignored by the thermal task.
  */
 struct ec_thermal_config {
@@ -1899,8 +1906,10 @@ struct ec_params_thermal_get_threshold_v1 {
 } __packed;
 /* This returns a struct ec_thermal_config */
 
-/* Version 1 - set config for one sensor.
- * Use read-modify-write for best results! */
+/*
+ * Version 1 - set config for one sensor.
+ * Use read-modify-write for best results!
+ */
 struct ec_params_thermal_set_threshold_v1 {
 	uint32_t sensor_num;
 	struct ec_thermal_config cfg;
@@ -2049,7 +2058,12 @@ enum mkbp_config_valid {
 	EC_MKBP_VALID_FIFO_MAX_DEPTH		= 1 << 7,
 };
 
-/* Configuration for our key scanning algorithm */
+/*
+ * Configuration for our key scanning algorithm.
+ *
+ * Note that this is used as a sub-structure of
+ * ec_{params/response}_mkbp_get_config.
+ */
 struct ec_mkbp_config {
 	uint32_t valid_mask;		/* valid fields */
 	uint8_t flags;		/* some flags (enum mkbp_config_flags) */
@@ -2332,6 +2346,7 @@ struct ec_params_gpio_set {
 struct ec_params_gpio_get {
 	char name[32];
 } __packed;
+
 struct ec_response_gpio_get {
 	uint8_t val;
 } __packed;
@@ -2372,8 +2387,10 @@ enum gpio_get_subcmd {
 /* I2C commands. Only available when flash write protect is unlocked. */
 
 /*
- * TODO(crosbug.com/p/23570): These commands are deprecated, and will be
- * removed soon.  Use EC_CMD_I2C_XFER instead.
+ * CAUTION: These commands are deprecated, and are not supported anymore in EC
+ * builds >= 8398.0.0 (see crosbug.com/p/23570).
+ *
+ * Use EC_CMD_I2C_PASSTHRU instead.
  */
 
 /* Read I2C bus */
@@ -2385,6 +2402,7 @@ struct ec_params_i2c_read {
 	uint8_t port;
 	uint8_t offset;
 } __packed;
+
 struct ec_response_i2c_read {
 	uint16_t data;
 } __packed;
@@ -2420,7 +2438,6 @@ struct ec_params_charge_control {
 } __packed;
 
 /*****************************************************************************/
-/* Console commands. Only available when flash write protect is unlocked. */
 
 /* Snapshot console output buffer for use by EC_CMD_CONSOLE_READ. */
 #define EC_CMD_CONSOLE_SNAPSHOT 0x97
@@ -2817,9 +2834,7 @@ enum ec_i2s_config {
 };
 
 struct ec_param_codec_i2s {
-	/*
-	 * enum ec_codec_i2s_subcmd
-	 */
+	/* enum ec_codec_i2s_subcmd */
 	uint8_t cmd;
 	union {
 		/*
@@ -2894,7 +2909,7 @@ struct ec_response_codec_gain {
 enum ec_reboot_cmd {
 	EC_REBOOT_CANCEL = 0,        /* Cancel a pending reboot */
 	EC_REBOOT_JUMP_RO = 1,       /* Jump to RO without rebooting */
-	EC_REBOOT_JUMP_RW = 2,       /* Jump to RW without rebooting */
+	EC_REBOOT_JUMP_RW = 2,       /* Jump to active RW without rebooting */
 	/* (command 3 was jump to RW-B) */
 	EC_REBOOT_COLD = 4,          /* Cold-reboot */
 	EC_REBOOT_DISABLE_JUMP = 5,  /* Disable jump until next reboot */
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
