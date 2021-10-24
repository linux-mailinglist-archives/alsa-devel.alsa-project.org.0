Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797343AC2C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 080281663;
	Tue, 26 Oct 2021 08:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 080281663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229023;
	bh=5o6DkShOj5aDh2Hf0DxmaBLkuCWF+TBjn49gF/sSX8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXhUJPkdoFrEkvGNHQQAVVTbweyhGnf1i5Y224diy6an26/iEP2J+Onh5BM4COdAz
	 +Lgfyn1ELk4/RpvEXNe2xL/l4qqahbKNXdAfiOzSH7PD7fpkvkBAq80/MTPcdyRZG3
	 3Ncpo+RRV/7mCJ4og7O8Lifm6Czn4sZiYYYL5Kv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D372F804E5;
	Tue, 26 Oct 2021 08:14:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB6CF802E7; Sun, 24 Oct 2021 11:43:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC773F80086
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 11:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC773F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HdMTDbum"
Received: by mail-pj1-x1041.google.com with SMTP id oa4so6018431pjb.2
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+R4gQ3wq8fmAnU+S4wsPz6JXpiQ2tC9FMl3CAdZ4npo=;
 b=HdMTDbumEho3NPLGw0oonIorsjC0PVW5v4EyHVf4WZvrckWyV7CEb18WrmZeyVIbbK
 uV8jK14Hucgw5/g54tm5YMiepetYC0m5/rQcDTYcthsdPSjOlTKi17b6C+Bh2c2g3lzX
 LyqI8JspIig7LyIYXPsmQC8itMF+j5580uxfm1F7v16DjVRxlr34N5NCA6lET6+9j9MB
 2LR+fU9ZRQWfUR9HJRdKPy4Dwoegh7o2bKA5s96ivHJLw1xWoI/4ghv2C9MnVWC2aAJ6
 My1pT7Mrqt48YGnu8l5l2bYKITwWcX2vxACwVqWhSONXZQiwc+lBb9ZlLTnGPmOnIxJM
 aCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+R4gQ3wq8fmAnU+S4wsPz6JXpiQ2tC9FMl3CAdZ4npo=;
 b=CbBFGMJHuFaJ+wVNGOPJ+XUyg3UZk2zxE65lKMW2iL0s4SC5d5KHmXhETss5jNwgFz
 3iTGRkKHarpnNBJ4dFHXbvVKevAuP8BRycETBLyHAqwzBY2vkQ/JtKzjV9eGEaMZH1Jz
 0qeEeaj+dX/iQ0PBbpOgwa5WAr4jWddVtm378upxeAKMpqOWrRiqq+c3RIskpfvy1Ko8
 AVQVpf9EruOOvpEeLjE24mOYYSwwYy/69EKhNAeHvm2FTvfdw1ZcQfRv9GQmHQS9LVnY
 SqLFNNzykQ4en85L3w976gYNp7vMnjj0HuCVekZLpKeqlyWRe512c6QXQxTZPQTp5sVf
 fU2A==
X-Gm-Message-State: AOAM530DN7H9ZVpCxRd/CldAj5BSGW+tsXZeSplW4Kn63iFyX9q12KKH
 G40aGK02EOq6mb75N3xjDec=
X-Google-Smtp-Source: ABdhPJwawc1x2vm1d6sp21l36h8s/1tz2ouvC5Rw1w8b8J2FUvLH9kym3znsQIatSCR+MvAxuWJyAQ==
X-Received: by 2002:a17:90a:de98:: with SMTP id
 n24mr3611418pjv.204.1635068616096; 
 Sun, 24 Oct 2021 02:43:36 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
 by smtp.gmail.com with ESMTPSA id p16sm17636619pfh.97.2021.10.24.02.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 02:43:35 -0700 (PDT)
From: Yunhao Tian <t123yh.xyz@gmail.com>
X-Google-Original-From: Yunhao Tian <t123yh@outlook.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: rockchip: add support for spdifrx receiver
Date: Sun, 24 Oct 2021 17:43:15 +0800
Message-Id: <20211024094317.1641949-2-t123yh@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024094317.1641949-1-t123yh@outlook.com>
References: <20211024094317.1641949-1-t123yh@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yunhao Tian <t123yh.xyz@gmail.com>, linux-arm-kernel@lists.infradead.org
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

