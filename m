Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376841E5BB8
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 11:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F03E17CC;
	Thu, 28 May 2020 11:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F03E17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590657673;
	bh=+3Dn2VUakpufZOw8vICu+ozKhHagqxkEPPDn98svUfs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fw6KRoQ2dWigT9+9QlNxpvXJIfg5zri+/kBNsWu9rmonupwmzdBqp7QmzI8Z5bVvd
	 ywin2aaOK6vq1qQivWGjmOxve2r6/I3X2/iu18kc8DonDNdFPZS71DqBbn8h/mSqvq
	 KrJgtaujKsTPquhhPnWXIwCEPBiFS03Ja87M3FVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6801F800FF;
	Thu, 28 May 2020 11:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF2BEF80150; Thu, 28 May 2020 11:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBE23F80107
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 11:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE23F80107
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N4yuK-1iv6rU0K6W-010xzN; Thu, 28 May 2020 11:18:56 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: rt5682: split i2c driver into separate module
Date: Thu, 28 May 2020 11:17:17 +0200
Message-Id: <20200528091851.2889754-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Kgg5vGoApM7AzB67V5fpLJEGOi5UaDt9ueE4L4t0XH1ynX+byHs
 xkJyXcyGHyfvbP7YNso6Og6Zo4j51UQTykFean3cJn4AZr1IuulThn8Cr+4LzGuB5YIHaYb
 1DhcPDynlpCVQ5UMleqotvOQ7pG9cT0WWJlPkj/CgXKRXimyx2gbJTl4dSd5QvemXFZJbjn
 YVtMjAItD53ZQ7In8bFxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G6PXa8Mlync=:9ns2VxBB8j6QEThlgDySZR
 N18Behnm23oGa8fsInNul1Ku+eAPC2IyRbvqFFpIWrLD5KZq92+SQBNhLhOUQwsmE/5ZeD/pP
 /ZmVV9xUZXtz74Nyc47+ubKW51bSfOBg1dQ5locKt+gOsAmec5ymzcaV8JjepQO+w/v0Up5HX
 FKNyg8LLKCd9TDLWWptpzCXwPWv3XnWihVkaior+2+SOWngRXSLz3VFkfb46q5QK+N0okDgeZ
 QWXPlK0E7LxPF2bfofmAznqBAHWOK81i+TZYfdq1lKKyad3htjlM8um6dITjThDjPusC7+1kj
 zyPHv4/+QNn6hINXgL6MOswZs9fIHXZxF3aKMlF0aaDdEaZkoTCbnGSu63ud5DflhU+SuxbUd
 mY9qvYaxwA2QJNfpyAuTAQglHH7l/WHCcqWlbmltaR5XcIwg35fDsIze0FWHn+ZYwNsjR143l
 dSozGHHWXTspdRFuTuLr5z+VgoO/JBTNqnZthvBmbkufae126/7GWcRZFO7nw/9ngOD/XWhOs
 4lIgAKPgW6tQJdIr9T/2s2Ihu0R6M9UTJ8s5Am0nv30PWNSpeWEvcz6bEKc3a6bHrB9ZihX3C
 f/zcB0/hrbF27RYozkDgvKdI+QYt4gwetR2LXyDGb/QnKE+QjZU+w61+Qw/7yKLAv/CuN0qU1
 JMFGkxNZX0rCo07fDAuNDHd+c+8K+P7B5kHUIo7VWjzhHdnlUYRMkSX+tB/9/KgeBSVGRu4hv
 GemXlv9JAlwYjg6dVgw559GOjv3m45dMs6uuYidyGBgEZgjIDIkB8d28O5XUjZyNKqUQiG8xB
 Dx0Dq5vSnSxWhgHiCTvGcuJWgy/2oXhNk4V1bIzkI3muOmeWu4=
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Derek Fang <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

With SND_SOC_AMD_RV_RT5682_MACH using the i2c version of the
driver, we can easily get a build failure when I2C is built-in
but soundwire is not:

 WARNING: unmet direct dependencies detected for SND_SOC_RT5682
   Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (I2C [=y] || SOUNDWIRE [=m]) && (SOUNDWIRE [=m] || !SOUNDWIRE [=m]) && (I2C [=y] || !I2C [=y])
   Selected by [y]:
   - SND_SOC_AMD_RV_RT5682_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP3x [=y] && I2C [=y] && CROS_EC [=y]
   Selected by [m]:
   - SND_SOC_RT5682_SDW [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=m] && (I2C [=y] || !I2C [=y])

Rework the driver to have three separate modules, with the
main driver just dealing with the common bits and the actual
initialization as part of i2c and sdw specific modules.

The conversion is fairly mechanical to keep it easy to review,
i.e. it moves code around with the minimal required renaming
and changes.

Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
Fixes: fd443a20c2f0 ("ASoC: rt5682: fix I2C/Soundwire dependencies")
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/Kconfig          |   2 +-
 sound/soc/codecs/Kconfig       |  11 +-
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/rt5682-i2c.c  | 306 +++++++++++++
 sound/soc/codecs/rt5682-sdw.c  | 459 +++++++++++++++++++-
 sound/soc/codecs/rt5682-sdw.h  |  20 -
 sound/soc/codecs/rt5682.c      | 773 ++-------------------------------
 sound/soc/codecs/rt5682.h      |  32 +-
 sound/soc/intel/boards/Kconfig |   6 +-
 9 files changed, 847 insertions(+), 764 deletions(-)
 create mode 100644 sound/soc/codecs/rt5682-i2c.c
 delete mode 100644 sound/soc/codecs/rt5682-sdw.h

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 77ffdb41bee5..e37cf72f2bab 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -29,7 +29,7 @@ config SND_SOC_AMD_ACP3x
 
 config SND_SOC_AMD_RV_RT5682_MACH
 	tristate "AMD RV support for RT5682"
-	select SND_SOC_RT5682
+	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
 	select SND_SOC_CROS_EC_CODEC
 	select I2C_CROS_EC_TUNNEL
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2d4f1b4bc011..243a48aaec2a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -167,7 +167,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT5668
 	imply SND_SOC_RT5670
 	imply SND_SOC_RT5677
-	imply SND_SOC_RT5682
+	imply SND_SOC_RT5682_I2C
 	imply SND_SOC_RT5682_SDW
 	imply SND_SOC_RT700_SDW
 	imply SND_SOC_RT711_SDW
@@ -1135,14 +1135,15 @@ config SND_SOC_RT5677_SPI
 
 config SND_SOC_RT5682
 	tristate
-	depends on I2C || SOUNDWIRE
-	depends on SOUNDWIRE || !SOUNDWIRE
-	depends on I2C || !I2C
+
+config SND_SOC_RT5682_I2C
+	tristate
+	depends on I2C
+	select SND_SOC_RT5682
 
 config SND_SOC_RT5682_SDW
 	tristate "Realtek RT5682 Codec - SDW"
 	depends on SOUNDWIRE
-	depends on I2C || !I2C
 	select SND_SOC_RT5682
 	select REGMAP_SOUNDWIRE
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a603532c7af5..34fb7ba5c77f 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -178,6 +178,7 @@ snd-soc-rt5677-objs := rt5677.o
 snd-soc-rt5677-spi-objs := rt5677-spi.o
 snd-soc-rt5682-objs := rt5682.o
 snd-soc-rt5682-sdw-objs := rt5682-sdw.o
