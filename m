Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446F13549
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A952D17ED;
	Sat,  4 May 2019 00:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A952D17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921521;
	bh=VKwLp/rFdVat5EBEY/NHcgiPydLbnTI1/Cqdu4Cxq5g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdsQf6pHaMTpdfgWd58q9FKrHR0ESTSZ4B6DMbfX17C6hf8lrqUSFnZ06+VoX3oRm
	 vx1VHq0yBKrC8XEW6+306ZqmJ4zqXX5NQpOnuZZHbrJXrzZlBXC/nntfO430QaQcQS
	 v1t71lfvr7+7mH+e+MlutH4OgOWMnT/Q+Xun1F/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC4B7F80720;
	Sat,  4 May 2019 00:03:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9C65F89724; Sat,  4 May 2019 00:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B263F8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B263F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DipJLBxo"
Received: by mail-pg1-x542.google.com with SMTP id w22so2030111pgi.6
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpZvwbwPYf0W1R0nI9DxhgS6xPRoVjEGctnuxzxQJHk=;
 b=DipJLBxoHg1BLPKIRZddMWg/EqPnObfT+6lYTDOxLu21MmXIkTYwph/62KDAqyDefh
 Up+0e0LNnMggYvpeGKk1BtJQxx5gvZKDPMvjEjB5oeJ1sH3YvwNaMXAf83CEiaRnyrs2
 8dQ5vtMP6WlDZJLKwu5eU0LY6rewLcCuc9AZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpZvwbwPYf0W1R0nI9DxhgS6xPRoVjEGctnuxzxQJHk=;
 b=FhdtbpCpfurqOWzaohIlNCebgVY3BtvkARL9aNwVYXReNpKfYkYUNWw+0LVGkcxkUH
 qtfAGaNIuxBo2qhqsU/qDH0jQKntFf7JTO8q1skGGMwAfg6vtKn+NPrDGgyWb/Ykb80c
 CViIjR7PiTLVLqPF4k+cB1LeeUe6s6DrrrFDFxEaCKUC3gFVfk9QwFiqEj6eIiJ0J3Mm
 KIrbgNfjAINAjbNS3kLNgaYzuvttPlKA6zvf/E8Df0cSrWTW2g3WUVEa2ea1bNJmIfaG
 5E1of0Ow4DJOfb1Beh0TG6Of9xWiEBV92U8WuIUdtFExd6jTj6Je0VRVpxiOEIFctcLv
 Niaw==
X-Gm-Message-State: APjAAAXWxakZR+5B6vt6mtK1PF7fsEzSBRBA7P5xt3yWL0ex2KTVDfdX
 Vhf4/TOLcSTf2tBSs3dHi0XDIQ==
X-Google-Smtp-Source: APXvYqyeAHIyL2YmcO+ypKIGK7enHbm/KXpWVRaOzEMqlfkAxyMgome5IOAVzPA+81fPABPUXt83TA==
X-Received: by 2002:a63:1e0c:: with SMTP id e12mr13199791pge.218.1556920976472; 
 Fri, 03 May 2019 15:02:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id l10sm9412937pfc.46.2019.05.03.15.02.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:02:55 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:11 -0700
Message-Id: <20190503220233.64546-9-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 08/30] mfd: cros_ec: move HDMI CEC API
	definition
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

Move near the end of file.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 148 ++++++++++++++-------------
 1 file changed, 75 insertions(+), 73 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 6538c5789c43..67e15c29e083 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -3124,6 +3124,81 @@ struct ec_response_battery_vendor_param {
 } __ec_align4;
 
 /*****************************************************************************/
