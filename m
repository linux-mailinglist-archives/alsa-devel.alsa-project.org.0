Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD13388C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFE4B169D;
	Mon,  3 Jun 2019 20:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFE4B169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587855;
	bh=MLDW2oENGeGWF+2KvRczCfvo4bopia2EwrxPClxglIs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ljre1VY0VK9YhoGhdszpNpRuU3a5Q0KlxEPFM+uFZCkzL/So/0sudVmqzlfub529a
	 5qZHjgHSC0Udge34+sCvk1yTno+hZg4KJUbWzmrapkWy07AQ1SvOdvAfNdS6CKzDC8
	 Sr+vbAKYP9Xt+DgoCbwQbylYj+6ks8boWHUFUkKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA7BF897B4;
	Mon,  3 Jun 2019 20:35:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46ADBF8977A; Mon,  3 Jun 2019 20:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29863F8976B
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29863F8976B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="n006p07L"
Received: by mail-pf1-x441.google.com with SMTP id a186so10396413pfa.5
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PPnzB4+ekdR6MgK0N6rYp72AUYX34yF3bdFMrhiS2nI=;
 b=n006p07LUn1rqIDZLl97/sH1SmE4SUCOdWEGI7tIS673YMHQxXxpFf9PC2OxSj+Cxy
 g9Ol6K51u3N2QQOV7YeAwN+RLk/EfQFZaazOlFqryCx1F69eiMEdLUS9pFD8DRpIbUdq
 X8stQSGNm1z8Porz0ZLouQ77PllVbSP6T1KqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PPnzB4+ekdR6MgK0N6rYp72AUYX34yF3bdFMrhiS2nI=;
 b=OLzqsLapKW51F4stAzbx7fdEmhTAKwyF4uIogXJxOIjqZJUlnGkLiz24wkRM2wURtz
 3nHt2XaaXyFWMf3ZPTo7Uxam2RyHuHpfKpcM+QkuEK9T85vRElUoRawYlUCfTX4pYnMo
 Yl/IL8+6CMXogKA9DZkDIXPD14SBPsfOlxGw42lPs0FkxlT4dUCHhlw22MOkE+DmQm/v
 Km40maN8TC0rmchKNdbBaupUo4uIsL64+mUhe/+RzbFwgiy+clL2Z2B9oB3wZW+ckQIs
 f0dQION9k9rT6ZDlABwbAd98vzDgm1IprLs5mRth5xsFIcbi8T1XPBHAzbbBcBnj/Pbk
 0ZeA==
X-Gm-Message-State: APjAAAW7NiC3MNX6cMcKdOkGBP6gsmVoBUuOfzc28m3tiR5VSM+X8W74
 6H9KLByd648+pDFK6EDHigWgcw==
X-Google-Smtp-Source: APXvYqxGEh4codWtYzCotWUDRWC62TxiynvejvyuxhVMDNLhv1lkKK4pOz6vKvp8FlURm1CUMvFW+Q==
X-Received: by 2002:a63:87c8:: with SMTP id
 i191mr30553912pge.131.1559586881467; 
 Mon, 03 Jun 2019 11:34:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id b2sm6165098pgk.50.2019.06.03.11.34.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:40 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:53 -0700
Message-Id: <20190603183401.151408-23-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 22/30] mfd: cros_ec: Add Smart
	Battery Firmware update API
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
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
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
