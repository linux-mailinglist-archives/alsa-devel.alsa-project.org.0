Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B41575064
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 16:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5415818A4;
	Thu, 14 Jul 2022 16:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5415818A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657807780;
	bh=Q8ugPt8B7AuXKOMmUxXFOLbei9ISDo6hGy7wscHq/eM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QpwCV2yUOzREmYSVA9GeR5eY1W0A3+WtFWuRFBln7RF8+G8gq63eEGmQY1sCsbCl8
	 3C/31AIY6+F2F5fgdRmt4vNV+SM0PZCScF5H+dZs5kYRoJDO5sQWi4mZrxQ7JgqERY
	 dz5dK7kpv8HLiyNMu9xavWF2Rowd6DoaFRN3b92I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCC97F800AA;
	Thu, 14 Jul 2022 16:08:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 432E2F80165; Thu, 14 Jul 2022 16:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 448DBF8014E
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 16:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 448DBF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="V4KB5zzQ"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B4376601A4C;
 Thu, 14 Jul 2022 15:08:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657807709;
 bh=Q8ugPt8B7AuXKOMmUxXFOLbei9ISDo6hGy7wscHq/eM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V4KB5zzQIjTXQz4Y7Rtjd5CViqg1riUb69dn/P8NHT27jfsX4yMxaWkGuA1euhoih
 exmet+dTDyOXRsY8YNOGovFn0OYO8QIZ+auAeHrzNHSD4kqA7GyaAJxKmhomjrmUXL
 u98HUZDNvToC3A2C0SsbwCOoWg8cvSzOL/1DjlGqy1p8UjcFVU963s+x/mqdi10hog
 JLvhIpB5IxJ2ck8bed1bxu8uDg0P7p7drf6eTot/f+Uald7k9BWRityZHOHgUc9Xjh
 4OyHfpI1+BBn6XA4kvMmqoLHHRqXTnOp0UnCW6hvSKl2hoiBuJFqA154WyclRRgTJt
 REmxHZQIAf1nw==
Message-ID: <ba986bba-a90e-54f4-6984-b44674d0d377@collabora.com>
Date: Thu, 14 Jul 2022 16:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 2/8] ASoC: mediatek: mt8186: add platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220712150442.32504-1-jiaxin.yu@mediatek.com>
 <20220712150442.32504-3-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712150442.32504-3-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

