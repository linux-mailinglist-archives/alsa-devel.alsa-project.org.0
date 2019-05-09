Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A147194A6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0C3A18DF;
	Thu,  9 May 2019 23:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0C3A18DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437515;
	bh=yoebr0EGUX5yE4IRyHFs4WNYRv5WDL9vQoYcL09o4HM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdVTe4aZykrg0n5KWAfF9WESAqsAvO8ko7OquM0Iy3DCNAwZg+pW1ehhfpJowS6Vd
	 EUeTta8NnIxS3RJyFjy26VEYNu7Nra8QuqiS5FwAMkOE7LZd3skwD1dOZfuyj1jMtU
	 JANrPIIEhP8HJpIPVx6NA1C25V+3EcRxXml9ARKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E99FF897B9;
	Thu,  9 May 2019 23:15:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98475F8977B; Thu,  9 May 2019 23:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D362F89775
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D362F89775
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mzdmu5oO"
Received: by mail-pf1-x441.google.com with SMTP id 10so1956750pfo.5
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Km0HSMOyBXYCQtJGjyx5C/OgWQFqPAevnijYAPrBruQ=;
 b=mzdmu5oOdFep4gcvfDlsS3/z7Xp98Kueq+NJT4yQ8eLemoMaje+ZFPhC1hF4Xmt0MO
 FlnpG7OR6OEC+2tq8H6RiGxHlQgXAyJN0Vt/blua1hUYuac79zrX6sA4oVkjdL8Ccnuu
 BwOBjczt3BSVPk3wJozhJcqeFgqU17fJxUWV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Km0HSMOyBXYCQtJGjyx5C/OgWQFqPAevnijYAPrBruQ=;
 b=LvTFHZJcoTPi40s/65WsriP95MAI71lRfV97+mSVcUniJeYuYDf6NM3yE4pMV3Z1us
 vH2B6BcjRjljSdQmeB42VJ76rqyinJIo/IW6fKDARXkJ6Io5koHUqX/Bh5cfSn+tPev3
 76V1o/fmenrOPWAATRR0ntfcsJ7GXWrvs5PUZaxVM/Hr2uMLl01rFCJq0ovk8sWo/z3X
 uP5S6NuEUFbnVYhmt/UXM+2jcVqbSTcuLdf083dG+vgnLdj76WAuOBwk5qNLjz7nMjHu
 APQs6NHTPCYE8NRUzLrzOox0vh1x0XVq3g4dhUeihRc5ahjl1GsZ1/mcCLIzVz9hO0qk
 ELDQ==
X-Gm-Message-State: APjAAAUcLw2RweGRp2tcFQYAqCxrfRScUMWSSEbDrwo8P+AvgN97ISH8
 jmAgy0Hs6+vuHmzGHOOzqoZQqg==
X-Google-Smtp-Source: APXvYqyX9kpfnQLUoODDaqEll/D8VDVJQLK3jZJAbZP8QNPZVQaHK3XCjgPRR2kicSM8uffpRvofKw==
X-Received: by 2002:a62:304:: with SMTP id 4mr8255011pfd.99.1557436477869;
 Thu, 09 May 2019 14:14:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id a3sm3250265pgl.74.2019.05.09.14.14.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:37 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:46 -0700
Message-Id: <20190509211353.213194-24-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 23/30] mfd: cros_ec: Add I2C passthru
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
