Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D243421BC63
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 19:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755981658;
	Fri, 10 Jul 2020 19:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755981658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594402678;
	bh=dKms6Q9h1SMZwhJJQ8K/Z9QwZeVqg5iL3IrduAZmi0U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQHjfDlHRZIKDMsTNzS0RnRoB4zInDj0uAGyuiBaZskopU3SnMOjeZx6/Z2fvVXYv
	 q2DqKBcdoCQLAP9zG+ozffopvI/nmhoeclL3xSNHhzS0oGOrraFI/CjLIqpYTdG029
	 D1KFVdMzPZQJfsrSKLxpmO/io+TXC5fjDY75wvdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4342F802BE;
	Fri, 10 Jul 2020 19:35:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8BF8F8015C; Fri, 10 Jul 2020 19:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE73F8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 19:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE73F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ao9XeK4P"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710173517euoutp01a35ef6c390a55f323e5b86a070000cb8~gdKR_bt650722307223euoutp01M
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 17:35:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710173517euoutp01a35ef6c390a55f323e5b86a070000cb8~gdKR_bt650722307223euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594402517;
 bh=wFScUX4fitP6oX7FAeDOMY87Tr9bTp8gZuCgOxycXc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ao9XeK4P6Te/lhh2Deacajh42hDSN4WfbM9jfHp7fCNhY8dyRbrA2A2FjPseAx/Nc
 j+3BE3KRznex9FYsD6kZw3HO8SXEYD0Ujl7lzNNb4Hv0+InzB78bNO8Bc3Ifdo2Hqw
 WnKTUsZiVH/ss9FhE85XxIh000Y4sLAO77mVY8ZY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710173517eucas1p21c8333fc1de6627f3b51d49f6c7a34eb~gdKRpXc4I2030220302eucas1p2v;
 Fri, 10 Jul 2020 17:35:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B5.F4.05997.5D6A80F5; Fri, 10
 Jul 2020 18:35:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb~gdKRJc0PY2029020290eucas1p20;
 Fri, 10 Jul 2020 17:35:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200710173517eusmtrp2d1dbdb210c4c45a3cadd4ec33ca70b43~gdKRIyAnl0083200832eusmtrp21;
 Fri, 10 Jul 2020 17:35:17 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-19-5f08a6d59ce7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 46.BE.06017.4D6A80F5; Fri, 10
 Jul 2020 18:35:16 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710173516eusmtip1a9cea7cce13aefb30168652067374dcf~gdKQquVAF2695826958eusmtip1L;
 Fri, 10 Jul 2020 17:35:16 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Subject: [PATCH 2/3] ASoC: samsung: Add sound support for Midas boards
