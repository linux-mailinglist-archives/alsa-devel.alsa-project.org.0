Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393744C20DC
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 02:03:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5531118BA;
	Thu, 24 Feb 2022 02:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5531118BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645664592;
	bh=oiUNfiVnkQCLNoUKGxwxzzuFLPEaxuohSLOO11x8o4A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNztYJNmzKabi+/MKGZAqKgQeqNg1ghkmlCN213aABNvDPaz0c45w8VB5uUIBopC4
	 I3XY4yLvnLhjHGAy87UU9wRBycHUOnqH+QUChWuVmV25Fy7dYDxyjDMX9TdV1DDM9r
	 tilfKojldRF/lXk2gwzo9+AVaAGLp8vSQLaWHADQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A2BF8019D;
	Thu, 24 Feb 2022 02:02:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3912F80237; Thu, 24 Feb 2022 02:02:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4564F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 02:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4564F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JCFtRmGY"
Received: by mail-wr1-x42f.google.com with SMTP id j17so629061wrc.0
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 17:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4e/Dnvb9YoryIhdTdufKPGz6hPEp9xb9MXXu9Z2tkes=;
 b=JCFtRmGYiQtsLAv3rnw5tWOfOC90RRwv2f9AUUFq/YozNBiu88clQpOm6YJEyg717J
 fWBVXoKeaK9KJp+DgOwv1LSMhNUDge91NpJyqwctN0uC3kCNeW5zKJPQH2ZzrMCwvspm
 Tec720f6qxbR2CG1kPA396ITMOwpcgyKQt2/+RvThEqPKPGfmr80/CuqLsP3QtnXJ/AO
 xOtbtGeuHEEbsR4EPtxcDvyB0uTM9mGGUVG/gh8DOXlw4/UE/G81VuUEzkaRQDgAtLrt
 cHC15C2634RTP5lT0wJ5lHaWkyrVuGkZMtz1YfsE2NnTaK7zGGvag4iDfEJNp/gKUyBw
 9g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4e/Dnvb9YoryIhdTdufKPGz6hPEp9xb9MXXu9Z2tkes=;
 b=suLE/s25LAFmXlzCijQKO4S6wSgZ+Aw+kxnmp60gu8hNKfu4a5TvLc98aK9PYf/ZB3
 9oCixBEQp+Af6AA95CqSaO+v8ATr3A8GElsGuL9/8N/HGlQR+l8x3YXWozHjxJMCXKHY
 OtK14c2ZhpC8TKjHp0I3CZ9jaAc4NHMIfeaIgVlsZcjfTZsYXY+wslk4ZnD7OrpfFVAl
 OMynASrtZ1Oh1B1p9PlRvAhfdaEHO2VA8E1NCh8RxbzD5xltTOcFAwPtde9x0gfqhlBS
 A5m9/5fSqdfCYlxCZp4/rI/DUbu8SS5/KF6UbCwZGG50JsuFiY3dRhnJmQyb5Fw5b8rf
 aD3g==
X-Gm-Message-State: AOAM530e02UjyiI3RT7zc1CBVgmuhZD0tZ+L3du96Fyu09L06XUG28YK
 V5jV4wBwkYvQFuXFUMSPiemYmA==
X-Google-Smtp-Source: ABdhPJzd71Svvs+9vb34rVpI3x2LL2LRf43Sjc2JTuzUKjBhmXKAYZpDbpI7YkNZJndN4rzKu1Kfcg==
X-Received: by 2002:adf:dd50:0:b0:1ea:8de3:9372 with SMTP id
 u16-20020adfdd50000000b001ea8de39372mr204367wrm.495.1645664511727; 
 Wed, 23 Feb 2022 17:01:51 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id r17sm971856wrp.64.2022.02.23.17.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 17:01:51 -0800 (PST)
