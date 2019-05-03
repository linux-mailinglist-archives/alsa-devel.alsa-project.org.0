Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DF13577
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A12D11825;
	Sat,  4 May 2019 00:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A12D11825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556922309;
	bh=KEeyPf5WnHC7R4xib0IQYKj04IHbi8XGcZf3id5jL1c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYF+ic8SCyvHA+HEt8BQvM/RxrpqA3ct59MEExKDu/xICXlcT833Bed1k2Xc+MLBU
	 vR+NGocauZIZxPnhbXjoih3+LeA4by9J4VTfXPE2pJRjOCPgJlt9jkqvlvubIz8Wyr
	 4dA0XeO990v/x6FatVfLZ3O8h14ZkEeIs5SKJ7UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43938F89723;
	Sat,  4 May 2019 00:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D031F89763; Sat,  4 May 2019 00:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 928DAF8975E
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 928DAF8975E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="f3ecIfqJ"
Received: by mail-pf1-x443.google.com with SMTP id 13so3227593pfw.9
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bd+ZQ7IZ3uuy9Fc2tXyPCEehBuupO/JtginQNtTWjWY=;
 b=f3ecIfqJUA2IP6AgRzc3sH+IDMmFUN6go1LixXZ0xO+ORNZ92vkkDgzQhr2y1mi15t
 fT7EcbhXdl9Ax0lvsmJ4yS/cTrrri/sSWkBRvCdB8KbTiUDecueChzWP0/UWJXQB9V9F
 jv0svp7kazHEZwjd1UC2sNpGV6bbwCEh926o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bd+ZQ7IZ3uuy9Fc2tXyPCEehBuupO/JtginQNtTWjWY=;
 b=iG0VOIY1dOAaxUBSh82E8e2q48hE2LkkDfreW5ONEDHHNMSUqZG/CKk8IxAjiY6/S1
 XjVayYxeQWLumcT/rPUNXjYP2qhgHj7KHiP1qpKDN57grK7xbah9wGqmdWDvXomowNzJ
 tx1oLdZ/iod8H3tK344sA/DNslXsISzLacOKuPVVSAJo9DUJm9a9caMNAaR11RM+rvWs
 C7x09iB6HuAROnuDaQLwRtw0fRxaU9LY8bOwlTrh8DvM7lqfk9j9/u2wUBbDVDwmM29o
 9T7qMeDY/2aD09zaP1KIqQmLX/LUi8R9colkN9ZPGYGYYeX03ord4ftfjVhHL65hGEQF
 ZGfQ==
X-Gm-Message-State: APjAAAUTFH4KVcZC5aX1xncf9lUJxo80wj1fzRDdHwStdjPHQtH5s8nS
 YUBu9KOM9ISMnqNbrHyvCPLGqg==
X-Google-Smtp-Source: APXvYqzJI6ShHssmAMsFD0CbCeh9SQGVKTrAih2oVBwCG/PBvxggwji1XuZZcqNy2QBX6bl7k1cB7w==
X-Received: by 2002:a63:560d:: with SMTP id k13mr13675024pgb.124.1556921010123; 
 Fri, 03 May 2019 15:03:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id l63sm7476008pfb.124.2019.05.03.15.03.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:29 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:32 -0700
Message-Id: <20190503220233.64546-30-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 29/30] mfd: cros_ec: Add Management API
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
