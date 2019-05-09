Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E21519484
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:20:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB98A187B;
	Thu,  9 May 2019 23:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB98A187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557436848;
	bh=MUXQ0Ld35SAlaPaRRfn2gijNGvYQ3ElYMFtRyE992jU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwKHpiW4U7rt8htyDk3qNr66cXAK721/aRtYybC3K62gqiVHaZRWFaQ5YLlGxtPIU
	 mMqAmCdQdOz/v+1jhi12k0q3YL0EuYJ+zNqCkHMqd6M7X4nnVK5VJ+Ob15fvS1A7Gv
	 Sm8RDB3Ky6MOBiGdx8xxuGlW9LJ6oT3nmH0M9Zwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24FF8F89754;
	Thu,  9 May 2019 23:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F3ECF89745; Thu,  9 May 2019 23:14:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F40F89732
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F40F89732
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="A/E7qhQD"
Received: by mail-pl1-x644.google.com with SMTP id bi2so1709217plb.13
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwVaVEj7IXkfmug377A9Z+9dSGylKGF+5h+RjN0OFaU=;
 b=A/E7qhQDkeCjMU7u8vo/8V7X0hd7RW+pgz94GzLUstAg6w7yaxsyFUDxVrMLvWNZQZ
 Pas+nRZfxa+rDf65S/txv4hVSL4XrVfglmn5F7PDt7U3VE1JkiaNKp2gHc7eLUBGUM6I
 85Xp0DyL7jIGWL/6RBHnpILJVzN3k0l1yWqfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwVaVEj7IXkfmug377A9Z+9dSGylKGF+5h+RjN0OFaU=;
 b=VY4PWLcet9UnGY+lxWpg7sw24tEqqQdSkGWHSch/e0UecM/7iQD6qV9KbB+a0DdztU
 saA9qCkDorkzLaPh6bok5DEhupMHFbNsydtBVdI6SUD8HCoBKpLm5CtR92t4dqnB8Faz
 fjxWHmeyE+JyvomSYXvZ1/QKZ9hkqM8Rl8r8fV2qI1z7LIN0ipsP6GL2FTQQoEnf9jVQ
 GLBRE36W1FrAcF3s9ej8gMr1c6EmHKXCvl6L4cmlsxJUMdBRotEocKZAOUz7KB3R1f7Y
 DY1ah2M+3eYcRIwgSEF9EBDa4+xCCW1p11Thzqr3+hedzAVxnRToQ1n4H7nZZY9EIJbw
 2YJg==
X-Gm-Message-State: APjAAAWw2abg0QAPuY9s0g/PiXpU9onIW+Tc2KQn0hpgxDwpNXbN+CnZ
 ZBvSKtCht7QzmSEU/4V1kYzQtA==
X-Google-Smtp-Source: APXvYqyAqUWCamq5W3ViI979pnhQ0eXBaJ7eHHx3S9QuPlAeQtfsDptKfJi5qvsTHDCplKEp6+9HhA==
X-Received: by 2002:a17:902:e28a:: with SMTP id
 cf10mr8136527plb.77.1557436455436; 
 Thu, 09 May 2019 14:14:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id c14sm3573892pgl.43.2019.05.09.14.14.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:14 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:31 -0700
Message-Id: <20190509211353.213194-9-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 08/30] mfd: cros_ec: move HDMI CEC API
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
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 148 ++++++++++++++-------------
 1 file changed, 75 insertions(+), 73 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 575066b90bab..d8bde2b5e9ce 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -3211,6 +3211,81 @@ struct ec_response_battery_vendor_param {
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
@@ -3339,79 +3414,6 @@ struct ec_params_reboot_ec {
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