Message-ID: <4b972404-578a-b13b-b036-4033c89fafa9@linaro.org>
Date: Thu, 24 Feb 2022 01:01:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ASoC: codecs: Add power domains support in digital
 macro codecs
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1645631198-4701-1-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1645631198-4701-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 23/02/2022 15:46, Srinivasa Rao Mandadapu wrote:
> Add support for enabling required power domains in digital macro codecs.
> macro and dcodec power domains are being requested as clocks by HLOS
> in ADSP based architectures and ADSP internally handling as powerdomains.
> In ADSP bypass case need to handle them as power domains explicitly.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> Changes since v1:
>      -- Add missing macros in Kconfig.
> 
>   sound/soc/codecs/Kconfig              |  7 ++++
>   sound/soc/codecs/Makefile             |  2 +
>   sound/soc/codecs/lpass-macro-common.c | 72 +++++++++++++++++++++++++++++++++++
>   sound/soc/codecs/lpass-macro-common.h | 18 +++++++++
>   sound/soc/codecs/lpass-rx-macro.c     | 13 ++++++-
>   sound/soc/codecs/lpass-tx-macro.c     | 10 +++++
>   sound/soc/codecs/lpass-va-macro.c     | 11 +++++-
>   sound/soc/qcom/Kconfig                |  1 +
>   8 files changed, 132 insertions(+), 2 deletions(-)
>   create mode 100644 sound/soc/codecs/lpass-macro-common.c
>   create mode 100644 sound/soc/codecs/lpass-macro-common.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index c2627f7..4de029a 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -244,6 +244,7 @@ config SND_SOC_ALL_CODECS
>   	imply SND_SOC_WCD9335
>   	imply SND_SOC_WCD934X
>   	imply SND_SOC_WCD938X_SDW
> +	imply SND_SOC_LPASS_MACRO_COMMON
>   	imply SND_SOC_LPASS_RX_MACRO
>   	imply SND_SOC_LPASS_TX_MACRO
>   	imply SND_SOC_WL1273
> @@ -2008,6 +2009,9 @@ config SND_SOC_TPA6130A2
>   	tristate "Texas Instruments TPA6130A2 headphone amplifier"
>   	depends on I2C
>   
> +config SND_SOC_LPASS_MACRO_COMMON
> +        tristate
> +
>   config SND_SOC_LPASS_WSA_MACRO
>   	depends on COMMON_CLK
>   	select REGMAP_MMIO
> @@ -2016,16 +2020,19 @@ config SND_SOC_LPASS_WSA_MACRO
>   config SND_SOC_LPASS_VA_MACRO
>   	depends on COMMON_CLK
>   	select REGMAP_MMIO
> +	select SND_SOC_LPASS_MACRO_COMMON
>   	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
>   
>   config SND_SOC_LPASS_RX_MACRO
>   	depends on COMMON_CLK
>   	select REGMAP_MMIO
> +	select SND_SOC_LPASS_MACRO_COMMON
>   	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
>   
>   config SND_SOC_LPASS_TX_MACRO
>   	depends on COMMON_CLK
>   	select REGMAP_MMIO
> +	select SND_SOC_LPASS_MACRO_COMMON
>   	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
>   
>   endmenu
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index b4e11c3..c3c6059 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -112,6 +112,7 @@ snd-soc-l3-objs := l3.o
>   snd-soc-lm4857-objs := lm4857.o
>   snd-soc-lm49453-objs := lm49453.o
>   snd-soc-lochnagar-sc-objs := lochnagar-sc.o
> +snd-soc-lpass-macro-common-objs := lpass-macro-common.o
>   snd-soc-lpass-rx-macro-objs := lpass-rx-macro.o
>   snd-soc-lpass-tx-macro-objs := lpass-tx-macro.o
>   snd-soc-lpass-wsa-macro-objs := lpass-wsa-macro.o
> @@ -676,6 +677,7 @@ obj-$(CONFIG_SND_SOC_MAX9877)	+= snd-soc-max9877.o
>   obj-$(CONFIG_SND_SOC_MAX98504)	+= snd-soc-max98504.o
>   obj-$(CONFIG_SND_SOC_SIMPLE_AMPLIFIER)	+= snd-soc-simple-amplifier.o
>   obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
> +obj-$(CONFIG_SND_SOC_LPASS_MACRO_COMMON)	+= snd-soc-lpass-macro-common.o
>   obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
>   obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
>   obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
> new file mode 100644
> index 0000000..b8e50e6
> --- /dev/null
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2022, The Linux Foundation. All rights reserved.
> +
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "lpass-macro-common.h"
> +
> +int lpass_macro_pds_init(struct platform_device *pdev, struct lpass_macro **pds)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lpass_macro *l_pds;
> +	int ret;
> +
> +	const struct property *prop = of_find_property(dev->of_node, "power-domains", NULL);
> +
> +	if (!prop)
> +		return 0;

