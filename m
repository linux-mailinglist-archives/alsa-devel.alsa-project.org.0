Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283091948D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8F3816E6;
	Thu,  9 May 2019 23:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8F3816E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557436970;
	bh=ny8Mrc8HuMcmS8VHcxa+DdiNKqwKFQvU4Th1jWdOB6I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FFt48G3q8FGt8+mjcM8/YE2BGgm+95QCWGU34jAe3+LTENvkixqmfgr3zDJJhh8bX
	 5qkiC24guX7TZ90EdO7s7xCfzBKzmEf/f80yHc23gp1Q5zwXj52KJyseKqSqQaE5fv
	 PSLXQzSFD2pcvdH1LVlbwtXzz6UPTsxmFMDABy+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677D4F89765;
	Thu,  9 May 2019 23:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36704F8974F; Thu,  9 May 2019 23:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 300A9F89742
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 300A9F89742
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iQwAmx3D"
Received: by mail-pg1-x544.google.com with SMTP id w22so1832554pgi.6
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4A6ApDzHg0Vagve51lA1yKCs7saRi6gPeDJI9wPwJM=;
 b=iQwAmx3DF99ZighBM5u3JpSwG2F5puJlQg04gWc4p7y+CccRae+tsSz1De01VgrOey
 aw6KXJf2+XggzD1YgjNbx9Jtnq4AI0fUw8opWB+Fjj9V/zeSqHgjjib8Xnl3ajvNeNnh
 eqv0TELKfxtidTfYAwnMaxUxfvNlB8RyfeExY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4A6ApDzHg0Vagve51lA1yKCs7saRi6gPeDJI9wPwJM=;
 b=dGsPmCr2TBosTztfVFS7oDTutOXxl9icLWzZY6zQM4sYQz2NZNWuma2iRY/ib5aeWU
 azFItnhyVXGdZz+9nItipHYgTpRd/b3gSmT59I+Sdx+5oQM4oQ0vUpXh6RWGwiMDt7CP
 S8+UbfDoZehAkAOvICiwi6/AXMTGhIdKsdK+BbrNtUm6QhJ2kORc7EzHvvSJmQc/TMZu
 xhzA8XBkI2slwJyKZwBcHh+D1xcmBfSz8btZsMdG8367NyeilJQrB/DSc7Afn/P8/Dkj
 5Pjm0WI7C6mWGU7HfHq+kwkhsex7a2ZH62CEpQtAiwYtsblP9FtqU9sBh/nVVbLCN+jh
 3C5A==
X-Gm-Message-State: APjAAAVqC9atsQeOvvc4aGKeHFa1awgVtcSWJnlRPuXvFq4mDRcdywXD
 FEhTMReziFgwW4p4bRVSggGqlw==
X-Google-Smtp-Source: APXvYqw3sRuUZF8CLJhv0NVP/D6q0xavfDBIfprlgR/LAKLe0nRNF0H46eszm2hvnZGWagdecZTS4w==
X-Received: by 2002:a65:64ca:: with SMTP id t10mr8581826pgv.177.1557436459846; 
 Thu, 09 May 2019 14:14:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id n13sm3874857pgh.6.2019.05.09.14.14.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:19 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:34 -0700
Message-Id: <20190509211353.213194-12-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 11/30] mfd: cros_ec: Add PWM_SET_DUTY API
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

Add API for fan control.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 3d1d26f62bd3..2b3a94a4f0f4 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -1521,11 +1521,19 @@ struct ec_response_pwm_get_fan_rpm {
 /* Set target fan RPM */
 #define EC_CMD_PWM_SET_FAN_TARGET_RPM 0x0021
 
-struct ec_params_pwm_set_fan_target_rpm {
+/* Version 0 of input params */
+struct ec_params_pwm_set_fan_target_rpm_v0 {
 	uint32_t rpm;
+} __ec_align4;
+
+/* Version 1 of input params */
+struct ec_params_pwm_set_fan_target_rpm_v1 {
+	uint32_t rpm;
+	uint8_t fan_idx;
 } __ec_align_size1;
 
 /* Get keyboard backlight */
+/* OBSOLETE - Use EC_CMD_PWM_SET_DUTY */
 #define EC_CMD_PWM_GET_KEYBOARD_BACKLIGHT 0x0022
 
 struct ec_response_pwm_get_keyboard_backlight {
@@ -1534,6 +1542,7 @@ struct ec_response_pwm_get_keyboard_backlight {
 } __ec_align1;
 
 /* Set keyboard backlight */
+/* OBSOLETE - Use EC_CMD_PWM_SET_DUTY */
 #define EC_CMD_PWM_SET_KEYBOARD_BACKLIGHT 0x0023
 
 struct ec_params_pwm_set_keyboard_backlight {
@@ -1543,10 +1552,17 @@ struct ec_params_pwm_set_keyboard_backlight {
 /* Set target fan PWM duty cycle */
 #define EC_CMD_PWM_SET_FAN_DUTY 0x0024
 
-struct ec_params_pwm_set_fan_duty {
+/* Version 0 of input params */
+struct ec_params_pwm_set_fan_duty_v0 {
 	uint32_t percent;
 } __ec_align4;
 
+/* Version 1 of input params */
+struct ec_params_pwm_set_fan_duty_v1 {
+	uint32_t percent;
+	uint8_t fan_idx;
+} __ec_align_size1;
+
 #define EC_CMD_PWM_SET_DUTY 0x0025
 /* 16 bit duty cycle, 0xffff = 100% */
 #define EC_PWM_MAX_DUTY 0xffff
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
