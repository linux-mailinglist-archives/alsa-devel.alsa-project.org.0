Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7F33885
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7871612;
	Mon,  3 Jun 2019 20:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7871612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587701;
	bh=Xqv5wLAoVRowl79vtLHUK1SU4gc8mta9sITl6i+j9E8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vhC/5hrJvOP5PU/c1gOi7FLxfODo7BOJWf4sQZZGnx+TQMJQuAxh02MfKQ2i4z0/M
	 6K4pL2m/bZvlkWgIerVxDpS67jfEAv/gHe4/vGalSol2S6GAqQ7nfTsIcizzasqxp1
	 X23+Xl4+iY1MKqq75RUtLio2sh5G8vWrqceacTzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 495C4F89797;
	Mon,  3 Jun 2019 20:34:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F04BEF8975B; Mon,  3 Jun 2019 20:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6A9BF89750
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A9BF89750
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Cn9X2hMz"
Received: by mail-pg1-x542.google.com with SMTP id e6so7510093pgd.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsvChVhPFRKhcltabgO7ScZB2QxDvaB52l0FVQDxtzA=;
 b=Cn9X2hMzM9igSBo/eBNiGhC4zf1RD5Ku+AlDhyhpbHiuFel5UCM4GLq+7EOpQlw1cK
 2zyEM4SHOXNdrUS0Ltuuc3Bear/nIWpRBQvHF88+60mhJJopYlMNbCINgjwybHmTAEVX
 R4MMc0FUprSuYCrq42LxdMU6A3RvHZp+ZsT4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsvChVhPFRKhcltabgO7ScZB2QxDvaB52l0FVQDxtzA=;
 b=sLBnETkYc5ZIIOo45hVFIBiBFDIx3l9LdHA0bBGX1CRlQILOTygfjpUmjFi5Ay2Lxc
 0FNqnabX05Njthb+OqKJatppnHAlZr6UZhA9T7kCZHjmG6edEftrwQE0nzrf5VivwbsR
 CE4TuFeJMnMbOjYSnIoM0x5SWVheVtF7pFIL7zUUeRUGn4FWtoo517N2Z3GRWeeEyFUR
 bMh2BXWD6tT/GaLdOO2M+7CMtH8mBcHC3jjtrTK00jasJS81n8yMyPNFBh57aP1e3cOf
 TPlRow9oqL9QEJOGhTDWxkqftokKw6DacXFEDj/3YNm8v5CiP/8q9ixXpssVUXqrK4Cq
 wyfA==
X-Gm-Message-State: APjAAAWWOsdYqfT++MUqhWAyJ2g8tPdpLL9X6Ily1uUYoV8zowv70Fde
 e8Rj8xWXQvSQRKYQU3ao9k/X8w==
X-Google-Smtp-Source: APXvYqzzheqUaEq5gErssHXtRL+7mVxMz6irQ7c2SSSqM18c4PDJ6kmoGhBdAeEECyckB5liMKB/dA==
X-Received: by 2002:a62:60c2:: with SMTP id u185mr23049876pfb.58.1559586874021; 
 Mon, 03 Jun 2019 11:34:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id m6sm17628198pgr.18.2019.06.03.11.34.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:33 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:49 -0700
Message-Id: <20190603183401.151408-19-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 18/30] mfd: cros_ec: Fix temperature
	API
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
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
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
