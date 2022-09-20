Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C85BDA87
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 04:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A881A950;
	Tue, 20 Sep 2022 04:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A881A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663642786;
	bh=lMP4roH4iuj42tgsErA6EpTI3xKh6u5eKyuTzYbIYqs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hgxV/EGXSBMMAfTZjOLB23L+YnIAoXCnJAQoqL4R5I6l6471Q22CyV7KncTkg/SDU
	 wUtlflpgU6o/hCayL6PdWmMz0L2YqgLL0CB6Az8MtgiWn0N7+vecm87PM4faXhr2OW
	 FfiEbW2ZJhoPFgOLaPVIN6hwmKh5tFxS9EcPuDRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB9CF804E4;
	Tue, 20 Sep 2022 04:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9878EF80155; Tue, 20 Sep 2022 04:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B39EFF800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 04:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39EFF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mB0m4QXG"
Received: by mail-pl1-x62e.google.com with SMTP id v1so1041451plo.9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=bG3TOlajU16P3gbCwMauLa0qhe+go+yuIOUL4RNlsMs=;
 b=mB0m4QXG1bWuQUYi3KqzpGAYgP8XshwcXa4pcBNoksZRgGI46KWHie5yLhFC+vyYPJ
 NjCkck5Vo0qK30wnb3TD0bVCAB71TJmZSgFtnbxkFmeeU6s6TaRcOZJfmcwSYqRdQei2
 CD4g18SdBpe0zEaU0Kw1GiAICKMXrE26WOWXc/689WbeWxT9Dgm+bYKPgmIpqTb9BbIa
 DiIQzVllOQRwvJ2Ro/adFfTxKEW1HO99ODpEKb64oEx0PMS6b+g0ASjMq24KQDBgUj3a
 nXOnSL1q6BHo1cGSp//lXHCWmuNn/ZrvV8xuLmU3QoRsDEFBMCQeYB9IFip3F2Z6Pb+I
 +tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=bG3TOlajU16P3gbCwMauLa0qhe+go+yuIOUL4RNlsMs=;
 b=duXbYqtFtgKRtIgbPJLJPBl3128WNAA96f6s2MbfqCKOYhUdhPOpUa2rrKeG72PFOe
 h4pWi/5QzYhAudSJRwRJhb+an/iH7Qyz4NQveiv2vpCO8GdXKOwYKHMyLUbq9EVkLRpp
 IitXyTru9RimIVIp248gxaQuHWzhHjCyIkhov1AlS1mxbO9fJk63oea3LLTIw8pj5woU
 NaxdmbYXW+JrGpV7oO9qREUvTlNgj15nnovy7Z96K/1hQKV2RlOOVr14+3B6GPRqx8Zv
 NSgWFYDNp2lXPST4uPETm9dHoR7pirEGloDGwokQeSJ9XQhAAdAc5V/7adxHq+b33vPM
 L9hQ==
X-Gm-Message-State: ACrzQf3nObzgZcS28IMDBRR/SZIM/EXYke+AwdPnn6N4EWdMZ3X0sCIq
 rmKpk1/HkUx1abzeH1cDqB0=
X-Google-Smtp-Source: AMsMyM422QwAquVOaMXBpgC0AQASMi7a0PhUei0xAJVzNK/fyN+cnM/gRRAeitNAdCFk83iiMBHuoQ==
X-Received: by 2002:a17:90b:1b10:b0:200:934b:741f with SMTP id
 nu16-20020a17090b1b1000b00200934b741fmr1482826pjb.212.1663642688676; 
 Mon, 19 Sep 2022 19:58:08 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:b095:5d5d:4c28:8088])
 by smtp.gmail.com with ESMTPSA id
 z128-20020a626586000000b00542e190f6bcsm147499pfb.102.2022.09.19.19.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 19:58:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: ssm2518: drop support for platform data
Date: Mon, 19 Sep 2022 19:58:03 -0700
Message-Id: <20220920025804.1788667-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
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

There are currently no users of this driver's platform data in the
mainline kernel, so let's drop it.

Newer devices should use DT, ACPI, or static software properties to
describe the hardware.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/platform_data/ssm2518.h | 21 ---------------------
 sound/soc/codecs/ssm2518.c            |  6 +-----
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 include/linux/platform_data/ssm2518.h

diff --git a/include/linux/platform_data/ssm2518.h b/include/linux/platform_data/ssm2518.h
deleted file mode 100644
index 3f9e632d6f63..000000000000
--- a/include/linux/platform_data/ssm2518.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * SSM2518 amplifier audio driver
- *
- * Copyright 2013 Analog Devices Inc.
- *  Author: Lars-Peter Clausen <lars@metafoo.de>
- */
-
-#ifndef __LINUX_PLATFORM_DATA_SSM2518_H__
-#define __LINUX_PLATFORM_DATA_SSM2518_H__
-
-/**
- * struct ssm2518_platform_data - Platform data for the ssm2518 driver
- * @enable_gpio: GPIO connected to the nSD pin. Set to -1 if the nSD pin is
- *            hardwired.
- */
-struct ssm2518_platform_data {
-	int enable_gpio;
-};
-
-#endif
diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 6d8847848299..feee28207e5d 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -13,7 +13,6 @@
 #include <linux/slab.h>
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
-#include <linux/platform_data/ssm2518.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -736,7 +735,6 @@ static const struct regmap_config ssm2518_regmap_config = {
 
 static int ssm2518_i2c_probe(struct i2c_client *i2c)
 {
-	struct ssm2518_platform_data *pdata = i2c->dev.platform_data;
 	struct ssm2518 *ssm2518;
 	int ret;
 
@@ -744,9 +742,7 @@ static int ssm2518_i2c_probe(struct i2c_client *i2c)
 	if (ssm2518 == NULL)
 		return -ENOMEM;
 
-	if (pdata) {
-		ssm2518->enable_gpio = pdata->enable_gpio;
-	} else if (i2c->dev.of_node) {
+	if (i2c->dev.of_node) {
 		ssm2518->enable_gpio = of_get_gpio(i2c->dev.of_node, 0);
 		if (ssm2518->enable_gpio < 0 && ssm2518->enable_gpio != -ENOENT)
 			return ssm2518->enable_gpio;
-- 
2.37.3.968.ga6b4b080e4-goog

