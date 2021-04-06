Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE30D355141
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 12:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB1B1614;
	Tue,  6 Apr 2021 12:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB1B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617706381;
	bh=imk/T2LzP//BjSBfG6X+RnV/eHzkE57Hsvnu3xqYy5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XK4X1ao2opgcDXc8IdB5x6ZuMVDyTS2dt60qalHJPLjkPE7e8UplV6Z8FRHBvJQyi
	 vVpDe8LjV4a8cDHOkGvuixoKNQfKupV7fhCo4/9BBshox8JXBj3Cup2QZnhYrQ8Ah0
	 XfZtzMslyRCd2czssgUvbH6jcyur2mqd1RovEvdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A39F8042F;
	Tue,  6 Apr 2021 12:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84141F80423; Tue,  6 Apr 2021 12:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B22B4F80169
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 12:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B22B4F80169
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 2E9A53FA2D;
 Tue,  6 Apr 2021 12:50:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id Fxa5jccpfkvA; Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 423873FA38;
 Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] SOC Codecs: TLV320AIC3X add SPI: SPI code
Date: Tue,  6 Apr 2021 12:50:17 +0200
Message-Id: <20210406105018.59463-5-jiri.prchal@aksignal.cz>
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

Things related to SPI in separate file.
Please help with getting model value, line 34. I didn't find out where to get "driver_data".

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x-spi.c | 77 ++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 sound/soc/codecs/tlv320aic3x-spi.c

diff --git a/sound/soc/codecs/tlv320aic3x-spi.c b/sound/soc/codecs/tlv320aic3x-spi.c
new file mode 100644
index 000000000000..611d53e1bdf2
--- /dev/null
+++ b/sound/soc/codecs/tlv320aic3x-spi.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ALSA SoC TLV320AIC3x codec driver SPI interface
+ *
+ * Author:      Arun KS, <arunks@mistralsolutions.com>
+ * Copyright:   (C) 2008 Mistral Solutions Pvt Ltd.,
+ *
+ * Based on sound/soc/codecs/wm8731.c by Richard Purdie
+ *
+ */
+
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "tlv320aic3x.h"
+
+static int aic3x_spi_probe(struct spi_device *spi)
+{
+	struct regmap *regmap;
+	struct regmap_config config;
+
+	config = aic3x_regmap_config;
+	config.reg_bits = 7;
+	config.pad_bits = 1;
+	config.val_bits = 8;
+	config.read_flag_mask = 0x01;
+
+	dev_dbg(&spi->dev, "probing tlv320aic3x spi device\n");
+
+	regmap = devm_regmap_init_spi(spi, &config);
+	return aic3x_probe(&spi->dev, regmap, AIC3X_MODEL_3X); /*FIXME: where to get id->driver_data?*/
+}
+
+static int aic3x_spi_remove(struct spi_device *spi)
+{
+	return aic3x_remove(&spi->dev);
+}
+
+static const struct spi_device_id aic3x_spi_id[] = {
+	{ "tlv320aic3x", AIC3X_MODEL_3X },
+	{ "tlv320aic33", AIC3X_MODEL_33 },
+	{ "tlv320aic3007", AIC3X_MODEL_3007 },
+	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ "tlv320aic3106", AIC3X_MODEL_3106 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, aic3x_spi_id);
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
+static struct spi_driver aic3x_spi_driver = {
+	.driver = {
+		.name = "tlv320aic3x",
+		.owner = THIS_MODULE,
+		.of_match_table = aic3x_of_id,
+	},
+	.probe = aic3x_spi_probe,
+	.remove = aic3x_spi_remove,
+	.id_table = aic3x_spi_id,
+};
+
+module_spi_driver(aic3x_spi_driver);
+
+MODULE_DESCRIPTION("ASoC TLV320AIC3x codec driver SPI");
+MODULE_AUTHOR("Arun KS <arunks@mistralsolutions.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

