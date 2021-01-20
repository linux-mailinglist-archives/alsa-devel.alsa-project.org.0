Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ABB2FDC1B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 22:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2631852;
	Wed, 20 Jan 2021 22:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2631852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611179566;
	bh=GuW2ZVZ19W03bwvWrT6F6hSLGnxsZEV3GzcfUvZRWik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnHAIRfc05tf3CIwWPEy0GRSLRciI4dMeBT9mWMHcJ7yQ+NsVVBoF2O+A0CXO8x9h
	 uNJ4lHE4b7NHU7H8P3bn0sESJY2ENeKXQdMbnKc/jLunQjS9+u/FkQqxY+GlRNbBGg
	 jIWZ2j9RcKs0cvO+3gCCA1tocbKsoaKNe0VR3xb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52631F804CA;
	Wed, 20 Jan 2021 22:50:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE794F804CC; Wed, 20 Jan 2021 22:50:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02C92F8019B
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C92F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EIe/4Rn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611179414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaoDPU2+Ks50PBIris6Yfru4My/Ag6Xgt7372OqFdQ4=;
 b=EIe/4Rn1aBT6HnbFqx9ClYKPWZw/6jAqC6GBDx4sMKj6bKrlrj2fcix90YYWz8Xa/FaiAF
 B2QrpQ1dMDhKvbKJnEDOFz7ARN3MsygytwqQlh8AhOnZZGQhZ2wlSDdxh4I1C+YFjw5eud
 U0E+XRf7gkr+r7OYVqN2eayqL0BrqhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-WglMIdnjPFeliS--8TAcuA-1; Wed, 20 Jan 2021 16:50:11 -0500
X-MC-Unique: WglMIdnjPFeliS--8TAcuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338D110054FF;
 Wed, 20 Jan 2021 21:50:09 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3DB95D6AD;
 Wed, 20 Jan 2021 21:50:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
Date: Wed, 20 Jan 2021 22:49:55 +0100
Message-Id: <20210120214957.140232-4-hdegoede@redhat.com>
In-Reply-To: <20210120214957.140232-1-hdegoede@redhat.com>
References: <20210120214957.140232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Add a comment to the irq-flags override explaining that theoretically
  DSDTs using IRQF_TRIGGER_FALLING could be correct on boards where the
  IRQ controller does not support active low level interrupts

Changes in v3:
- Fix compilation error when CONFIG_ACPI is not set

Changes in v2:
- Minor coding style tweaks
- Use memcpy instead of for loop to copy gpiod_lookup-s
- Log a warning when the ACPI "CLKE" call fails
- Drop addition of acpi_device_get_match_data() call, as the code was
  moved over to use the generic device_get_match_data() helper in a
  (new in v2) preparation patch
---
 drivers/mfd/arizona-spi.c | 127 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index 798b88295c77..24a2c75d691a 100644
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
@@ -15,11 +18,128 @@
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
+	acpi_status status;
+	int ret;
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
+	memcpy(lookup->table, arizona_soc_gpios, sizeof(arizona_soc_gpios));
+
+	gpiod_add_lookup_table(lookup);
+	ret = devm_add_action_or_reset(arizona->dev, arizona_spi_acpi_remove_lookup, lookup);
+	if (ret)
+		return ret;
+
+	/* Enable 32KHz clock from SoC to codec for jack-detect */
+	status = acpi_evaluate_object(ACPI_HANDLE(arizona->dev), "CLKE", NULL, NULL);
+	if (ACPI_FAILURE(status))
+		dev_warn(arizona->dev, "Failed to enable 32KHz clk ACPI error %d\n", status);
+
+	/*
+	 * Some DSDTs wrongly declare the IRQ trigger-type as IRQF_TRIGGER_FALLING
+	 * The IRQ line will stay low when a new IRQ event happens between reading
+	 * the IRQ status flags and acknowledging them. When the IRQ line stays
+	 * low like this the IRQ will never trigger again when its type is set
+	 * to IRQF_TRIGGER_FALLING. Correct the IRQ trigger-type to fix this.
+	 *
+	 * Note theoretically it is possible that some boards are not capable
+	 * of handling active low level interrupts. In that case setting the
+	 * flag to IRQF_TRIGGER_FALLING would not be a bug (and we would need
+	 * to work around this) but so far all known usages of IRQF_TRIGGER_FALLING
+	 * are a bug in the board's DSDT.
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
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, arizona_acpi_match);
+#else
+static int arizona_spi_acpi_probe(struct arizona *arizona)
+{
+	return -ENODEV;
+}
+#endif
+
 static int arizona_spi_probe(struct spi_device *spi)
 {
 	const struct spi_device_id *id = spi_get_device_id(spi);
@@ -77,6 +197,12 @@ static int arizona_spi_probe(struct spi_device *spi)
 	arizona->dev = &spi->dev;
 	arizona->irq = spi->irq;
 
+	if (has_acpi_companion(&spi->dev)) {
+		ret = arizona_spi_acpi_probe(arizona);
+		if (ret)
+			return ret;
+	}
+
 	return arizona_dev_init(arizona);
 }
 
@@ -104,6 +230,7 @@ static struct spi_driver arizona_spi_driver = {
 		.name	= "arizona",
 		.pm	= &arizona_pm_ops,
 		.of_match_table	= of_match_ptr(arizona_of_match),
+		.acpi_match_table = ACPI_PTR(arizona_acpi_match),
 	},
 	.probe		= arizona_spi_probe,
 	.remove		= arizona_spi_remove,
-- 
2.28.0

