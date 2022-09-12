Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C35B54B5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 08:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A9116BF;
	Mon, 12 Sep 2022 08:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A9116BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662965273;
	bh=is+h/e36XsHU72nHm9Va5nR2BfILpqbPemIg331QRPw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NttO3mo05w51u4bIu5J514d1ar51Q+hKRcWY/U/nGokyw1W4bifca/noII2RlHGvF
	 /CER9e6ERwYkE0qaksjrg9+VrB77pqSa3RJ8a52IxWUVeEz6PZcciOTbb+QnJrP7WB
	 YKnHIumaabsfgJi/ziRnejZOE04xdwtKR8/LsKBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 130E8F8030F;
	Mon, 12 Sep 2022 08:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54BA2F8027B; Mon, 12 Sep 2022 08:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52539F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 08:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52539F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F+Nio2aw"
Received: by mail-pj1-x1035.google.com with SMTP id go6so2869634pjb.2
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=j4PjTccEHYjDAuf3hVA7eWXv6Iz54soeMzMlWCGF0To=;
 b=F+Nio2awuO+Cikv2ptj7D0EiPaHp7+2G8sp4ODZCuoCaBVdULE9EIdE0fXxZTtMOyv
 VTEbrbOM4jPLTN3pf6STQx/kjQumyOmZiigdj1pwSPadH3lw4o+R+8kflycvOV9Sndn8
 cj70o74Ysqpn427lYBRZy3Og4cIsG1rW5Ro1boQ/M4niHCvPllkV21tugCxj7OuY76MM
 VJ94jTW0rUvMQYyA2OosHVb9+/cSYxuD3UqRbUTeOkTx1AxTlAjT4t3p+tHA5P/I6PKw
 f/lyIMEODt+duz2xucHhSOHBtKQJQIM/dzT/2ztBkZwCnnZgSoGr3qlq5jaO/YXOfP/7
 Yjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=j4PjTccEHYjDAuf3hVA7eWXv6Iz54soeMzMlWCGF0To=;
 b=lMBE6eU/Qg8FNwf75IZjW+lw4C65QvawO8RbUbliJDYyo3/ZPK34hdXRAMpj1wbPBt
 ksKItg9Bcsd7/EDjZowgrMZOwzcGKNPminYxTzBpDXoEyKkHE2obZaFjFfUZ/Ipm8OH9
 0QBlr84eg1BAqaJMdcFPabcwetaQ/wfHCGKlfj2OJVaJ1lVCIqyZyFVSP4buME7aISJz
 59TrU2gXmy8edgEqUGQ9VneQOnZEgJDk0Rn48M/OYfy+tWy7kh5yEw58ILCKCS2JZ3Gt
 HkN1q1r8nDfaI6cULg8qX0Fwne6kHwc8xqHI9FKn0gfCjCGDmrwrvOEctSM4sjsAbRQl
 irgw==
X-Gm-Message-State: ACgBeo0ZoF7ijmBq9xMPbO5rXJ/igrjaG93Hka8OiD/8n/r/89/AMX2d
 OTMd8CXe/QkpJThoRChRZg==
X-Google-Smtp-Source: AA6agR7w4e1ZQ953H7iXYAVe9XFnfJKALiZH/QVbFS6KNIW09oP5iQi/un0KgCoU4C7vt58nHLXxYg==
X-Received: by 2002:a17:902:cec8:b0:178:1b77:5afe with SMTP id
 d8-20020a170902cec800b001781b775afemr10077240plg.63.1662965201656; 
 Sun, 11 Sep 2022 23:46:41 -0700 (PDT)