how about
	if (!of_property_read_bool(dev->of_node, "power-domains"))
		return 0;

> +
> +	l_pds = devm_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
> +	if (!l_pds)
> +		return -ENOMEM;
> +
> +	l_pds->macro_pd = dev_pm_domain_attach_by_name(dev,  "macro");
> +	if (IS_ERR_OR_NULL(l_pds->macro_pd)) {
> +		ret = PTR_ERR(l_pds->macro_pd) ? : -ENODATA;
> +		return ret;
> +	}
> +	ret = pm_runtime_get_sync(l_pds->macro_pd);
> +	if (ret < 0) {
> +		dev_err(dev, "%s failed for macro_pd, ret %d\n", __func__, ret);
> +		dev_pm_domain_detach(l_pds->macro_pd, false);
> +		pm_runtime_put_noidle(l_pds->macro_pd);
> +		return ret;
> +	}
> +
> +	l_pds->dcodec_pd = dev_pm_domain_attach_by_name(dev, "dcodec");
> +	if (IS_ERR_OR_NULL(l_pds->dcodec_pd)) {
> +		ret = PTR_ERR(l_pds->dcodec_pd) ? : -ENODATA;
> +		dev_pm_domain_detach(l_pds->macro_pd, false);
> +		return ret;
> +	}
> +
> +	ret = pm_runtime_get_sync(l_pds->dcodec_pd);
> +	if (ret < 0) {
> +		dev_err(dev, "%s failed for dcodec_pd, ret %d\n", __func__, ret);
> +
> +		dev_pm_domain_detach(l_pds->dcodec_pd, false);
should you not detach and do pm_put on macro_pd here?

> +		pm_runtime_put_noidle(l_pds->dcodec_pd);
> +		return ret;
> +	}
> +	*pds = l_pds;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_pds_init);
> +
> +void lpass_macro_pds_exit(struct platform_device *pdev, struct lpass_macro *pds)
> +{
> +	pm_runtime_put(pds->macro_pd);
> +	pm_runtime_put(pds->dcodec_pd);
> +	dev_pm_domain_detach(pds->macro_pd, false);
> +	dev_pm_domain_detach(pds->dcodec_pd, false);
> +}
> +EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
> +
> +MODULE_DESCRIPTION("QTI SC7280 LPI GPIO pin control driver");
Seems incorrect description for the module.

> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> new file mode 100644
> index 0000000..c343f0e
> --- /dev/null
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __LPASS_MACRO_COMMON_H__
> +#define __LPASS_MACRO_COMMON_H__
> +
> +
> +struct lpass_macro {
> +	struct device *macro_pd;
> +	struct device *dcodec_pd;
> +};
> +
> +int lpass_macro_pds_init(struct platform_device *pdev, struct lpass_macro **pds);
> +void lpass_macro_pds_exit(struct platform_device *pdev, struct lpass_macro *pds);
> +
> +#endif /* __LPASS_MACRO_COMMON_H__ */
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 29d214f..db32090 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -14,6 +14,8 @@
>   #include <linux/of_clk.h>
>   #include <linux/clk-provider.h>
>   
> +#include "lpass-macro-common.h"
> +
>   #define CDC_RX_TOP_TOP_CFG0		(0x0000)
>   #define CDC_RX_TOP_SWR_CTRL		(0x0008)
>   #define CDC_RX_TOP_DEBUG		(0x000C)
> @@ -606,7 +608,7 @@ struct rx_macro {
>   	int is_softclip_on;
>   	int is_aux_hpf_on;
>   	int softclip_clk_users;
> -
> +	struct lpass_macro *pds;
>   	struct regmap *regmap;
>   	struct clk_bulk_data clks[RX_NUM_CLKS_MAX];
>   	struct clk_hw hw;
> @@ -3537,6 +3539,12 @@ static int rx_macro_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	ret = lpass_macro_pds_init(pdev, &rx->pds);
> +	if (ret < 0) {
> +		dev_err(dev, "Enabling power domains failed in %s\n", __func__);
> +		return ret;
> +	}
> +
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
> @@ -3575,6 +3583,9 @@ static int rx_macro_remove(struct platform_device *pdev)
>   
>   	of_clk_del_provider(pdev->dev.of_node);
>   	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
> +
> +	lpass_macro_pds_exit(pdev, rx->pds);
> +
>   	return 0;
>   }
>   
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 9c96ab1..4d1e5ab 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -13,6 +13,8 @@
>   #include <linux/of_clk.h>
>   #include <linux/clk-provider.h>
>   
> +#include "lpass-macro-common.h"
> +
>   #define CDC_TX_CLK_RST_CTRL_MCLK_CONTROL (0x0000)
>   #define CDC_TX_MCLK_EN_MASK		BIT(0)
>   #define CDC_TX_MCLK_ENABLE		BIT(0)
> @@ -266,6 +268,7 @@ struct tx_macro {
>   	u16 dmic_clk_div;
>   	bool bcs_enable;
>   	int dec_mode[NUM_DECIMATORS];
> +	struct lpass_macro *pds;
>   	bool bcs_clk_en;
>   };
>   #define to_tx_macro(_hw) container_of(_hw, struct tx_macro, hw)
> @@ -1802,6 +1805,11 @@ static int tx_macro_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	ret = lpass_macro_pds_init(pdev, &tx->pds);
> +	if (ret < 0) {
> +		dev_err(dev, "Enabling power domains failed in %s\n", __func__);
> +		return ret;
> +	}
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
> @@ -1859,6 +1867,8 @@ static int tx_macro_remove(struct platform_device *pdev)
>   
>   	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
>   
> +	lpass_macro_pds_exit(pdev, tx->pds);
> +
>   	return 0;
>   }
>   
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 11147e3..b29b9a1 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -15,6 +15,8 @@
>   #include <sound/soc-dapm.h>
>   #include <sound/tlv.h>
>   
> +#include "lpass-macro-common.h"
> +
>   /* VA macro registers */
>   #define CDC_VA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
>   #define CDC_VA_MCLK_CONTROL_EN			BIT(0)
> @@ -195,6 +197,7 @@ struct va_macro {
>   	struct regmap *regmap;
>   	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
>   	struct clk_hw hw;
> +	struct lpass_macro *pds;
>   
>   	s32 dmic_0_1_clk_cnt;
>   	s32 dmic_2_3_clk_cnt;
> @@ -1413,7 +1416,11 @@ static int va_macro_probe(struct platform_device *pdev)
>   		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
>   		return ret;
>   	}
> -
> +	ret = lpass_macro_pds_init(pdev, &va->pds);
> +	if (ret < 0) {
> +		dev_err(dev, "Enabling power domains failed %s\n", __func__);
> +		return ret;
> +	}
>   	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
>   				   &sample_rate);
>   	if (ret) {
> @@ -1468,6 +1475,8 @@ static int va_macro_remove(struct platform_device *pdev)
>   
>   	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
>   
> +	lpass_macro_pds_exit(pdev, va->pds);
> +
>   	return 0;
>   }
>   
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 52db003..6ffd51a 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -194,6 +194,7 @@ config SND_SOC_SC7280
>   	select SND_SOC_LPASS_SC7280
>   	select SND_SOC_MAX98357A
>   	select SND_SOC_WCD938X
> +	select SND_SOC_LPASS_MACRO_COMMON
>   	select SND_SOC_LPASS_RX_MACRO
>   	select SND_SOC_LPASS_TX_MACRO
>   	help
