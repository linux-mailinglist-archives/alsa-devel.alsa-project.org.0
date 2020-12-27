Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF52E32C2
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:15:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A831751;
	Sun, 27 Dec 2020 22:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A831751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103737;
	bh=cXJDdymZOvagg6yU8JBQ6KY+CLfyeOHNS4mMHesS9R0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5j1kE13bF+xOk7vaYeOFsNSYD9FWUnXfZoGwXAt7fdgIV7WaQgp2PwSR9AKxzEs5
	 UA1MHveRHfvX7GVxY/q/lP6Sc7ZG73vGFBbxVcbEQLQIPXZ/eOamafGrPK9h50NIP6
	 AS0JNKhzyfX0pzb40lHK/ZelovCzQ1n3bBBqw1Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E713BF804E1;
	Sun, 27 Dec 2020 22:13:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52F03F80279; Sun, 27 Dec 2020 22:12:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06345F80258
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06345F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FAOEESip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BM+xYE8rJ+h1dxqeRkp4MTZMKZI7EtWFPPwKnNWYE74=;
 b=FAOEESipvNAEUlp6h4a68NpY8iSE7E+w9ueypBENUXHMH4xUdKoOApXFuD3aZ0cUC4ambc
 jWFOaoCFe8cSn9gdMLFHn+a7MKkYySgUWVywuILCDlra869kmEnPtGNDMmSiC1DCagAVw1
 r+yxUr6a3RhzleCHJ7qg4MO04GW48zM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-bBUBCoYqNoCHYWc08rrbIA-1; Sun, 27 Dec 2020 16:12:46 -0500
X-MC-Unique: bBUBCoYqNoCHYWc08rrbIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237F7E75A;
 Sun, 27 Dec 2020 21:12:44 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B20BF62A23;
 Sun, 27 Dec 2020 21:12:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/14] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
Date: Sun, 27 Dec 2020 22:12:21 +0100
Message-Id: <20201227211232.117801-4-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Christian Hartmann <cornogle@googlemail.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

The Intel Bay Trail (x86/ACPI) based Lenovo Yoga Tablet 2 series use
a WM5102 codec connected over SPI.

Add support for ACPI enumeration to arizona-spi so that arizona-spi can
bind to the codec on these tablets.

This is loosely based on an earlier attempt (for Android-x86) at this by
Christian Hartmann, combined with insights in things like the speaker GPIO
from the android-x86 android port for the Lenovo Yoga Tablet 2 1051F/L [1].

[1] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel

Cc: Christian Hartmann <cornogle@googlemail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/arizona-spi.c | 120 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index 704f214d2614..bcdbd72fefb5 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -7,7 +7,10 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -15,11 +18,119 @@
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/of.h>
+#include <uapi/linux/input-event-codes.h>
 
 #include <linux/mfd/arizona/core.h>
 
 #include "arizona.h"
 
