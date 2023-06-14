Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 790637311EA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 10:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5006A826;
	Thu, 15 Jun 2023 10:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5006A826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686817061;
	bh=axH0LvZwRTBUgu7/CgKMvQpRQZPd76/uynpASqdcyXc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nvcKU2XoONUczA/Ebw3QDOCP6P0kN5JxEE6RGaRCCz5pp/spgfosIvM8LoT9MugRy
	 Rb5tIFguIn7l0xjaF9J4Sl9jjR18b8viGbL4t9r8tyQ3bwiW1htQchypm/2d+ZHiqg
	 mw1JHzQmmbjzYMfMQzhUf7APnMYXKnXw9VOj0ZlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E938F8052E; Thu, 15 Jun 2023 10:16:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB5EF80130;
	Thu, 15 Jun 2023 10:16:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C7CF80246; Wed, 14 Jun 2023 14:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 09307F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 14:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09307F800BA
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8Ax3eoSsYlkrCAFAA--.10886S3;
	Wed, 14 Jun 2023 20:22:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXMoSsYlkWZkaAA--.1762S4;
	Wed, 14 Jun 2023 20:22:42 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	mengyingkun@loongson.cn
Subject: [PATCH v3 2/3] ASoC: loongson: Add Loongson ASoC Sound Card Support
Date: Wed, 14 Jun 2023 20:22:40 +0800
Message-Id: <20230614122240.3402762-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXMoSsYlkWZkaAA--.1762S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQACDGSIXIIYSwANsj
X-Coremail-Antispam: 1Uk129KBj93XoW3Ww1DCr4DJw47Zw4fXryfXwc_yoWfAr4xpa
	nxZay5KrWrJr4fCr1FqrWrAF1ak34xuFnrXay7Gw1xKr9rA3s5WwnrGF1UZF4fAr98KayU
	XFW8GFW8KFyDGacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HSBSAAFJDGDHGJ2FNKCS3TQSXCNUM3QH
X-Message-ID-Hash: HSBSAAFJDGDHGJ2FNKCS3TQSXCNUM3QH
X-Mailman-Approved-At: Thu, 15 Jun 2023 08:14:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSBSAAFJDGDHGJ2FNKCS3TQSXCNUM3QH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yingkun Meng <mengyingkun@loongson.cn>

The Loongson ASoC Sound Card is a general ASoC DAI Link driver that
can be used for Loongson CPU DAI drivers and external CODECs.

The driver supports the use of ACPI table to describe device resources.
On loongson 7axxx platforms, the audio device is an ACPI device.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 sound/soc/loongson/Kconfig         |  10 ++
 sound/soc/loongson/Makefile        |   4 +
 sound/soc/loongson/loongson_card.c | 230 +++++++++++++++++++++++++++++
 3 files changed, 244 insertions(+)
 create mode 100644 sound/soc/loongson/loongson_card.c

diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
index 4478ac91e402..c175f9de19a8 100644
--- a/sound/soc/loongson/Kconfig
+++ b/sound/soc/loongson/Kconfig
@@ -13,4 +13,14 @@ config SND_SOC_LOONGSON_I2S_PCI
 	  The controller is found in loongson bridge chips or SoCs,
 	  and work as a PCI device.
 
+config SND_SOC_LOONGSON_CARD
+	tristate "Loongson Sound Card Driver"
+	select SND_SOC_LOONGSON_I2S_PCI
+	help
+	  Say Y or M if you want to add support for SoC audio using
+	  loongson I2S controller.
+
+	  The driver add support for ALSA SoC Audio support using
+	  loongson I2S controller.
+
 endmenu
diff --git a/sound/soc/loongson/Makefile b/sound/soc/loongson/Makefile
index 099af7989103..601a905a4860 100644
--- a/sound/soc/loongson/Makefile
+++ b/sound/soc/loongson/Makefile
@@ -2,3 +2,7 @@
 #Platform Support
 snd-soc-loongson-i2s-pci-objs := loongson_i2s_pci.o loongson_i2s.o loongson_dma.o
 obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PCI) += snd-soc-loongson-i2s-pci.o
