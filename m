Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226BE13565
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:18:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04D9183C;
	Sat,  4 May 2019 00:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04D9183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921902;
	bh=VNaeYuUrVJPJnDxep3B55k7oPv3OzaZe+C3X/H9FTIc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGFbq61oWDpVqspaeQKjKwAXv+xQO2XNHF+tHjYdQ+bxdBVVR9SEhRvI54Lv75zyi
	 pX3B4Q4VfA++aEgxIs9aB/87OGXWfDSSwdSC7pvfUq5VJVXZlMBthQ7dl7d+Ry9EBV
	 OgwytTUWZ/IcVSn2TBAignrHPQr32aXka/BWV534=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35EC6F8978C;
	Sat,  4 May 2019 00:04:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C2D9F89747; Sat,  4 May 2019 00:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A48FF89750
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A48FF89750
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EYBs6j1u"
Received: by mail-pf1-x441.google.com with SMTP id 188so3533474pfd.8
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7jf11BSROJYGYWGaMhdpSMdF9KlDBwardIcOhZ2vpE=;
 b=EYBs6j1u0ar6LZWMBPa86O/T+vhocQtHOspqto4ssJRYHXEOM+oclp5oo9qqEVSXJE
 iGjb5qXVAba/toGOcYwwd08qubZYp4aic0BGEbf+ZZXh+YqF0c0t++xBwveBanRismxc
 MG7ABlf5AgEJukxjvW/dfWTIhwFyPp/IFVWXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7jf11BSROJYGYWGaMhdpSMdF9KlDBwardIcOhZ2vpE=;
 b=KO36eiSP5VyJVPexNmcf9sKFtX9FMZvy8RS1J3VM+fZg3lpIxjnZu2umJJdKdmxZDM
 0RUOg4qTECSR0ZDM5CNrzdF/bvEWqX0Fk2TnvenEHt7XgxzAnFygwTk+sDtHnFThAe7x
 YsHiZIqCUVL8SVFiwpe7adIgRk8VKupr7nMQ0zr/Eev6KWwKPlUr8lJJ3c0X90eZ1iAT
 tWcTpfhVqfoYzoOMrBHcb3m5XRk9Rsm9lU24Mn75fYRY0F8YFUuj16PCf8w9aBugRx1A
 DB109jtsIACiwW2yN1SlBX/A2ZGhgtjuv25LUVg5r/+Rw4PZ3G5IpRp9n0mzh28n7wF2
 am6A==
X-Gm-Message-State: APjAAAXLgeLIt/aZmtaMcZi+W0K6Spco72i6YJ8Pq1FI+jaLNjPb8jPc
 HsZG4SGEBHy4vGKTlIA8N60HAA==
X-Google-Smtp-Source: APXvYqxg3DK7BDo0zppzRV9+Yt/49X75Nmj33RT+e5uAVKjOE1je0wqzV6pqO1AUwhuUXWk6YH9LOw==
X-Received: by 2002:a65:4c07:: with SMTP id u7mr13282550pgq.93.1556921000826; 
 Fri, 03 May 2019 15:03:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id m131sm7612238pfc.25.2019.05.03.15.03.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:20 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:26 -0700
Message-Id: <20190503220233.64546-24-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 23/30] mfd: cros_ec: Add I2C passthru
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
