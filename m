Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B744413558
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EBDA1839;
	Sat,  4 May 2019 00:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EBDA1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921701;
	bh=yS2oGB2B+tSj/SJjaXF9HW69M9SAfx/uQZewrCpoUMU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5YDZgKuDsL2C9kP8QeK2BjULJfYbcKjksP2z4ypmfAhVP8eyMbyA3autu9BTzZT4
	 x5h7mkmwWs5ZR2F150b0j7k83Kt1g7WjHH1zwc4yPkudl5KjG8bIRDHFzSa25IYTO2
	 mCUgi7To+UvfUfFNm9D/AO6mMVJT0BPlnXF0AJfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78085F8977B;
	Sat,  4 May 2019 00:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 757B5F89756; Sat,  4 May 2019 00:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A137F8973C
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A137F8973C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ao+NzMz/"
Received: by mail-pl1-x644.google.com with SMTP id o5so3302170pls.12
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bSuxoZ7+qYB19ztbsWp6BeCaVFDU7BjmtK6s9ryilDs=;
 b=Ao+NzMz/+/OEYvZWA3aRImeh+izLu7ADfRtCMc/YP7vKVJ/CtYBT3w1bew7nYm8vUJ
 r176MgFGsI2YE0lYETFQEpDaXDdYuMp5q95QVCYpm2kRysjgyQABlr4y7vbCRP831LIS
 yUHVKDUR0tAmiTNyPa3IjSkhuvATh2jBzCY+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bSuxoZ7+qYB19ztbsWp6BeCaVFDU7BjmtK6s9ryilDs=;
 b=Fr/r8yeV28jH7hknkNrJfHkI3CzhdHWvLsT2ZUyisUQesVPw9lQnURVMxm6UE1WD9u
 JX441pWMwG2nZNkG01sHVkb+ENCybPf4crzsYKIOcNFjjic66kqFW/PCQki8o7clvtgy
 dNfP4Ij6YdKY96yUCvvrs1+lkcp4YsfsoOETpThDoIQ9nsQ42HqwVynoKi3huXPDF23C
 p37BvrRJhFykl9fpfZ6+iVZWVR0fYjEA6zWHajpCpuflRaarxvZk2KKSSEL7QwR/Ak1q
 NPHt/13FZvLYoLDSbPf2ITlLl6CkDX047cZYLFxa/C6WprxlbJCsAMwrSmMOJrcI7ynn
 anLA==
X-Gm-Message-State: APjAAAVUPPUZh6gYiyzNd29HCw9kKfbOAHJDrE5ponRs1sFuOERc/TP9
 AuUQApJC/ENvG6nqD9Nbt4j5Og==
X-Google-Smtp-Source: APXvYqx5iDGBZFLs41qnvLeFfoo8z02V77Yp1/nm8OQcOzyhBV726RNWuFdfN2FqD7es15wrqCGfuw==
X-Received: by 2002:a17:902:bd4b:: with SMTP id
 b11mr13654767plx.68.1556920989636; 
 Fri, 03 May 2019 15:03:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id o81sm6009287pfa.156.2019.05.03.15.03.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:08 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:19 -0700
Message-Id: <20190503220233.64546-17-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 16/30] mfd: cros_ec: Fix event processing API
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

