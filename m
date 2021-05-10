Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D096377F2F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 11:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B992616B5;
	Mon, 10 May 2021 11:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B992616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620638107;
	bh=VSTNxWXsRDN04owFYAGBwI+PUvG/NNxqI4J3/zZIbls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfaXmU5vdyOLMy7j0yLHMCn+XYK6JZZnpDMzEdG0l71MdT6BaQM0oPoI1nbLwdHNK
	 Lt3oMCK40EndHKL3emkOhZmBoblUUsxq4B14iSxj3LC/yKo0FpCRdgGvmkbXYTY2DZ
	 sEs3KEUKoKbvlp1twz0gtELJfMEUCH9G7UyMQ87U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F287F8027B;
	Mon, 10 May 2021 11:13:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 187CBF80272; Mon, 10 May 2021 11:13:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A03C3F800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 11:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A03C3F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FgUplIOR"
Received: by mail-wr1-x42e.google.com with SMTP id l2so15779529wrm.9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q62kvUojd/CS4f0GUoH40Kz29XHeqv+w8LQsa6wuePg=;
 b=FgUplIORX/8wBTHf3e0s6ooIAqBFDLkFKqK7zHHbKgDqnFZNfnyCpj9+mOocPrKH8j
 fWbfWxSwm63SBDtcooZRjM7wvNLOYpgH7bVxZWlqPJy0hwWBz76MpNOl01BJbHRblo3+
 i1epJowT0572TcbGz0jqtasTT25bMG9LGPYZIEHPDy5xX98+NZWKCxZcfnVKAVM9pomW
 G13zllZyf5Ash0WK2eAnPsL7k/ZxTMlHIk1DZMTSrCuzjxg5iuaNRGWphY58MDMW5Hrl
 Buqu6U7Lam79dDOpbpI+Zxzr2QAOC/GIH0Q8gPodk7+PaoqIqG6SAfCqfF2HdOw2s0Jt
 P/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q62kvUojd/CS4f0GUoH40Kz29XHeqv+w8LQsa6wuePg=;
 b=mCmH+ZcRjaSUvuvYpGnT2PuV7CJI6lQecCG+gcuN8QQdCsRjQusiYaTcEH9UVM5J34
 V3ALcvtgbNERQ7N33ikHqhmWx8+gSqnewVWRm5P0fGDA6fFBsR69ZRk5MYyZrL38HIOO
 wq1oC3MEC3Gr9MT1EErTEde2cau6bzQ0diurC4/qNPf/oQcNqiRrd2X9iTo9JgGuTz8V
 ykmz9BdUJA7X0IW788c/nsTZvLt7+4vZ4XoJQlnWOmqI653e/aZCyAIVWX2qsUroMIgP
 +RwL863J1zs7pdQhbvlNkGuuYJh3r//LXjPJ1sPM7Zxgxgnobgf5NLc6cGGA9SdgUp+7
 xGPQ==
X-Gm-Message-State: AOAM533jYQxUQwLd395SoyIMVp1gSxB/ffJHBS9l4sX9b1mp/k25biSW
 ECrsUSlBkXfLIOxYQHL1mcpwEQ==
X-Google-Smtp-Source: ABdhPJxjdy4AmriG/0qKHp1B+hfL6f6BrsaZ/Vutx9OAGQggwQ6O+811DoJ9hQueZVnBft3iV2I3Rw==
X-Received: by 2002:adf:f152:: with SMTP id y18mr29434949wro.77.1620637990242; 
 Mon, 10 May 2021 02:13:10 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id s5sm19040575wmh.37.2021.05.10.02.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 02:13:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/2] mfd: wcd934x: add macro for adding new interrupts
Date: Mon, 10 May 2021 10:12:38 +0100
Message-Id: <20210510091239.2442-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
References: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently only two interrupts supported is added in wcd934x interrupt controller,
however if we are adding more interrupts the file will become too much unreadable.

So add a macro to make adding new interrupts easy and also convert existing
slim and soundwire interrupts to use it.
This is in preparation to enable Multi Button Headset Control support on this
codec.

WCD934x supports Multi Button Headset control which enable headset detection
along with headset button detection.

This patch adds interrupts required for MBHC functionality.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/mfd/wcd934x.c | 43 +++++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index c274d733b656..53d46fadcf5a 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -17,6 +17,21 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slimbus.h>
 
+#define WCD934X_REGMAP_IRQ_REG(_irq, _off, _mask)		\
+	[_irq] = {						\
+		.reg_offset = (_off),				\
+		.mask = (_mask),				\
+		.type = {					\
+			.type_reg_offset = (_off),		\
+			.types_supported = IRQ_TYPE_EDGE_BOTH,	\
+			.type_reg_mask  = (_mask),		\
+			.type_level_low_val = (_mask),		\
+			.type_level_high_val = (_mask),		\
+			.type_falling_val = 0,			\
+			.type_rising_val = 0,			\
+		},						\
+	}
+
 static const struct mfd_cell wcd934x_devices[] = {
 	{
 		.name = "wcd934x-codec",
@@ -30,32 +45,8 @@ static const struct mfd_cell wcd934x_devices[] = {
 };
 
 static const struct regmap_irq wcd934x_irqs[] = {
-	[WCD934X_IRQ_SLIMBUS] = {
-		.reg_offset = 0,
-		.mask = BIT(0),
-		.type = {
-			.type_reg_offset = 0,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-			.type_reg_mask  = BIT(0),
-			.type_level_low_val = BIT(0),
-			.type_level_high_val = BIT(0),
-			.type_falling_val = 0,
-			.type_rising_val = 0,
-		},
-	},
-	[WCD934X_IRQ_SOUNDWIRE] = {
-		.reg_offset = 2,
-		.mask = BIT(4),
-		.type = {
-			.type_reg_offset = 2,
-			.types_supported = IRQ_TYPE_EDGE_BOTH,
-			.type_reg_mask  = BIT(4),
-			.type_level_low_val = BIT(4),
-			.type_level_high_val = BIT(4),
-			.type_falling_val = 0,
-			.type_rising_val = 0,
-		},
-	},
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SLIMBUS, 0, BIT(0)),
+	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SOUNDWIRE, 2, BIT(4)),
 };
 
 static const struct regmap_irq_chip wcd934x_regmap_irq_chip = {
-- 
2.21.0