Received: from localhost.localdomain ([113.110.235.160])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a170902710200b00172f4835f60sm5025954pll.189.2022.09.11.23.46.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Sep 2022 23:46:40 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 fengzheng923@gmail.com
Subject: [PATCH v10 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Date: Sun, 11 Sep 2022 23:45:33 -0700
Message-Id: <1662965133-9232-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

The Allwinner H6 and later SoCs have an DMIC block
which is capable of capture.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Tested-by: Samuel Holland <samuel@sholland.org>
---
v1->v2:
1.Fix some compilation errors.
2.Modify some code styles.

v2->v3:
None.

v3->v4:
1.add sig_bits.

v4->v5:
None.

v5->v6:
1.Modify RXFIFO_CTL_MODE to mode 1.

v6->v7:
1.Modify dmic_rate_s to be a global variable.
2.Changed some macro names to make more sense.
3.Align code format.
4.Add a depends on PM to Kconfig entry.

v7->v8:
None.

v8->v9:
1.Modified Kconfig.
2.Added a comment.

v9->v10:
None.
---
 MAINTAINERS                   |   7 +
 sound/soc/sunxi/Kconfig       |   7 +
 sound/soc/sunxi/Makefile      |   1 +
 sound/soc/sunxi/sun50i-dmic.c | 406 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 421 insertions(+)
 create mode 100644 sound/soc/sunxi/sun50i-dmic.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e9d5b05..839f625 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -796,6 +796,13 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/sunxi/cedrus/
 
+ALLWINNER DMIC DRIVERS
+M:	Ban Tao <fengzheng923@gmail.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
+F:	sound/soc/sunxi/sun50i-dmic.c
+
 ALPHA PORT
 M:	Richard Henderson <rth@twiddle.net>
 M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index ddcaaa9..1f18f01 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -56,6 +56,13 @@ config SND_SUN4I_SPDIF
 	  Say Y or M to add support for the S/PDIF audio block in the Allwinner
 	  A10 and affiliated SoCs.
 
+config SND_SUN50I_DMIC
+	tristate "Allwinner H6 DMIC Support"
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y or M to add support for the DMIC audio block in the Allwinner
+	  H6 and affiliated SoCs.
+
 config SND_SUN8I_ADDA_PR_REGMAP
 	tristate
 	select REGMAP
diff --git a/sound/soc/sunxi/Makefile b/sound/soc/sunxi/Makefile
index a86be34..4483fe9 100644
--- a/sound/soc/sunxi/Makefile
+++ b/sound/soc/sunxi/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_SND_SUN8I_CODEC_ANALOG) += sun8i-codec-analog.o
 obj-$(CONFIG_SND_SUN50I_CODEC_ANALOG) += sun50i-codec-analog.o
 obj-$(CONFIG_SND_SUN8I_CODEC) += sun8i-codec.o
 obj-$(CONFIG_SND_SUN8I_ADDA_PR_REGMAP) += sun8i-adda-pr-regmap.o
