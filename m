Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C942533892
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 593BB169E;
	Mon,  3 Jun 2019 20:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 593BB169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587894;
	bh=o2ZfaEmRDx15mPPRJRq0gHssiriamGE4RUjST4pxw94=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uy1mumtAiJimuLKnYBTtVQ62JXMc8uCrKEbNenZfPtlsh0lhhwJ+HkvGhFDpjheGC
	 dhXgs+QD9+m2Fh7Ru5aqMG8UtLJ/SCkFU9/poq4hycdIIaKsnSSGGHG7TG9u6mcrzh
	 L5KmpiB2Rm8+2g1cxAFOiq8BsIVruPZ4rLFp4/PY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F06AF897B9;
	Mon,  3 Jun 2019 20:35:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B760BF8977C; Mon,  3 Jun 2019 20:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEB55F89776
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEB55F89776
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aQ9MPswY"
Received: by mail-pg1-x544.google.com with SMTP id h17so8790317pgv.0
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hz5V6YUUKbQCf9zJopKesHEceG79IQrE8elrPDeqfIA=;
 b=aQ9MPswYniQYF/VdKEGa83AHZ5RcwOnAiRjnZU9kdPMUKqq4lkWjJfrxGSYaNBSa2M
 7Ozd1L3YdSwCVfklSjOEq+yoZ3Aq5rcVjPm3TXVn5aD/gT6wAu241TMQdNeNEoRv1W4n
 UkQo6o4yyGV9LY1WQFNGimqIwNoKhnUVrlciM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hz5V6YUUKbQCf9zJopKesHEceG79IQrE8elrPDeqfIA=;
 b=f9DP696jwcwjFgxyyKHU4RHQfVp6Sgl67vLuqjwAPWIdco09Yy44E4NICCfwDdB2ef
 /8e4WBQH+OIN2++HYNpXlRlE51eDszGsw5Sr66v8jFu4xwMYugjektzFByFEAX+EbS4U
 DWY0ESwsZ4rs+YdPkpByXYPw+gPSdNFhy/uDBEH+t4AfnFK97dw5OMrX2GxJuZHgaAdL
 2+y0FzpAnlWKCtwAstIHDHljlHS+hpM2XMPo/8v9W7kou+R69bgQdZ//SEu2SqIrG/w4
 P2pfSljpqhf4AE4hxDlcNGatlXdZZ/Ydzao3vJ4d2tp34+folYRhrDaJ0GET3nBZ55LX
 umHQ==
X-Gm-Message-State: APjAAAX6uNiMnp1CZwwJRdnntAMO4q47dEjXoLVkhD0Khm8KDucKUK9k
 FHYAKwxM4/Km/b5M5o4xXg24Cw==
X-Google-Smtp-Source: APXvYqxCgWJ0IzOoKA7UD5Ilf35KswSj9PGa5spcxGeDMhtHufZS+8vOm3xoElqubc+gwOmf6i+aNg==
X-Received: by 2002:a63:ee12:: with SMTP id e18mr16056124pgi.412.1559586883446; 
 Mon, 03 Jun 2019 11:34:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id e124sm20964180pfa.135.2019.06.03.11.34.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:42 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:54 -0700
Message-Id: <20190603183401.151408-24-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 23/30] mfd: cros_ec: Add I2C passthru
	protection API
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

Prevent direct i2c access to device behind EC when not in development mode.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 49ea905cfd18..59ad6bae3f9b 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -4316,6 +4316,28 @@ struct ec_params_entering_mode {
 #define VBOOT_MODE_DEVELOPER 1
 #define VBOOT_MODE_RECOVERY  2
 
+/*****************************************************************************/
+/*
+ * I2C passthru protection command: Protects I2C tunnels against access on
+ * certain addresses (board-specific).
+ */
+#define EC_CMD_I2C_PASSTHRU_PROTECT 0x00B7
+
+enum ec_i2c_passthru_protect_subcmd {
+	EC_CMD_I2C_PASSTHRU_PROTECT_STATUS = 0x0,
+	EC_CMD_I2C_PASSTHRU_PROTECT_ENABLE = 0x1,
+};
+
+struct ec_params_i2c_passthru_protect {
+	uint8_t subcmd;
+	uint8_t port;		/* I2C port number */
+} __ec_align1;
+
+struct ec_response_i2c_passthru_protect {
+	uint8_t status;		/* Status flags (0: unlocked, 1: locked) */
+} __ec_align1;
+
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
