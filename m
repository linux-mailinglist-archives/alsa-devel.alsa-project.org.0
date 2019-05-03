Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1513564
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05D81870;
	Sat,  4 May 2019 00:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05D81870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921861;
	bh=YPytlMmeIeUPcFw+57UZAP3wy7J+5PUBlF0Dw5xxrkQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDD9E1LVFnY2Bo0l6Ft/JAz+vXZzclJZEezfmJGCI2ufJ+XSA5IqFa/u97qcQFC4c
	 1RbYblTBsTXUip8Ar1dtW0T6OfItnlrF5ESphobks0Dl8Z4PdAvg9iwGWTaEIfuFGt
	 UfJC/aQ4PjSDW0oPx0gsoCk6DAZIvlaVp3D3kFiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95747F89796;
	Sat,  4 May 2019 00:04:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5763CF8975C; Sat,  4 May 2019 00:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56AA7F89747
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56AA7F89747
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Axp9HxCR"
Received: by mail-pf1-x443.google.com with SMTP id 188so3533402pfd.8
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GaS6M4lZppmXoFuVVxZhUE8hMF24Q3vazmIS9Ea3b7g=;
 b=Axp9HxCRAXI3pFBQ32Ll1nDuYsJawqXclGjWfqZytau8KDMUID0AGSBVvAy9LYa1Us
 CByt+i6wTDRhnw+I6b/YetjS8+p2ZAe+KL7CZ0SV7Ok20Oo5EwgnFAHr0M9q9pWzZQ9U
 L4bUQnIiexiwgK19PT/78bd0ROgNydfraxpDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GaS6M4lZppmXoFuVVxZhUE8hMF24Q3vazmIS9Ea3b7g=;
 b=qMOKBBcDHaNBoNbcnHVq9jH4iQkArS8uuJnGw+LXLIxQ7Stn5uioL200mAWrOJbVhv
 3+WWl01s6hVR8pd7K9tedxmgEeWi7CzNeQUb7k+CKwLKoO997zruTm4cd3XpLIeZxJOX
 d+GwKnp0xac59RTJ8q/Wrw3ti/1yEL4fgCsrM55j437U1LEe7BuIX9RX5w7ZOa4fm8IE
 GrjadftoB4E9uO70sJDsI/E7/foQb1yYdWjIuz3T8RinAxk7q/dTEyvGYJ8Pu7pSuZkv
 FNlDmS37dh6DmofMVsFdLm/qT5q9ys5UCbH1eqX4GJswVaBv+ZTpRUhkSPbM22qFnm95
 pMew==
X-Gm-Message-State: APjAAAVORhTSLxmPo7kfkwnyk/N3MkJY9e2NI6fL8niMJeE3jux/xbkW
 wN7IGd8q4J01N96GNByg6RPbKg==
X-Google-Smtp-Source: APXvYqzDeSFO3ZBXK9CVEDX19Ck2fauVSo/A2U0471pzZ9mqHoqz0Pc8t9uCLH1xQlF9xwgvogGeVg==
X-Received: by 2002:a63:f64f:: with SMTP id u15mr13823708pgj.192.1556920997911; 
 Fri, 03 May 2019 15:03:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id u7sm3894776pfu.157.2019.05.03.15.03.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:17 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:24 -0700
Message-Id: <20190503220233.64546-22-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 21/30] mfd: cros_ec: Add Hibernate API
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

Add support for controlling hibernation of the Embedded Controller.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 129 ++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 88d08aa85738..7f98c6e63ad1 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -4045,6 +4045,40 @@ struct ec_params_dedicated_charger_limit {
 	uint16_t voltage_lim; /* in mV */
 } __ec_align2;
 
+/*****************************************************************************/
+/* Hibernate/Deep Sleep Commands */
+
+/* Set the delay before going into hibernation. */
+#define EC_CMD_HIBERNATION_DELAY 0x00A8
+
+struct ec_params_hibernation_delay {
+	/*
+	 * Seconds to wait in G3 before hibernate.  Pass in 0 to read the
+	 * current settings without changing them.
+	 */
+	uint32_t seconds;
+} __ec_align4;
+
+struct ec_response_hibernation_delay {
+	/*
+	 * The current time in seconds in which the system has been in the G3
+	 * state.  This value is reset if the EC transitions out of G3.
+	 */
+	uint32_t time_g3;
+
+	/*
+	 * The current time remaining in seconds until the EC should hibernate.
+	 * This value is also reset if the EC transitions out of G3.
+	 */
+	uint32_t time_remaining;
+
+	/*
+	 * The current time in seconds that the EC should wait in G3 before
+	 * hibernating.
+	 */
+	uint32_t hibernate_delay;
+} __ec_align4;
+
 /* Inform the EC when entering a sleep state */
 #define EC_CMD_HOST_SLEEP_EVENT 0x00A9
 