+obj-$(CONFIG_SND_SUN50I_DMIC) += sun50i-dmic.o
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
new file mode 100644
index 0000000..cd3c07f
--- /dev/null
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// This driver supports the DMIC in Allwinner's H6 SoCs.
+//
+// Copyright 2021 Ban Tao <fengzheng923@gmail.com>
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#define SUN50I_DMIC_EN_CTL			(0x00)
+	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
+	#define SUN50I_DMIC_EN_CTL_CHAN(v)			((v) << 0)
+	#define SUN50I_DMIC_EN_CTL_CHAN_MASK			GENMASK(7, 0)
+#define SUN50I_DMIC_SR				(0x04)
+	#define SUN50I_DMIC_SR_SAMPLE_RATE(v)			((v) << 0)
+	#define SUN50I_DMIC_SR_SAMPLE_RATE_MASK			GENMASK(2, 0)
+#define SUN50I_DMIC_CTL				(0x08)
+	#define SUN50I_DMIC_CTL_OVERSAMPLE_RATE			BIT(0)
+#define SUN50I_DMIC_DATA			(0x10)
+#define SUN50I_DMIC_INTC			(0x14)
+	#define SUN50I_DMIC_FIFO_DRQ_EN				BIT(2)
+#define SUN50I_DMIC_INT_STA			(0x18)
+	#define SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING		BIT(1)
+	#define SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING		BIT(0)
+#define SUN50I_DMIC_RXFIFO_CTL			(0x1c)
+	#define SUN50I_DMIC_RXFIFO_CTL_FLUSH			BIT(31)
+	#define SUN50I_DMIC_RXFIFO_CTL_MODE_MASK		BIT(9)
+	#define SUN50I_DMIC_RXFIFO_CTL_MODE_LSB			(0 << 9)
+	#define SUN50I_DMIC_RXFIFO_CTL_MODE_MSB			(1 << 9)
+	#define SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK		BIT(8)
+	#define SUN50I_DMIC_RXFIFO_CTL_SAMPLE_16		(0 << 8)
+	#define SUN50I_DMIC_RXFIFO_CTL_SAMPLE_24		(1 << 8)
+#define SUN50I_DMIC_CH_NUM			(0x24)
+	#define SUN50I_DMIC_CH_NUM_N(v)				((v) << 0)
+	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
+#define SUN50I_DMIC_CNT				(0x2c)
+	#define SUN50I_DMIC_CNT_N				(1 << 0)
+#define SUN50I_DMIC_HPF_CTRL			(0x38)
+#define SUN50I_DMIC_VERSION			(0x50)
+
+struct sun50i_dmic_dev {
+	struct clk *dmic_clk;
+	struct clk *bus_clk;
+	struct reset_control *rst;
+	struct regmap *regmap;
+	struct snd_dmaengine_dai_dma_data dma_params_rx;
+};
+
+struct dmic_rate {
+	unsigned int samplerate;
+	unsigned int rate_bit;
+};
+
+const static struct dmic_rate dmic_rate_s[] = {
+	{48000, 0x0},
+	{44100, 0x0},
+	{32000, 0x1},
+	{24000, 0x2},
+	{22050, 0x2},
+	{16000, 0x3},
+	{12000, 0x4},
+	{11025, 0x4},
+	{8000,  0x5},
+};
+
+static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *cpu_dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+
+	/* only support capture */
+	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+		return -EINVAL;
+
+	regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
+			SUN50I_DMIC_RXFIFO_CTL_FLUSH,
+			SUN50I_DMIC_RXFIFO_CTL_FLUSH);
+	regmap_write(host->regmap, SUN50I_DMIC_CNT, SUN50I_DMIC_CNT_N);
+
+	return 0;
+}
+
+static int sun50i_dmic_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *cpu_dai)
+{
+	int i = 0;
+	unsigned long rate = params_rate(params);
+	unsigned int mclk = 0;
+	unsigned int channels = params_channels(params);
+	unsigned int chan_en = (1 << channels) - 1;
+	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* DMIC num is N+1 */
+	regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
+			   SUN50I_DMIC_CH_NUM_N_MASK,
+			   SUN50I_DMIC_CH_NUM_N(channels - 1));
+	regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, chan_en);
+	regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
+			   SUN50I_DMIC_EN_CTL_CHAN_MASK,
+			   SUN50I_DMIC_EN_CTL_CHAN(chan_en));
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
+				   SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK,
+				   SUN50I_DMIC_RXFIFO_CTL_SAMPLE_16);
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
+				   SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK,
+				   SUN50I_DMIC_RXFIFO_CTL_SAMPLE_24);
+		break;
+	default:
+		dev_err(cpu_dai->dev, "Invalid format!\n");
+		return -EINVAL;
+	}
+	/* The hardware supports FIFO mode 1 for 24-bit samples */
+	regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
+			   SUN50I_DMIC_RXFIFO_CTL_MODE_MASK,
+			   SUN50I_DMIC_RXFIFO_CTL_MODE_MSB);
+
+	switch (rate) {
+	case 11025:
+	case 22050:
+	case 44100:
+		mclk = 22579200;
+		break;
+	case 8000:
+	case 12000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+		mclk = 24576000;
+		break;
+	default:
+		dev_err(cpu_dai->dev, "Invalid rate!\n");
+		return -EINVAL;
+	}
+
+	if (clk_set_rate(host->dmic_clk, mclk)) {
+		dev_err(cpu_dai->dev, "mclk : %u not support\n", mclk);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dmic_rate_s); i++) {
+		if (dmic_rate_s[i].samplerate == rate) {
+			regmap_update_bits(host->regmap, SUN50I_DMIC_SR,
+					   SUN50I_DMIC_SR_SAMPLE_RATE_MASK,
+					   SUN50I_DMIC_SR_SAMPLE_RATE(dmic_rate_s[i].rate_bit));
+			break;
+		}
+	}
+
+	switch (params_physical_width(params)) {
+	case 16:
+		host->dma_params_rx.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 32:
+		host->dma_params_rx.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	default:
+		dev_err(cpu_dai->dev, "Unsupported physical sample width: %d\n",
+			params_physical_width(params));
+		return -EINVAL;
+	}
+
+	/* oversamplerate adjust */
+	if (params_rate(params) >= 24000)
+		regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
+				   SUN50I_DMIC_CTL_OVERSAMPLE_RATE,
+				   SUN50I_DMIC_CTL_OVERSAMPLE_RATE);
+	else
+		regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
+				   SUN50I_DMIC_CTL_OVERSAMPLE_RATE, 0);
+
+	return 0;
+}
+
+static int sun50i_dmic_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *dai)
+{
+	int ret = 0;
+	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
+
+	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+		return -EINVAL;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* DRQ ENABLE */
+		regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
+				   SUN50I_DMIC_FIFO_DRQ_EN,
+				   SUN50I_DMIC_FIFO_DRQ_EN);
+		/* Global enable */
+		regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
+				   SUN50I_DMIC_EN_CTL_GLOBE,
+				   SUN50I_DMIC_EN_CTL_GLOBE);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/* DRQ DISABLE */
+		regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
+				   SUN50I_DMIC_FIFO_DRQ_EN, 0);
+		/* Global disable */
+		regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
+				   SUN50I_DMIC_EN_CTL_GLOBE, 0);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai *dai)
+{
+	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, NULL, &host->dma_params_rx);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops sun50i_dmic_dai_ops = {
+	.startup        = sun50i_dmic_startup,
+	.trigger        = sun50i_dmic_trigger,
+	.hw_params      = sun50i_dmic_hw_params,
+};
+
+static const struct regmap_config sun50i_dmic_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = SUN50I_DMIC_VERSION,
+	.cache_type = REGCACHE_NONE,
+};
+
+#define SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000)
+#define SUN50I_DMIC_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+static struct snd_soc_dai_driver sun50i_dmic_dai = {
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+		.rates = SUN50I_DMIC_RATES,
+		.formats = SUN50I_DMIC_FORMATS,
+		.sig_bits = 21,
+	},
+	.probe = sun50i_dmic_soc_dai_probe,
+	.ops = &sun50i_dmic_dai_ops,
+	.name = "dmic",
+};
+
+static const struct of_device_id sun50i_dmic_of_match[] = {
+	{
+		.compatible = "allwinner,sun50i-h6-dmic",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
+
+static const struct snd_soc_component_driver sun50i_dmic_component = {
+	.name           = "sun50i-dmic",
+};
+
+static int sun50i_dmic_runtime_suspend(struct device *dev)
+{
+	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(host->dmic_clk);
+	clk_disable_unprepare(host->bus_clk);
+
+	return 0;
+}
+
+static int sun50i_dmic_runtime_resume(struct device *dev)
+{
+	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(host->dmic_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(host->bus_clk);
+	if (ret) {
+		clk_disable_unprepare(host->dmic_clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sun50i_dmic_probe(struct platform_device *pdev)
+{
+	struct sun50i_dmic_dev *host;
+	struct resource *res;
+	int ret;
+	void __iomem *base;
+
+	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	/* Get the addresses */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(base),
+				     "get resource failed.\n");
+
+	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     &sun50i_dmic_regmap_config);
+
+	/* Clocks */
+	host->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	if (IS_ERR(host->bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->bus_clk),
+				     "failed to get bus clock.\n");
+
+	host->dmic_clk = devm_clk_get(&pdev->dev, "mod");
+	if (IS_ERR(host->dmic_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->dmic_clk),
+				     "failed to get dmic clock.\n");
+
+	host->dma_params_rx.addr = res->start + SUN50I_DMIC_DATA;
+	host->dma_params_rx.maxburst = 8;
+
+	platform_set_drvdata(pdev, host);
+
+	host->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(host->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
+				     "Failed to get reset.\n");
+	reset_control_deassert(host->rst);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &sun50i_dmic_component,
+					      &sun50i_dmic_dai, 1);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register component.\n");
+
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = sun50i_dmic_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_disable_runtime_pm;
+	}
+
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret)
+		goto err_suspend;
+
+	return 0;
+err_suspend:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		sun50i_dmic_runtime_suspend(&pdev->dev);
+err_disable_runtime_pm:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int sun50i_dmic_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		sun50i_dmic_runtime_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops sun50i_dmic_pm = {
+	SET_RUNTIME_PM_OPS(sun50i_dmic_runtime_suspend,
+			   sun50i_dmic_runtime_resume, NULL)
+};
+
+static struct platform_driver sun50i_dmic_driver = {
+	.driver         = {
+		.name   = "sun50i-dmic",
+		.of_match_table = of_match_ptr(sun50i_dmic_of_match),
+		.pm     = &sun50i_dmic_pm,
+	},
+	.probe          = sun50i_dmic_probe,
+	.remove         = sun50i_dmic_remove,
+};
+
+module_platform_driver(sun50i_dmic_driver);
+
+MODULE_DESCRIPTION("Allwinner sun50i DMIC SoC Interface");
+MODULE_AUTHOR("Ban Tao <fengzheng923@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:sun50i-dmic");
-- 
2.7.4