+snd-soc-rt5682-i2c-objs := rt5682-i2c.o
 snd-soc-rt700-objs := rt700.o rt700-sdw.o
 snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
@@ -479,6 +480,7 @@ obj-$(CONFIG_SND_SOC_RT5670)	+= snd-soc-rt5670.o
 obj-$(CONFIG_SND_SOC_RT5677)	+= snd-soc-rt5677.o
 obj-$(CONFIG_SND_SOC_RT5677_SPI)	+= snd-soc-rt5677-spi.o
 obj-$(CONFIG_SND_SOC_RT5682)	+= snd-soc-rt5682.o
+obj-$(CONFIG_SND_SOC_RT5682_I2C)	+= snd-soc-rt5682-i2c.o
 obj-$(CONFIG_SND_SOC_RT5682_SDW)	+= snd-soc-rt5682-sdw.o
 obj-$(CONFIG_SND_SOC_RT700)     += snd-soc-rt700.o
 obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
new file mode 100644
index 000000000000..e28d08b1cd65
--- /dev/null
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt5682.c  --  RT5682 ALSA SoC audio component driver
+//
+// Copyright 2018 Realtek Semiconductor Corp.
+// Author: Bard Liao <bardliao@realtek.com>
+//
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+#include <linux/acpi.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/mutex.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <sound/rt5682.h>
+
+#include "rl6231.h"
+#include "rt5682.h"
+
+static const struct rt5682_platform_data i2s_default_platform_data = {
+	.dmic1_data_pin = RT5682_DMIC1_DATA_GPIO2,
+	.dmic1_clk_pin = RT5682_DMIC1_CLK_GPIO3,
+	.jd_src = RT5682_JD1,
+	.btndet_delay = 16,
+	.dai_clk_names[RT5682_DAI_WCLK_IDX] = "rt5682-dai-wclk",
+	.dai_clk_names[RT5682_DAI_BCLK_IDX] = "rt5682-dai-bclk",
+};
+
+static const struct regmap_config rt5682_regmap = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.max_register = RT5682_I2C_MODE,
+	.volatile_reg = rt5682_volatile_register,
+	.readable_reg = rt5682_readable_register,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = rt5682_reg,
+	.num_reg_defaults = RT5682_REG_NUM,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static void rt5682_jd_check_handler(struct work_struct *work)
+{
+	struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
+		jd_check_work.work);
+
+	if (snd_soc_component_read32(rt5682->component, RT5682_AJD1_CTRL)
+		& RT5682_JDH_RS_MASK) {
+		/* jack out */
+		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
+
+		snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+	} else {
+		schedule_delayed_work(&rt5682->jd_check_work, 500);
+	}
+}
+
+static irqreturn_t rt5682_irq(int irq, void *data)
+{
+	struct rt5682_priv *rt5682 = data;
+
+	mod_delayed_work(system_power_efficient_wq,
+		&rt5682->jack_detect_work, msecs_to_jiffies(250));
+
+	return IRQ_HANDLED;
+}
+
+static struct snd_soc_dai_driver rt5682_dai[] = {
+	{
+		.name = "rt5682-aif1",
+		.id = RT5682_AIF1,
+		.playback = {
+			.stream_name = "AIF1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.ops = &rt5682_aif1_dai_ops,
+	},
+	{
+		.name = "rt5682-aif2",
+		.id = RT5682_AIF2,
+		.capture = {
+			.stream_name = "AIF2 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.ops = &rt5682_aif2_dai_ops,
+	},
+};
+
+static int rt5682_i2c_probe(struct i2c_client *i2c,
+		const struct i2c_device_id *id)
+{
+	struct rt5682_platform_data *pdata = dev_get_platdata(&i2c->dev);
+	struct rt5682_priv *rt5682;
+	int i, ret;
+	unsigned int val;
+
+	rt5682 = devm_kzalloc(&i2c->dev, sizeof(struct rt5682_priv),
+		GFP_KERNEL);
+	if (!rt5682)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, rt5682);
+
+	rt5682->pdata = i2s_default_platform_data;
+
+	if (pdata)
+		rt5682->pdata = *pdata;
+	else
+		rt5682_parse_dt(rt5682, &i2c->dev);
+
+	rt5682->regmap = devm_regmap_init_i2c(i2c, &rt5682_regmap);
+	if (IS_ERR(rt5682->regmap)) {
+		ret = PTR_ERR(rt5682->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(rt5682->supplies); i++)
+		rt5682->supplies[i].supply = rt5682_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(rt5682->supplies),
+				      rt5682->supplies);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(rt5682->supplies),
+				    rt5682->supplies);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to enable supplies: %d\n", ret);
+		return ret;
+	}
+
+	if (gpio_is_valid(rt5682->pdata.ldo1_en)) {
+		if (devm_gpio_request_one(&i2c->dev, rt5682->pdata.ldo1_en,
+					  GPIOF_OUT_INIT_HIGH, "rt5682"))
+			dev_err(&i2c->dev, "Fail gpio_request gpio_ldo\n");
+	}
+
+	/* Sleep for 300 ms miniumum */
+	usleep_range(300000, 350000);
+
+	regmap_write(rt5682->regmap, RT5682_I2C_MODE, 0x1);
+	usleep_range(10000, 15000);
+
+	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
+	if (val != DEVICE_ID) {
+		dev_err(&i2c->dev,
+			"Device with ID register %x is not rt5682\n", val);
+		return -ENODEV;
+	}
+
+	mutex_init(&rt5682->calibrate_mutex);
+	rt5682_calibrate(rt5682);
+
+	rt5682_apply_patch_list(rt5682, &i2c->dev);
+
+	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
+
+	/* DMIC pin*/
+	if (rt5682->pdata.dmic1_data_pin != RT5682_DMIC1_NULL) {
+		switch (rt5682->pdata.dmic1_data_pin) {
+		case RT5682_DMIC1_DATA_GPIO2: /* share with LRCK2 */
+			regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
+				RT5682_DMIC_1_DP_MASK, RT5682_DMIC_1_DP_GPIO2);
+			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
+				RT5682_GP2_PIN_MASK, RT5682_GP2_PIN_DMIC_SDA);
+			break;
+
+		case RT5682_DMIC1_DATA_GPIO5: /* share with DACDAT1 */
+			regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
+				RT5682_DMIC_1_DP_MASK, RT5682_DMIC_1_DP_GPIO5);
+			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
+				RT5682_GP5_PIN_MASK, RT5682_GP5_PIN_DMIC_SDA);
+			break;
+
+		default:
+			dev_warn(&i2c->dev, "invalid DMIC_DAT pin\n");
+			break;
+		}
+
+		switch (rt5682->pdata.dmic1_clk_pin) {
+		case RT5682_DMIC1_CLK_GPIO1: /* share with IRQ */
+			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
+				RT5682_GP1_PIN_MASK, RT5682_GP1_PIN_DMIC_CLK);
+			break;
+
+		case RT5682_DMIC1_CLK_GPIO3: /* share with BCLK2 */
+			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
+				RT5682_GP3_PIN_MASK, RT5682_GP3_PIN_DMIC_CLK);
+			break;
+
+		default:
+			dev_warn(&i2c->dev, "invalid DMIC_CLK pin\n");
+			break;
+		}
+	}
+
+	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
+		RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
+		RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
+	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
+	regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
+		RT5682_GP4_PIN_MASK | RT5682_GP5_PIN_MASK,
+		RT5682_GP4_PIN_ADCDAT1 | RT5682_GP5_PIN_DACDAT1);
+	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
+	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
+		RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
+	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
+		RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
+	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
+		RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
+	regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
+		RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
+
+	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
+		rt5682_jack_detect_handler);
+	INIT_DELAYED_WORK(&rt5682->jd_check_work,
+		rt5682_jd_check_handler);
+
+	if (i2c->irq) {
+		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
+			rt5682_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
+			| IRQF_ONESHOT, "rt5682", rt5682);
+		if (ret)
+			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+	}
+
+	return devm_snd_soc_register_component(&i2c->dev,
+					       &rt5682_soc_component_dev,
+					       rt5682_dai, ARRAY_SIZE(rt5682_dai));
+}
+
+static void rt5682_i2c_shutdown(struct i2c_client *client)
+{
+	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
+
+	rt5682_reset(rt5682);
+}
+
+static const struct of_device_id rt5682_of_match[] = {
+	{.compatible = "realtek,rt5682i"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt5682_of_match);
+
+static const struct acpi_device_id rt5682_acpi_match[] = {
+	{"10EC5682", 0,},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
+
+static const struct i2c_device_id rt5682_i2c_id[] = {
+	{"rt5682", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
+
+static struct i2c_driver rt5682_i2c_driver = {
+	.driver = {
+		.name = "rt5682",
+		.of_match_table = rt5682_of_match,
+		.acpi_match_table = rt5682_acpi_match,
+	},
+	.probe = rt5682_i2c_probe,
+	.shutdown = rt5682_i2c_shutdown,
+	.id_table = rt5682_i2c_id,
+};
+module_i2c_driver(rt5682_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC RT5682 driver");
+MODULE_AUTHOR("Bard Liao <bardliao@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 99dd48d2a1d6..4cecc5ce545c 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mutex.h>
 #include <linux/soundwire/sdw.h>
@@ -28,7 +29,461 @@
 #include <sound/tlv.h>
 
 #include "rt5682.h"
-#include "rt5682-sdw.h"
+
+#define RT5682_SDW_ADDR_L			0x3000
+#define RT5682_SDW_ADDR_H			0x3001
+#define RT5682_SDW_DATA_L			0x3004
+#define RT5682_SDW_DATA_H			0x3005
+#define RT5682_SDW_CMD				0x3008
+
+static int rt5682_sdw_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct device *dev = context;
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	unsigned int data_l, data_h;
+
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_CMD, 0);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_H, (reg >> 8) & 0xff);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_L, (reg & 0xff));
+	regmap_read(rt5682->sdw_regmap, RT5682_SDW_DATA_H, &data_h);
+	regmap_read(rt5682->sdw_regmap, RT5682_SDW_DATA_L, &data_l);
+
+	*val = (data_h << 8) | data_l;
+
+	dev_vdbg(dev, "[%s] %04x => %04x\n", __func__, reg, *val);
+
+	return 0;
+}
+
+static int rt5682_sdw_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct device *dev = context;
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_CMD, 1);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_H, (reg >> 8) & 0xff);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_L, (reg & 0xff));
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_DATA_H, (val >> 8) & 0xff);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_DATA_L, (val & 0xff));
+
+	dev_vdbg(dev, "[%s] %04x <= %04x\n", __func__, reg, val);
+
+	return 0;
+}
+
+static const struct regmap_config rt5682_sdw_indirect_regmap = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.max_register = RT5682_I2C_MODE,
+	.volatile_reg = rt5682_volatile_register,
+	.readable_reg = rt5682_readable_register,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = rt5682_reg,
+	.num_reg_defaults = RT5682_REG_NUM,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_read = rt5682_sdw_read,
+	.reg_write = rt5682_sdw_write,
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				 int direction)
+{
+	struct sdw_stream_data *stream;
+
+	if (!sdw_stream)
+		return 0;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+
+	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_dma_data = stream;
+	else
+		dai->capture_dma_data = stream;
+
+	return 0;
+}
+
+static void rt5682_sdw_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int retval, port, num_channels;
+	unsigned int val_p = 0, val_c = 0, osr_p = 0, osr_c = 0;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!stream)
+		return -ENOMEM;
+
+	if (!rt5682->slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		port = 1;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		port = 2;
+	}
+
+	stream_config.frame_rate = params_rate(params);
+	stream_config.ch_count = params_channels(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+
+	num_channels = params_channels(params);
+	port_config.ch_mask = (1 << (num_channels)) - 1;
+	port_config.num = port;
+
+	retval = sdw_stream_add_slave(rt5682->slave, &stream_config,
+				      &port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	switch (params_rate(params)) {
+	case 48000:
+		val_p = RT5682_SDW_REF_1_48K;
+		val_c = RT5682_SDW_REF_2_48K;
+		break;
+	case 96000:
+		val_p = RT5682_SDW_REF_1_96K;
+		val_c = RT5682_SDW_REF_2_96K;
+		break;
+	case 192000:
+		val_p = RT5682_SDW_REF_1_192K;
+		val_c = RT5682_SDW_REF_2_192K;
+		break;
+	case 32000:
+		val_p = RT5682_SDW_REF_1_32K;
+		val_c = RT5682_SDW_REF_2_32K;
+		break;
+	case 24000:
+		val_p = RT5682_SDW_REF_1_24K;
+		val_c = RT5682_SDW_REF_2_24K;
+		break;
+	case 16000:
+		val_p = RT5682_SDW_REF_1_16K;
+		val_c = RT5682_SDW_REF_2_16K;
+		break;
+	case 12000:
+		val_p = RT5682_SDW_REF_1_12K;
+		val_c = RT5682_SDW_REF_2_12K;
+		break;
+	case 8000:
+		val_p = RT5682_SDW_REF_1_8K;
+		val_c = RT5682_SDW_REF_2_8K;
+		break;
+	case 44100:
+		val_p = RT5682_SDW_REF_1_44K;
+		val_c = RT5682_SDW_REF_2_44K;
+		break;
+	case 88200:
+		val_p = RT5682_SDW_REF_1_88K;
+		val_c = RT5682_SDW_REF_2_88K;
+		break;
+	case 176400:
+		val_p = RT5682_SDW_REF_1_176K;
+		val_c = RT5682_SDW_REF_2_176K;
+		break;
+	case 22050:
+		val_p = RT5682_SDW_REF_1_22K;
+		val_c = RT5682_SDW_REF_2_22K;
+		break;
+	case 11025:
+		val_p = RT5682_SDW_REF_1_11K;
+		val_c = RT5682_SDW_REF_2_11K;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (params_rate(params) <= 48000) {
+		osr_p = RT5682_DAC_OSR_D_8;
+		osr_c = RT5682_ADC_OSR_D_8;
+	} else if (params_rate(params) <= 96000) {
+		osr_p = RT5682_DAC_OSR_D_4;
+		osr_c = RT5682_ADC_OSR_D_4;
+	} else {
+		osr_p = RT5682_DAC_OSR_D_2;
+		osr_c = RT5682_ADC_OSR_D_2;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
+			RT5682_SDW_REF_1_MASK, val_p);
+		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
+			RT5682_DAC_OSR_MASK, osr_p);
+	} else {
+		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
+			RT5682_SDW_REF_2_MASK, val_c);
+		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
+			RT5682_ADC_OSR_MASK, osr_c);
+	}
+
+	return retval;
+}
+
+static int rt5682_sdw_hw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt5682->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt5682->slave, stream->sdw_stream);
+	return 0;
+}
+
+static struct snd_soc_dai_ops rt5682_sdw_ops = {
+	.hw_params	= rt5682_sdw_hw_params,
+	.hw_free	= rt5682_sdw_hw_free,
+	.set_sdw_stream	= rt5682_set_sdw_stream,
+	.shutdown	= rt5682_sdw_shutdown,
+};
+
+static struct snd_soc_dai_driver rt5682_dai[] = {
+	{
+		.name = "rt5682-aif1",
+		.id = RT5682_AIF1,
+		.playback = {
+			.stream_name = "AIF1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.ops = &rt5682_aif1_dai_ops,
+	},
+	{
+		.name = "rt5682-aif2",
+		.id = RT5682_AIF2,
+		.capture = {
+			.stream_name = "AIF2 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.ops = &rt5682_aif2_dai_ops,
+	},
+	{
+		.name = "rt5682-sdw",
+		.id = RT5682_SDW,
+		.playback = {
+			.stream_name = "SDW Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.capture = {
+			.stream_name = "SDW Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.ops = &rt5682_sdw_ops,
+	},
+};
+
+static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
+			   struct sdw_slave *slave)
+{
+	struct rt5682_priv *rt5682;
+	int ret;
+
+	rt5682 = devm_kzalloc(dev, sizeof(*rt5682), GFP_KERNEL);
+	if (!rt5682)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt5682);
+	rt5682->slave = slave;
+	rt5682->sdw_regmap = regmap;
+	rt5682->is_sdw = true;
+
+	rt5682->regmap = devm_regmap_init(dev, NULL, dev,
+					  &rt5682_sdw_indirect_regmap);
+	if (IS_ERR(rt5682->regmap)) {
+		ret = PTR_ERR(rt5682->regmap);
+		dev_err(dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt5682->hw_init = false;
+	rt5682->first_hw_init = false;
+
+	mutex_init(&rt5682->calibrate_mutex);
+	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
+		rt5682_jack_detect_handler);
+
+	ret = devm_snd_soc_register_component(dev,
+					      &rt5682_soc_component_dev,
+					      rt5682_dai, ARRAY_SIZE(rt5682_dai));
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return ret;
+}
+
+static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	int ret = 0;
+	unsigned int val;
+
+	if (rt5682->hw_init)
+		return 0;
+
+	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
+	if (val != DEVICE_ID) {
+		dev_err(dev, "Device with ID register %x is not rt5682\n", val);
+		return -ENODEV;
+	}
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!rt5682->first_hw_init) {
+		/* set autosuspend parameters */
+		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
+		pm_runtime_use_autosuspend(&slave->dev);
+
+		/* update count of parent 'active' children */
+		pm_runtime_set_active(&slave->dev);
+
+		/* make sure the device does not suspend immediately */
+		pm_runtime_mark_last_busy(&slave->dev);
+
+		pm_runtime_enable(&slave->dev);
+	}
+
+	pm_runtime_get_noresume(&slave->dev);
+
+	if (rt5682->first_hw_init) {
+		regcache_cache_only(rt5682->regmap, false);
+		regcache_cache_bypass(rt5682->regmap, true);
+	}
+
+	rt5682_calibrate(rt5682);
+
+	if (rt5682->first_hw_init) {
+		regcache_cache_bypass(rt5682->regmap, false);
+		regcache_mark_dirty(rt5682->regmap);
+		regcache_sync(rt5682->regmap);
+
+		/* volatile registers */
+		regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
+			RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
+
+		goto reinit;
+	}
+
+	rt5682_apply_patch_list(rt5682, dev);
+
+	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
+
+	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
+		RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
+		RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
+	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
+	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
+	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
+		RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
+	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
+		RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
+	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
+		RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
+
+	/* Soundwire */
+	regmap_write(rt5682->regmap, RT5682_PLL2_INTERNAL, 0xa266);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_1, 0x1700);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_2, 0x0006);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_3, 0x2600);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_4, 0x0c8f);
+	regmap_write(rt5682->regmap, RT5682_PLL_TRACK_2, 0x3000);
+	regmap_write(rt5682->regmap, RT5682_PLL_TRACK_3, 0x4000);
+	regmap_update_bits(rt5682->regmap, RT5682_GLB_CLK,
+		RT5682_SCLK_SRC_MASK | RT5682_PLL2_SRC_MASK,
+		RT5682_SCLK_SRC_PLL2 | RT5682_PLL2_SRC_SDW);
+
+	regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
+		RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
+	regmap_write(rt5682->regmap, RT5682_CBJ_CTRL_1, 0xd042);
+	regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_3,
+		RT5682_CBJ_IN_BUF_EN, RT5682_CBJ_IN_BUF_EN);
+	regmap_update_bits(rt5682->regmap, RT5682_SAR_IL_CMD_1,
+		RT5682_SAR_POW_MASK, RT5682_SAR_POW_EN);
+	regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
+		RT5682_POW_IRQ | RT5682_POW_JDH |
+		RT5682_POW_ANA, RT5682_POW_IRQ |
+		RT5682_POW_JDH | RT5682_POW_ANA);
+	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_2,
+		RT5682_PWR_JDH, RT5682_PWR_JDH);
+	regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
+		RT5682_JD1_EN_MASK | RT5682_JD1_IRQ_MASK,
+		RT5682_JD1_EN | RT5682_JD1_IRQ_PUL);
+
+reinit:
+	mod_delayed_work(system_power_efficient_wq,
+		&rt5682->jack_detect_work, msecs_to_jiffies(250));
+
+	/* Mark Slave initialization complete */
+	rt5682->hw_init = true;
+	rt5682->first_hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+
+	return ret;
+}
 
 static bool rt5682_sdw_readable_register(struct device *dev, unsigned int reg)
 {
@@ -46,7 +501,7 @@ static bool rt5682_sdw_readable_register(struct device *dev, unsigned int reg)
 	}
 }
 
