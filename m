Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3993419499
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67B51AB4;
	Thu,  9 May 2019 23:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67B51AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437313;
	bh=1KOXDZuwkLykjVMjLtzy/xMWn4+JVy6ieBUnUoQvCXg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxtIURTzOUe/+EUqHEn6R/SvUdMRivE5XqO+avEm5bivYTmJXf5zqwBTQZuXIsFvD
	 vDb9OlguZhKIu+YwWSTiCILkmz9TO9mX4eQByplXWoNcvPg62bg3p5vu3xF1mTU46Y
	 3XoNlS2esTZ4EEi1qQ/8XxVGFnPyFnBY68Mu/N2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52389F8979D;
	Thu,  9 May 2019 23:14:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5AC5F89763; Thu,  9 May 2019 23:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_21,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD7F5F89755
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD7F5F89755
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Bfd/Ekf2"
Received: by mail-pl1-x642.google.com with SMTP id g9so1733713plm.6
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LdBQmcIdU0Rz/x8vcPlOves92mcg6yTCi+x1gfv5Pak=;
 b=Bfd/Ekf2p/8ipmAOdUnSq+3U+hBLAtjV69d+L0A5aiqMeWrRbYXuREhAR3zxvuNnKY
 XW4VfFk8dw/iEMnIEvtF82oVHKPtTcEuwAElg84/cOriyZyt4kGa8XtDzC4v/Y/0v92R
 6kxrU3rQ+Ife1RHQCo35bkUNvd8mbc1xMJxnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdBQmcIdU0Rz/x8vcPlOves92mcg6yTCi+x1gfv5Pak=;
 b=BIU04kjA2KTKcGpBj3ryDt/pC+6bdnjYynPqr2TwrLRo1mwP8k6KTcjmQ9UGZ+eXHh
 YFfXUhFVrfu67Gw6Ly4RdhkW9Ii+XV/NHL1N3cmuGuX+1IAKzRjGq+BVpazls/lljLJa
 0xutG6A2QhXCCZzr1uRV5Qz6HBUxzk29onhqvgClik8WNnIv6Y8++jLTayPiN0ihegGz
 F2LBRxiudq5QuqZ1fOVezcqW4kVhyZfXcVbOUVTi6wZLFIUH2bo5cY2uSYvo3oX15I8B
 l/k2M1SBWDMVwfozOuQyuB7mx0Pj1+w4FYjNolP2YffB+VXg0h68yC3ZmTQSPal2x4GG
 orXg==
X-Gm-Message-State: APjAAAWRKLe4WA98TKjpr1XEUIFXsoVSspAOFg5GI51VsYdhyJ1l1hP6
 KtCkXEmJ8ql+vmG4WDvQPUwJ91kSetk=
X-Google-Smtp-Source: APXvYqxbJXdzA8oxT2Bn+g8DBr4t1WTxDT7A8NncOrsx+sD74nqvfLbZIIXeJW3uwslBJ+FXKtQ/AQ==
X-Received: by 2002:a17:902:7247:: with SMTP id
 c7mr8290208pll.65.1557436470337; 
 Thu, 09 May 2019 14:14:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id h189sm4414601pfc.125.2019.05.09.14.14.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:29 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:41 -0700
Message-Id: <20190509211353.213194-19-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 18/30] mfd: cros_ec: Fix temperature API
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

Improve API to retrieve temperature information.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 64 +++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index d5d07a9957ec..9a84aad7475a 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -2945,9 +2945,28 @@ enum ec_temp_thresholds {
 /*
  * Thermal configuration for one temperature sensor. Temps are in degrees K.
  * Zero values will be silently ignored by the thermal task.
+ *
+ * Set 'temp_host' value allows thermal task to trigger some event with 1 degree
+ * hysteresis.
+ * For example,
+ *	temp_host[EC_TEMP_THRESH_HIGH] = 300 K
+ *	temp_host_release[EC_TEMP_THRESH_HIGH] = 0 K
+ * EC will throttle ap when temperature >= 301 K, and release throttling when
+ * temperature <= 299 K.
+ *
+ * Set 'temp_host_release' value allows thermal task has a custom hysteresis.
+ * For example,
+ *	temp_host[EC_TEMP_THRESH_HIGH] = 300 K
+ *	temp_host_release[EC_TEMP_THRESH_HIGH] = 295 K
+ * EC will throttle ap when temperature >= 301 K, and release throttling when
+ * temperature <= 294 K.
+ *
+ * Note that this structure is a sub-structure of
+ * ec_params_thermal_set_threshold_v1, but maintains its alignment there.
  */
 struct ec_thermal_config {
 	uint32_t temp_host[EC_TEMP_THRESH_COUNT]; /* levels of hotness */
+	uint32_t temp_host_release[EC_TEMP_THRESH_COUNT]; /* release levels */
 	uint32_t temp_fan_off;		/* no active cooling needed */
 	uint32_t temp_fan_max;		/* max active cooling needed */
 } __ec_align4;
@@ -2973,32 +2992,63 @@ struct ec_params_thermal_set_threshold_v1 {
 /* Toggle automatic fan control */
 #define EC_CMD_THERMAL_AUTO_FAN_CTRL 0x0052
 
-/* Get TMP006 calibration data */
+/* Version 1 of input params */
+struct ec_params_auto_fan_ctrl_v1 {
+	uint8_t fan_idx;
+} __ec_align1;
+
+/* Get/Set TMP006 calibration data */
 #define EC_CMD_TMP006_GET_CALIBRATION 0x0053
+#define EC_CMD_TMP006_SET_CALIBRATION 0x0054
+
+/*
+ * The original TMP006 calibration only needed four params, but now we need
+ * more. Since the algorithm is nothing but magic numbers anyway, we'll leave
+ * the params opaque. The v1 "get" response will include the algorithm number
+ * and how many params it requires. That way we can change the EC code without
+ * needing to update this file. We can also use a different algorithm on each
+ * sensor.
+ */
 
+/* This is the same struct for both v0 and v1. */
 struct ec_params_tmp006_get_calibration {
 	uint8_t index;
 } __ec_align1;
 
-struct ec_response_tmp006_get_calibration {
+/* Version 0 */
+struct ec_response_tmp006_get_calibration_v0 {
 	float s0;
 	float b0;
 	float b1;
 	float b2;
 } __ec_align4;
 
-/* Set TMP006 calibration data */
-#define EC_CMD_TMP006_SET_CALIBRATION 0x0054
-
-struct ec_params_tmp006_set_calibration {
+struct ec_params_tmp006_set_calibration_v0 {
 	uint8_t index;
-	uint8_t reserved[3];  /* Reserved; set 0 */
+	uint8_t reserved[3];
 	float s0;
 	float b0;
 	float b1;
 	float b2;
 } __ec_align4;
 
+/* Version 1 */
+struct ec_response_tmp006_get_calibration_v1 {
+	uint8_t algorithm;
+	uint8_t num_params;
+	uint8_t reserved[2];
+	float val[0];
+} __ec_align4;
+
+struct ec_params_tmp006_set_calibration_v1 {
+	uint8_t index;
+	uint8_t algorithm;
+	uint8_t num_params;
+	uint8_t reserved;
+	float val[0];
+} __ec_align4;
+
+
 /* Read raw TMP006 data */
 #define EC_CMD_TMP006_GET_RAW 0x0055
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