+
+#Machine Support
+snd-soc-loongson-card-objs := loongson_card.o
+obj-$(CONFIG_SND_SOC_LOONGSON_CARD) += snd-soc-loongson-card.o
diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
new file mode 100644
index 000000000000..965eaf4e9109
--- /dev/null
+++ b/sound/soc/loongson/loongson_card.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Loongson ASoC Audio Machine driver
+//
+// Copyright (C) 2023 Loongson Technology Corporation Limited
+// Author: Yingkun Meng <mengyingkun@loongson.cn>
+//
+
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include <sound/pcm_params.h>
+
+static char codec_name[SND_ACPI_I2C_ID_LEN];
+
+struct loongson_card_data {
+	struct snd_soc_card snd_card;
+	unsigned int mclk_fs;
+};
+
+static int loongson_card_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct loongson_card_data *ls_card = snd_soc_card_get_drvdata(rtd->card);
+	int ret, mclk;
+
+	if (ls_card->mclk_fs) {
+		mclk = ls_card->mclk_fs * params_rate(params);
+		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
+					     SND_SOC_CLOCK_OUT);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "cpu_dai clock not set\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static const struct snd_soc_ops loongson_ops = {
+	.hw_params = loongson_card_hw_params,
+};
+
+SND_SOC_DAILINK_DEFS(analog,
+	DAILINK_COMP_ARRAY(COMP_CPU("loongson-i2s")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link loongson_dai_links[] = {
+	{
+		.name = "Loongson Audio Port",
+		.stream_name = "Loongson Audio",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
+			| SND_SOC_DAIFMT_CBC_CFC,
+		SND_SOC_DAILINK_REG(analog),
+		.ops = &loongson_ops,
+	},
+};
+
+static int loongson_card_parse_acpi(struct loongson_card_data *data)
+{
+	struct snd_soc_card *card = &data->snd_card;
+	struct fwnode_handle *fwnode = card->dev->fwnode;
+	struct fwnode_reference_args args;
+	const char *codec_dai_name;
+	struct acpi_device *adev;
+	struct device *phy_dev;
+	int ret, i;
+
+	/* fixup platform name based on reference node */
+	memset(&args, 0, sizeof(args));
+	ret = acpi_node_get_property_reference(fwnode, "cpu", 0, &args);
+	if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
+		dev_err(card->dev, "No matching phy in ACPI table\n");
+		return ret;
+	}
+	adev = to_acpi_device_node(args.fwnode);
+	phy_dev = acpi_get_first_physical_node(adev);
+	if (!phy_dev)
+		return -EPROBE_DEFER;
+	for (i = 0; i < card->num_links; i++)
+		loongson_dai_links[i].platforms->name = dev_name(phy_dev);
+
+	/* fixup codec name based on reference node */
+	memset(&args, 0, sizeof(args));
+	ret = acpi_node_get_property_reference(fwnode, "codec", 0, &args);
+	if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
+		dev_err(card->dev, "No matching phy in ACPI table\n");
+		return ret;
+	}
+	adev = to_acpi_device_node(args.fwnode);
+	snprintf(codec_name, sizeof(codec_name), "i2c-%s", acpi_dev_name(adev));
+	for (i = 0; i < card->num_links; i++)
+		loongson_dai_links[i].codecs->name = codec_name;
+
+	device_property_read_string(card->dev, "codec-dai-name",
+				    &codec_dai_name);
+	for (i = 0; i < card->num_links; i++)
+		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
+
+	return 0;
+}
+
+static int loongson_card_parse_of(struct loongson_card_data *data)
+{
+	const char *cpu_dai_name, *codec_dai_name;
+	struct device_node *cpu, *codec;
+	struct snd_soc_card *card = &data->snd_card;
+	struct device *dev = card->dev;
+	struct of_phandle_args args;
+	int ret, i;
+
+	cpu = of_get_child_by_name(dev->of_node, "cpu");
+	if (!cpu) {
+		dev_err(dev, "platform property missing or invalid\n");
+		return -EINVAL;
+	}
+	codec = of_get_child_by_name(dev->of_node, "codec");
+	if (!codec) {
+		dev_err(dev, "audio-codec property missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = of_parse_phandle_with_args(cpu, "sound-dai",
+					 "#sound-dai-cells", 0, &args);
+	if (ret) {
+		dev_err(dev, "codec node missing #sound-dai-cells\n");
+		goto err;
+	}
+	for (i = 0; i < card->num_links; i++)
+		loongson_dai_links[i].cpus->of_node = args.np;
+
+	ret = of_parse_phandle_with_args(codec, "sound-dai",
+					 "#sound-dai-cells", 0, &args);
+	if (ret) {
+		dev_err(dev, "codec node missing #sound-dai-cells\n");
+		goto err;
+	}
+	for (i = 0; i < card->num_links; i++)
+		loongson_dai_links[i].codecs->of_node = args.np;
+
+	snd_soc_of_get_dai_name(cpu, &cpu_dai_name);
+	snd_soc_of_get_dai_name(codec, &codec_dai_name);
+	for (i = 0; i < card->num_links; i++) {
+		loongson_dai_links[i].cpus->dai_name = cpu_dai_name;
+		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
+	}
+	of_node_put(cpu);
+	of_node_put(codec);
+
+	return 0;
+
+err:
+	of_node_put(cpu);
+	of_node_put(codec);
+	return ret;
+}
+
+static int loongson_asoc_card_probe(struct platform_device *pdev)
+{
+	struct loongson_card_data *ls_priv;
+	struct snd_soc_card *card;
+	int ret;
+
+	ls_priv = devm_kzalloc(&pdev->dev, sizeof(*ls_priv), GFP_KERNEL);
+	if (!ls_priv)
+		return -ENOMEM;
+
+	card = &ls_priv->snd_card;
+
+	card->dev = &pdev->dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = loongson_dai_links;
+	card->num_links = ARRAY_SIZE(loongson_dai_links);
+	snd_soc_card_set_drvdata(card, ls_priv);
+
+	ret = device_property_read_string(&pdev->dev, "model", &card->name);
+	if (ret) {
+		dev_err(&pdev->dev, "Error parsing card name: %d\n", ret);
+		return ret;
+	}
+	ret = device_property_read_u32(&pdev->dev, "mclk-fs", &ls_priv->mclk_fs);
+	if (ret) {
+		dev_err(&pdev->dev, "Error parsing mclk-fs: %d\n", ret);
+		return ret;
+	}
+
+	if (has_acpi_companion(&pdev->dev))
+		ret = loongson_card_parse_acpi(ls_priv);
+	else
+		ret = loongson_card_parse_of(ls_priv);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	return ret;
+}
+
+static const struct of_device_id loongson_asoc_dt_ids[] = {
+	{ .compatible = "loongson,ls-audio-card" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, loongson_asoc_dt_ids);
+
+static struct platform_driver loongson_audio_driver = {
+	.probe = loongson_asoc_card_probe,
+	.driver = {
+		.name = "loongson-asoc-card",
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = of_match_ptr(loongson_asoc_dt_ids),
+	},
+};
+module_platform_driver(loongson_audio_driver);
+
+MODULE_DESCRIPTION("Loongson ASoc Sound Card driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");
-- 
2.33.0