-const struct regmap_config rt5682_sdw_regmap = {
+static const struct regmap_config rt5682_sdw_regmap = {
 	.name = "sdw",
 	.reg_bits = 32,
 	.val_bits = 8,
diff --git a/sound/soc/codecs/rt5682-sdw.h b/sound/soc/codecs/rt5682-sdw.h
deleted file mode 100644
index 76e6f607066e..000000000000
--- a/sound/soc/codecs/rt5682-sdw.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * rt5682-sdw.h  --  RT5682 SDW ALSA SoC audio driver
- *
- * Copyright 2019 Realtek Semiconductor Corp.
- * Author: Oder Chiou <oder_chiou@realtek.com>
- */
-
-#ifndef __RT5682_SDW_H__
-#define __RT5682_SDW_H__
-
-#define RT5682_SDW_ADDR_L			0x3000
-#define RT5682_SDW_ADDR_H			0x3001
-#define RT5682_SDW_DATA_L			0x3004
-#define RT5682_SDW_DATA_H			0x3005
-#define RT5682_SDW_CMD				0x3008
-
-#define RT5682_PROBE_TIMEOUT			2000
-
-#endif /* __RT5682_SDW_H__ */
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 046e6110de73..d3245123101d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- * rt5682.c  --  RT5682 ALSA SoC audio component driver
- *
- * Copyright 2018 Realtek Semiconductor Corp.
- * Author: Bard Liao <bardliao@realtek.com>
- */
+//
+// rt5682.c  --  RT5682 ALSA SoC audio component driver
+//
+// Copyright 2018 Realtek Semiconductor Corp.
+// Author: Bard Liao <bardliao@realtek.com>
+//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
-#include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
@@ -31,22 +30,13 @@
 
 #include "rl6231.h"
 #include "rt5682.h"
-#include "rt5682-sdw.h"
 
-static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
+const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
 	"AVDD",
 	"MICVDD",
 	"VBAT",
 };
-
-static const struct rt5682_platform_data i2s_default_platform_data = {
-	.dmic1_data_pin = RT5682_DMIC1_DATA_GPIO2,
-	.dmic1_clk_pin = RT5682_DMIC1_CLK_GPIO3,
-	.jd_src = RT5682_JD1,
-	.btndet_delay = 16,
-	.dai_clk_names[RT5682_DAI_WCLK_IDX] = "rt5682-dai-wclk",
-	.dai_clk_names[RT5682_DAI_BCLK_IDX] = "rt5682-dai-bclk",
-};
+EXPORT_SYMBOL_GPL(rt5682_supply_names);
 
 static const struct reg_sequence patch_list[] = {
 	{RT5682_HP_IMP_SENS_CTRL_19, 0x1000},
@@ -55,7 +45,18 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_PLL2_INTERNAL, 0x8266},
 };
 