Il 12/07/22 17:04, Jiaxin Yu ha scritto:
> Add mt8186 platform and affiliated driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                    |   12 +
>   sound/soc/mediatek/Makefile                   |    1 +
>   sound/soc/mediatek/mt8186/Makefile            |   19 +
>   sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |    3 +-
>   sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |    2 +-
>   sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
>   .../soc/mediatek/mt8186/mt8186-afe-control.c  |  255 ++
>   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3000 +++++++++++++++++
>   8 files changed, 3525 insertions(+), 2 deletions(-)
>   create mode 100644 sound/soc/mediatek/mt8186/Makefile
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 3b1ddea26a9e..f3c3b93226e4 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -152,6 +152,18 @@ config SND_SOC_MT8183_DA7219_MAX98357A
>   	  Select Y if you have such device.
>   	  If unsure select "N".
>   
> +config SND_SOC_MT8186
> +	tristate "ASoC support for Mediatek MT8186 chip"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on COMMON_CLK
> +	select SND_SOC_MEDIATEK
> +	select MFD_SYSCON if SND_SOC_MT6358
> +	help
> +	  This adds ASoC driver for Mediatek MT8186 boards
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> +
>   config SND_SOC_MTK_BTCVSD
>   	tristate "ALSA BT SCO CVSD/MSBC Driver"
>   	help
> diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
> index 34778ca12106..5571c640a288 100644
> --- a/sound/soc/mediatek/Makefile
> +++ b/sound/soc/mediatek/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_SND_SOC_MT2701) += mt2701/
>   obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
>   obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
>   obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
> +obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
>   obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
>   obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
> diff --git a/sound/soc/mediatek/mt8186/Makefile b/sound/soc/mediatek/mt8186/Makefile
> new file mode 100644
> index 000000000000..7626bb3499dd
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/Makefile
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# platform driver
> +snd-soc-mt8186-afe-objs := \
> +	mt8186-afe-pcm.o \
> +	mt8186-audsys-clk.o \
> +	mt8186-afe-clk.o \
> +	mt8186-afe-gpio.o \
> +	mt8186-dai-adda.o \
> +	mt8186-afe-control.o \
> +	mt8186-dai-i2s.o \
> +	mt8186-dai-hw-gain.o \
> +	mt8186-dai-pcm.o \
> +	mt8186-dai-src.o \
> +	mt8186-dai-hostless.o \
> +	mt8186-dai-tdm.o \
> +	mt8186-misc-control.o \
> +
> +obj-$(CONFIG_SND_SOC_MT8186) += snd-soc-mt8186-afe.o
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
> index 0275f66ddc18..a6b4f29049bb 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
> @@ -645,7 +645,8 @@ int mt8186_init_clock(struct mtk_base_afe *afe)
>   	return 0;
>   }
>   
> -void mt8186_deinit_clock(struct mtk_base_afe *afe)
> +void mt8186_deinit_clock(void *priv)
>   {
> +	struct mtk_base_afe *afe = priv;
>   	mt8186_audsys_clk_unregister(afe);
>   }
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
> index c539557d7c78..d5988717d8f2 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
> @@ -81,7 +81,7 @@ enum {
>   struct mtk_base_afe;
>   int mt8186_set_audio_int_bus_parent(struct mtk_base_afe *afe, int clk_id);
>   int mt8186_init_clock(struct mtk_base_afe *afe);
> -void mt8186_deinit_clock(struct mtk_base_afe *afe);
> +void mt8186_deinit_clock(void *priv);
>   int mt8186_afe_enable_cgs(struct mtk_base_afe *afe);
>   void mt8186_afe_disable_cgs(struct mtk_base_afe *afe);
>   int mt8186_afe_enable_clock(struct mtk_base_afe *afe);
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
> new file mode 100644
> index 000000000000..7e9e71783468
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * mt8186-afe-common.h  --  Mediatek 8186 audio driver definitions
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> + */
> +

..snip..

> +
> +#define MT8186_RECORD_MEMIF MT8186_MEMIF_VUL12
> +#define MT8186_ECHO_REF_MEMIF MT8186_MEMIF_AWB
> +#define MT8186_PRIMARY_MEMIF MT8186_MEMIF_DL1
> +#define MT8186_FAST_MEMIF MT8186_MEMIF_DL2
> +#define MT8186_DEEP_MEMIF MT8186_MEMIF_DL3
> +#define MT8186_VOIP_MEMIF MT8186_MEMIF_DL12
> +#define MT8186_MMAP_DL_MEMIF MT8186_MEMIF_DL5
> +#define MT8186_MMAP_UL_MEMIF MT8186_MEMIF_VUL5
> +#define MT8186_BARGEIN_MEMIF MT8186_MEMIF_AWB
> +
> +enum {
> +	MT8186_IRQ_0,
> +	MT8186_IRQ_1,
> +	MT8186_IRQ_2,
> +	MT8186_IRQ_3,
> +	MT8186_IRQ_4,
> +	MT8186_IRQ_5,
> +	MT8186_IRQ_6,
> +	MT8186_IRQ_7,
> +	MT8186_IRQ_8,
> +	MT8186_IRQ_9,
> +	MT8186_IRQ_10,
> +	MT8186_IRQ_11,
> +	MT8186_IRQ_12,
> +	MT8186_IRQ_13,
> +	MT8186_IRQ_14,
> +	MT8186_IRQ_15,
> +	MT8186_IRQ_16,
> +	MT8186_IRQ_17,
> +	MT8186_IRQ_18,
> +	MT8186_IRQ_19,
> +	MT8186_IRQ_20,
> +	MT8186_IRQ_21,
> +	MT8186_IRQ_22,
> +	MT8186_IRQ_23,
> +	MT8186_IRQ_24,
> +	MT8186_IRQ_25,
> +	MT8186_IRQ_26,
> +	MT8186_IRQ_NUM,
> +};
> +
> +enum {
> +	MT8186_AFE_IRQ_DIR_MCU = 0,
> +	MT8186_AFE_IRQ_DIR_DSP,
> +	MT8186_AFE_IRQ_DIR_BOTH,
> +};
> +
> +enum {
> +	MTKAIF_PROTOCOL_1 = 0,
> +	MTKAIF_PROTOCOL_2,
> +	MTKAIF_PROTOCOL_2_CLK_P2,
> +};
> +
> +enum {
> +	MTK_AFE_ADDA_DL_GAIN_MUTE = 0,
> +	MTK_AFE_ADDA_DL_GAIN_NORMAL = 0xf74f,
> +	/* SA suggest apply -0.3db to audio/speech path */
> +};
> +
> +#define MTK_SPK_NOT_SMARTPA_STR "MTK_SPK_NOT_SMARTPA"
> +#define MTK_SPK_RICHTEK_RT5509_STR "MTK_SPK_RICHTEK_RT5509"
> +#define MTK_SPK_MEDIATEK_MT6660_STR "MTK_SPK_MEDIATEK_MT6660"
> +#define MTK_SPK_GOODIX_TFA9874_STR "MTK_SPK_GOODIX_TFA9874"
> +
> +#define MTK_SPK_I2S_0_STR "MTK_SPK_I2S_0"
> +#define MTK_SPK_I2S_1_STR "MTK_SPK_I2S_1"
> +#define MTK_SPK_I2S_2_STR "MTK_SPK_I2S_2"
> +#define MTK_SPK_I2S_3_STR "MTK_SPK_I2S_3"
> +#define MTK_SPK_I2S_5_STR "MTK_SPK_I2S_5"
> +#define MTK_SPK_I2S_6_STR "MTK_SPK_I2S_6"
> +#define MTK_SPK_I2S_7_STR "MTK_SPK_I2S_7"
> +#define MTK_SPK_I2S_8_STR "MTK_SPK_I2S_8"
> +#define MTK_SPK_I2S_9_STR "MTK_SPK_I2S_9"

These definitions (and some more) are unused. Please drop.

Everything else looks ok to me.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
