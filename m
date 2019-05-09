Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15156194A0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979E6188A;
	Thu,  9 May 2019 23:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979E6188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437424;
	bh=sFbnTBsAn5yhTfWCfKY6c23NdnGu9gexfppd7qN1m8U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MTUGwhc4oXRPxcIWbp0Omsyf5dH8dWUJRkBdACjfeiAaoT6KSVfehib3LpKIKALXM
	 EbKQi4fl7IM3ey8HbkSc6N4aNuene45/Jgs3heNhy7DUMN0edgck+Ykp44BExwDFc7
	 FL1NhFxhlQzwt48dbgzOsso+RMPjA0NQZjLHLCI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAD9F897A9;
	Thu,  9 May 2019 23:14:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88B14F8977B; Thu,  9 May 2019 23:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88377F89774
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88377F89774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="l9AwUPGM"
Received: by mail-pg1-x542.google.com with SMTP id w22so1832829pgi.6
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWgr+AhFO3OhKHAPV2m+8yh16a60wmBfWKOBXA4JWIU=;
 b=l9AwUPGMjJlXTw3q/c4anvpEH7Apr8aszczxsz4koZlEjHGujT/XXlhrz3pf0+sgzP
 dnAvEMxzsMC47BA4uHex5mnJOCBLJtL+VnX8D0Y0cQcuEDamqlpfp+YNaNNY8zeWE69c
 jMjclChUoCUTXBkcR2S0aGhAvt5t3ntNQtaUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWgr+AhFO3OhKHAPV2m+8yh16a60wmBfWKOBXA4JWIU=;
 b=bxccOvpNl6Els4fctK4lvLERX/PlnE5KVmfOI/DaZIqH7Zn/qILcl1wtP54tumEaHG
 8Hm0VWQk067BKtwvGrcLDCvYIl77HX3bDmlB7AvjQfR2N6Y/hXHo+p1+rtjpLQ2AHJH8
 xp+CXuS2a/F8s37z7aXD5xLIpuMaD/tZ0wudDvgZeXbFfGKz4vITsjoNpqjgAehIgqRK
 p0hWrJawGuAHt+flAmSBguJOZFJGugG8iqTFXKGXNOAEb4OGRMGJ4injBtVv3lhkht93
 xzeiHJpsJZ3StNA3skVvk6bb5IOQdU9metZ/VTX0gQneFNfIrH68CX0YSwFho9MY8TGt
 5ytw==
X-Gm-Message-State: APjAAAXQQI/mq/LXZD0WVA69yzII3QmmAYMAvGar2z9Lo6aGqiqXx5pJ
 KlAyPAfHByAdo+4kwmc0ikVQvg==
X-Google-Smtp-Source: APXvYqxbARVqhKLstd3ckJiRL7/+p2xHa3sntQBgb11XMfj7kEkYjGDv7msVASirpXtae93+FNtnGw==
X-Received: by 2002:a63:1460:: with SMTP id 32mr8650708pgu.319.1557436476179; 
 Thu, 09 May 2019 14:14:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id a17sm4854335pff.82.2019.05.09.14.14.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:35 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:45 -0700
Message-Id: <20190509211353.213194-23-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 22/30] mfd: cros_ec: Add Smart Battery
	Firmware update API
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

Add API to update battery firmware.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 7f98c6e63ad1..49ea905cfd18 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -4243,6 +4243,79 @@ struct ec_response_battery_vendor_param {
 	uint32_t value;
 } __ec_align4;
 
+/*****************************************************************************/
+/*
+ * Smart Battery Firmware Update Commands
+ */
+#define EC_CMD_SB_FW_UPDATE 0x00B5
+
+enum ec_sb_fw_update_subcmd {
+	EC_SB_FW_UPDATE_PREPARE  = 0x0,
+	EC_SB_FW_UPDATE_INFO     = 0x1, /*query sb info */
+	EC_SB_FW_UPDATE_BEGIN    = 0x2, /*check if protected */
+	EC_SB_FW_UPDATE_WRITE    = 0x3, /*check if protected */
+	EC_SB_FW_UPDATE_END      = 0x4,
+	EC_SB_FW_UPDATE_STATUS   = 0x5,
+	EC_SB_FW_UPDATE_PROTECT  = 0x6,
+	EC_SB_FW_UPDATE_MAX      = 0x7,
+};
+
+#define SB_FW_UPDATE_CMD_WRITE_BLOCK_SIZE 32
+#define SB_FW_UPDATE_CMD_STATUS_SIZE 2
+#define SB_FW_UPDATE_CMD_INFO_SIZE 8
+
+struct ec_sb_fw_update_header {
+	uint16_t subcmd;  /* enum ec_sb_fw_update_subcmd */
+	uint16_t fw_id;   /* firmware id */
+} __ec_align4;
+
+struct ec_params_sb_fw_update {
+	struct ec_sb_fw_update_header hdr;
+	union {
+		/* EC_SB_FW_UPDATE_PREPARE  = 0x0 */
+		/* EC_SB_FW_UPDATE_INFO     = 0x1 */
+		/* EC_SB_FW_UPDATE_BEGIN    = 0x2 */
+		/* EC_SB_FW_UPDATE_END      = 0x4 */
+		/* EC_SB_FW_UPDATE_STATUS   = 0x5 */
+		/* EC_SB_FW_UPDATE_PROTECT  = 0x6 */
+		/* Those have no args */
+
+		/* EC_SB_FW_UPDATE_WRITE    = 0x3 */
+		struct __ec_align4 {
+			uint8_t  data[SB_FW_UPDATE_CMD_WRITE_BLOCK_SIZE];
+		} write;
+	};
+} __ec_align4;
+
+struct ec_response_sb_fw_update {
+	union {
+		/* EC_SB_FW_UPDATE_INFO     = 0x1 */
+		struct __ec_align1 {
+			uint8_t data[SB_FW_UPDATE_CMD_INFO_SIZE];
+		} info;
+
+		/* EC_SB_FW_UPDATE_STATUS   = 0x5 */
+		struct __ec_align1 {
+			uint8_t data[SB_FW_UPDATE_CMD_STATUS_SIZE];
+		} status;
+	};
+} __ec_align1;
+
+/*
+ * Entering Verified Boot Mode Command
+ * Default mode is VBOOT_MODE_NORMAL if EC did not receive this command.
+ * Valid Modes are: normal, developer, and recovery.
+ */
+#define EC_CMD_ENTERING_MODE 0x00B6
+
+struct ec_params_entering_mode {
+	int vboot_mode;
+} __ec_align4;
+
+#define VBOOT_MODE_NORMAL    0
+#define VBOOT_MODE_DEVELOPER 1
+#define VBOOT_MODE_RECOVERY  2
+
 /*****************************************************************************/
 /*
  * HDMI CEC commands
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