-static const struct reg_default rt5682_reg[] = {
+void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev)
+{
+	int ret;
+
+	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
+				     ARRAY_SIZE(patch_list));
+	if (ret)
+		dev_warn(dev, "Failed to apply regmap patch: %d\n", ret);
+}
+EXPORT_SYMBOL_GPL(rt5682_apply_patch_list);
+
+const struct reg_default rt5682_reg[RT5682_REG_NUM] = {
 	{0x0002, 0x8080},
 	{0x0003, 0x8000},
 	{0x0005, 0x0000},
@@ -375,8 +376,9 @@ static const struct reg_default rt5682_reg[] = {
 	{0x03f2, 0x0800},
 	{0x03f3, 0x0800},
 };
+EXPORT_SYMBOL_GPL(rt5682_reg);
 
-static bool rt5682_volatile_register(struct device *dev, unsigned int reg)
+bool rt5682_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case RT5682_RESET:
@@ -403,8 +405,9 @@ static bool rt5682_volatile_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
+EXPORT_SYMBOL_GPL(rt5682_volatile_register);
 
-static bool rt5682_readable_register(struct device *dev, unsigned int reg)
+bool rt5682_readable_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case RT5682_RESET:
@@ -733,6 +736,7 @@ static bool rt5682_readable_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
+EXPORT_SYMBOL_GPL(rt5682_readable_register);
 
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(adc_vol_tlv, -1725, 75, 0);
@@ -800,12 +804,13 @@ static SOC_ENUM_SINGLE_DECL(rt5682_dacr_enum,
 static const struct snd_kcontrol_new rt5682_dac_r_mux =
 	SOC_DAPM_ENUM("DAC R Mux", rt5682_dacr_enum);
 
-static void rt5682_reset(struct rt5682_priv *rt5682)
+void rt5682_reset(struct rt5682_priv *rt5682)
 {
 	regmap_write(rt5682->regmap, RT5682_RESET, 0);
 	if (!rt5682->is_sdw)
 		regmap_write(rt5682->regmap, RT5682_I2C_MODE, 1);
 }
+EXPORT_SYMBOL_GPL(rt5682_reset);
 
 /**
  * rt5682_sel_asrc_clk_src - select ASRC clock source for a set of filters
@@ -910,8 +915,7 @@ static void rt5682_enable_push_button_irq(struct snd_soc_component *component,
  *
  * Returns detect status.
  */
-static int rt5682_headset_detect(struct snd_soc_component *component,
-		int jack_insert)
+int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = &component->dapm;
@@ -972,35 +976,7 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 	dev_dbg(component->dev, "jack_type = %d\n", rt5682->jack_type);
 	return rt5682->jack_type;
 }
-
-static irqreturn_t rt5682_irq(int irq, void *data)
-{
-	struct rt5682_priv *rt5682 = data;
-
-	mod_delayed_work(system_power_efficient_wq,
-		&rt5682->jack_detect_work, msecs_to_jiffies(250));
-
-	return IRQ_HANDLED;
-}
-
-static void rt5682_jd_check_handler(struct work_struct *work)
-{
-	struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
-		jd_check_work.work);
-
-	if (snd_soc_component_read32(rt5682->component, RT5682_AJD1_CTRL)
-		& RT5682_JDH_RS_MASK) {
-		/* jack out */
-		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
-
-		snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
-			SND_JACK_HEADSET |
-			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			SND_JACK_BTN_2 | SND_JACK_BTN_3);
-	} else {
-		schedule_delayed_work(&rt5682->jd_check_work, 500);
-	}
-}
+EXPORT_SYMBOL_GPL(rt5682_headset_detect);
 
 static int rt5682_set_jack_detect(struct snd_soc_component *component,
 		struct snd_soc_jack *hs_jack, void *data)