Improve API between EC and Host to report events.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 115 ++++++++++++++++++++++++---
 1 file changed, 105 insertions(+), 10 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 594db631452f..2d59b4480876 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -500,7 +500,8 @@ enum host_event_code {
 	EC_HOST_EVENT_BATTERY_CRITICAL = 7,
 	EC_HOST_EVENT_BATTERY = 8,
 	EC_HOST_EVENT_THERMAL_THRESHOLD = 9,
-	EC_HOST_EVENT_THERMAL_OVERLOAD = 10,
+	/* Event generated by a device attached to the EC */
+	EC_HOST_EVENT_DEVICE = 10,
 	EC_HOST_EVENT_THERMAL = 11,
 	EC_HOST_EVENT_USB_CHARGER = 12,
 	EC_HOST_EVENT_KEY_PRESSED = 13,
@@ -527,15 +528,34 @@ enum host_event_code {
 	EC_HOST_EVENT_HANG_DETECT = 20,
 	/* Hang detect logic detected a hang and warm rebooted the AP */
 	EC_HOST_EVENT_HANG_REBOOT = 21,
+
 	/* PD MCU triggering host event */
 	EC_HOST_EVENT_PD_MCU = 22,
 
-	/* EC desires to change state of host-controlled USB mux */
-	EC_HOST_EVENT_USB_MUX = 28,
+	/* Battery Status flags have changed */
+	EC_HOST_EVENT_BATTERY_STATUS = 23,
+
+	/* EC encountered a panic, triggering a reset */
+	EC_HOST_EVENT_PANIC = 24,
+
+	/* Keyboard fastboot combo has been pressed */
+	EC_HOST_EVENT_KEYBOARD_FASTBOOT = 25,
 
 	/* EC RTC event occurred */
 	EC_HOST_EVENT_RTC = 26,
 
+	/* Emulate MKBP event */
+	EC_HOST_EVENT_MKBP = 27,
+
+	/* EC desires to change state of host-controlled USB mux */
+	EC_HOST_EVENT_USB_MUX = 28,
+
+	/* TABLET/LAPTOP mode or detachable base attach/detach event */
+	EC_HOST_EVENT_MODE_CHANGE = 29,
+
+	/* Keyboard recovery combo with hardware reinitialization */
+	EC_HOST_EVENT_KEYBOARD_RECOVERY_HW_REINIT = 30,
+
 	/*
 	 * The high bit of the event mask is not used as a host event code.  If
 	 * it reads back as set, then the entire event mask should be
@@ -1227,10 +1247,40 @@ enum ec_feature_code {
 	EC_FEATURE_USB_MUX = 23,
 	/* Motion Sensor code has an internal software FIFO */
 	EC_FEATURE_MOTION_SENSE_FIFO = 24,
+	/* Support temporary secure vstore */
+	EC_FEATURE_VSTORE = 25,
+	/* EC decides on USB-C SS mux state, muxes configured by host */
+	EC_FEATURE_USBC_SS_MUX_VIRTUAL = 26,
 	/* EC has RTC feature that can be controlled by host commands */
 	EC_FEATURE_RTC = 27,
+	/* The MCU exposes a Fingerprint sensor */
+	EC_FEATURE_FINGERPRINT = 28,
+	/* The MCU exposes a Touchpad */
+	EC_FEATURE_TOUCHPAD = 29,
+	/* The MCU has RWSIG task enabled */
+	EC_FEATURE_RWSIG = 30,
+	/* EC has device events support */
+	EC_FEATURE_DEVICE_EVENT = 31,
+	/* EC supports the unified wake masks for LPC/eSPI systems */
+	EC_FEATURE_UNIFIED_WAKE_MASKS = 32,
+	/* EC supports 64-bit host events */
+	EC_FEATURE_HOST_EVENT64 = 33,
+	/* EC runs code in RAM (not in place, a.k.a. XIP) */
+	EC_FEATURE_EXEC_IN_RAM = 34,
 	/* EC supports CEC commands */
 	EC_FEATURE_CEC = 35,
+	/* EC supports tight sensor timestamping. */
+	EC_FEATURE_MOTION_SENSE_TIGHT_TIMESTAMPS = 36,
+	/*
+	 * EC supports tablet mode detection aligned to Chrome and allows
+	 * setting of threshold by host command using
+	 * MOTIONSENSE_CMD_TABLET_MODE_LID_ANGLE.
+	 */
+	EC_FEATURE_REFINED_TABLET_MODE_HYSTERESIS = 37,
+	/* EC supports audio codec. */
+	EC_FEATURE_AUDIO_CODEC = 38,
+	/* The MCU is a System Companion Processor (SCP). */
+	EC_FEATURE_SCP = 39,
 	/* The MCU is an Integrated Sensor Hub */
 	EC_FEATURE_ISH = 40,
 };
@@ -3153,12 +3203,23 @@ struct ec_result_keyscan_seq_ctrl {
 } __ec_todo_packed;
 
 /*
- * Command for retrieving the next pending MKBP event from the EC device
+ * Get the next pending MKBP event.
  *
- * The device replies with UNAVAILABLE if there aren't any pending events.
+ * Returns EC_RES_UNAVAILABLE if there is no event pending.
  */
 #define EC_CMD_GET_NEXT_EVENT 0x0067
 
+#define EC_MKBP_HAS_MORE_EVENTS_SHIFT 7
+
+/*
+ * We use the most significant bit of the event type to indicate to the host
+ * that the EC has more MKBP events available to provide.
+ */
+#define EC_MKBP_HAS_MORE_EVENTS BIT(EC_MKBP_HAS_MORE_EVENTS_SHIFT)
+
+/* The mask to apply to get the raw event type */
+#define EC_MKBP_EVENT_TYPE_MASK (BIT(EC_MKBP_HAS_MORE_EVENTS_SHIFT) - 1)
+
 enum ec_mkbp_event {
 	/* Keyboard matrix changed. The event data is the new matrix state. */
 	EC_MKBP_EVENT_KEY_MATRIX = 0,
@@ -3175,9 +3236,21 @@ enum ec_mkbp_event {
 	/* The state of the switches have changed. */
 	EC_MKBP_EVENT_SWITCH = 4,
 
-	/* EC sent a sysrq command */
+	/* New Fingerprint sensor event, the event data is fp_events bitmap. */
+	EC_MKBP_EVENT_FINGERPRINT = 5,
+
+	/*
+	 * Sysrq event: send emulated sysrq. The event data is sysrq,
+	 * corresponding to the key to be pressed.
+	 */
 	EC_MKBP_EVENT_SYSRQ = 6,
 
+	/*
+	 * New 64-bit host event.
+	 * The event data is 8 bytes of host event flags.
+	 */
+	EC_MKBP_EVENT_HOST_EVENT64 = 7,
+
 	/* Notify the AP that something happened on CEC */
 	EC_MKBP_EVENT_CEC_EVENT = 8,
 
@@ -3187,12 +3260,14 @@ enum ec_mkbp_event {
 	/* Number of MKBP events */
 	EC_MKBP_EVENT_COUNT,
 };
+BUILD_ASSERT(EC_MKBP_EVENT_COUNT <= EC_MKBP_EVENT_TYPE_MASK);
 
 union __ec_align_offset1 ec_response_get_next_data {
 	uint8_t key_matrix[13];
 
 	/* Unaligned */
-	uint32_t  host_event;
+	uint32_t host_event;
+	uint64_t host_event64;
 
 	struct __ec_todo_unpacked {
 		/* For aligning the fifo_info */
@@ -3200,14 +3275,25 @@ union __ec_align_offset1 ec_response_get_next_data {
 		struct ec_response_motion_sense_fifo_info info;
 	} sensor_fifo;
 
-	uint32_t   buttons;
-	uint32_t   switches;
-	uint32_t   sysrq;
+	uint32_t buttons;
+
+	uint32_t switches;
+
+	uint32_t fp_events;
+
+	uint32_t sysrq;
+
+	/* CEC events from enum mkbp_cec_event */
+	uint32_t cec_events;
 };
 
 union __ec_align_offset1 ec_response_get_next_data_v1 {
 	uint8_t key_matrix[16];
+
+	/* Unaligned */
 	uint32_t host_event;
+	uint64_t host_event64;
+
 	struct __ec_todo_unpacked {
 		/* For aligning the fifo_info */
 		uint8_t reserved[3];
@@ -3215,11 +3301,19 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
 	} sensor_fifo;
 
 	uint32_t buttons;
+
 	uint32_t switches;
+
+	uint32_t fp_events;
+
 	uint32_t sysrq;
+
+	/* CEC events from enum mkbp_cec_event */
 	uint32_t cec_events;
+
 	uint8_t cec_message[16];
 };
+BUILD_ASSERT(sizeof(union ec_response_get_next_data_v1) == 16);
 
 struct ec_response_get_next_event {
 	uint8_t event_type;
@@ -3238,6 +3332,7 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_POWER_BUTTON	0
 #define EC_MKBP_VOL_UP		1
 #define EC_MKBP_VOL_DOWN	2
+#define EC_MKBP_RECOVERY	3
 
 /* Switches */
 #define EC_MKBP_LID_OPEN	0
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