+/*
+ * HDMI CEC commands
+ *
+ * These commands are for sending and receiving message via HDMI CEC
+ */
+
+#define MAX_CEC_MSG_LEN 16
+
+/* CEC message from the AP to be written on the CEC bus */
+#define EC_CMD_CEC_WRITE_MSG 0x00B8
+
+/**
+ * struct ec_params_cec_write - Message to write to the CEC bus
+ * @msg: message content to write to the CEC bus
+ */
+struct ec_params_cec_write {
+	uint8_t msg[MAX_CEC_MSG_LEN];
+} __ec_align1;
+
+/* Set various CEC parameters */
+#define EC_CMD_CEC_SET 0x00BA
+
+/**
+ * struct ec_params_cec_set - CEC parameters set
+ * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
+ * @val: in case cmd is CEC_CMD_ENABLE, this field can be 0 to disable CEC
+ *	or 1 to enable CEC functionality, in case cmd is
+ *	CEC_CMD_LOGICAL_ADDRESS, this field encodes the requested logical
+ *	address between 0 and 15 or 0xff to unregister
+ */
+struct ec_params_cec_set {
+	uint8_t cmd; /* enum cec_command */
+	uint8_t val;
+} __ec_align1;
+
+/* Read various CEC parameters */
+#define EC_CMD_CEC_GET 0x00BB
+
+/**
+ * struct ec_params_cec_get - CEC parameters get
+ * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
+ */
+struct ec_params_cec_get {
+	uint8_t cmd; /* enum cec_command */
+} __ec_align1;
+
+/**
+ * struct ec_response_cec_get - CEC parameters get response
+ * @val: in case cmd was CEC_CMD_ENABLE, this field will 0 if CEC is
+ *	disabled or 1 if CEC functionality is enabled,
+ *	in case cmd was CEC_CMD_LOGICAL_ADDRESS, this will encode the
+ *	configured logical address between 0 and 15 or 0xff if unregistered
+ */
+struct ec_response_cec_get {
+	uint8_t val;
+} __ec_align1;
+
+/* CEC parameters command */
+enum cec_command {
+	/* CEC reading, writing and events enable */
+	CEC_CMD_ENABLE,
+	/* CEC logical address  */
+	CEC_CMD_LOGICAL_ADDRESS,
+};
+
+/* Events from CEC to AP */
+enum mkbp_cec_event {
+	/* Outgoing message was acknowledged by a follower */
+	EC_MKBP_CEC_SEND_OK			= BIT(0),
+	/* Outgoing message was not acknowledged */
+	EC_MKBP_CEC_SEND_FAILED			= BIT(1),
+};
+
+/*****************************************************************************/
+
 /* Commands for I2S recording on audio codec. */
 
 #define EC_CMD_CODEC_I2S 0x00BC
@@ -3252,79 +3327,6 @@ struct ec_params_reboot_ec {
  */
 #define EC_CMD_GET_PANIC_INFO 0x00D3
 
-/*****************************************************************************/
-/*
- * HDMI CEC commands
- *
- * These commands are for sending and receiving message via HDMI CEC
- */
-#define EC_MAX_CEC_MSG_LEN 16
-
-/* CEC message from the AP to be written on the CEC bus */
-#define EC_CMD_CEC_WRITE_MSG 0x00B8
-
-/**
- * struct ec_params_cec_write - Message to write to the CEC bus
- * @msg: message content to write to the CEC bus
- */
-struct ec_params_cec_write {
-	uint8_t msg[EC_MAX_CEC_MSG_LEN];
-} __ec_align1;
-
-/* Set various CEC parameters */
-#define EC_CMD_CEC_SET 0x00BA
-
-/**
- * struct ec_params_cec_set - CEC parameters set
- * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
- * @val: in case cmd is CEC_CMD_ENABLE, this field can be 0 to disable CEC
- *	or 1 to enable CEC functionality, in case cmd is CEC_CMD_LOGICAL_ADDRESS,
- *	this field encodes the requested logical address between 0 and 15
- *	or 0xff to unregister
- */
-struct ec_params_cec_set {
-	uint8_t cmd; /* enum cec_command */
-	uint8_t val;
-} __ec_align1;
-
-/* Read various CEC parameters */
-#define EC_CMD_CEC_GET 0x00BB
-
-/**
- * struct ec_params_cec_get - CEC parameters get
- * @cmd: parameter type, can be CEC_CMD_ENABLE or CEC_CMD_LOGICAL_ADDRESS
- */
-struct ec_params_cec_get {
-	uint8_t cmd; /* enum cec_command */
-} __ec_align1;
-
-/**
- * struct ec_response_cec_get - CEC parameters get response
- * @val: in case cmd was CEC_CMD_ENABLE, this field will 0 if CEC is
- *	disabled or 1 if CEC functionality is enabled,
- *	in case cmd was CEC_CMD_LOGICAL_ADDRESS, this will encode the
- *	configured logical address between 0 and 15 or 0xff if unregistered
- */
-struct ec_response_cec_get {
-	uint8_t val;
-} __ec_align1;
-
-/* CEC parameters command */
-enum ec_cec_command {
-	/* CEC reading, writing and events enable */
-	CEC_CMD_ENABLE,
-	/* CEC logical address  */
-	CEC_CMD_LOGICAL_ADDRESS,
-};
-
-/* Events from CEC to AP */
-enum mkbp_cec_event {
-	/* Outgoing message was acknowledged by a follower */
-	EC_MKBP_CEC_SEND_OK			= BIT(0),
-	/* Outgoing message was not acknowledged */
-	EC_MKBP_CEC_SEND_FAILED			= BIT(1),
-};
-
 /*****************************************************************************/
 /*
  * Special commands
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
