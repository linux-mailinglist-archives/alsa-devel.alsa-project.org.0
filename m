Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF119492
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296281888;
	Thu,  9 May 2019 23:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296281888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437061;
	bh=W7AGg+/ksyi/+P34OJu0uKf7PQGqpd/cUiiQluD65kM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/IurCUEQf7UCVVO6wH0JrGzOxzYiscwJ+NCFdIptaTtFGdsLE7ZEYn6sX/A7DT+P
	 h9IpbvSDIxFaKA1Fk3npMjDBVzHOJPQGglTDnhC/WmCj838rjg1xJH5jSOasy8qTw/
	 RAfXfMPT52paC0BfSjAlbz2UlbMCEgINaP4PCSgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF25FF89773;
	Thu,  9 May 2019 23:14:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7771F89750; Thu,  9 May 2019 23:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A52F89732
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A52F89732
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ikiqJjbl"
Received: by mail-pf1-x441.google.com with SMTP id u17so1951699pfn.7
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjD70egNJa0bWRCM3mWm+Y3jFJFiZloqPeAQ9dZL65s=;
 b=ikiqJjblS+fQtPXMsXiF4xrITMT4K7JPsjpUMPZ2qF3G7U9uJgPRuVTCWl6k2sbHQJ
 BJ+XDDAbh/TBK52T7SHd9FYULFPSwNxOGfH4NrASleMhPo+VdhVPZZsPxajc7bsNdpzu
 WKjiJ/dfum5eKOAMuRxnfHWGrNVDQpWSs3Bso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjD70egNJa0bWRCM3mWm+Y3jFJFiZloqPeAQ9dZL65s=;
 b=ZcFfHzYjjQ8hF6Wfd1F5xTPexxrqoJBP/AeLQIdvLBZ0/NnEw9ucvVTd15mUVJfPqv
 7RR95s6G74jlC0K+wBFYVkzm3rGrL5WLrC/m8yhQxJI/+OhCYdYde0pcwyif5IJlkmsl
 /0Zc6akYUUzXJecs63sE1UV50QQRKnqEHWFBseueB875z9vfpjXUkpZjVEu6feEqr9oB
 lOdUlBTA4pjDG32nCy46AqrQCgvDg7kfXeKyHzh36/N9mN6WBB2dEWCeRDKcX/gju1VX
 jg07/nRN6RJO4ZASTwBT/BBPHzAhBeKZ1ihXU1Xz7eWcsQicEA23SfxkNzPx2ruWZ+OU
 9MEw==
X-Gm-Message-State: APjAAAUl72IeCySFzTOewR5m5TjrETloFMk5uVlLqg9AnJKPSMEam/Ck
 y8rWn8K4eu6EbK3C51H8l6r5RQ==
X-Google-Smtp-Source: APXvYqw3LC+kAnV5JsjEZvQK+vrOXKMWUrM42DnEQLFc9wnBPmNZc0J12yJPGp2ytD5mN+2UzABKcQ==
X-Received: by 2002:a63:b1d:: with SMTP id 29mr8622490pgl.103.1557436461199;
 Thu, 09 May 2019 14:14:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id k6sm227261pfi.86.2019.05.09.14.14.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:20 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:35 -0700
Message-Id: <20190509211353.213194-13-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 12/30] mfd: cros_ec: Add lightbar v2 API
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