+#ifdef CONFIG_ACPI
+const struct acpi_gpio_params reset_gpios = { 1, 0, false };
+const struct acpi_gpio_params ldoena_gpios = { 2, 0, false };
+
+static const struct acpi_gpio_mapping arizona_acpi_gpios[] = {
+	{ "reset-gpios", &reset_gpios, 1, },
+	{ "wlf,ldoena-gpios", &ldoena_gpios, 1 },
+	{ }
+};
+
+/*
+ * The ACPI resources for the device only describe external GPIO-s. They do
+ * not provide mappings for the GPIO-s coming from the Arizona codec itself.
+ */
+static const struct gpiod_lookup arizona_soc_gpios[] = {
+	{ "arizona", 2, "wlf,spkvdd-ena", 0, GPIO_ACTIVE_HIGH },
+	{ "arizona", 4, "wlf,micd-pol", 0, GPIO_ACTIVE_LOW },
+};
+
+/*
+ * The AOSP 3.5 mm Headset: Accessory Specification gives the following values:
+ * Function A Play/Pause:           0 ohm
+ * Function D Voice assistant:    135 ohm
+ * Function B Volume Up           240 ohm
+ * Function C Volume Down         470 ohm
+ * Minimum Mic DC resistance     1000 ohm
+ * Minimum Ear speaker impedance   16 ohm
+ * Note the first max value below must be less then the min. speaker impedance,
+ * to allow CTIA/OMTP detection to work. The other max values are the closest
+ * value from extcon-arizona.c:arizona_micd_levels halfway 2 button resistances.
+ */
+static const struct arizona_micd_range arizona_micd_aosp_ranges[] = {
+	{ .max =  11, .key = KEY_PLAYPAUSE },
+	{ .max = 186, .key = KEY_VOICECOMMAND },
+	{ .max = 348, .key = KEY_VOLUMEUP },
+	{ .max = 752, .key = KEY_VOLUMEDOWN },
+};
+
+static void arizona_spi_acpi_remove_lookup(void *lookup)
+{
+	gpiod_remove_lookup_table(lookup);
+}
+
+static int arizona_spi_acpi_probe(struct arizona *arizona)
+{
+	struct gpiod_lookup_table *lookup;
+	int i, ret;
+
+	/* Add mappings for the 2 ACPI declared GPIOs used for reset and ldo-ena */
+	devm_acpi_dev_add_driver_gpios(arizona->dev, arizona_acpi_gpios);
+
+	/* Add lookups for the SoCs own GPIOs used for micdet-polarity and spkVDD-enable */
+	lookup = devm_kzalloc(arizona->dev,
+			      struct_size(lookup, table, ARRAY_SIZE(arizona_soc_gpios) + 1),
+			      GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+
+	lookup->dev_id = dev_name(arizona->dev);
+	for (i = 0; i < ARRAY_SIZE(arizona_soc_gpios); i++)
+		lookup->table[i] = arizona_soc_gpios[i];
+
+	gpiod_add_lookup_table(lookup);
+	ret = devm_add_action_or_reset(arizona->dev, arizona_spi_acpi_remove_lookup, lookup);
+	if (ret)
+		return ret;
+
+	/* Enable 32KHz clock from SoC to codec for jack-detect */
+	acpi_evaluate_object(ACPI_HANDLE(arizona->dev), "CLKE", NULL, NULL);
+
+	/*
+	 * Some DSDTs wrongly declare the IRQ trigger-type as IRQF_TRIGGER_FALLING
+	 * The IRQ line will stay low when a new IRQ event happens between reading
+	 * the IRQ status flags and acknowledging them. When the IRQ line stays
+	 * low like this the IRQ will never trigger again when its type is set
+	 * to IRQF_TRIGGER_FALLING. Correct the IRQ trigger-type to fix this.
+	 */
+	arizona->pdata.irq_flags = IRQF_TRIGGER_LOW;
+
+	/* Wait 200 ms after jack insertion */
+	arizona->pdata.micd_detect_debounce = 200;
+
+	/* Use standard AOSP values for headset-button mappings */
+	arizona->pdata.micd_ranges = arizona_micd_aosp_ranges;
+	arizona->pdata.num_micd_ranges = ARRAY_SIZE(arizona_micd_aosp_ranges);
+
+	return 0;
+}
+
+static const struct acpi_device_id arizona_acpi_match[] = {
+	{
+		.id = "WM510204",
+		.driver_data = WM5102,
+	},
+	{
+		.id = "WM510205",
+		.driver_data = WM5102,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, arizona_acpi_match);
+#else
+static void arizona_spi_acpi_probe(struct arizona *arizona)
+{
+}
+#endif
+
 static int arizona_spi_probe(struct spi_device *spi)
 {
 	const struct spi_device_id *id = spi_get_device_id(spi);
@@ -30,6 +141,8 @@ static int arizona_spi_probe(struct spi_device *spi)
 
 	if (spi->dev.of_node)
 		type = arizona_of_get_type(&spi->dev);
+	else if (ACPI_COMPANION(&spi->dev))
+		type = (unsigned long)acpi_device_get_match_data(&spi->dev);
 	else
 		type = id->driver_data;
 
@@ -75,6 +188,12 @@ static int arizona_spi_probe(struct spi_device *spi)
 	arizona->dev = &spi->dev;
 	arizona->irq = spi->irq;
 
+	if (ACPI_COMPANION(&spi->dev)) {
+		ret = arizona_spi_acpi_probe(arizona);
+		if (ret)
+			return ret;
+	}
+
 	return arizona_dev_init(arizona);
 }
 
@@ -102,6 +221,7 @@ static struct spi_driver arizona_spi_driver = {
 		.name	= "arizona",
 		.pm	= &arizona_pm_ops,
 		.of_match_table	= of_match_ptr(arizona_of_match),
+		.acpi_match_table = ACPI_PTR(arizona_acpi_match),
 	},
 	.probe		= arizona_spi_probe,
 	.remove		= arizona_spi_remove,
-- 
2.28.0