@@ -1077,7 +1053,7 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 	return 0;
 }
 
-static void rt5682_jack_detect_handler(struct work_struct *work)
+void rt5682_jack_detect_handler(struct work_struct *work)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(work, struct rt5682_priv, jack_detect_work.work);
@@ -1160,6 +1136,7 @@ static void rt5682_jack_detect_handler(struct work_struct *work)
 
 	mutex_unlock(&rt5682->calibrate_mutex);
 }
+EXPORT_SYMBOL_GPL(rt5682_jack_detect_handler);
 
 static const struct snd_kcontrol_new rt5682_snd_controls[] = {
 	/* DAC Digital Volume */
@@ -2899,7 +2876,8 @@ static int rt5682_resume(struct snd_soc_component *component)
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
 
-	rt5682_irq(0, rt5682);
+	mod_delayed_work(system_power_efficient_wq,
+		&rt5682->jack_detect_work, msecs_to_jiffies(250));
 
 	return 0;
 }
@@ -2908,270 +2886,22 @@ static int rt5682_resume(struct snd_soc_component *component)
 #define rt5682_resume NULL
 #endif
 
-#define RT5682_STEREO_RATES SNDRV_PCM_RATE_8000_192000
-#define RT5682_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
-		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
-
-static const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
+const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_tdm_slot = rt5682_set_tdm_slot,
 	.set_bclk_ratio = rt5682_set_bclk1_ratio,
 };
+EXPORT_SYMBOL_GPL(rt5682_aif1_dai_ops);
 
-static const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
+const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_bclk_ratio = rt5682_set_bclk2_ratio,
 };
+EXPORT_SYMBOL_GPL(rt5682_aif2_dai_ops);
 
