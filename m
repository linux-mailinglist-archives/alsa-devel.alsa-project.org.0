Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E2355140
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 12:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2461676;
	Tue,  6 Apr 2021 12:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2461676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617706367;
	bh=k4hGVIOOcQuqovKyW2uZ1QDcFpEJMiAgY/IO4UfDtNo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIRESWRkdYyZclKqlh9F4kfcm/eq5N5x6AKee+sBdGNXGpfXaIB8IILReFeI2LlmG
	 vUL/MN+EuJfPxpLzC5QkUVTw+qbi1K6RWL/ENuITp/C4Z3Kr3BIX8XdaYczn27o06B
	 LsD28dJ5e4pL8emDZgUR5XBTLzA55EczRN7yH0M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD95F8020B;
	Tue,  6 Apr 2021 12:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C3A4F80249; Tue,  6 Apr 2021 12:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13F2BF80249
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 12:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F2BF80249
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id AC52F3FA38;
 Tue,  6 Apr 2021 12:50:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id lfPPcqAUAOvi; Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 0BD1C3FA37;
 Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] SOC Codecs: TLV320AIC3X add SPI: I2C code
Date: Tue,  6 Apr 2021 12:50:16 +0200
Message-Id: <20210406105018.59463-4-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Things related to I2C in separate file.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x-i2c.c | 72 ++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 sound/soc/codecs/tlv320aic3x-i2c.c

diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
new file mode 100644
index 000000000000..f77c76d25112
--- /dev/null
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ALSA SoC TLV320AIC3x codec driver I2C interface
+ *
+ * Author:      Arun KS, <arunks@mistralsolutions.com>
+ * Copyright:   (C) 2008 Mistral Solutions Pvt Ltd.,
+ *
+ * Based on sound/soc/codecs/wm8731.c by Richard Purdie
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "tlv320aic3x.h"
+
+static int aic3x_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
+{
+	struct regmap *regmap;
+	struct regmap_config config;
+
+	config = aic3x_regmap_config;
+	config.reg_bits = 8;
+	config.val_bits = 8;
+
+	regmap = devm_regmap_init_i2c(i2c, &config);
+	return aic3x_probe(&i2c->dev, regmap, id->driver_data);
+}
+
+static int aic3x_i2c_remove(struct i2c_client *i2c)
+{
+	return aic3x_remove(&i2c->dev);
+}
+
+static const struct i2c_device_id aic3x_i2c_id[] = {
+	{ "tlv320aic3x", AIC3X_MODEL_3X },
+	{ "tlv320aic33", AIC3X_MODEL_33 },
+	{ "tlv320aic3007", AIC3X_MODEL_3007 },
+	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ "tlv320aic3106", AIC3X_MODEL_3106 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aic3x_i2c_id);
+
+static const struct of_device_id aic3x_of_id[] = {
+	{ .compatible = "ti,tlv320aic3x", },
+	{ .compatible = "ti,tlv320aic33" },
+	{ .compatible = "ti,tlv320aic3007" },
+	{ .compatible = "ti,tlv320aic3104" },
+	{ .compatible = "ti,tlv320aic3106" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aic3x_of_id);
+
+static struct i2c_driver aic3x_i2c_driver = {
+	.driver = {
+		.name = "tlv320aic3x",
+		.of_match_table = aic3x_of_id),
+	},
+	.probe = aic3x_i2c_probe,
+	.remove = aic3x_i2c_remove,
+	.id_table = aic3x_i2c_id,
+};
+
+module_i2c_driver(aic3x_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC TLV320AIC3x codec driver I2C");
+MODULE_AUTHOR("Arun KS <arunks@mistralsolutions.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