From: Yunhao Tian <t123yh.xyz@gmail.com>

This commit adds support for the rockchip S/PDIF receiver,
which enables receiving S/PDIF or TOSLINK on RK3308.

This is a cleaned up version of the downstream vendor kernel's
driver. Several ALSA controls, such as sync status indication,
sample rate detection and channel status bits are added and tested.
This driver can be enabled through the SND_SOC_ROCKCHIP_SPDIFRX
configuration option.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 MAINTAINERS                           |   6 +
 sound/soc/rockchip/Kconfig            |   8 +
 sound/soc/rockchip/Makefile           |   2 +
 sound/soc/rockchip/rockchip_spdifrx.c | 660 ++++++++++++++++++++++++++
 sound/soc/rockchip/rockchip_spdifrx.h |  90 ++++
 5 files changed, 766 insertions(+)
 create mode 100644 sound/soc/rockchip/rockchip_spdifrx.c
 create mode 100644 sound/soc/rockchip/rockchip_spdifrx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d7b4f32875a9..a2bee2166a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15980,6 +15980,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
 F:	drivers/media/platform/rockchip/rga/
 
+ROCKCHIP SPDIFRX DRIVER
+M:	Yunhao Tian <t123yh.xyz@gmail.com>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	sound/soc/rockchip/rockchip_spdifrx.*
+
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@collabora.com>
 L:	linux-media@vger.kernel.org
diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index b8f4b934826e..2a239fb21713 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -43,6 +43,14 @@ config SND_SOC_ROCKCHIP_SPDIF
 	  Say Y or M if you want to add support for SPDIF driver for
 	  Rockchip SPDIF transceiver device.
 
+config SND_SOC_ROCKCHIP_SPDIFRX
+	tristate "Rockchip SPDIFRX Device Driver"
+	depends on HAVE_CLK && SND_SOC_ROCKCHIP
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y or M if you want to add support for SPDIF RX driver for
+	  Rockchip SPDIF receiver device.
+
 config SND_SOC_ROCKCHIP_MAX98090
 	tristate "ASoC support for Rockchip boards using a MAX98090 codec"
 	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
diff --git a/sound/soc/rockchip/Makefile b/sound/soc/rockchip/Makefile
index b10f5e7b136d..48a6b2e2dd91 100644
--- a/sound/soc/rockchip/Makefile
+++ b/sound/soc/rockchip/Makefile
@@ -5,11 +5,13 @@ snd-soc-rockchip-i2s-tdm-objs := rockchip_i2s_tdm.o
 snd-soc-rockchip-pcm-objs := rockchip_pcm.o
 snd-soc-rockchip-pdm-objs := rockchip_pdm.o
 snd-soc-rockchip-spdif-objs := rockchip_spdif.o
+snd-soc-rockchip-spdifrx-objs := rockchip_spdifrx.o
 
 obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) += snd-soc-rockchip-i2s.o snd-soc-rockchip-pcm.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S_TDM) += snd-soc-rockchip-i2s-tdm.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_PDM) += snd-soc-rockchip-pdm.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_SPDIF) += snd-soc-rockchip-spdif.o
+obj-$(CONFIG_SND_SOC_ROCKCHIP_SPDIFRX) += snd-soc-rockchip-spdifrx.o
 
 snd-soc-rockchip-max98090-objs := rockchip_max98090.o
 snd-soc-rockchip-rt5645-objs := rockchip_rt5645.o