-#if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
-static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
-				 int direction)
-{
-	struct sdw_stream_data *stream;
-
-	if (!sdw_stream)
-		return 0;
-
-	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
-
-	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
-
-	return 0;
-}
-
-static void rt5682_sdw_shutdown(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
-{
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
-}
-
-static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params,
-				struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
-	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
-	unsigned int val_p = 0, val_c = 0, osr_p = 0, osr_c = 0;
-
-	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
-	if (!stream)
-		return -ENOMEM;
-
-	if (!rt5682->slave)
-		return -EINVAL;
-
-	/* SoundWire specific configuration */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
-		port = 1;
-	} else {
-		direction = SDW_DATA_DIR_TX;
-		port = 2;
-	}
-
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = (1 << (num_channels)) - 1;
-	port_config.num = port;
-
-	retval = sdw_stream_add_slave(rt5682->slave, &stream_config,
-				      &port_config, 1, stream->sdw_stream);
-	if (retval) {
-		dev_err(dai->dev, "Unable to configure port\n");
-		return retval;
-	}
-
-	switch (params_rate(params)) {
-	case 48000:
-		val_p = RT5682_SDW_REF_1_48K;
-		val_c = RT5682_SDW_REF_2_48K;
-		break;
-	case 96000:
-		val_p = RT5682_SDW_REF_1_96K;
-		val_c = RT5682_SDW_REF_2_96K;
-		break;
-	case 192000:
-		val_p = RT5682_SDW_REF_1_192K;
-		val_c = RT5682_SDW_REF_2_192K;
-		break;
-	case 32000:
-		val_p = RT5682_SDW_REF_1_32K;
-		val_c = RT5682_SDW_REF_2_32K;
-		break;
-	case 24000:
-		val_p = RT5682_SDW_REF_1_24K;
-		val_c = RT5682_SDW_REF_2_24K;
-		break;
-	case 16000:
-		val_p = RT5682_SDW_REF_1_16K;
-		val_c = RT5682_SDW_REF_2_16K;
-		break;
-	case 12000:
-		val_p = RT5682_SDW_REF_1_12K;
-		val_c = RT5682_SDW_REF_2_12K;
-		break;
-	case 8000:
-		val_p = RT5682_SDW_REF_1_8K;
-		val_c = RT5682_SDW_REF_2_8K;
-		break;
-	case 44100:
-		val_p = RT5682_SDW_REF_1_44K;
-		val_c = RT5682_SDW_REF_2_44K;
-		break;
-	case 88200:
-		val_p = RT5682_SDW_REF_1_88K;
-		val_c = RT5682_SDW_REF_2_88K;
-		break;
-	case 176400:
-		val_p = RT5682_SDW_REF_1_176K;
-		val_c = RT5682_SDW_REF_2_176K;
-		break;
-	case 22050:
-		val_p = RT5682_SDW_REF_1_22K;
-		val_c = RT5682_SDW_REF_2_22K;
-		break;
-	case 11025:
-		val_p = RT5682_SDW_REF_1_11K;
-		val_c = RT5682_SDW_REF_2_11K;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (params_rate(params) <= 48000) {
-		osr_p = RT5682_DAC_OSR_D_8;
-		osr_c = RT5682_ADC_OSR_D_8;
-	} else if (params_rate(params) <= 96000) {
-		osr_p = RT5682_DAC_OSR_D_4;
-		osr_c = RT5682_ADC_OSR_D_4;
-	} else {
-		osr_p = RT5682_DAC_OSR_D_2;
-		osr_c = RT5682_ADC_OSR_D_2;
-	}
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
-			RT5682_SDW_REF_1_MASK, val_p);
-		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
-			RT5682_DAC_OSR_MASK, osr_p);
-	} else {
-		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
-			RT5682_SDW_REF_2_MASK, val_c);
-		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
-			RT5682_ADC_OSR_MASK, osr_c);
-	}
-
-	return retval;
-}
-
-static int rt5682_sdw_hw_free(struct snd_pcm_substream *substream,
-			      struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
-		snd_soc_dai_get_dma_data(dai, substream);
-
-	if (!rt5682->slave)
-		return -EINVAL;
-
-	sdw_stream_remove_slave(rt5682->slave, stream->sdw_stream);
-	return 0;
-}
-
-static struct snd_soc_dai_ops rt5682_sdw_ops = {
-	.hw_params	= rt5682_sdw_hw_params,
-	.hw_free	= rt5682_sdw_hw_free,
-	.set_sdw_stream	= rt5682_set_sdw_stream,
-	.shutdown	= rt5682_sdw_shutdown,
-};
-#endif
-
-static struct snd_soc_dai_driver rt5682_dai[] = {
-	{
-		.name = "rt5682-aif1",
-		.id = RT5682_AIF1,
-		.playback = {
-			.stream_name = "AIF1 Playback",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = RT5682_STEREO_RATES,
-			.formats = RT5682_FORMATS,
-		},
-		.capture = {
-			.stream_name = "AIF1 Capture",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = RT5682_STEREO_RATES,
-			.formats = RT5682_FORMATS,
-		},
-		.ops = &rt5682_aif1_dai_ops,
-	},
-	{
-		.name = "rt5682-aif2",
-		.id = RT5682_AIF2,
-		.capture = {
-			.stream_name = "AIF2 Capture",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = RT5682_STEREO_RATES,
-			.formats = RT5682_FORMATS,
-		},
-		.ops = &rt5682_aif2_dai_ops,
-	},
-#if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
-	{
-		.name = "rt5682-sdw",
-		.id = RT5682_SDW,
-		.playback = {
-			.stream_name = "SDW Playback",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = RT5682_STEREO_RATES,
-			.formats = RT5682_FORMATS,
-		},
-		.capture = {
-			.stream_name = "SDW Capture",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = RT5682_STEREO_RATES,
-			.formats = RT5682_FORMATS,
-		},
-		.ops = &rt5682_sdw_ops,
-	},
-#endif
-};
-
-static const struct snd_soc_component_driver soc_component_dev_rt5682 = {
+const struct snd_soc_component_driver rt5682_soc_component_dev = {
 	.probe = rt5682_probe,
 	.remove = rt5682_remove,
 	.suspend = rt5682_suspend,
@@ -3190,27 +2920,9 @@ static const struct snd_soc_component_driver soc_component_dev_rt5682 = {
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
 };
+EXPORT_SYMBOL_GPL(rt5682_soc_component_dev);
 
-static const struct regmap_config rt5682_regmap = {
-	.reg_bits = 16,
-	.val_bits = 16,
-	.max_register = RT5682_I2C_MODE,
-	.volatile_reg = rt5682_volatile_register,
-	.readable_reg = rt5682_readable_register,
-	.cache_type = REGCACHE_RBTREE,
-	.reg_defaults = rt5682_reg,
-	.num_reg_defaults = ARRAY_SIZE(rt5682_reg),
-	.use_single_read = true,
-	.use_single_write = true,
-};
-
-static const struct i2c_device_id rt5682_i2c_id[] = {
-	{"rt5682", 0},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
-
-static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
+int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 {
 
 	device_property_read_u32(dev, "realtek,dmic1-data-pin",
@@ -3238,8 +2950,9 @@ static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rt5682_parse_dt);
 
-static void rt5682_calibrate(struct rt5682_priv *rt5682)
+void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
 
@@ -3289,407 +3002,7 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 
 	mutex_unlock(&rt5682->calibrate_mutex);
 }
-
-#if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
-static int rt5682_sdw_read(void *context, unsigned int reg, unsigned int *val)
-{
-	struct device *dev = context;
-	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	unsigned int data_l, data_h;
-
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_CMD, 0);
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_H, (reg >> 8) & 0xff);
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_L, (reg & 0xff));
-	regmap_read(rt5682->sdw_regmap, RT5682_SDW_DATA_H, &data_h);
-	regmap_read(rt5682->sdw_regmap, RT5682_SDW_DATA_L, &data_l);
-
-	*val = (data_h << 8) | data_l;
-
-	dev_vdbg(dev, "[%s] %04x => %04x\n", __func__, reg, *val);
-
-	return 0;
-}
-
-static int rt5682_sdw_write(void *context, unsigned int reg, unsigned int val)
-{
-	struct device *dev = context;
-	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_CMD, 1);
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_H, (reg >> 8) & 0xff);
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_L, (reg & 0xff));
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_DATA_H, (val >> 8) & 0xff);
-	regmap_write(rt5682->sdw_regmap, RT5682_SDW_DATA_L, (val & 0xff));
-
-	dev_vdbg(dev, "[%s] %04x <= %04x\n", __func__, reg, val);
-
-	return 0;
-}
-
-static const struct regmap_config rt5682_sdw_regmap = {
-	.reg_bits = 16,
-	.val_bits = 16,
-	.max_register = RT5682_I2C_MODE,
-	.volatile_reg = rt5682_volatile_register,
-	.readable_reg = rt5682_readable_register,
-	.cache_type = REGCACHE_RBTREE,
-	.reg_defaults = rt5682_reg,
-	.num_reg_defaults = ARRAY_SIZE(rt5682_reg),
-	.use_single_read = true,
-	.use_single_write = true,
-	.reg_read = rt5682_sdw_read,
-	.reg_write = rt5682_sdw_write,
-};
-
-int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
-		struct sdw_slave *slave)
-{
-	struct rt5682_priv *rt5682;
-	int ret;
-
-	rt5682 = devm_kzalloc(dev, sizeof(*rt5682), GFP_KERNEL);
-	if (!rt5682)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, rt5682);
-	rt5682->slave = slave;
-	rt5682->sdw_regmap = regmap;
-	rt5682->is_sdw = true;
-
-	rt5682->regmap = devm_regmap_init(dev, NULL, dev, &rt5682_sdw_regmap);
-	if (IS_ERR(rt5682->regmap)) {
-		ret = PTR_ERR(rt5682->regmap);
-		dev_err(dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
-	/*
-	 * Mark hw_init to false
-	 * HW init will be performed when device reports present
-	 */
-	rt5682->hw_init = false;
-	rt5682->first_hw_init = false;
-
-	mutex_init(&rt5682->calibrate_mutex);
-	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
-		rt5682_jack_detect_handler);
-
-	ret = devm_snd_soc_register_component(dev, &soc_component_dev_rt5682,
-		rt5682_dai, ARRAY_SIZE(rt5682_dai));
-
-	dev_dbg(&slave->dev, "%s\n", __func__);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(rt5682_sdw_init);
-
-int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
-{
-	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	int ret = 0;
-	unsigned int val;
-
-	if (rt5682->hw_init)
-		return 0;
-
-	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
-	if (val != DEVICE_ID) {
-		dev_err(dev, "Device with ID register %x is not rt5682\n", val);
-		return -ENODEV;
-	}
-
-	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
-	 */
-	if (!rt5682->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
-		/* update count of parent 'active' children */
-		pm_runtime_set_active(&slave->dev);
-
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-	}
-
-	pm_runtime_get_noresume(&slave->dev);
-
-	if (rt5682->first_hw_init) {
-		regcache_cache_only(rt5682->regmap, false);
-		regcache_cache_bypass(rt5682->regmap, true);
-	}
-
-	rt5682_calibrate(rt5682);
-
-	if (rt5682->first_hw_init) {
-		regcache_cache_bypass(rt5682->regmap, false);
-		regcache_mark_dirty(rt5682->regmap);
-		regcache_sync(rt5682->regmap);
-
-		/* volatile registers */
-		regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
-			RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
-
-		goto reinit;
-	}
-
-	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
-				     ARRAY_SIZE(patch_list));
-	if (ret)
-		dev_warn(dev, "Failed to apply regmap patch: %d\n", ret);
-
-	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
-
-	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
-		RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
-		RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
-	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
-	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
-	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
-		RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
-	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
-		RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
-	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
-		RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
-
-	/* Soundwire */
-	regmap_write(rt5682->regmap, RT5682_PLL2_INTERNAL, 0xa266);
-	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_1, 0x1700);
-	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_2, 0x0006);
-	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_3, 0x2600);
-	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_4, 0x0c8f);
-	regmap_write(rt5682->regmap, RT5682_PLL_TRACK_2, 0x3000);
-	regmap_write(rt5682->regmap, RT5682_PLL_TRACK_3, 0x4000);
-	regmap_update_bits(rt5682->regmap, RT5682_GLB_CLK,
-		RT5682_SCLK_SRC_MASK | RT5682_PLL2_SRC_MASK,
-		RT5682_SCLK_SRC_PLL2 | RT5682_PLL2_SRC_SDW);
-
-	regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
-		RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
-	regmap_write(rt5682->regmap, RT5682_CBJ_CTRL_1, 0xd042);
-	regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_3,
-		RT5682_CBJ_IN_BUF_EN, RT5682_CBJ_IN_BUF_EN);
-	regmap_update_bits(rt5682->regmap, RT5682_SAR_IL_CMD_1,
-		RT5682_SAR_POW_MASK, RT5682_SAR_POW_EN);
-	regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
-		RT5682_POW_IRQ | RT5682_POW_JDH |
-		RT5682_POW_ANA, RT5682_POW_IRQ |
-		RT5682_POW_JDH | RT5682_POW_ANA);
-	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_2,
-		RT5682_PWR_JDH, RT5682_PWR_JDH);
-	regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
-		RT5682_JD1_EN_MASK | RT5682_JD1_IRQ_MASK,
-		RT5682_JD1_EN | RT5682_JD1_IRQ_PUL);
-
-reinit:
-	mod_delayed_work(system_power_efficient_wq,
-		&rt5682->jack_detect_work, msecs_to_jiffies(250));
-
-	/* Mark Slave initialization complete */
-	rt5682->hw_init = true;
-	rt5682->first_hw_init = true;
-
-	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
-
-	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(rt5682_io_init);
-#endif
-
-static int rt5682_i2c_probe(struct i2c_client *i2c,
-		const struct i2c_device_id *id)
-{
-	struct rt5682_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	struct rt5682_priv *rt5682;
-	int i, ret;
-	unsigned int val;
-
-	rt5682 = devm_kzalloc(&i2c->dev, sizeof(struct rt5682_priv),
-		GFP_KERNEL);
-	if (!rt5682)
-		return -ENOMEM;
-
-	i2c_set_clientdata(i2c, rt5682);
-
-	rt5682->pdata = i2s_default_platform_data;
-
-	if (pdata)
-		rt5682->pdata = *pdata;
-	else
-		rt5682_parse_dt(rt5682, &i2c->dev);
-
-	rt5682->regmap = devm_regmap_init_i2c(i2c, &rt5682_regmap);
-	if (IS_ERR(rt5682->regmap)) {
-		ret = PTR_ERR(rt5682->regmap);
-		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(rt5682->supplies); i++)
-		rt5682->supplies[i].supply = rt5682_supply_names[i];
-
-	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(rt5682->supplies),
-				      rt5682->supplies);
-	if (ret) {
-		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(rt5682->supplies),
-				    rt5682->supplies);
-	if (ret) {
-		dev_err(&i2c->dev, "Failed to enable supplies: %d\n", ret);
-		return ret;
-	}
-
-	if (gpio_is_valid(rt5682->pdata.ldo1_en)) {
-		if (devm_gpio_request_one(&i2c->dev, rt5682->pdata.ldo1_en,
-					  GPIOF_OUT_INIT_HIGH, "rt5682"))
-			dev_err(&i2c->dev, "Fail gpio_request gpio_ldo\n");
-	}
-
-	/* Sleep for 300 ms miniumum */
-	usleep_range(300000, 350000);
-
-	regmap_write(rt5682->regmap, RT5682_I2C_MODE, 0x1);
-	usleep_range(10000, 15000);
-
-	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
-	if (val != DEVICE_ID) {
-		dev_err(&i2c->dev,
-			"Device with ID register %x is not rt5682\n", val);
-		return -ENODEV;
-	}
-
-	mutex_init(&rt5682->calibrate_mutex);
-	rt5682_calibrate(rt5682);
-
-	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
-				     ARRAY_SIZE(patch_list));
-	if (ret)
-		dev_warn(&i2c->dev, "Failed to apply regmap patch: %d\n", ret);
-
-	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
-
-	/* DMIC pin*/
-	if (rt5682->pdata.dmic1_data_pin != RT5682_DMIC1_NULL) {
-		switch (rt5682->pdata.dmic1_data_pin) {
-		case RT5682_DMIC1_DATA_GPIO2: /* share with LRCK2 */
-			regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
-				RT5682_DMIC_1_DP_MASK, RT5682_DMIC_1_DP_GPIO2);
-			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-				RT5682_GP2_PIN_MASK, RT5682_GP2_PIN_DMIC_SDA);
-			break;
-
-		case RT5682_DMIC1_DATA_GPIO5: /* share with DACDAT1 */
-			regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
-				RT5682_DMIC_1_DP_MASK, RT5682_DMIC_1_DP_GPIO5);
-			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-				RT5682_GP5_PIN_MASK, RT5682_GP5_PIN_DMIC_SDA);
-			break;
-
-		default:
-			dev_warn(&i2c->dev, "invalid DMIC_DAT pin\n");
-			break;
-		}
-
-		switch (rt5682->pdata.dmic1_clk_pin) {
-		case RT5682_DMIC1_CLK_GPIO1: /* share with IRQ */
-			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-				RT5682_GP1_PIN_MASK, RT5682_GP1_PIN_DMIC_CLK);
-			break;
-
-		case RT5682_DMIC1_CLK_GPIO3: /* share with BCLK2 */
-			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-				RT5682_GP3_PIN_MASK, RT5682_GP3_PIN_DMIC_CLK);
-			break;
-
-		default:
-			dev_warn(&i2c->dev, "invalid DMIC_CLK pin\n");
-			break;
-		}
-	}
-
-	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
-		RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
-		RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
-	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
-	regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-		RT5682_GP4_PIN_MASK | RT5682_GP5_PIN_MASK,
-		RT5682_GP4_PIN_ADCDAT1 | RT5682_GP5_PIN_DACDAT1);
-	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
-	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
-		RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
-	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
-		RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
-	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
-		RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
-	regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
-		RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
-
-	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
-		rt5682_jack_detect_handler);
-	INIT_DELAYED_WORK(&rt5682->jd_check_work,
-		rt5682_jd_check_handler);
-
-	if (i2c->irq) {
-		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
-			rt5682_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
-			| IRQF_ONESHOT, "rt5682", rt5682);
-		if (ret)
-			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
-	}
-
-	return devm_snd_soc_register_component(&i2c->dev,
-			&soc_component_dev_rt5682,
-			rt5682_dai, ARRAY_SIZE(rt5682_dai));
-}
-
-static void rt5682_i2c_shutdown(struct i2c_client *client)
-{
-	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
-
-	rt5682_reset(rt5682);
-}
-
-#ifdef CONFIG_OF
-static const struct of_device_id rt5682_of_match[] = {
-	{.compatible = "realtek,rt5682i"},
-	{},
-};
-MODULE_DEVICE_TABLE(of, rt5682_of_match);
-#endif
-
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id rt5682_acpi_match[] = {
-	{"10EC5682", 0,},
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
-#endif
-
-static struct i2c_driver __maybe_unused rt5682_i2c_driver = {
-	.driver = {
-		.name = "rt5682",
-		.of_match_table = of_match_ptr(rt5682_of_match),
-		.acpi_match_table = ACPI_PTR(rt5682_acpi_match),
-	},
-	.probe = rt5682_i2c_probe,
-	.shutdown = rt5682_i2c_shutdown,
-	.id_table = rt5682_i2c_id,
-};
-
-#ifdef CONFIG_I2C
-module_i2c_driver(rt5682_i2c_driver);
-#endif
+EXPORT_SYMBOL_GPL(rt5682_calibrate);
 
 MODULE_DESCRIPTION("ASoC RT5682 driver");
 MODULE_AUTHOR("Bard Liao <bardliao@realtek.com>");
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 0baeece84ec4..f172c9ebd227 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1337,6 +1337,13 @@
 #define RT5682_SAR_SOUR_BTN			(0x3f)
 #define RT5682_SAR_SOUR_TYPE			(0x0)
 
+/* soundwire timeout */
+#define RT5682_PROBE_TIMEOUT			2000
+
+
+#define RT5682_STEREO_RATES SNDRV_PCM_RATE_8000_192000
+#define RT5682_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
 /* System Clock Source */
 enum {
@@ -1418,10 +1425,29 @@ struct rt5682_priv {
 	int jack_type;
 };
 
+extern const char *rt5682_supply_names[RT5682_NUM_SUPPLIES];
+
 int rt5682_sel_asrc_clk_src(struct snd_soc_component *component,
 		unsigned int filter_mask, unsigned int clk_src);
-int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
-	       struct sdw_slave *slave);
-int rt5682_io_init(struct device *dev, struct sdw_slave *slave);
+
+void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev);
+
+int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert);
+void rt5682_jack_detect_handler(struct work_struct *work);
+
+bool rt5682_volatile_register(struct device *dev, unsigned int reg);
+bool rt5682_readable_register(struct device *dev, unsigned int reg);
+
+int rt5682_register_component(struct device *dev);
+void rt5682_calibrate(struct rt5682_priv *rt5682);
+void rt5682_reset(struct rt5682_priv *rt5682);
+int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev);
+
+#define RT5682_REG_NUM 318
+extern const struct reg_default rt5682_reg[RT5682_REG_NUM];
+
+extern const struct snd_soc_dai_ops rt5682_aif1_dai_ops;
+extern const struct snd_soc_dai_ops rt5682_aif2_dai_ops;
+extern const struct snd_soc_component_driver rt5682_soc_component_dev;
 
 #endif /* __RT5682_H__ */
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 91ce347b3a45..46073c04364a 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -430,7 +430,7 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
-	select SND_SOC_RT5682
+	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
@@ -468,7 +468,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_MAX98373
 	select SND_SOC_RT1015
-	select SND_SOC_RT5682
+	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	help
@@ -511,7 +511,7 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT1011
-	select SND_SOC_RT5682
+	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	help
-- 
2.26.2

