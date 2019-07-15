Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8796A211
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 08:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175B31693;
	Tue, 16 Jul 2019 08:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175B31693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563257046;
	bh=5naOFPxtOZdfPi9MIgB4bmIbdnkxw9Vrlggggnohn8w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bdZ30CAiU0AZdWkWrhHXpAKa/jIFeXBNbvOsNRglQU1C4Mv9mWBtvF2rwZfLO0Bj3
	 Lby4kanupEA8ZnXa0JDG4qc9DPQ5kW39BDWEu85383qbRh2+aSj3VKquOlsPuKvZ8g
	 PSv/Bjt4WQO4FPaMzDxmLJYgk7EFUYhQoLMswF+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E5A3F803CF;
	Tue, 16 Jul 2019 08:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DB8F80367; Mon, 15 Jul 2019 11:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-sz.amlogic.com (mail-sz.amlogic.com [211.162.65.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B425F800D8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 11:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B425F800D8
Received: from localhost.localdomain (10.28.8.29) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 15 Jul 2019
 17:56:28 +0800
From: chunguo feng <chunguo.feng@amlogic.com>
To: <lgirdwood@gmail.com>
Date: Mon, 15 Jul 2019 17:55:56 +0800
Message-ID: <20190715095556.1614-1-chunguo.feng@amlogic.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.29]
X-Mailman-Approved-At: Tue, 16 Jul 2019 08:01:36 +0200
Cc: alsa-devel@alsa-project.org, RyanS.Lee@maximintegrated.com,
 grundler@chromium.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, chunguo.feng@amlogic.com,
 broonie@kernel.org, bleung@chromium.org
Subject: [alsa-devel] [PATCH] ASoC: max98383: fix i2c probe failure
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

From: fengchunguo <chunguo.feng@amlogic.com>

Added reset_gpio configuration for i2c probe successfully.
If not,i2c address can't be found rightly.

Error information:
max98373 3-0031: Failed to read: 0x21FF

Fixed:
[3.761299@3] max98373 3-0031: MAX98373 revisionID: 0x43
[3.828911@3] asoc-aml-card auge_sound: max98373-aif1 <-> TDM-B mapping ok

Signed-off-by: fengchunguo <chunguo.feng@amlogic.com>
---
 sound/soc/codecs/max98373.c | 34 ++++++++++++++++++++++++++++++----
 sound/soc/codecs/max98373.h |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 528695cd6a1c..9a1eb7222357 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -12,6 +12,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98373.h"
@@ -895,6 +896,17 @@ static void max98373_slot_config(struct i2c_client *i2c,
 	else
 		max98373->i_slot = 1;
 
+	max98373->reset_gpio = of_get_named_gpio(dev->of_node,
+						"maxim,reset-gpio", 0);
+	if (!gpio_is_valid(max98373->reset_gpio)) {
+		dev_err(dev, "Looking up %s property in node %s failed %d\n",
+			"maxim,reset-gpio", dev->of_node->full_name,
+			max98373->reset_gpio);
+	} else {
+		dev_dbg(dev, "maxim,reset-gpio=%d",
+			max98373->reset_gpio);
+	}
+
 	if (!device_property_read_u32(dev, "maxim,spkfb-slot-no", &value))
 		max98373->spkfb_slot = value & 0xF;
 	else
@@ -923,7 +935,6 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 	else
 		max98373->interleave_mode = false;
 
-
 	/* regmap initialization */
 	max98373->regmap
 		= devm_regmap_init_i2c(i2c, &max98373_regmap);
@@ -934,6 +945,24 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	/* voltage/current slot & gpio configuration */
+	max98373_slot_config(i2c, max98373);
+
+	/* Power on device */
+	if (gpio_is_valid(max98373->reset_gpio)) {
+		ret = gpio_request(max98373->reset_gpio, "MAX98373_RESET");
+		if (ret) {
+			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
+				__func__, max98373->reset_gpio);
+			gpio_free(max98373->reset_gpio);
+			return -EINVAL;
+		}
+		gpio_direction_output(max98373->reset_gpio, 0);
+		msleep(50);
+		gpio_direction_output(max98373->reset_gpio, 1);
+		msleep(20);
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98373->regmap,
 		MAX98373_R21FF_REV_ID, &reg);
@@ -944,9 +973,6 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 	}
 	dev_info(&i2c->dev, "MAX98373 revisionID: 0x%02X\n", reg);
 
-	/* voltage/current slot configuration */
-	max98373_slot_config(i2c, max98373);
-
 	/* codec registeration */
 	ret = devm_snd_soc_register_component(&i2c->dev, &soc_codec_dev_max98373,
 		max98373_dai, ARRAY_SIZE(max98373_dai));
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index f6a37aa02f26..533d2053f608 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -203,6 +203,7 @@
 
 struct max98373_priv {
 	struct regmap *regmap;
+	int reset_gpio;
 	unsigned int v_slot;
 	unsigned int i_slot;
 	unsigned int spkfb_slot;
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