@@ -4052,13 +4086,102 @@ enum host_sleep_event {
 	HOST_SLEEP_EVENT_S3_SUSPEND   = 1,
 	HOST_SLEEP_EVENT_S3_RESUME    = 2,
 	HOST_SLEEP_EVENT_S0IX_SUSPEND = 3,
-	HOST_SLEEP_EVENT_S0IX_RESUME  = 4
+	HOST_SLEEP_EVENT_S0IX_RESUME  = 4,
+	/* S3 suspend with additional enabled wake sources */
+	HOST_SLEEP_EVENT_S3_WAKEABLE_SUSPEND = 5,
 };
 
 struct ec_params_host_sleep_event {
 	uint8_t sleep_event;
 } __ec_align1;
 
+/*
+ * Use a default timeout value (CONFIG_SLEEP_TIMEOUT_MS) for detecting sleep
+ * transition failures
+ */
+#define EC_HOST_SLEEP_TIMEOUT_DEFAULT 0
+
+/* Disable timeout detection for this sleep transition */
+#define EC_HOST_SLEEP_TIMEOUT_INFINITE 0xFFFF
+
+struct ec_params_host_sleep_event_v1 {
+	/* The type of sleep being entered or exited. */
+	uint8_t sleep_event;
+
+	/* Padding */
+	uint8_t reserved;
+	union {
+		/* Parameters that apply for suspend messages. */
+		struct {
+			/*
+			 * The timeout in milliseconds between when this message
+			 * is received and when the EC will declare sleep
+			 * transition failure if the sleep signal is not
+			 * asserted.
+			 */
+			uint16_t sleep_timeout_ms;
+		} suspend_params;
+
+		/* No parameters for non-suspend messages. */
+	};
+} __ec_align2;
+
+/* A timeout occurred when this bit is set */
+#define EC_HOST_RESUME_SLEEP_TIMEOUT 0x80000000
+
+/*
+ * The mask defining which bits correspond to the number of sleep transitions,
+ * as well as the maximum number of suspend line transitions that will be
+ * reported back to the host.
+ */
+#define EC_HOST_RESUME_SLEEP_TRANSITIONS_MASK 0x7FFFFFFF
+
+struct ec_response_host_sleep_event_v1 {
+	union {
+		/* Response fields that apply for resume messages. */
+		struct {
+			/*
+			 * The number of sleep power signal transitions that
+			 * occurred since the suspend message. The high bit
+			 * indicates a timeout occurred.
+			 */
+			uint32_t sleep_transitions;
+		} resume_response;
+
+		/* No response fields for non-resume messages. */
+	};
+} __ec_align4;
+
+/*****************************************************************************/
+/* Device events */
+#define EC_CMD_DEVICE_EVENT 0x00AA
+
+enum ec_device_event {
+	EC_DEVICE_EVENT_TRACKPAD,
+	EC_DEVICE_EVENT_DSP,
+	EC_DEVICE_EVENT_WIFI,
+};
+
+enum ec_device_event_param {
+	/* Get and clear pending device events */
+	EC_DEVICE_EVENT_PARAM_GET_CURRENT_EVENTS,
+	/* Get device event mask */
+	EC_DEVICE_EVENT_PARAM_GET_ENABLED_EVENTS,
+	/* Set device event mask */
+	EC_DEVICE_EVENT_PARAM_SET_ENABLED_EVENTS,
+};
+
+#define EC_DEVICE_EVENT_MASK(event_code) BIT(event_code % 32)
+
+struct ec_params_device_event {
+	uint32_t event_mask;
+	uint8_t param;
+} __ec_align_size1;
+
+struct ec_response_device_event {
+	uint32_t event_mask;
+} __ec_align4;
+
 /*****************************************************************************/
 /* Smart battery pass-through */
 
@@ -4304,12 +4427,14 @@ enum ec_reboot_cmd {
 	/* (command 3 was jump to RW-B) */
 	EC_REBOOT_COLD = 4,          /* Cold-reboot */
 	EC_REBOOT_DISABLE_JUMP = 5,  /* Disable jump until next reboot */
-	EC_REBOOT_HIBERNATE = 6      /* Hibernate EC */
+	EC_REBOOT_HIBERNATE = 6,     /* Hibernate EC */
+	EC_REBOOT_HIBERNATE_CLEAR_AP_OFF = 7, /* and clears AP_OFF flag */
 };
 
 /* Flags for ec_params_reboot_ec.reboot_flags */
 #define EC_REBOOT_FLAG_RESERVED0      BIT(0)  /* Was recovery request */
 #define EC_REBOOT_FLAG_ON_AP_SHUTDOWN BIT(1)  /* Reboot after AP shutdown */
+#define EC_REBOOT_FLAG_SWITCH_RW_SLOT BIT(2)  /* Switch RW slot */
 
 struct ec_params_reboot_ec {
 	uint8_t cmd;           /* enum ec_reboot_cmd */
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
