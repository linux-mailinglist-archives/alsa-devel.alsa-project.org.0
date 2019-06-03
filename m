Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E145C33883
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7998484A;
	Mon,  3 Jun 2019 20:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7998484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587620;
	bh=55Gm4PY7b/innnrp3uVO8Alc9dHW2ic3lb0m01SmnsI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+VP7sjuQz00isgUHJFc61ocxB187jmQU11657RTa0Mx17boWYYunFsI6XdgFezKo
	 RJYbDPeDd0LnPivkM6YoXwPk9bGaMdPAR7tpBqtmfxsEswoT1OnONfGLgiqqtyw9Mq
	 WcG+zGGQ3k4lXG/RvMZ63/EzY06s0E1LfQQf4Mg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A3EFF8978A;
	Mon,  3 Jun 2019 20:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D537F8975D; Mon,  3 Jun 2019 20:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0473BF89758
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0473BF89758
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bU53spTy"
Received: by mail-pf1-x442.google.com with SMTP id c6so11095279pfa.10
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLotqMclXyUlsuW9uQH9zagpLzLAMXTXKDHLBiZ5Jx0=;
 b=bU53spTyGL0bwgDWJ8RSomAY/DiTTZe/GalaxudAB8o80pwlxsY4SnPJd2xb6X0Oky
 OB7viqpou48zgpy7FRsGSUw+3cTaKX9cuF+pcYlx5qRQye85XS1byCXGSkKBkdkFbso2
 btEF7mn3YgqbZ5BakafG01jqy8eoURU5Zqrc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BLotqMclXyUlsuW9uQH9zagpLzLAMXTXKDHLBiZ5Jx0=;
 b=URtrkyaFoyLEeAadkVUikycIE85D6OXrVYrqQec2Avqlz9ayHZDF7OKzk+M1fvw0e3
 MYY7UJcxxOlCzhJwQCy1dAkhhEMNgyt4FwfmdmKWysjUbr6Im+TrJMALEarrq36wfm1g
 NOScgLomMYfNP6fiOcWKEXfRwJnhyA8K+Mw6vQ3WKVNoZ2CXFQtTNj1GpLxVosASmC2S
 EIAx8toonv7PWfTwy9XswVz4y9fgTmNG7KN+gh+zE8xi/7G4AwdtyxqJdXw45FtJjv/o
 Rx6CEcjdI5V0WIFGjDMoYAua4adfBIUGRvMniaBSoqioS3vt5N1KeW0Gb/NGoAI3ZUma
 /gBg==
X-Gm-Message-State: APjAAAVeTO1RLmSdsrDlFDWGhetv+rP2UbyVzapH/lwQ7EAfs4KhjIpe
 4/Wx4xAjy+0xA/4SPjrxA5/BGg==
X-Google-Smtp-Source: APXvYqxMA9eqMtgQwAWWeHljRzV8T6ilTCq5psNZnE9OFwCs7L2n0w0oI83qqJXUPljhkDYAWUVvnw==
X-Received: by 2002:a17:90a:216c:: with SMTP id
 a99mr17861873pje.3.1559586870955; 
 Mon, 03 Jun 2019 11:34:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id 10sm989774pfh.179.2019.06.03.11.34.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:30 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:47 -0700
Message-Id: <20190603183401.151408-17-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 16/30] mfd: cros_ec: Fix event
	processing API
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
Acked-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 87 ++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 11 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 701b03cfa445..51fe65170ce6 100644
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
@@ -1259,7 +1279,7 @@ enum ec_feature_code {
 	EC_FEATURE_REFINED_TABLET_MODE_HYSTERESIS = 37,
 	/* EC supports audio codec. */
 	EC_FEATURE_AUDIO_CODEC = 38,
-	/* EC Supports SCP. */
+	/* The MCU is a System Companion Processor (SCP). */
 	EC_FEATURE_SCP = 39,
 	/* The MCU is an Integrated Sensor Hub */
 	EC_FEATURE_ISH = 40,
@@ -3183,12 +3203,23 @@ struct ec_result_keyscan_seq_ctrl {
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
@@ -3205,9 +3236,21 @@ enum ec_mkbp_event {
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
 
@@ -3217,12 +3260,14 @@ enum ec_mkbp_event {
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
@@ -3230,14 +3275,25 @@ union __ec_align_offset1 ec_response_get_next_data {
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
@@ -3245,11 +3301,19 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
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
@@ -3268,6 +3332,7 @@ struct ec_response_get_next_event_v1 {
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