diff --git a/sound/soc/rockchip/rockchip_spdifrx.c b/sound/soc/rockchip/rockchip_spdifrx.c
new file mode 100644
index 000000000000..3b8eff051e7f
--- /dev/null
+++ b/sound/soc/rockchip/rockchip_spdifrx.c
@@ -0,0 +1,660 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ALSA SoC Audio Layer - Rockchip SPDIF_RX Controller driver
+ *
+ * Copyright (C) 2018 Fuzhou Rockchip Electronics Co., Ltd
+ *
+ * Copyright (C) 2021 Yunhao Tian <t123yh.xyz@gmail.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/of_gpio.h>
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+
+#include "rockchip_spdifrx.h"
+
+struct rk_spdifrx_dev {
+	struct snd_soc_dai *dai;
+	struct snd_pcm_substream *substream;
+	struct snd_kcontrol *snd_kctl_sync;
+	struct snd_kcontrol *snd_kctl_rate;
+	struct snd_kcontrol *snd_kctl_chstat;
+	struct snd_kcontrol *snd_kctl_chstat_mask;
+	struct snd_kcontrol *snd_kctl_usr;
+	/* Prevent race condition on stream state */
+	spinlock_t irq_lock;
+
+	struct device *dev;
+	struct clk *mclk;
+	struct clk *hclk;
+	struct snd_dmaengine_dai_dma_data capture_dma_data;
+	struct regmap *regmap;
+	struct reset_control *reset;
+	int irq;
+};
+
+static int rk_spdifrx_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	return 0;
+}
+
+static void rk_spdifrx_reset(struct rk_spdifrx_dev *spdifrx)
+{
+	reset_control_assert(spdifrx->reset);
+	udelay(1);
+	reset_control_deassert(spdifrx->reset);
+}
+
+static int rk_spdifrx_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+	unsigned long flags;
+
+	spin_lock_irqsave(&spdifrx->irq_lock, flags);
+	spdifrx->substream = substream;
+	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+
+	return 0;
+}
+
+static void rk_spdifrx_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+	unsigned long flags;
+
+	spin_lock_irqsave(&spdifrx->irq_lock, flags);
+	spdifrx->substream = NULL;
+	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+}
+
+static int rk_spdifrx_trigger(struct snd_pcm_substream *substream, int cmd,
+			      struct snd_soc_dai *dai)
+{
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+	int ret = 0;
+	const unsigned int irqs =
+		SPDIFRX_INT_BMDE | SPDIFRX_INT_RXO | SPDIFRX_INT_PE;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* Reset receiving clock */
+		rk_spdifrx_reset(spdifrx);
+
+		/* Clear interrupts before enabling them */
+		regmap_write(spdifrx->regmap, SPDIFRX_INTCLR, irqs);
+		regmap_update_bits(spdifrx->regmap, SPDIFRX_INTEN, irqs, irqs);
+
+		regmap_update_bits(spdifrx->regmap, SPDIFRX_DMACR,
+				   SPDIFRX_DMACR_RDE_MASK,
+				   SPDIFRX_DMACR_RDE_ENABLE);
+
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		regmap_update_bits(spdifrx->regmap, SPDIFRX_INTEN, irqs, 0);
+
+		regmap_update_bits(spdifrx->regmap, SPDIFRX_DMACR,
+				   SPDIFRX_DMACR_RDE_MASK,
+				   SPDIFRX_DMACR_RDE_DISABLE);
+
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int rk_spdifrx_iec958_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+#define CONTROL_PRIV_IS_USR BIT(0)
+
+static int rk_spdifrx_iec958_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+	int i;
+	unsigned int val;
+	unsigned int addr;
+
+	for (i = 0; i < 12; i++) {
+		addr = (kcontrol->private_value & CONTROL_PRIV_IS_USR) ?
+			       SPDIFRX_USRDR(i) :
+			       SPDIFRX_CHNSR(i);
+		regmap_read(spdifrx->regmap, addr, &val);
+		ucontrol->value.iec958.status[i * 2] = val & 0xFF;
+		ucontrol->value.iec958.status[i * 2 + 1] = (val >> 8) & 0xFF;
+	}
+
+	return 0;
+}
+
+static int rk_spdifrx_iec958_mask_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	memset(ucontrol->value.iec958.status, 0xFF,
+	       sizeof(ucontrol->value.iec958.status));
+
+	return 0;
+}
+
+static int rk_spdifrx_is_sync(const struct rk_spdifrx_dev *spdifrx)
+{
+	u32 val;
+
+	regmap_read(spdifrx->regmap, SPDIFRX_CDR, &val);
+	return (val & SPDIFRX_CDR_CS_MASK) == SPDIFRX_CDR_CS_SYNC;
+}
+
+static const int sample_rates[] = { 32000, 44100,  48000, 88200,
+				    96000, 176400, 192000 };
+static int rk_spdifrx_get_rate(const struct rk_spdifrx_dev *spdifrx)
+{
+	u32 pulse, clk_rate, est_pulse, val;
+	int i;
+
+	regmap_read(spdifrx->regmap, SPDIFRX_CDRST, &val);
+	pulse = val & 0xFF;
+	if (pulse != 0) {
+		clk_rate = clk_get_rate(spdifrx->mclk);
+		for (i = 0; i < ARRAY_SIZE(sample_rates); i++) {
+			est_pulse = DIV_ROUND_CLOSEST(clk_rate,
+						      sample_rates[i] * 128);
+			if (pulse >= est_pulse - 1 && pulse <= est_pulse + 1)
+				return sample_rates[i];
+		}
+	}
+	return 0;
+}
+
+static int rk_spdifrx_rate_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 192000;
+	return 0;
+}
+
+static int rk_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.integer.value[0] = rk_spdifrx_get_rate(spdifrx);
+	return 0;
+}
+
+static int rk_spdifrx_sync_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	return 0;
+}
+
+static int rk_spdifrx_sync_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.integer.value[0] = rk_spdifrx_is_sync(spdifrx);
+	return 0;
+}
+
+static int rk_spdifrx_dai_probe(struct snd_soc_dai *dai)
+{
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+	struct snd_card *card = dai->component->card->snd_card;
+	struct snd_kcontrol_new control;
+	int ret;
+	unsigned long flags;
+	const unsigned int irqs = SPDIFRX_INT_ESYNC | SPDIFRX_INT_NSYNC |
+				  SPDIFRX_INT_UBC | SPDIFRX_INT_CSC;
+
+	rk_spdifrx_reset(spdifrx);
+
+	ret = clk_prepare_enable(spdifrx->mclk);
+	if (ret) {
+		dev_err(spdifrx->dev, "mclk clock enable failed %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(spdifrx->hclk);
+	if (ret) {
+		dev_err(spdifrx->dev, "hclk clock enable failed %d\n", ret);
+		return ret;
+	}
+
+	regmap_write(spdifrx->regmap, SPDIFRX_CLR, SPDIFRX_CLR_RXSC);
+	regmap_update_bits(spdifrx->regmap, SPDIFRX_CDR,
+			   SPDIFRX_CDR_AVGSEL_MASK | SPDIFRX_CDR_BYPASS_MASK,
+			   SPDIFRX_CDR_AVGSEL_AVG | SPDIFRX_CDR_BYPASS_DIS);
+	regmap_update_bits(spdifrx->regmap, SPDIFRX_DMACR,
+			   SPDIFRX_DMACR_RDL_MASK, SPDIFRX_DMACR_RDL(8));
+	dai->capture_dma_data = &spdifrx->capture_dma_data;
+
+	spin_lock_irqsave(&spdifrx->irq_lock, flags);
+
+	/* the access property of controls don't have to
+	 * be volatile, as it will be notified by interrupt handler
+	 */
+	spdifrx->dai = dai;
+	control = (struct snd_kcontrol_new){
+		/* Sample Rate Control */
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE) "Rate",
+		/* access don't have to be volatile, as it will be notified by intr */
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = rk_spdifrx_rate_info,
+		.get = rk_spdifrx_rate_get,
+	};
+	spdifrx->snd_kctl_rate = snd_ctl_new1(&control, dai);
+
+	control = (struct snd_kcontrol_new){
+		/* Sync Control */
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE) "Sync",
+		/* access don't have to be volatile, as it will be notified by intr */
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = rk_spdifrx_sync_info,
+		.get = rk_spdifrx_sync_get,
+	};
+	spdifrx->snd_kctl_sync = snd_ctl_new1(&control, dai);
+
+	control = (struct snd_kcontrol_new){
+		/* Channel Status Bits */
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, DEFAULT),
+		/* access don't have to be volatile, as it will be notified by intr */
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = rk_spdifrx_iec958_info,
+		.get = rk_spdifrx_iec958_get,
+		.private_value = 0
+	};
+	spdifrx->snd_kctl_chstat = snd_ctl_new1(&control, dai);
+
+	control = (struct snd_kcontrol_new){
+		/* User Bits */
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE) "User Bit",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = rk_spdifrx_iec958_info,
+		.get = rk_spdifrx_iec958_get,
+		.private_value = CONTROL_PRIV_IS_USR
+	};
+	spdifrx->snd_kctl_usr = snd_ctl_new1(&control, dai);
+
+	control = (struct snd_kcontrol_new){
+		/* Channel Status Mask */
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, MASK),
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = rk_spdifrx_iec958_info,
+		.get = rk_spdifrx_iec958_mask_get,
+	};
+	spdifrx->snd_kctl_chstat_mask = snd_ctl_new1(&control, dai);
+
+	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+
+	ret = snd_ctl_add(card, spdifrx->snd_kctl_rate);
+	if (ret < 0) {
+		dev_err(spdifrx->dev, "Failed to add rate control: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_ctl_add(card, spdifrx->snd_kctl_sync);
+	if (ret < 0) {
+		dev_err(spdifrx->dev, "Failed to add sync control: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_ctl_add(card, spdifrx->snd_kctl_chstat);
+	if (ret < 0) {
+		dev_err(spdifrx->dev,
+			"Failed to add channel status control: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_ctl_add(card, spdifrx->snd_kctl_chstat_mask);
+	if (ret < 0) {
+		dev_err(spdifrx->dev,
+			"Failed to add channel status mask control: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_ctl_add(card, spdifrx->snd_kctl_usr);
+	if (ret < 0) {
+		dev_err(spdifrx->dev, "Failed to add user bits control: %d\n",
+			ret);
+		return ret;
+	}
+
+	regmap_write(spdifrx->regmap, SPDIFRX_INTEN, irqs);
+
+	regmap_update_bits(spdifrx->regmap, SPDIFRX_CFGR, SPDIFRX_EN_MASK,
+			   SPDIFRX_EN);
+
+	return 0;
+}
+
+static int rk_spdifrx_dai_remove(struct snd_soc_dai *dai)
+{
+	struct rk_spdifrx_dev *spdifrx = snd_soc_dai_get_drvdata(dai);
+
+	/* disable spdif */
+	regmap_update_bits(spdifrx->regmap, SPDIFRX_CFGR, SPDIFRX_EN_MASK,
+			   SPDIFRX_DIS);
+
+	clk_disable_unprepare(spdifrx->hclk);
+	clk_disable_unprepare(spdifrx->mclk);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops rk_spdifrx_dai_ops = {
+	.startup = rk_spdifrx_startup,
+	.hw_params = rk_spdifrx_hw_params,
+	.trigger = rk_spdifrx_trigger,
+	.shutdown = rk_spdifrx_shutdown,
+};
+
+static struct snd_soc_dai_driver rk_spdifrx_dai = {
+	.probe = rk_spdifrx_dai_probe,
+	.remove	= rk_spdifrx_dai_remove,
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = (SNDRV_PCM_RATE_32000 |
+			  SNDRV_PCM_RATE_44100 |
+			  SNDRV_PCM_RATE_48000 |
+			  SNDRV_PCM_RATE_88200 |
+			  SNDRV_PCM_RATE_96000 |
+			  SNDRV_PCM_RATE_176400 |
+			  SNDRV_PCM_RATE_192000),
+		.formats = SNDRV_PCM_FMTBIT_S24_LE,
+	},
+	.ops = &rk_spdifrx_dai_ops,
+};
+
+static const struct snd_soc_component_driver rk_spdifrx_component = {
+	.name = "rockchip-spdifrx",
+};
+
+static bool rk_spdifrx_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFRX_CFGR:
+	case SPDIFRX_CLR:
+	case SPDIFRX_CDR:
+	case SPDIFRX_CDRST:
+	case SPDIFRX_DMACR:
+	case SPDIFRX_FIFOCTRL:
+	case SPDIFRX_INTEN:
+	case SPDIFRX_INTMASK:
+	case SPDIFRX_INTSR:
+	case SPDIFRX_INTCLR:
+	case SPDIFRX_SMPDR:
+	case SPDIFRX_BURSTINFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rk_spdifrx_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= SPDIFRX_USRDR(0) && reg < SPDIFRX_CHNSR(12))
+		return true;
+
+	switch (reg) {
+	case SPDIFRX_CFGR:
+	case SPDIFRX_CLR:
+	case SPDIFRX_CDR:
+	case SPDIFRX_CDRST:
+	case SPDIFRX_DMACR:
+	case SPDIFRX_FIFOCTRL:
+	case SPDIFRX_INTEN:
+	case SPDIFRX_INTMASK:
+	case SPDIFRX_INTSR:
+	case SPDIFRX_INTCLR:
+	case SPDIFRX_SMPDR:
+	case SPDIFRX_BURSTINFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rk_spdifrx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= SPDIFRX_USRDR(0) && reg < SPDIFRX_CHNSR(12))
+		return true;
+
+	switch (reg) {
+	case SPDIFRX_CLR:
+	case SPDIFRX_CDR:
+	case SPDIFRX_CDRST:
+	case SPDIFRX_FIFOCTRL:
+	case SPDIFRX_INTSR:
+	case SPDIFRX_INTCLR:
+	case SPDIFRX_SMPDR:
+	case SPDIFRX_BURSTINFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rk_spdifrx_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFRX_SMPDR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config rk_spdifrx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = SPDIFRX_BURSTINFO,
+	.writeable_reg = rk_spdifrx_wr_reg,
+	.readable_reg = rk_spdifrx_rd_reg,
+	.volatile_reg = rk_spdifrx_volatile_reg,
+	.precious_reg = rk_spdifrx_precious_reg,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static irqreturn_t rk_spdifrx_isr(int irq, void *dev_id)
+{
+	struct rk_spdifrx_dev *spdifrx = dev_id;
+	struct snd_card *card;
+	bool sync_changed = false, err = false, xrun_err = false;
+	u32 intsr;
+	unsigned long flags;
+
+	regmap_read(spdifrx->regmap, SPDIFRX_INTSR, &intsr);
+
+	if (!intsr)
+		return IRQ_NONE;
+
+	if (intsr & SPDIFRX_INT_NSYNC) {
+		dev_dbg(spdifrx->dev, "Exiting sync status\n");
+		sync_changed = true;
+		err = true;
+	}
+
+	if (intsr & SPDIFRX_INT_BMDE) {
+		dev_warn(spdifrx->dev, "Biphase mark decoding error\n");
+		err = true;
+	}
+
+	if (intsr & SPDIFRX_INT_PE) {
+		dev_warn(spdifrx->dev, "Parity error\n");
+		err = true;
+	}
+
+	if (intsr & SPDIFRX_INT_RXO) {
+		dev_warn(spdifrx->dev, "FIFO overrun error\n");
+		xrun_err = true;
+	}
+
+	/* clear all handled interrupts */
+	regmap_write(spdifrx->regmap, SPDIFRX_INTCLR, intsr);
+
+	spin_lock_irqsave(&spdifrx->irq_lock, flags);
+	if (spdifrx->dai) {
+		card = spdifrx->dai->component->card->snd_card;
+		if (sync_changed) {
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &spdifrx->snd_kctl_sync->id);
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &spdifrx->snd_kctl_rate->id);
+		}
+		if (intsr & SPDIFRX_INT_UBC) {
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &spdifrx->snd_kctl_usr->id);
+		}
+		if (intsr & SPDIFRX_INT_CSC) {
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+				       &spdifrx->snd_kctl_chstat->id);
+		}
+	}
+
+	if (err && spdifrx->substream)
+		snd_pcm_stop(spdifrx->substream, SNDRV_PCM_STATE_DISCONNECTED);
+
+	if (xrun_err && spdifrx->substream)
+		snd_pcm_stop_xrun(spdifrx->substream);
+
+	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static int rk_spdifrx_probe(struct platform_device *pdev)
+{
+	struct rk_spdifrx_dev *spdifrx;
+	struct resource *res;
+	void __iomem *regs;
+	int ret;
+
+	spdifrx = devm_kzalloc(&pdev->dev, sizeof(*spdifrx), GFP_KERNEL);
+	if (!spdifrx)
+		return -ENOMEM;
+	spin_lock_init(&spdifrx->irq_lock);
+
+	spdifrx->reset = devm_reset_control_get(&pdev->dev, "spdifrx-m");
+	if (IS_ERR(spdifrx->reset)) {
+		ret = PTR_ERR(spdifrx->reset);
+		if (ret != -ENOENT)
+			return ret;
+	}
+
+	spdifrx->hclk = devm_clk_get(&pdev->dev, "hclk");
+	if (IS_ERR(spdifrx->hclk))
+		return PTR_ERR(spdifrx->hclk);
+
+	spdifrx->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(spdifrx->mclk))
+		return PTR_ERR(spdifrx->mclk);
+
+	spdifrx->irq = platform_get_irq(pdev, 0);
+	if (spdifrx->irq < 0)
+		return spdifrx->irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, spdifrx->irq, NULL,
+					rk_spdifrx_isr,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					dev_name(&pdev->dev), spdifrx);
+	if (ret)
+		return ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	spdifrx->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+						&rk_spdifrx_regmap_config);
+	if (IS_ERR(spdifrx->regmap))
+		return PTR_ERR(spdifrx->regmap);
+
+	spdifrx->capture_dma_data.addr = res->start + SPDIFRX_SMPDR;
+	spdifrx->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	spdifrx->capture_dma_data.maxburst = 4;
+
+	spdifrx->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, spdifrx);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &rk_spdifrx_component,
+					      &rk_spdifrx_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register DAI\n");
+		goto err;
+	}
+
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register PCM\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static const struct of_device_id rk_spdifrx_match[] = {
+	{
+		.compatible = "rockchip,rk3308-spdifrx",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rk_spdifrx_match);
+
+static struct platform_driver rk_spdifrx_driver = {
+	.probe = rk_spdifrx_probe,
+	.driver = {
+		.name = "rockchip-spdifrx",
+		.of_match_table = of_match_ptr(rk_spdifrx_match),
+	},
+};
+module_platform_driver(rk_spdifrx_driver);
+
+MODULE_ALIAS("platform:rockchip-spdifrx");
+MODULE_DESCRIPTION("ROCKCHIP SPDIF Receiver Interface");
+MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/rockchip/rockchip_spdifrx.h b/sound/soc/rockchip/rockchip_spdifrx.h
new file mode 100644
index 000000000000..711416273b69
--- /dev/null
+++ b/sound/soc/rockchip/rockchip_spdifrx.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ALSA SoC Audio Layer - Rockchip SPDIF_RX Controller driver
+ *
+ * Copyright (C) 2018 Fuzhou Rockchip Electronics Co., Ltd
+ *
+ */
+
+#ifndef _ROCKCHIP_SPDIFRX_H
+#define _ROCKCHIP_SPDIFRX_H
+
+/* CFGR */
+#define SPDIFRX_CFGR_TWAD_SHIFT		1
+#define SPDIFRX_CFGR_TWAD_DATA_ONLY	(0 << 1)
+#define SPDIFRX_CFGR_TWAD_STREAM	BIT(1)
+#define SPDIFRX_EN_MASK			BIT(0)
+#define SPDIFRX_EN			BIT(0)
+#define SPDIFRX_DIS			0
+
+/* CLR */
+#define SPDIFRX_CLR_RXSC		BIT(0)
+
+/* CDR */
+#define SPDIFRX_CDR_CS_MASK		GENMASK(10, 9)
+#define SPDIFRX_CDR_CS_IDLE		0
+#define SPDIFRX_CDR_CS_DETECT		BIT(9)
+#define SPDIFRX_CDR_CS_MEASUREMENT	BIT(10)
+#define SPDIFRX_CDR_CS_SYNC		(BIT(9) | BIT(10))
+#define SPDIFRX_CDR_AVGSEL_MASK		BIT(1)
+#define SPDIFRX_CDR_AVGSEL_MIN		(0 << 1)
+#define SPDIFRX_CDR_AVGSEL_AVG		BIT(1)
+#define SPDIFRX_CDR_BYPASS_MASK		BIT(0)
+#define SPDIFRX_CDR_BYPASS_EN		BIT(0)
+#define SPDIFRX_CDR_BYPASS_DIS		0
+
+/* CDRST */
+#define SPDIFRX_CDRST_NOSTRTHR_MASK	GENMASK(31, 16)
+#define SPDIFRX_CDRST_MAXCNT_MASK	GENMASK(15, 8)
+#define SPDIFRX_CDRST_MINCNT_MASK	GENMASK(7, 0)
+
+/* DMACR */
+#define SPDIFRX_DMACR_RDE_MASK		BIT(5)
+#define SPDIFRX_DMACR_RDE_DISABLE	(0 << 5)
+#define SPDIFRX_DMACR_RDE_ENABLE	BIT(5)
+#define SPDIFRX_DMACR_RDL_MASK		GENMASK(4, 0)
+#define SPDIFRX_DMACR_RDL(x)		(((x) - 1) << 0)
+
+/* FIFOCTRL */
+#define SPDIFRX_FIFOCTRL_RFL_MASK	GENMASK(13, 8)
+#define SPDIFRX_FIFOCTRL_RFT_MASK	GENMASK(4, 0)
+
+/* Interrupts */
+#define SPDIFRX_INT_UBC			BIT(10)  /* User bit changed */
+#define SPDIFRX_INT_ESYNC		BIT(9)   /* Enter sync */
+#define SPDIFRX_INT_BTE			BIT(8)   /* Block end */
+#define SPDIFRX_INT_NSYNC		BIT(7)   /* Exit sync */
+#define SPDIFRX_INT_BMDE		BIT(5)   /* Biphase mark decode error */
+#define SPDIFRX_INT_RXO			BIT(5)   /* RX Overrun */
+#define SPDIFRX_INT_RXF			BIT(4)   /* RX Full */
+#define SPDIFRX_INT_NPSP		BIT(3)   /* ??? */
+#define SPDIFRX_INT_NVLD		BIT(2)   /* ??? */
+#define SPDIFRX_INT_CSC			BIT(1)   /* Channel status bit changed */
+#define SPDIFRX_INT_PE			BIT(0)   /* Parity error */
+
+/* BURSTINFO */
+#define SPDIFRX_BURSTINFO_PD_MASK	GENMASK(31, 16)
+#define SPDIFRX_BURSTINFO_BSNUM_MASK	GENMASK(15, 13)
+#define SPDIFRX_BURSTINFO_DATAINFO_MASK	GENMASK(12, 8)
+#define SPDIFRX_BURSTINFO_ERRFLAG_MASK	BIT(7)
+#define SPDIFRX_BURSTINFO_ERR		BIT(7)
+#define SPDIFRX_BURSTINFO_VALID		(0 << 7)
+#define SPDIFRX_BURSTINFO_DATATYPE_MASK	GENMASK(6, 0)
+
+#define SPDIFRX_VERSION			(0x0000)
+#define SPDIFRX_CFGR			(0x0004)
+#define SPDIFRX_CLR			(0x0008)
+#define SPDIFRX_CDR			(0x000c)
+#define SPDIFRX_CDRST			(0x0010)
+#define SPDIFRX_DMACR			(0x0014)
+#define SPDIFRX_FIFOCTRL		(0x0018)
+#define SPDIFRX_INTEN			(0x001C)
+#define SPDIFRX_INTMASK			(0x0020)
+#define SPDIFRX_INTSR			(0x0024)
+#define SPDIFRX_INTCLR			(0x0028)
+#define SPDIFRX_SMPDR			(0x002C)
+#define SPDIFRX_USRDR(n)		(0x0030 + (n << 2))
+#define SPDIFRX_CHNSR(n)		(0x0060 + (n << 2))
+#define SPDIFRX_BURSTINFO		(0x0100)
+
+#endif /* _ROCKCHIP_SPDIFRX_H */
-- 
2.25.1

