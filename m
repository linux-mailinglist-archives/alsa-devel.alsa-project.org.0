Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149EE5D639
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 20:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00301695;
	Tue,  2 Jul 2019 20:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00301695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562092682;
	bh=ZRMxaEQIYPkYFZfJovTWC1gRKq71j04vG3O6KXDLqhs=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:Cc:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=CaGCFcuj9VkiRCOpab/HzEh7z/f07sMY05LXAUDOMzL1skxzXD+LrzlqB1g1Edahu
	 Jpx6B3DqdAIjiWT48z9aDY/2+jOLb3TFbksZzdFTtem40uoarInbgx0sDNSCCGDLVO
	 FtOMrd5+Gje4LI2NBQkOXl7ZFcWEv/4+WoAVkjb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BEC3F80135;
	Tue,  2 Jul 2019 20:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99470F8076A; Mon,  1 Jul 2019 15:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20F38F8076A
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 15:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20F38F8076A
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from pc-niv.weinmann.com (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 48E854D130;
 Mon,  1 Jul 2019 15:43:09 +0200 (CEST)
From: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andreas Dannenberg <dannenberg@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Kate Stewart <kstewart@linuxfoundation.org>
Date: Mon,  1 Jul 2019 15:42:52 +0200
Message-Id: <24afd89b00bfba84d31083e6455baf1f3ad3f362.1561988282.git.nikolaus.voss@loewensteinmedical.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
References: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
In-Reply-To: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
References: <20190628143037.GH5379@sirena.org.uk>
 <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
X-Mailman-Approved-At: Tue, 02 Jul 2019 20:32:21 +0200
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org, nv@vosn.de,
 linux-kernel@vger.kernel.org,
 Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: tas5720.c: add ACPI enumeration
	support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add ACPI IDs for tas5720 and tas5722 and use device match API
to determine the variant.

Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
---
 sound/soc/codecs/tas5720.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index b2e897f094b4..e3f85926cac4 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -7,6 +7,7 @@
  * Author: Andreas Dannenberg <dannenberg@ti.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/device.h>
@@ -631,7 +632,9 @@ static int tas5720_probe(struct i2c_client *client,
 
 	data->tas5720_client = client;
 
-	data->variant = (const struct tas5720_variant *)id->driver_data;
+	data->variant = device_get_match_data(&client->dev);
+	if (!data->variant)
+		data->variant = (const struct tas5720_variant *)id->driver_data;
 
 	data->regmap = devm_regmap_init_i2c(client, data->variant->reg_config);
 	if (IS_ERR(data->regmap)) {
@@ -687,10 +690,20 @@ static const struct of_device_id tas5720_of_match[] = {
 MODULE_DEVICE_TABLE(of, tas5720_of_match);
 #endif
 
+#if IS_ENABLED(CONFIG_ACPI)
+static const struct acpi_device_id tas5720_acpi_match[] = {
+	{ "10TI5720", (kernel_ulong_t)&tas5720 },
+	{ "10TI5722", (kernel_ulong_t)&tas5722 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, tas5720_acpi_match);
+#endif
+
 static struct i2c_driver tas5720_i2c_driver = {
 	.driver = {
 		.name = "tas5720",
 		.of_match_table = of_match_ptr(tas5720_of_match),
+		.acpi_match_table = ACPI_PTR(tas5720_acpi_match),
 	},
 	.probe = tas5720_probe,
 	.id_table = tas5720_id,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
