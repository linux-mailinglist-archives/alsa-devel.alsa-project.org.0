Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4164D194B5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:35:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36361AF2;
	Thu,  9 May 2019 23:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36361AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437756;
	bh=pyzTbN4cmZbWX5ljxUhXrTSuqDTZ+Lj4bxkIHLl5V3I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4/TJll8RqOsXXp8+c78FF4OPn3Qp7sjLrluacuI9uUDJIpuME2ZVk7QFv5qWL15w
	 oRy+/aGVvXCmud0saEtBIECTEnl6N3UhDUDcoyJGMj/US8VWix548fVe/3Ck+fzctx
	 Kezz54Eld+VqJ91AWF2hQVoKN/JAywiA0cMBDjjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FD7F897DC;
	Thu,  9 May 2019 23:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E28AF8979A; Thu,  9 May 2019 23:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF6DCF8978F
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF6DCF8978F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="k4AET8e0"
Received: by mail-pf1-x442.google.com with SMTP id z28so1969615pfk.0
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiRsVnFkoaKdWe3RTNwSS2O9WyZw6tAbpUeMzGn2gBU=;
 b=k4AET8e0CEUJCdG3XMbYtHfngoRH29y57NEPjcyQ1ZRf0Qulf45ap44Qxuu6A8OFXP
 nI3thRaZkI4kgdUg96lw5Pb8pxz2ppWbUdTFL6vR1nXTnVgB0ltQTI//oFXqKTjrLPRg
 J7wdF7o1I/quQGBNUuzfpK3DVrp5eNRcQd2w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiRsVnFkoaKdWe3RTNwSS2O9WyZw6tAbpUeMzGn2gBU=;
 b=CmUV5MYc6VP4gkQid0st6ArlNlZCnvo1D9wqUlkNiZ4tBZGYp9gj9FYzP2E+LU8pTd
 uZ6C7rwZpn+//Nw2JmgI+u6oRueFeHoODQYNz3c5YIoMIZOzdzmcINGSY+LEFR+FK1OE
 1hXLBNvMoHovQPJ8ZEDTnFHUUxbmzbu7NWNK1cPkiFO7+ykrwK2YawnPj19YzA89CCKs
 gYIdTcF4eSyw42QMGyTAl6rTKs1wY281h6Uq2QNDWlaSuD9dyt/nWcQ2nwHDYgc1eGwj
 6oba/c9l8rtNn6sVqjkSmkwZgOI0wSbWf/eOZcQbWPj1ut/em81RprGZJGXNuNsl7vmR
 jVBQ==
X-Gm-Message-State: APjAAAWL8Qzy9lcysqLclIZY0SyUOeYaT+QqUG/A0GgmX4f2B6OjtrVY
 WDRk+UvYeZ0jqXvQXDfGrn/gcw==
X-Google-Smtp-Source: APXvYqzDqLIxCyKyXFHtmN2WxwUd+Y4m0NdE4zowfAFAyu0RmB1SkDroWBx3LwUwq/qBuK9Adgh1ww==
X-Received: by 2002:a63:2c4a:: with SMTP id s71mr8524088pgs.373.1557436487374; 
 Thu, 09 May 2019 14:14:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id z19sm3649946pgk.28.2019.05.09.14.14.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:46 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:52 -0700
Message-Id: <20190509211353.213194-30-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 29/30] mfd: cros_ec: Add Management API
	entry points
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

Add commands for test and management.
Add command space for future development.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 860a76274334..fc8babce1576 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -5176,6 +5176,119 @@ struct ec_params_set_cbi {
 	uint8_t data[];		/* For string and raw data */
 } __ec_align1;
 
+/*
+ * Information about resets of the AP by the EC and the EC's own uptime.
+ */
+#define EC_CMD_GET_UPTIME_INFO 0x0121
+
+struct ec_response_uptime_info {
+	/*
+	 * Number of milliseconds since the last EC boot. Sysjump resets
+	 * typically do not restart the EC's time_since_boot epoch.
+	 *
+	 * WARNING: The EC's sense of time is much less accurate than the AP's
+	 * sense of time, in both phase and frequency.  This timebase is similar
+	 * to CLOCK_MONOTONIC_RAW, but with 1% or more frequency error.
+	 */
+	uint32_t time_since_ec_boot_ms;
+
+	/*
+	 * Number of times the AP was reset by the EC since the last EC boot.
+	 * Note that the AP may be held in reset by the EC during the initial
+	 * boot sequence, such that the very first AP boot may count as more
+	 * than one here.
+	 */
+	uint32_t ap_resets_since_ec_boot;
+
+	/*
+	 * The set of flags which describe the EC's most recent reset.  See
+	 * include/system.h RESET_FLAG_* for details.
+	 */
+	uint32_t ec_reset_flags;
+
+	/* Empty log entries have both the cause and timestamp set to zero. */
+	struct ap_reset_log_entry {
+		/*
+		 * See include/chipset.h: enum chipset_{reset,shutdown}_reason
+		 * for details.
+		 */
+		uint16_t reset_cause;
+
+		/* Reserved for protocol growth. */
+		uint16_t reserved;
+
+		/*
+		 * The time of the reset's assertion, in milliseconds since the
+		 * last EC boot, in the same epoch as time_since_ec_boot_ms.
+		 * Set to zero if the log entry is empty.
+		 */
+		uint32_t reset_time_ms;
+	} recent_ap_reset[4];
+} __ec_align4;
+
+/*
+ * Add entropy to the device secret (stored in the rollback region).
+ *
+ * Depending on the chip, the operation may take a long time (e.g. to erase
+ * flash), so the commands are asynchronous.
+ */
+#define EC_CMD_ADD_ENTROPY	0x0122
+
+enum add_entropy_action {
+	/* Add entropy to the current secret. */
+	ADD_ENTROPY_ASYNC = 0,
+	/*
+	 * Add entropy, and also make sure that the previous secret is erased.
+	 * (this can be implemented by adding entropy multiple times until
+	 * all rolback blocks have been overwritten).
+	 */
+	ADD_ENTROPY_RESET_ASYNC = 1,
+	/* Read back result from the previous operation. */
+	ADD_ENTROPY_GET_RESULT = 2,
+};
+
+struct ec_params_rollback_add_entropy {
+	uint8_t action;
+} __ec_align1;
+
+/*
+ * Perform a single read of a given ADC channel.
+ */
+#define EC_CMD_ADC_READ		0x0123
+
+struct ec_params_adc_read {
+	uint8_t adc_channel;
+} __ec_align1;
+
+struct ec_response_adc_read {
+	int32_t adc_value;
+} __ec_align4;
+
+/*
+ * Read back rollback info
+ */
+#define EC_CMD_ROLLBACK_INFO		0x0124
+
+struct ec_response_rollback_info {
+	int32_t id; /* Incrementing number to indicate which region to use. */
+	int32_t rollback_min_version;
+	int32_t rw_rollback_version;
+} __ec_align4;
+
+
+/* Issue AP reset */
+#define EC_CMD_AP_RESET 0x0125
+
+/*****************************************************************************/
+/* The command range 0x200-0x2FF is reserved for Rotor. */
+
+/*****************************************************************************/
+/*
+ * Reserve a range of host commands for the CR51 firmware.
+ */
+#define EC_CMD_CR51_BASE 0x0300
+#define EC_CMD_CR51_LAST 0x03FF
+
 /*****************************************************************************/
 /* Fingerprint MCU commands: range 0x0400-0x040x */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
