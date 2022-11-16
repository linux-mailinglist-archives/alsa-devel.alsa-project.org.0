Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15162B2E0
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:40:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C373F16B2;
	Wed, 16 Nov 2022 06:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C373F16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577245;
	bh=S+3QMg1zp6RJ4AzIHlEwYbPMHEDZj/gL2wPHOc7O1d0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9HVbK8YYiOk1T5SXWr1D5Sx8nsfYj4410f+FNShLo9C/aBtTziiAaB0xfMTgI7AY
	 SoSlzgq1k2Ke/Jvwxif+vJQJN1sxpfjEpxJshumL0RSp0izRykB+ly469XwLFfoXg1
	 iUmeVuwm+AfpgyjUiJbmNkCcJOU8VH1pTyw5GhKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8535EF8057B;
	Wed, 16 Nov 2022 06:38:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86EE9F80571; Wed, 16 Nov 2022 06:38:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2164F800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2164F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="naf7hHO3"
Received: by mail-pl1-x632.google.com with SMTP id io19so15441697plb.8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFQW6v1diH1VyW+sL8lBdAoomh7zxMpXfwnkxl/32zA=;
 b=naf7hHO3UWHjpNpfDT7zWp+/pfz24/zpiVMv5vvpOmtsjD71TdXVOQuWTrXQlGW3DT
 k6OQyzXbC33xTJ4vWRBVu9j4bmDx6F7NtWWOnhPf1MyyzqTcFrH8M3c7v3m1bpJmKh15
 gL9KA6gm3URmDKumwfAsxlyem/35OjO3zoRfYkjUdt1JcHyccj00Eyx9Bi9uSIWdF7ZT
 +Wr5OWMJKXnCwh7W+QWb/80dPzmO5u+N6SqhYvU0Q3tpeaFNhACn2zodPNtlWRQxqwEk
 vdXf+yZqTNcpyU304fRnPyvbpukwqcaJt1vFvtUYIM7XdVNYYbPvJ1oGfq6acSrI+9hU
 43MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFQW6v1diH1VyW+sL8lBdAoomh7zxMpXfwnkxl/32zA=;
 b=k8PKe3f8bX5q9ejauv/p3Wae/zXtjV3vdOKKkuhCwHIv0zEzpo1Ymsr5qsU1fnQExF
 c4Dy0E8o8975RXrhAf4aWFYVi7AMA6Bp3trbf8vV9Z4mn9BrnyzYTLRXoTUIQWnSKgjq
 qIXGyRMoLL9hfUo/MXnO0T/Jawfug+UoubJGtjSOdjru3XxeOV5GyHJVCSNGkyfH0oGz
 JfDQ84XsmZ8S+qibxPMXrhTW6ORXW0x1FciDkozcrpif9PtNLzmWY9ZMutP/bvWisffR
 AXi64ypT2xk1Z3h0gs01UbpGsDPmx73xT51OR2/lsyz/lawbVzcWeYGnaP0n72SuyJq6
 gWmg==
X-Gm-Message-State: ANoB5pk34KkmHHzEdz9GnnmabxkOKSNlPnXCuK1bY09CGQvz5O1+QDl5
 5rRL90PKOb80FQ6qNSPSHUgEl8bC+Xo=
X-Google-Smtp-Source: AA0mqf4eBMXcBzdwJ5mtVoL0fxjZ7psKH+U4U0xM8+RXDkiJthcyDXK7qNiV0gPyIWmCuY6dETT4gA==
X-Received: by 2002:a17:902:e546:b0:188:4ea8:a685 with SMTP id
 n6-20020a170902e54600b001884ea8a685mr7509296plf.71.1668577107897; 
 Tue, 15 Nov 2022 21:38:27 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:27 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 04/11] ASoC: tpa6130a2: remove support for platform data
Date: Tue, 15 Nov 2022 21:38:10 -0800
Message-Id: <20221116053817.2929810-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
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

There are no users of tpa6130a2_platform_data in the mainline kernel,
remove it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/sound/tpa6130a2-plat.h | 17 -----------------
 sound/soc/codecs/tpa6130a2.c   | 18 ++++--------------
 2 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 include/sound/tpa6130a2-plat.h

diff --git a/include/sound/tpa6130a2-plat.h b/include/sound/tpa6130a2-plat.h
deleted file mode 100644
index a60930e36e93..000000000000
--- a/include/sound/tpa6130a2-plat.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * TPA6130A2 driver platform header
- *
- * Copyright (C) Nokia Corporation
- *
- * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
- */
-
-#ifndef TPA6130A2_PLAT_H
-#define TPA6130A2_PLAT_H
-
-struct tpa6130a2_platform_data {
-	int power_gpio;
-};
-
-#endif
diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index 8c00db32996b..5f00bfc32917 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -14,7 +14,6 @@
 #include <linux/gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <sound/tpa6130a2-plat.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <linux/of.h>
@@ -218,16 +217,15 @@ MODULE_DEVICE_TABLE(i2c, tpa6130a2_id);
 
 static int tpa6130a2_probe(struct i2c_client *client)
 {
-	struct device *dev;
+	struct device *dev = &client->dev;
 	struct tpa6130a2_data *data;
-	struct tpa6130a2_platform_data *pdata = client->dev.platform_data;
-	struct device_node *np = client->dev.of_node;
 	const struct i2c_device_id *id;
 	const char *regulator;
 	unsigned int version;
 	int ret;
 
-	dev = &client->dev;
+	if (!dev->of_node)
+		return -ENODEV;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -239,15 +237,7 @@ static int tpa6130a2_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	if (pdata) {
-		data->power_gpio = pdata->power_gpio;
-	} else if (np) {
-		data->power_gpio = of_get_named_gpio(np, "power-gpio", 0);
-	} else {
-		dev_err(dev, "Platform data not set\n");
-		dump_stack();
-		return -ENODEV;
-	}
+	data->power_gpio = of_get_named_gpio(dev->of_node, "power-gpio", 0);
 
 	i2c_set_clientdata(client, data);
 
-- 
2.38.1.431.g37b22c650d-goog