Date: Fri, 10 Jul 2020 19:34:59 +0200
Message-Id: <20200710173500.22365-2-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710173500.22365-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd2ryzjiDW61ylpcuXiIyWLjjPWs
 FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gtDr9pZ7XYcuY2mwOXx4bPTWwem1Z1
 snm0rN/E5tG3ZRWjx+dNcgGsUVw2Kak5mWWpRfp2CVwZ634dYi2Y18VY8ezebuYGxuVFXYyc
 HBICJhI77h9m7WLk4hASWMEosWHZcnYI5wujxMtF76Ccz4wSLy60M8G07F52hw0isZxR4tGc
 JcxwLe++dbCDVLEJGEr0Hu1jBLFFBNQl7s9oAlvCLHCTUWLmpj6gdg4OYQE3ie4DAiA1LAKq
 Ei8vTmMBsXkFrCVev53NCLFNXmL1hgPMIOWcAjYSB765gIyREOhml3h2FORwkBoXiRvvWtkh
 bGGJV8e3QNkyEv93zmeCaGhmlOjZfZsdwpnAKHH/+AKoDdYSd879AjuIWUBTYv0ufYiwo8TC
 JW/ZQcISAnwSN94KgoSZgcxJ26YzQ4R5JTrahCCqVSR+r5oODSApie4n/1kgbA+J5XOOQsOn
 n1Fi5bpLLBMY5WchLFvAyLiKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMI2c/nf8yw7G
 XX+SDjEKcDAq8fAuSOSIF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRmkO
 FiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjN2FHL3y88Qa54n2Wf5T11tVJ7IormxjWbH5
 7eN7Z/rNm7punXGXpn3amgb+7FfCU7tlzatOT3/bJZlaV/ti9WMB1+gvp/T+9M55xHxL9tGD
 08zz9Sf7Ohbv+T87oCS46FwpX/Dr5td3Vy2xnckc+GeBi5FfxZq+XdtUj3GtePshKD00vszq
 ixJLcUaioRZzUXEiAL0nqh8fAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsVy+t/xu7pXlnHEGxy8Z2Nx5eIhJouNM9az
 Wkx9+ITNYv6Rc6wW589vYLeYcX4fk8XaI3fZLVr3HmG3OPymndViy5nbbA5cHhs+N7F5bFrV
 yebRsn4Tm0ffllWMHp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq
 6dvZpKTmZJalFunbJehlrPt1iLVgXhdjxbN7u5kbGJcXdTFyckgImEjsXnaHDcQWEljKKPH4
 iHcXIwdQXEpifosSRImwxJ9rXUAlXEAlnxglnuxrBatnEzCU6D3axwhiiwhoSnTMu80KUsQs
 8JBRYv/x+4wgg4QF3CS6DwiA1LAIqEq8vDiNBcTmFbCWeP12NiPEAnmJ1RsOMIOUcwrYSBz4
 5gJxjrXEo1e/WScw8i1gZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGM7bjv3csoOx613w
 IUYBDkYlHt4FiRzxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAp000Rm
 KdHkfGCs5ZXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYNzYHiC8
 LoO5tTRjpqrmS9dADSmt2h7vi8umhX1mv3WDTel3KuvW0A2fJRbW/JDOOihQzPT40ySx48r3
 uVMTT36o5W48vUB0447arpSalRGJCw/tm7Ty4+1lW34Yq93+ukHu8rMtQZu4dp60XLVWU2PC
 /YZ3ufFJt3eu3HV5wY9PWw697lSZ73xBiaU4I9FQi7moOBEAwJcP1n0CAAA=
X-CMS-MailID: 20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
 <CGME20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb@eucas1p2.samsung.com>
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, m.szyprowski@samsung.com
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

From: Simon Shields <simon@lineageos.org>

This patch adds support for voice and BT calls, along with standard
audio output via the speaker, earpiece, headphone jack, HDMI, and
any accessories compatible with Midas boards. This patch also supports
headphone/headset detection and headsets with inline buttons.

Signed-off-by: Simon Shields <simon@lineageos.org>
[m.szyprowski: adaptation to v5.1+ kernels (DAI links initialization)]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
[s.nawrocki: removal of the clk API calls for CODEC MCLK, the jack data
 structure moved to struct midas_priv, coding style and typo fixes,
 conversion to new cpu/codec/dai-node binding]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/Kconfig        |   8 +
 sound/soc/samsung/Makefile       |   2 +
 sound/soc/samsung/midas_wm1811.c | 543 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 sound/soc/samsung/midas_wm1811.c

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 4b5c348..1431be4 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -225,4 +225,12 @@ config SND_SOC_SAMSUNG_ARIES_WM8994
 	  via ADC, GPIOs, and an extcon device.  Switching between the Mic
 	  and TV-Out path is also handled.
 
+config SND_SOC_SAMSUNG_MIDAS_WM1811
+	tristate "SoC I2S Audio support for Midas boards"
+	depends on SND_SOC_SAMSUNG
+	select SND_SAMSUNG_I2S
+	select SND_SOC_WM8994
+	help
+	  Say Y if you want to add support for SoC audio on the Midas boards.
+
 endif #SND_SOC_SAMSUNG
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 22259f7..398e843 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -42,6 +42,7 @@ snd-soc-odroid-objs := odroid.o
 snd-soc-arndale-objs := arndale.o
 snd-soc-tm2-wm5110-objs := tm2_wm5110.o
 snd-soc-aries-wm8994-objs := aries_wm8994.o