New API split commands, improve EC command latency.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 124 ++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 4 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 2b3a94a4f0f4..0ff1941288cf 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -1658,7 +1658,10 @@ struct lightbar_params_v1 {
 	int32_t s3_sleep_for;
 	int32_t s3_ramp_up;
 	int32_t s3_ramp_down;
+	int32_t s5_ramp_up;
+	int32_t s5_ramp_down;
 	int32_t tap_tick_delay;
+	int32_t tap_gate_delay;
 	int32_t tap_display_time;
 
 	/* Tap-for-battery params */
@@ -1686,11 +1689,82 @@ struct lightbar_params_v1 {
 	uint8_t s0_idx[2][LB_BATTERY_LEVELS];	/* AP is running */
 	uint8_t s3_idx[2][LB_BATTERY_LEVELS];	/* AP is sleeping */
 
+	/* s5: single color pulse on inhibited power-up */
+	uint8_t s5_idx;
+
 	/* Color palette */
 	struct rgb_s color[8];			/* 0-3 are Google colors */
 } __ec_todo_packed;
 
-/* Lightbar program */
+/* Lightbar command params v2
+ * crbug.com/467716
+ *
+ * lightbar_parms_v1 was too big for i2c, therefore in v2, we split them up by
+ * logical groups to make it more manageable ( < 120 bytes).
+ *
+ * NOTE: Each of these groups must be less than 120 bytes.
+ */
+
+struct lightbar_params_v2_timing {
+	/* Timing */
+	int32_t google_ramp_up;
+	int32_t google_ramp_down;
+	int32_t s3s0_ramp_up;
+	int32_t s0_tick_delay[2];		/* AC=0/1 */
+	int32_t s0a_tick_delay[2];		/* AC=0/1 */
+	int32_t s0s3_ramp_down;
+	int32_t s3_sleep_for;
+	int32_t s3_ramp_up;
+	int32_t s3_ramp_down;
+	int32_t s5_ramp_up;
+	int32_t s5_ramp_down;
+	int32_t tap_tick_delay;
+	int32_t tap_gate_delay;
+	int32_t tap_display_time;
+} __ec_todo_packed;
+
+struct lightbar_params_v2_tap {
+	/* Tap-for-battery params */
+	uint8_t tap_pct_red;
+	uint8_t tap_pct_green;
+	uint8_t tap_seg_min_on;
+	uint8_t tap_seg_max_on;
+	uint8_t tap_seg_osc;
+	uint8_t tap_idx[3];
+} __ec_todo_packed;
+
+struct lightbar_params_v2_oscillation {
+	/* Oscillation */
+	uint8_t osc_min[2];			/* AC=0/1 */
+	uint8_t osc_max[2];			/* AC=0/1 */
+	uint8_t w_ofs[2];			/* AC=0/1 */
+} __ec_todo_packed;
+
+struct lightbar_params_v2_brightness {
+	/* Brightness limits based on the backlight and AC. */
+	uint8_t bright_bl_off_fixed[2];		/* AC=0/1 */
+	uint8_t bright_bl_on_min[2];		/* AC=0/1 */
+	uint8_t bright_bl_on_max[2];		/* AC=0/1 */
+} __ec_todo_packed;
+
+struct lightbar_params_v2_thresholds {
+	/* Battery level thresholds */
+	uint8_t battery_threshold[LB_BATTERY_LEVELS - 1];
+} __ec_todo_packed;
+
+struct lightbar_params_v2_colors {
+	/* Map [AC][battery_level] to color index */
+	uint8_t s0_idx[2][LB_BATTERY_LEVELS];	/* AP is running */
+	uint8_t s3_idx[2][LB_BATTERY_LEVELS];	/* AP is sleeping */
+
+	/* s5: single color pulse on inhibited power-up */
+	uint8_t s5_idx;
+
+	/* Color palette */
+	struct rgb_s color[8];			/* 0-3 are Google colors */
+} __ec_todo_packed;
+
+/* Lightbar program. */
 #define EC_LB_PROG_LEN 192
 struct lightbar_program {
 	uint8_t size;
@@ -1704,7 +1778,10 @@ struct ec_params_lightbar {
 		 * The following commands have no args:
 		 *
 		 * dump, off, on, init, get_seq, get_params_v0, get_params_v1,
-		 * version, get_brightness, get_demo, suspend, resume
+		 * version, get_brightness, get_demo, suspend, resume,
+		 * get_params_v2_timing, get_params_v2_tap, get_params_v2_osc,
+		 * get_params_v2_bright, get_params_v2_thlds,
+		 * get_params_v2_colors
 		 *
 		 * Don't use an empty struct, because C++ hates that.
 		 */
@@ -1731,6 +1808,14 @@ struct ec_params_lightbar {
 
 		struct lightbar_params_v0 set_params_v0;
 		struct lightbar_params_v1 set_params_v1;
+
+		struct lightbar_params_v2_timing set_v2par_timing;
+		struct lightbar_params_v2_tap set_v2par_tap;
+		struct lightbar_params_v2_oscillation set_v2par_osc;
+		struct lightbar_params_v2_brightness set_v2par_bright;
+		struct lightbar_params_v2_thresholds set_v2par_thlds;
+		struct lightbar_params_v2_colors set_v2par_colors;
+
 		struct lightbar_program set_program;
 	};
 } __ec_todo_packed;
@@ -1752,6 +1837,14 @@ struct ec_response_lightbar {
 		struct lightbar_params_v0 get_params_v0;
 		struct lightbar_params_v1 get_params_v1;
 
+
+		struct lightbar_params_v2_timing get_params_v2_timing;
+		struct lightbar_params_v2_tap get_params_v2_tap;
+		struct lightbar_params_v2_oscillation get_params_v2_osc;
+		struct lightbar_params_v2_brightness get_params_v2_bright;
+		struct lightbar_params_v2_thresholds get_params_v2_thlds;
+		struct lightbar_params_v2_colors get_params_v2_colors;
+
 		struct __ec_todo_unpacked {
 			uint32_t num;
 			uint32_t flags;
@@ -1764,9 +1857,11 @@ struct ec_response_lightbar {
 		/*
 		 * The following commands have no response:
 		 *
-		 * off, on, init, set_brightness, seq, reg, set_rgb,
+		 * off, on, init, set_brightness, seq, reg, set_rgb, demo,
 		 * set_params_v0, set_params_v1, set_program,
-		 * manual_suspend_ctrl, suspend, resume
+		 * manual_suspend_ctrl, suspend, resume, set_v2par_timing,
+		 * set_v2par_tap, set_v2par_osc, set_v2par_bright,
+		 * set_v2par_thlds, set_v2par_colors
 		 */
 	};
 } __ec_todo_packed;
@@ -1795,6 +1890,18 @@ enum lightbar_command {
 	LIGHTBAR_CMD_MANUAL_SUSPEND_CTRL = 19,
 	LIGHTBAR_CMD_SUSPEND = 20,
 	LIGHTBAR_CMD_RESUME = 21,
+	LIGHTBAR_CMD_GET_PARAMS_V2_TIMING = 22,
+	LIGHTBAR_CMD_SET_PARAMS_V2_TIMING = 23,
+	LIGHTBAR_CMD_GET_PARAMS_V2_TAP = 24,
+	LIGHTBAR_CMD_SET_PARAMS_V2_TAP = 25,
+	LIGHTBAR_CMD_GET_PARAMS_V2_OSCILLATION = 26,
+	LIGHTBAR_CMD_SET_PARAMS_V2_OSCILLATION = 27,
+	LIGHTBAR_CMD_GET_PARAMS_V2_BRIGHTNESS = 28,
+	LIGHTBAR_CMD_SET_PARAMS_V2_BRIGHTNESS = 29,
+	LIGHTBAR_CMD_GET_PARAMS_V2_THRESHOLDS = 30,
+	LIGHTBAR_CMD_SET_PARAMS_V2_THRESHOLDS = 31,
+	LIGHTBAR_CMD_GET_PARAMS_V2_COLORS = 32,
+	LIGHTBAR_CMD_SET_PARAMS_V2_COLORS = 33,
 	LIGHTBAR_NUM_CMDS
 };
 
@@ -1813,6 +1920,14 @@ enum ec_led_id {
 	EC_LED_ID_POWER_LED,
 	/* LED on power adapter or its plug */
 	EC_LED_ID_ADAPTER_LED,
+	/* LED to indicate left side */
+	EC_LED_ID_LEFT_LED,
+	/* LED to indicate right side */
+	EC_LED_ID_RIGHT_LED,
+	/* LED to indicate recovery mode with HW_REINIT */
+	EC_LED_ID_RECOVERY_HW_REINIT_LED,
+	/* LED to indicate sysrq debug mode. */
+	EC_LED_ID_SYSRQ_DEBUG_LED,
 
 	EC_LED_ID_COUNT
 };
@@ -1827,6 +1942,7 @@ enum ec_led_colors {
 	EC_LED_COLOR_BLUE,
 	EC_LED_COLOR_YELLOW,
 	EC_LED_COLOR_WHITE,
+	EC_LED_COLOR_AMBER,
 
 	EC_LED_COLOR_COUNT
 };
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
