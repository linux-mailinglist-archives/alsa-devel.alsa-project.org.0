Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6C194A4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D761AD9;
	Thu,  9 May 2019 23:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D761AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437470;
	bh=GUJXN5O6PrpJSa1YxmCBow3lBK0yrvraU3euX1FftBo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQUS0SVBZ1pV/UjgwLONvXrmxNK+l+T+R2MRQkYddIVTYO/1felMjERlhmk619qSJ
	 7Mn3tf9R8UoDEG6RlogP9iuDiHhIJoRCAZTgPLX2P6foGiL262h//aeBKSKx1r6WEs
	 RxUDvU2MIu5/bYYax66hHg6VfWoXqbC3mcS3Z3rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E56AF897B7;
	Thu,  9 May 2019 23:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A64F8977C; Thu,  9 May 2019 23:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37D76F89771
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D76F89771
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Zfpt5xg3"
Received: by mail-pf1-x441.google.com with SMTP id y11so1938087pfm.13
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lcz1eqcuD73T/NcdIkbFXLwMtkZSGY486wHQZ5MgZj0=;
 b=Zfpt5xg3AxUyQfo8Abyg4ogJXok/St2aZrREtayCmA7BJtNKUrMRpzYLgQhVp8epax
 8X6De6AkM85K2V9mwGPumIuJ4JxnQtMTvXU5RGjInwp3/9deUJM/NvREnuT/LzCF1y91
 GofwX0UiSkq5Vx/fbHbbIFKCYEWUZ7+VXPRyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lcz1eqcuD73T/NcdIkbFXLwMtkZSGY486wHQZ5MgZj0=;
 b=gLZWmpotlxQCkPTFgFdOH+Mk6IH/Puk29KJz/MfTI8u2hi0dCZ8zeOEhBEve2VNCAg
 zieEVY5u2KGBuJuy5mURgz2eSQqRTXRU5rWP7Bqy6lYwU4ZGt+iU/SFczqStR21FmVCy
 lw/SMvAFfH8IOV8k47JFfZqAc08uBrKOPQZ5TXTgapqCug36DweUxGyqO7a4bKKxfdG7
 L8ZiBw5rESa5ZcArDXZGYv95tp3KxWsvg3c1dhRt9SOtZvcskyluYOyJcql6MPFJuh6l
 /Y+FZfGCb9V0uLhMXZxgmBN7AACilFZuW6GR/rc6M8ScdY9ScYvtrdAPyJfqJaOW3PEa
 aRzw==
X-Gm-Message-State: APjAAAUmecyYkLM0z0fvzT0KmicJoADiApNEvjyjp2m0zT0uKGGSsNkL
 NUdF/KyiGvrya2uUG7di3NpekQ==
X-Google-Smtp-Source: APXvYqz042zmYNJ4m/qpAeFzE/1gR0DwW34FrcjHP7YYL9ft7HjvOA7U92isJkKJvsl71wPm4dexyQ==
X-Received: by 2002:a65:5941:: with SMTP id g1mr8699957pgu.51.1557436474785;
 Thu, 09 May 2019 14:14:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id e8sm5128546pfc.47.2019.05.09.14.14.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:34 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:44 -0700
Message-Id: <20190509211353.213194-22-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 21/30] mfd: cros_ec: Add Hibernate API
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
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 72 +++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index cc054a0a4c4c..7f98c6e63ad1 100644
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
 
@@ -4052,7 +4086,9 @@ enum host_sleep_event {
 	HOST_SLEEP_EVENT_S3_SUSPEND   = 1,
 	HOST_SLEEP_EVENT_S3_RESUME    = 2,
 	HOST_SLEEP_EVENT_S0IX_SUSPEND = 3,
-	HOST_SLEEP_EVENT_S0IX_RESUME  = 4
+	HOST_SLEEP_EVENT_S0IX_RESUME  = 4,
+	/* S3 suspend with additional enabled wake sources */
+	HOST_SLEEP_EVENT_S3_WAKEABLE_SUSPEND = 5,
 };
 
 struct ec_params_host_sleep_event {
@@ -4116,6 +4152,36 @@ struct ec_response_host_sleep_event_v1 {
 	};
 } __ec_align4;
 
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
 
@@ -4361,12 +4427,14 @@ enum ec_reboot_cmd {
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