+snd-soc-midas-wm1811-objs := midas_wm1811.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_JIVE_WM8750) += snd-soc-jive-wm8750.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753) += snd-soc-neo1973-wm8753.o
@@ -66,3 +67,4 @@ obj-$(CONFIG_SND_SOC_ODROID) += snd-soc-odroid.o
 obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994) += snd-soc-aries-wm8994.o
+obj-$(CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811) += snd-soc-midas-wm1811.o
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
new file mode 100644
index 0000000..d03340c
--- /dev/null
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Midas audio support
+//
+// Copyright (C) 2018 Simon Shields <simon@lineageos.org>
+// Copyright (C) 2020 Samsung Electronics Co., Ltd.
+
+#include <linux/clk.h>
+#include <linux/mfd/wm8994/registers.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/regulator/consumer.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#include "i2s.h"
+#include "../codecs/wm8994.h"
+
+/*
+ * The MCLK1 clock source is XCLKOUT with its mux set to the external fixed rate
+ * oscillator (XXTI).
+ */
+#define MCLK1_RATE 24000000U
+#define MCLK2_RATE 32768U
+#define DEFAULT_FLL1_RATE 11289600U
+
+struct midas_priv {
+	struct regulator *reg_mic_bias;
+	struct regulator *reg_submic_bias;
+	struct gpio_desc *gpio_fm_sel;
+	struct gpio_desc *gpio_lineout_sel;
+	unsigned int fll1_rate;
+
+	struct snd_soc_jack headset_jack;
+};
+
+static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!rate)
+		rate = priv->fll1_rate;
+	/*
+	 * If no new rate is requested, set FLL1 to a sane default for jack
+	 * detection.
+	 */
+	if (!rate)
+		rate = DEFAULT_FLL1_RATE;
+
+	if (rate != priv->fll1_rate && priv->fll1_rate) {
+		/* while reconfiguring, switch to MCLK2 for SYSCLK */
+		ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+					     MCLK2_RATE, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "Unable to switch to MCLK2: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = snd_soc_dai_set_pll(aif1_dai, WM8994_FLL1, WM8994_FLL_SRC_MCLK1,
+				  MCLK1_RATE, rate);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set FLL1 rate: %d\n", ret);
+		return ret;
+	}
+	priv->fll1_rate = rate;
+
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_FLL1,
+				     priv->fll1_rate, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set SYSCLK source: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK, 0,
+				     SAMSUNG_I2S_OPCLK_PCLK);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set OPCLK source: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
+				     MCLK2_RATE, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(card->dev, "Unable to switch to MCLK2: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(aif1_dai, WM8994_FLL1, 0, 0, 0);
+	if (ret < 0) {
+		dev_err(card->dev, "Unable to stop FLL1: %d\n", ret);
+		return ret;
+	}
+
+	priv->fll1_rate = 0;
+
+	return 0;
+}
+
+static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd	= substream->private_data;
+	unsigned int pll_out;
+
+	/* AIF1CLK should be at least 3MHz for "optimal performance" */
+	if (params_rate(params) == 8000 || params_rate(params) == 11025)
+		pll_out = params_rate(params) * 512;
+	else
+		pll_out = params_rate(params) * 256;
+
+	return midas_start_fll1(rtd, pll_out);
+}
+
+static struct snd_soc_ops midas_aif1_ops = {
+	.hw_params = midas_aif1_hw_params,
+};
+
+/*
+ * We only have a single external speaker, so mix stereo data
+ * to a single mono stream.
+ */
+static int midas_ext_spkmode(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = snd_soc_component_update_bits(codec, WM8994_SPKOUT_MIXERS,
+				  WM8994_SPKMIXR_TO_SPKOUTL_MASK,
+				  WM8994_SPKMIXR_TO_SPKOUTL);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		ret = snd_soc_component_update_bits(codec, WM8994_SPKOUT_MIXERS,
+				  WM8994_SPKMIXR_TO_SPKOUTL_MASK,
+				  0);
+		break;
+	}
+
+	return ret;
+}
+
+static int midas_mic_bias(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return regulator_enable(priv->reg_mic_bias);
+	case SND_SOC_DAPM_POST_PMD:
+		return regulator_disable(priv->reg_mic_bias);
+	}
+
+	return 0;
+}
+
+static int midas_submic_bias(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return regulator_enable(priv->reg_submic_bias);
+	case SND_SOC_DAPM_POST_PMD:
+		return regulator_disable(priv->reg_submic_bias);
+	}
+
+	return 0;
+}
+
+static int midas_fm_set(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	if (!priv->gpio_fm_sel)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		gpiod_set_value_cansleep(priv->gpio_fm_sel, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		gpiod_set_value_cansleep(priv->gpio_fm_sel, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int midas_line_set(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	if (!priv->gpio_lineout_sel)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		gpiod_set_value_cansleep(priv->gpio_lineout_sel, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		gpiod_set_value_cansleep(priv->gpio_lineout_sel, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new midas_controls[] = {
+	SOC_DAPM_PIN_SWITCH("HP"),
+
+	SOC_DAPM_PIN_SWITCH("SPK"),
+	SOC_DAPM_PIN_SWITCH("RCV"),
+
+	SOC_DAPM_PIN_SWITCH("LINE"),
+	SOC_DAPM_PIN_SWITCH("HDMI"),
+
+	SOC_DAPM_PIN_SWITCH("Main Mic"),
+	SOC_DAPM_PIN_SWITCH("Sub Mic"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+
+	SOC_DAPM_PIN_SWITCH("FM In"),
+};
+
+static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("HP", NULL),
+
+	SND_SOC_DAPM_SPK("SPK", midas_ext_spkmode),
+	SND_SOC_DAPM_SPK("RCV", NULL),
+
+	/* FIXME: toggle MAX77693 on i9300/i9305 */
+	SND_SOC_DAPM_LINE("LINE", midas_line_set),
+	SND_SOC_DAPM_LINE("HDMI", NULL),
+	SND_SOC_DAPM_LINE("FM In", midas_fm_set),
+
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
+	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
+};
+
+static int midas_set_bias_level(struct snd_soc_card *card,
+				struct snd_soc_dapm_context *dapm,
+				enum snd_soc_bias_level level)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
+						  &card->dai_link[0]);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+
+	if (dapm->dev != aif1_dai->dev)
+		return 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_STANDBY:
+		return midas_stop_fll1(rtd);
+	case SND_SOC_BIAS_PREPARE:
+		return midas_start_fll1(rtd, 0);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int midas_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
+							&card->dai_link[0]);
+	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	/* Use MCLK2 as SYSCLK for boot */
+	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2, MCLK2_RATE,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(aif1_dai->dev, "Failed to switch to MCLK2: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(card, "Headset",
+			SND_JACK_HEADSET | SND_JACK_MECHANICAL |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+			SND_JACK_BTN_3 | SND_JACK_BTN_4 | SND_JACK_BTN_5,
+			&priv->headset_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	wm8958_mic_detect(aif1_dai->component, &priv->headset_jack,
+			  NULL, NULL, NULL, NULL);
+	return 0;
+}
+
+static struct snd_soc_dai_driver midas_ext_dai[] = {
+	{
+		.name = "Voice call",
+		.playback = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
+	{
+		.name = "Bluetooth",
+		.playback = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.capture = {
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_min = 8000,
+			.rate_max = 16000,
+			.rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000),
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
+};
+
+static const struct snd_soc_component_driver midas_component = {
+	.name	= "midas-audio",
+};
+
+SND_SOC_DAILINK_DEFS(wm1811_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(wm1811_voice,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif2")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(wm1811_bt,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif3")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link midas_dai[] = {
+	{
+		.name = "WM8994 AIF1",
+		.stream_name = "HiFi Primary",
+		.ops = &midas_aif1_ops,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(wm1811_hifi),
+	}, {
+		.name = "WM1811 Voice",
+		.stream_name = "Voice call",
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm1811_voice),
+	}, {
+		.name = "WM1811 BT",
+		.stream_name = "Bluetooth",
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(wm1811_bt),
+	},
+};
+
+static struct snd_soc_card midas_card = {
+	.name = "Midas WM1811",
+	.owner = THIS_MODULE,
+
+	.dai_link = midas_dai,
+	.num_links = ARRAY_SIZE(midas_dai),
+	.controls = midas_controls,
+	.num_controls = ARRAY_SIZE(midas_controls),
+	.dapm_widgets = midas_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(midas_dapm_widgets),
+
+	.set_bias_level = midas_set_bias_level,
+	.late_probe = midas_late_probe,
+};
+
+static int midas_probe(struct platform_device *pdev)
+{
+	struct device_node *cpu_dai_node = NULL, *codec_dai_node = NULL;
+	struct device_node *cpu = NULL, *codec = NULL;
+	struct snd_soc_card *card = &midas_card;
+	struct device *dev = &pdev->dev;
+	static struct snd_soc_dai_link *dai_link;
+	struct midas_priv *priv;
+	int ret, i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	snd_soc_card_set_drvdata(card, priv);
+	card->dev = dev;
+
+	priv->reg_mic_bias = devm_regulator_get(dev, "mic-bias");
+	if (IS_ERR(priv->reg_mic_bias)) {
+		dev_err(dev, "Failed to get mic bias regulator\n");
+		return PTR_ERR(priv->reg_mic_bias);
+	}
+
+	priv->reg_submic_bias = devm_regulator_get(dev, "submic-bias");
+	if (IS_ERR(priv->reg_submic_bias)) {
+		dev_err(dev, "Failed to get submic bias regulator\n");
+		return PTR_ERR(priv->reg_submic_bias);
+	}
+
+	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpio_fm_sel)) {
+		dev_err(dev, "Failed to get FM selection GPIO\n");
+		return PTR_ERR(priv->gpio_fm_sel);
+	}
+
+	priv->gpio_lineout_sel = devm_gpiod_get_optional(dev, "lineout-sel",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpio_lineout_sel)) {
+		dev_err(dev, "Failed to get line out selection GPIO\n");
+		return PTR_ERR(priv->gpio_lineout_sel);
+	}
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret < 0) {
+		dev_err(dev, "Card name is not specified\n");
+		return ret;
+	}
+
+	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	if (ret < 0) {
+		dev_err(dev, "Audio routing invalid/unspecified\n");
+		return ret;
+	}
+
+	cpu = of_get_child_by_name(dev->of_node, "cpu");
+	if (!cpu)
+		return -EINVAL;
+
+	codec = of_get_child_by_name(dev->of_node, "codec");
+	if (!codec) {
+		of_node_put(cpu);
+		return -EINVAL;
+	}
+
+	cpu_dai_node = of_parse_phandle(cpu, "sound-dai", 0);
+	of_node_put(cpu);
+	if (!cpu_dai_node) {
+		dev_err(dev, "parsing cpu/sound-dai failed\n");
+		of_node_put(codec);
+		return -EINVAL;
+	}
+
+	codec_dai_node = of_parse_phandle(codec, "sound-dai", 0);
+	of_node_put(codec);
+	if (!codec_dai_node) {
+		dev_err(dev, "audio-codec property invalid/missing\n");
+		ret = -EINVAL;
+		goto put_cpu_dai_node;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		dai_link->codecs->of_node = codec_dai_node;
+		dai_link->cpus->of_node = cpu_dai_node;
+		dai_link->platforms->of_node = cpu_dai_node;
+	}
+
+	ret = devm_snd_soc_register_component(dev, &midas_component,
+			midas_ext_dai, ARRAY_SIZE(midas_ext_dai));
+	if (ret < 0) {
+		dev_err(dev, "Failed to register component: %d\n", ret);
+		goto put_codec_dai_node;
+	}
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register card: %d\n", ret);
+		goto put_codec_dai_node;
+	}
+
+	return 0;
+
+put_codec_dai_node:
+	of_node_put(codec_dai_node);
+put_cpu_dai_node:
+	of_node_put(cpu_dai_node);
+	return ret;
+}
+
+static const struct of_device_id midas_of_match[] = {
+	{ .compatible = "samsung,midas-audio" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, midas_of_match);
+
+static struct platform_driver midas_driver = {
+	.driver = {
+		.name = "midas-audio",
+		.of_match_table = midas_of_match,
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = midas_probe,
+};
+module_platform_driver(midas_driver);
+
+MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
+MODULE_DESCRIPTION("ASoC support for Midas");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

