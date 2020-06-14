Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504561F8DE2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4D8166F;
	Mon, 15 Jun 2020 08:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4D8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202737;
	bh=oDpyutUcX349m7DAi2K4/7H50YATwobyCIQNpuTViLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMvzkAT+11Q9gixxS/i8qbmKUT0+2B4LGZ3G0T4pUItCcLJJWfL2kjQwsfNjnGADk
	 FANDTqLmdgMl6jHQlQGquxGhwg+fPjpPg1XPLsOPSBWsyHJqRF9Exope13ILSQ/zoS
	 41d29PEMhpqwHDIZ1rNY035wMZgwVM9v6nKabGJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFCCF802EA;
	Mon, 15 Jun 2020 08:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 728B3F8022B; Sun, 14 Jun 2020 22:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM, MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010018.outbound.protection.outlook.com [40.92.10.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D6BF80232
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 22:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D6BF80232
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfUJPCwEN27mBzXxqcmBvIEv2A6Gsr4UMP+AYHhbEkKholmFh2wmzCVCJyYbcPJbQBEM3AehTfcZBIHxGRgSRkmE6NL3QYgViQ3S35trC7J9irJE2EPiUdW1TLRyna2VGWbG5rAi4v4vxjy2vjfnlG2xTxEpD9KMU4CxdSvdX85KH41OZp/zu9PCJWcBgu9bCccjSXjgVuRdpnhkF7PdNXTb64uSy4AUWRjLMP5rApHiF/KIDjWDKEYfAxUnXDXITvaeQ7YFKRkz6e4RxEwXhVzSFrdxB2+VVsLTGgstTXVMwNy5eVq5cFplRC218LQHNYae2T+Y4csF/nXcGzd+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnubzFlynxQcHXqK438MfC1BZFidiXwVV0/KoGanGEM=;
 b=I5sA6ybvs3Zfn/1FK4iXm2TKD2pYvKDXgvNoJh/3lbC3xX3K+p61reoOyQSZ5S/MAUSLcw/Rs4l/iUeju8K90LJL+ZOzSSyRySGwwwbJhks0T99HY72xfoahFPBryYfoOerB/00otUoSxz8I1gY7sCEUBHUQTiW0kw/xJi9I2R5k+YC0Fhsn35JOJgWv7aXd/RKBa6AHZ6OQBFxPZOnMynBADu7XabCU/crm/I8GtX8q151Eov5FJgUbTO/gliMGPjf/jrhiiWCxTOk6jkcDXsiPj1H7s/8NNJXfGB6Uwj3GxakzcHN+U1aQyZwOORSQU+y0AZibMUIfEwpJYyJcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
 (10.152.92.60) by BN3NAM04HT168.eop-NAM04.prod.protection.outlook.com
 (10.152.93.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Sun, 14 Jun
 2020 20:24:38 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e4e::4c) by BN3NAM04FT037.mail.protection.outlook.com
 (2a01:111:e400:7e4e::196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Sun, 14 Jun 2020 20:24:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:660DC5EA6428C817D0B48920E49218CDAAFD8EEBFE0B394102916EBA57D127D8;
 UpperCasedChecksum:68C9254866B0ACA92B1B71250672E74290994745074E6E5FEA8DB3F5EEA26A27;
 SizeAsReceived:7845; Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3088.028; Sun, 14 Jun 2020
 20:24:38 +0000
From: Jonathan Bakker <xc-racer2@live.ca>
To: krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] ASoC: samsung: Add driver for Aries boards
Date: Sun, 14 Jun 2020 13:24:11 -0700
Message-ID: <BN6PR04MB06608CBF03EF27B70B175978A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614202411.27843-1-xc-racer2@live.ca>
References: <20200614202411.27843-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR2001CA0018.namprd20.prod.outlook.com
 (2603:10b6:301:15::28) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200614202411.27843-4-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by
 MWHPR2001CA0018.namprd20.prod.outlook.com (2603:10b6:301:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend
 Transport; Sun, 14 Jun 2020 20:24:36 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200614202411.27843-4-xc-racer2@live.ca>
X-TMN: [az4k4fvVezD1okxo891nFnf17YTX5ygBlIqZiWJ3ALAnIh+FFEkyTnphppiSJnTu]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1b90c024-bad7-48e8-a46c-08d810a0f5f1
X-MS-TrafficTypeDiagnostic: BN3NAM04HT168:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3o/fedRgSQWYeZ1Z6rCOZq9TgZqlK8v5ON2ZSnMbG8CwqbcChb+HIndcOKSjwV9BaqvyZ4/cHHOJYKWTbpSd1tPqbLNeQ6HaS0CW6JvGClYWXPnWXLs3X2wVI8/OXiOmpXFQsUY2O3c6q62/OxC+36TtPu0kKMqfKsywdBZ3PYjNLLBm3iN9Vnj5yvPzjad142DjvyhJA15ORaXVjUQGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0660.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: btX/I1vsRzBKzSV74THAzo/T7ormdN7Y0Zz9dTPLjb1G2er6eknALIn1dFQUe8+GhEU06af9ynKBU96MJSgOZJnxW2Z+sdg1TqhsLq1E1rWKYM+Yr69Z/3w2jl4qon4PEaxXtJlDgtAQtIP7R9bxJ3C3wpF9SgsHuOL9CWbStMkZzOIg13ve5h6h4DT6CyNsmxLuZxwce8k/RMIWBS/LZQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b90c024-bad7-48e8-a46c-08d810a0f5f1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2020 20:24:38.4049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT168
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:09 +0200
Cc: Jonathan Bakker <xc-racer2@live.ca>
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

Samsung Aries boards have a WM8994 codec connected to the Samsung
I2S controller, the BT codec, and the cellular modem.  Jack detection
is done by a combination of an ADC, GPIOs, and an extcon device for
the USB dock.  There is also a GPIO for selection between the Mic
path and the TV out path on the headphone jack.

There are two main variants, one with an FM radio and where the modem
is the master and one without a radio and the modem is the slave.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 sound/soc/samsung/Kconfig        |  13 +
 sound/soc/samsung/Makefile       |   2 +
 sound/soc/samsung/aries_wm8994.c | 695 +++++++++++++++++++++++++++++++
 3 files changed, 710 insertions(+)
 create mode 100644 sound/soc/samsung/aries_wm8994.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 112911dc271b..505087d2a50d 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -212,4 +212,17 @@ config SND_SOC_SAMSUNG_TM2_WM5110
 	help
 	  Say Y if you want to add support for SoC audio on the TM2 board.
 
+config SND_SOC_SAMSUNG_ARIES_WM8994
+	tristate "SoC I2S Audio support for WM8994 on Aries"
+	depends on SND_SOC_SAMSUNG && MFD_WM8994 && IIO && EXTCON
+	select SND_SOC_BT_SCO
+	select SND_SOC_WM8994
+	select SND_SAMSUNG_I2S
+	help
+	  Say Y if you want to add support for SoC audio on Aries boards,
+	  which has a WM8994 codec connected to a BT codec, a cellular
+	  modem, and the Samsung I2S controller.  Jack detection is done
+	  via ADC, GPIOs, and an extcon device.  Switching between the Mic
+	  and TV-Out path is also handled.
+
 endif #SND_SOC_SAMSUNG
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 8f5dfe20b9f1..22259f7818f0 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -41,6 +41,7 @@ snd-soc-bells-objs := bells.o
 snd-soc-odroid-objs := odroid.o
 snd-soc-arndale-objs := arndale.o
 snd-soc-tm2-wm5110-objs := tm2_wm5110.o
+snd-soc-aries-wm8994-objs := aries_wm8994.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753) += snd-soc-neo1973-wm8753.o
@@ -64,3 +65,4 @@ obj-$(CONFIG_SND_SOC_BELLS) += snd-soc-bells.o
 obj-$(CONFIG_SND_SOC_ODROID) += snd-soc-odroid.o
 obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
+obj-$(CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994) += snd-soc-aries-wm8994.o
diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
new file mode 100644
index 000000000000..8579c87dcae8
--- /dev/null
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -0,0 +1,695 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/extcon.h>
+#include <linux/iio/consumer.h>
+#include <linux/iio/iio.h>
+#include <linux/input-event-codes.h>
+#include <linux/mfd/wm8994/registers.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/regulator/consumer.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "i2s.h"
+#include "../codecs/wm8994.h"
+
+#define ARIES_MCLK1_FREQ 24000000
+
+struct aries_wm8994_variant {
+	unsigned int modem_dai_fmt;
+	bool has_fm_radio;
+};
+
+struct aries_wm8994_data {
+	struct extcon_dev *usb_extcon;
+	struct regulator *reg_main_micbias;
+	struct regulator *reg_headset_micbias;
+	struct gpio_desc *gpio_headset_detect;
+	struct gpio_desc *gpio_headset_key;
+	struct gpio_desc *gpio_earpath_sel;
+	struct iio_channel *adc;
+	const struct aries_wm8994_variant *variant;
+};
+
+/* USB dock */
+static struct snd_soc_jack aries_dock;
+
+static struct snd_soc_jack_pin dock_pins[] = {
+	{
+		.pin = "LINE",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
+static int aries_extcon_notifier(struct notifier_block *this,
+				 unsigned long connected, void *_cmd)
+{
+	if (connected)
+		snd_soc_jack_report(&aries_dock, SND_JACK_LINEOUT,
+				SND_JACK_LINEOUT);
+	else
+		snd_soc_jack_report(&aries_dock, 0, SND_JACK_LINEOUT);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block aries_extcon_notifier_block = {
+	.notifier_call = aries_extcon_notifier,
+};
+
+/* Headset jack */
+static struct snd_soc_jack aries_headset;
+
+static struct snd_soc_jack_pin jack_pins[] = {
+	{
+		.pin = "HP",
+		.mask = SND_JACK_HEADPHONE,
+	}, {
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static struct snd_soc_jack_zone headset_zones[] = {
+	{
+		.min_mv = 0,
+		.max_mv = 241,
+		.jack_type = SND_JACK_HEADPHONE,
+	}, {
+		.min_mv = 242,
+		.max_mv = 2980,
+		.jack_type = SND_JACK_HEADSET,
+	}, {
+		.min_mv = 2981,
+		.max_mv = UINT_MAX,
+		.jack_type = SND_JACK_HEADPHONE,
+	},
+};
+
+static irqreturn_t headset_det_irq_thread(int irq, void *data)
+{
+	struct aries_wm8994_data *priv = (struct aries_wm8994_data *) data;
+	int ret = 0;
+	int time_left_ms = 300;
+	int adc;
+
+	while (time_left_ms > 0) {
+		if (!gpiod_get_value(priv->gpio_headset_detect)) {
+			snd_soc_jack_report(&aries_headset, 0,
+					SND_JACK_HEADSET);
+			gpiod_set_value(priv->gpio_earpath_sel, 0);
+			return IRQ_HANDLED;
+		}
+		msleep(20);
+		time_left_ms -= 20;
+	}
+
+	/* Temporarily enable micbias and earpath selector */
+	ret = regulator_enable(priv->reg_headset_micbias);
+	if (ret)
+		pr_err("%s failed to enable micbias: %d", __func__, ret);
+
+	gpiod_set_value(priv->gpio_earpath_sel, 1);
+
+	ret = iio_read_channel_processed(priv->adc, &adc);
+	if (ret < 0) {
+		/* failed to read ADC, so assume headphone */
+		pr_err("%s failed to read ADC, assuming headphones", __func__);
+		snd_soc_jack_report(&aries_headset, SND_JACK_HEADPHONE,
+				SND_JACK_HEADSET);
+	} else {
+		snd_soc_jack_report(&aries_headset,
+				snd_soc_jack_get_type(&aries_headset, adc),
+				SND_JACK_HEADSET);
+	}
+
+	ret = regulator_disable(priv->reg_headset_micbias);
+	if (ret)
+		pr_err("%s failed disable micbias: %d", __func__, ret);
+
+	/* Disable earpath selector when no mic connected */
+	if (!(aries_headset.status & SND_JACK_MICROPHONE))
+		gpiod_set_value(priv->gpio_earpath_sel, 0);
+
+	return IRQ_HANDLED;
+}
+
+static int headset_button_check(void *data)
+{
+	struct aries_wm8994_data *priv = (struct aries_wm8994_data *) data;
+
+	/* Filter out keypresses when 4 pole jack not detected */
+	if (gpiod_get_value_cansleep(priv->gpio_headset_key) &&
+			aries_headset.status & SND_JACK_MICROPHONE)
+		return SND_JACK_BTN_0;
+
+	return 0;
+}
+
+static struct snd_soc_jack_gpio headset_button_gpio[] = {
+	{
+		.name = "Media Button",
+		.report = SND_JACK_BTN_0,
+		.debounce_time  = 30,
+		.jack_status_check = headset_button_check,
+	},
+};
+
+static int aries_spk_cfg(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_component *component;
+	int ret = 0;
+
+	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
+	component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	/**
+	 * We have an odd setup - the SPKMODE pin is pulled up so
+	 * we only have access to the left side SPK configs,
+	 * but SPKOUTR isn't bridged so when playing back in
+	 * stereo, we only get the left hand channel.  The only
+	 * option we're left with is to force the AIF into mono
+	 * mode.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = snd_soc_component_update_bits(component,
+				WM8994_AIF1_DAC1_FILTERS_1,
+				WM8994_AIF1DAC1_MONO, WM8994_AIF1DAC1_MONO);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = snd_soc_component_update_bits(component,
+				WM8994_AIF1_DAC1_FILTERS_1,
+				WM8994_AIF1DAC1_MONO, 0);
+		break;
+	}
+
+	return ret;
+}
+
+static int aries_main_bias(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct aries_wm8994_data *priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = regulator_enable(priv->reg_main_micbias);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		ret = regulator_disable(priv->reg_main_micbias);
+		break;
+	}
+
+	return ret;
+}
+
+static int aries_headset_bias(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct aries_wm8994_data *priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = regulator_enable(priv->reg_headset_micbias);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		ret = regulator_disable(priv->reg_headset_micbias);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new aries_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Modem In"),
+	SOC_DAPM_PIN_SWITCH("Modem Out"),
+};
+
+static const struct snd_soc_dapm_widget aries_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("HP", NULL),
+
+	SND_SOC_DAPM_SPK("SPK", aries_spk_cfg),
+	SND_SOC_DAPM_SPK("RCV", NULL),
+
+	SND_SOC_DAPM_LINE("LINE", NULL),
+
+	SND_SOC_DAPM_MIC("Main Mic", aries_main_bias),
+	SND_SOC_DAPM_MIC("Headset Mic", aries_headset_bias),
+
+	SND_SOC_DAPM_MIC("Bluetooth Mic", NULL),
+	SND_SOC_DAPM_SPK("Bluetooth SPK", NULL),
+
+	SND_SOC_DAPM_LINE("Modem In", NULL),
+	SND_SOC_DAPM_LINE("Modem Out", NULL),
+
+	/* This must be last as it is conditionally not used */
+	SND_SOC_DAPM_LINE("FM In", NULL),
+};
+
+static int aries_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int pll_out;
+	int ret;
+
+	/* AIF1CLK should be >=3MHz for optimal performance */
+	if (params_width(params) == 24)
+		pll_out = params_rate(params) * 384;
+	else if (params_rate(params) == 8000 || params_rate(params) == 11025)
+		pll_out = params_rate(params) * 512;
+	else
+		pll_out = params_rate(params) * 256;
+
+	ret = snd_soc_dai_set_pll(codec_dai, WM8994_FLL1, WM8994_FLL_SRC_MCLK1,
+				ARIES_MCLK1_FREQ, pll_out);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL1,
+				pll_out, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int aries_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	/* Switch sysclk to MCLK1 */
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1,
+				ARIES_MCLK1_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		return ret;
+
+	/* Stop PLL */
+	ret = snd_soc_dai_set_pll(codec_dai, WM8994_FLL1, WM8994_FLL_SRC_MCLK1,
+				ARIES_MCLK1_FREQ, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Main DAI operations
+ */
+static struct snd_soc_ops aries_ops = {
+	.hw_params = aries_hw_params,
+	.hw_free = aries_hw_free,
+};
+
+static int aries_baseband_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int pll_out;
+	int ret;
+
+	pll_out = 8000 * 512;
+
+	/* Set the codec FLL */
+	ret = snd_soc_dai_set_pll(codec_dai, WM8994_FLL2, WM8994_FLL_SRC_MCLK1,
+			ARIES_MCLK1_FREQ, pll_out);
+	if (ret < 0)
+		return ret;
+
+	/* Set the codec system clock */
+	ret = snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_FLL2,
+			pll_out, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int aries_late_probe(struct snd_soc_card *card)
+{
+	struct aries_wm8994_data *priv = snd_soc_card_get_drvdata(card);
+	int ret, irq;
+
+	ret = snd_soc_card_jack_new(card, "Dock", SND_JACK_LINEOUT,
+			&aries_dock, dock_pins, ARRAY_SIZE(dock_pins));
+	if (ret)
+		return ret;
+
+	ret = devm_extcon_register_notifier(card->dev,
+			priv->usb_extcon, EXTCON_JACK_LINE_OUT,
+			&aries_extcon_notifier_block);
+	if (ret)
+		return ret;
+
+	if (extcon_get_state(priv->usb_extcon,
+			EXTCON_JACK_LINE_OUT) > 0)
+		snd_soc_jack_report(&aries_dock, SND_JACK_LINEOUT,
+				SND_JACK_LINEOUT);
+	else
+		snd_soc_jack_report(&aries_dock, 0, SND_JACK_LINEOUT);
+
+	ret = snd_soc_card_jack_new(card, "Headset",
+			SND_JACK_HEADSET | SND_JACK_BTN_0,
+			&aries_headset,
+			jack_pins, ARRAY_SIZE(jack_pins));
+	if (ret)
+		return ret;
+
+	ret = snd_soc_jack_add_zones(&aries_headset, ARRAY_SIZE(headset_zones),
+			headset_zones);
+	if (ret)
+		return ret;
+
+	irq = gpiod_to_irq(priv->gpio_headset_detect);
+	if (irq < 0) {
+		dev_err(card->dev, "Failed to map headset detect gpio to irq");
+		return -EINVAL;
+	}
+
+	ret = devm_request_threaded_irq(card->dev, irq, NULL,
+			headset_det_irq_thread,
+			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
+			IRQF_ONESHOT, "headset_detect", priv);
+	if (ret) {
+		dev_err(card->dev, "Failed to request headset detect irq");
+		return ret;
+	}
+
+	headset_button_gpio[0].data = priv;
+	headset_button_gpio[0].desc = priv->gpio_headset_key;
+
+	snd_jack_set_key(aries_headset.jack, SND_JACK_BTN_0, KEY_MEDIA);
+
+	return snd_soc_jack_add_gpios(&aries_headset,
+			ARRAY_SIZE(headset_button_gpio), headset_button_gpio);
+}
+
+static const struct snd_soc_pcm_stream baseband_params = {
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rate_min = 8000,
+	.rate_max = 8000,
+	.channels_min = 1,
+	.channels_max = 1,
+};
+
+static const struct snd_soc_pcm_stream bluetooth_params = {
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rate_min = 8000,
+	.rate_max = 8000,
+	.channels_min = 1,
+	.channels_max = 2,
+};
+
+static const struct snd_soc_dapm_widget aries_modem_widgets[] = {
+	SND_SOC_DAPM_INPUT("Modem RX"),
+	SND_SOC_DAPM_OUTPUT("Modem TX"),
+};
+
+static const struct snd_soc_dapm_route aries_modem_routes[] = {
+	{ "Modem Capture", NULL, "Modem RX" },
+	{ "Modem TX", NULL, "Modem Playback" },
+};
+
+static const struct snd_soc_component_driver aries_component = {
+	.name			= "aries-audio",
+	.dapm_widgets		= aries_modem_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(aries_modem_widgets),
+	.dapm_routes		= aries_modem_routes,
+	.num_dapm_routes	= ARRAY_SIZE(aries_modem_routes),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static struct snd_soc_dai_driver aries_ext_dai[] = {
+	{
+		.name = "Voice call",
+		.playback = {
+			.stream_name = "Modem Playback",
+			.channels_min = 1,
+			.channels_max = 1,
+			.rate_min = 8000,
+			.rate_max = 8000,
+			.rates = SNDRV_PCM_RATE_8000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.stream_name = "Modem Capture",
+			.channels_min = 1,
+			.channels_max = 1,
+			.rate_min = 8000,
+			.rate_max = 8000,
+			.rates = SNDRV_PCM_RATE_8000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
+};
+
+SND_SOC_DAILINK_DEFS(aif1,
+	DAILINK_COMP_ARRAY(COMP_CPU(SAMSUNG_I2S_DAI)),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(baseband,
+	DAILINK_COMP_ARRAY(COMP_CPU("Voice call")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif2")));
+
+SND_SOC_DAILINK_DEFS(bluetooth,
+	DAILINK_COMP_ARRAY(COMP_CPU("bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif3")));
+
+static struct snd_soc_dai_link aries_dai[] = {
+	{
+		.name = "WM8994 AIF1",
+		.stream_name = "HiFi",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBM_CFM,
+		.ops = &aries_ops,
+		SND_SOC_DAILINK_REG(aif1),
+	},
+	{
+		.name = "WM8994 AIF2",
+		.stream_name = "Baseband",
+		.init = &aries_baseband_init,
+		.params = &baseband_params,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(baseband),
+	},
+	{
+		.name = "WM8994 AIF3",
+		.stream_name = "Bluetooth",
+		.params = &bluetooth_params,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(bluetooth),
+	},
+};
+
+static struct snd_soc_card aries_card = {
+	.name = "ARIES",
+	.owner = THIS_MODULE,
+	.dai_link = aries_dai,
+	.num_links = ARRAY_SIZE(aries_dai),
+	.controls = aries_controls,
+	.num_controls = ARRAY_SIZE(aries_controls),
+	.dapm_widgets = aries_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(aries_dapm_widgets),
+	.late_probe = aries_late_probe,
+};
+
+static const struct aries_wm8994_variant fascinate4g_variant = {
+	.modem_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBS_CFS
+		| SND_SOC_DAIFMT_IB_NF,
+	.has_fm_radio = false,
+};
+
+static const struct aries_wm8994_variant aries_variant = {
+	.modem_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM
+		| SND_SOC_DAIFMT_IB_NF,
+	.has_fm_radio = true,
+};
+
+static const struct of_device_id samsung_wm8994_of_match[] = {
+	{
+		.compatible = "samsung,fascinate4g-wm8994",
+		.data = &fascinate4g_variant,
+	},
+	{
+		.compatible = "samsung,aries-wm8994",
+		.data = &aries_variant,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
+
+static int aries_audio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *cpu, *codec, *extcon_np;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_card *card = &aries_card;
+	struct aries_wm8994_data *priv;
+	struct snd_soc_dai_link *dai_link;
+	const struct of_device_id *match;
+	int ret, i;
+
+	if (!np)
+		return -EINVAL;
+
+	card->dev = dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	match = of_match_node(samsung_wm8994_of_match, np);
+	priv->variant = match->data;
+
+	/* Remove FM widget if not present */
+	if (!priv->variant->has_fm_radio)
+		card->num_dapm_widgets--;
+
+	priv->reg_main_micbias = devm_regulator_get(dev, "main-micbias");
+	if (IS_ERR(priv->reg_main_micbias)) {
+		dev_err(dev, "Failed to get main micbias regulator\n");
+		return PTR_ERR(priv->reg_main_micbias);
+	}
+
+	priv->reg_headset_micbias = devm_regulator_get(dev, "headset-micbias");
+	if (IS_ERR(priv->reg_headset_micbias)) {
+		dev_err(dev, "Failed to get headset micbias regulator\n");
+		return PTR_ERR(priv->reg_headset_micbias);
+	}
+
+	priv->gpio_earpath_sel = devm_gpiod_get(dev, "earpath-sel",
+			GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpio_earpath_sel)) {
+		dev_err(dev, "Failed to get earpath selector gpio");
+		return PTR_ERR(priv->gpio_earpath_sel);
+	}
+
+	extcon_np = of_parse_phandle(np, "extcon", 0);
+	priv->usb_extcon = extcon_find_edev_by_node(extcon_np);
+	if (IS_ERR(priv->usb_extcon)) {
+		if (PTR_ERR(priv->usb_extcon) != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get extcon device");
+		return PTR_ERR(priv->usb_extcon);
+	}
+	of_node_put(extcon_np);
+
+	priv->adc = devm_iio_channel_get(dev, "headset-detect");
+	if (IS_ERR(priv->adc)) {
+		if (PTR_ERR(priv->adc) != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get ADC channel");
+		return PTR_ERR(priv->adc);
+	}
+	if (priv->adc->channel->type != IIO_VOLTAGE)
+		return -EINVAL;
+
+	priv->gpio_headset_key = devm_gpiod_get(dev, "headset-key",
+			GPIOD_IN);
+	if (IS_ERR(priv->gpio_headset_key)) {
+		dev_err(dev, "Failed to get headset key gpio");
+		return PTR_ERR(priv->gpio_headset_key);
+	}
+
+	priv->gpio_headset_detect = devm_gpiod_get(dev,
+			"headset-detect", GPIOD_IN);
+	if (IS_ERR(priv->gpio_headset_detect)) {
+		dev_err(dev, "Failed to get headset detect gpio");
+		return PTR_ERR(priv->gpio_headset_detect);
+	}
+
+	/* Update card-name if provided through DT, else use default name */
+	snd_soc_of_parse_card_name(card, "model");
+
+	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	if (ret < 0) {
+		dev_err(dev, "Audio routing invalid/unspecified\n");
+		return ret;
+	}
+
+	aries_dai[1].dai_fmt = priv->variant->modem_dai_fmt;
+
+	cpu = of_get_child_by_name(dev->of_node, "cpu");
+	if (!cpu)
+		return -EINVAL;
+
+	codec = of_get_child_by_name(dev->of_node, "codec");
+	if (!codec)
+		return -EINVAL;
+
+	for_each_card_prelinks(card, i, dai_link) {
+		dai_link->codecs->of_node = of_parse_phandle(codec,
+				"sound-dai", 0);
+		if (!dai_link->codecs->of_node) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	/* Set CPU and platform of_node for main DAI */
+	aries_dai[0].cpus->of_node = of_parse_phandle(cpu,
+			"sound-dai", 0);
+	if (!aries_dai[0].cpus->of_node) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	aries_dai[0].platforms->of_node = aries_dai[0].cpus->of_node;
+
+	/* Set CPU of_node for BT DAI */
+	aries_dai[2].cpus->of_node = of_parse_phandle(cpu,
+			"sound-dai", 1);
+	if (!aries_dai[2].cpus->of_node) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = devm_snd_soc_register_component(dev, &aries_component,
+				aries_ext_dai, ARRAY_SIZE(aries_ext_dai));
+	if (ret < 0) {
+		dev_err(dev, "Failed to register component: %d\n", ret);
+		goto out;
+	}
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret)
+		dev_err(dev, "snd_soc_register_card() failed:%d\n", ret);
+
+out:
+	of_node_put(cpu);
+	of_node_put(codec);
+
+	return ret;
+}
+
+static struct platform_driver aries_audio_driver = {
+	.driver		= {
+		.name	= "aries-audio-wm8994",
+		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
+		.pm	= &snd_soc_pm_ops,
+	},
+	.probe		= aries_audio_probe,
+};
+
+module_platform_driver(aries_audio_driver);
+
+MODULE_DESCRIPTION("ALSA SoC ARIES WM8994");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:aries-audio-wm8994");
-- 
2.20.1

