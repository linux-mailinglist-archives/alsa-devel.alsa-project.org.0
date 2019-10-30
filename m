Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C354E9E20
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:58:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F184122FD;
	Wed, 30 Oct 2019 15:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F184122FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572447507;
	bh=0h4icZLCTva4lgBpdc/0vLWBaFdWLGgYx7b0A0qKUtc=;
	h=In-Reply-To:References:From:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/4BGsv82LTrBuaZnWjfH4p0qS+3dqiKenRP1TZGBsGnguS2/04NvEP0WfeCssaX4
	 mObjeECU/A22AaEmIWhzmahi5lu2hk0rhbzCInHiBjmEZDPvnOzgGAw7SIDjjisGBX
	 QAFvPBWMM4yajNFIozQsRcViQr7BFLEAvjHssSak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21139F8044A;
	Wed, 30 Oct 2019 15:56:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3BEAF80361; Wed, 30 Oct 2019 15:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D60F802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D60F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bNgUZU71"
Received: by mail-pf1-x441.google.com with SMTP id 193so454950pfc.13
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:from:subject:to:cc:user-agent:date;
 bh=kUX+QB+n6uPsMbBuXUFFDaJg5lKGQ/rdJhKtAOQxM68=;
 b=bNgUZU71v+0fmmNO32iK5sG8ShIFzxEVanGouBgUUl1TWyrYV9O7bG3dlDm8YLckH4
 d+aygtJELB/eg5oR8mSOvB/gHvYdLip5dMSYcpm4ZFmdvQ9c11yC9alSFajCI0d29EH6
 lsn085FJbQRp1w/1MosfnmNAbXjWAU5xYDf3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
 :user-agent:date;
 bh=kUX+QB+n6uPsMbBuXUFFDaJg5lKGQ/rdJhKtAOQxM68=;
 b=FGTj4tztOlJ6WjGAB69PHj67NCHSwkBeqw6P8ENM5T25XUVXJU/7mecKwGUnScl1d0
 F74dOz8qI1TSPJlz6V9IWL5iJqqKZe3wJdfR84G0cFRabJKdCC623N1ZwUCqzR1NzvUz
 /sPIclJnMWvFvjlofsPjX33IjxlCpGLjnBVdxLnFP45L52b363d9NBBpDWsVX8HhYicb
 owGGDnBxW5TV4SMIrxdF8OtHrbU4pFNi5GKmu46b172/0aXnjO58eBl0eqbBflRKx6Ch
 49FcGqN1noA5/22TEvNPEcEF2YTz07u7cEXH8tR3Aom8jyog7Xks/8Zu1JXUxD+qHfYy
 f/pg==
X-Gm-Message-State: APjAAAVhvu/tsAlfQKJG7un/3msQsMRatDIO5Jj7niwezIkxPy6hhEDU
 BItFFJKGLu3xYdeuq8yyLZNrmQ==
X-Google-Smtp-Source: APXvYqzbFFg5OC6TJ9lnqjvMpIqFnf7mzbiND6t96bWdmgGcpqetszJAYKhFjob6bIjnEsoSQ7lghA==
X-Received: by 2002:a63:3442:: with SMTP id b63mr8798587pga.264.1572447055787; 
 Wed, 30 Oct 2019 07:50:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id s11sm2394909pjp.26.2019.10.30.07.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 07:50:55 -0700 (PDT)
Message-ID: <5db9a34f.1c69fb81.23dfc.7ea5@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org,
 lee.jones@linaro.org, linus.walleij@linaro.org, robh@kernel.org
User-Agent: alot/0.8.1
Date: Wed, 30 Oct 2019 07:50:54 -0700
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org,
 Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH v3 09/11] pinctrl: qcom-wcd934x: Add
	support to wcd934x pinctrl driver.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Quoting Srinivas Kandagatla (2019-10-29 04:26:58)
> From: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
> 
> This patch adds support to wcd934x pinctrl block found in
> WCD9340/WC9341 Audio codecs.
> 
> [Srini: multiple cleanups to the code]

This goes after the author signoff and before yours. Can you add more
details too?

> Signed-off-by: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig                |   7 +
>  drivers/pinctrl/qcom/Makefile               |   1 +
>  drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c | 365 ++++++++++++++++++++
>  3 files changed, 373 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
> new file mode 100644
> index 000000000000..1aff88d0bcb3
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
> @@ -0,0 +1,365 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <linux/module.h>
> +#include <linux/gpio.h>
> +#include <linux/interrupt.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +
> +#include "../core.h"
> +#include "../pinctrl-utils.h"
> +
> +#define WCD_REG_DIR_CTL_OFFSET 0x42
> +#define WCD_REG_VAL_CTL_OFFSET 0x43
> +#define WCD_GPIO_PULL_UP       1
> +#define WCD_GPIO_PULL_DOWN     2
> +#define WCD_GPIO_BIAS_DISABLE  3
> +#define WCD_GPIO_STRING_LEN    20
> +#define WCD934X_NPINS          5
> +
> +/**
> + * struct wcd_gpio_pad - keep current GPIO settings
> + * @offset: offset of gpio.
> + * @is_valid: Set to false, when GPIO in high Z state.
> + * @value: value of a pin
> + * @output_enabled: Set to true if GPIO is output and false if it is input
> + * @pullup: Constant current which flow through GPIO output buffer.
> + * @strength: Drive strength of a pin
> + */
> +struct wcd_gpio_pad {
> +       u16  offset;
> +       bool is_valid;
> +       bool value;
> +       bool output_enabled;
> +       unsigned int pullup;
> +       unsigned int strength;
> +};
> +
> +struct wcd_gpio_priv {
> +       struct device *dev;
> +       struct regmap *map;
> +       struct pinctrl_dev *ctrl;
> +       struct gpio_chip chip;
> +};
> +
> +static int wcd_gpio_read(struct wcd_gpio_priv *priv_data,
> +                        struct wcd_gpio_pad *pad, unsigned int addr)
> +{
> +       unsigned int val;
> +       int ret;
> +
> +       ret = regmap_read(priv_data->map, addr, &val);
> +       if (ret < 0)
> +               dev_err(priv_data->dev, "%s: read 0x%x failed\n",
> +                       __func__, addr);
> +       else
> +               ret = (val >> pad->offset);
> +
> +       return ret;
> +}
> +
> +static int wcd_gpio_write(struct wcd_gpio_priv *priv_data,
> +                         struct wcd_gpio_pad *pad, unsigned int addr,
> +                         unsigned int val)
> +{
> +       int ret;
> +
> +       ret = regmap_update_bits(priv_data->map, addr, (1 << pad->offset),
> +                                val << pad->offset);
> +       if (ret < 0)
> +               dev_err(priv_data->dev, "write 0x%x failed\n", addr);

Is there value in these error messages? Also, use %#x to get '0x'.

> +
> +       return ret;
> +}
[...]
> +
> +static int wcd_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct pinctrl_pin_desc *pindesc;
> +       struct pinctrl_desc *pctrldesc;
> +       struct wcd_gpio_pad *pad, *pads;
> +       struct wcd_gpio_priv *priv_data;
> +       u32 npins = WCD934X_NPINS;
> +       char **name;
> +       int i;
> +
> +       priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
> +       if (!priv_data)
> +               return -ENOMEM;
> +
> +       priv_data->dev = dev;
> +       priv_data->map = dev_get_regmap(dev->parent, NULL);
> +       if (!priv_data->map) {
> +               dev_err(dev, "%s: failed to get regmap\n", __func__);
> +               return  -EINVAL;
> +       }
> +
> +       pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
> +       if (!pindesc)
> +               return -ENOMEM;
> +
> +       pads = devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
> +       if (!pads)
> +               return -ENOMEM;

Is it possible to put the pad struct around the pindesc struct? It's
sort of sad that we have to allocate a chunk of memory twice for the
pindesc and the pads when we could either use container_of() on the
pindesc or just point the pindesc driver data member to the container
structure for the qcom specific bits.

> +
> +       pctrldesc = devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
> +       if (!pctrldesc)
> +               return -ENOMEM;
> +
> +       pctrldesc->pctlops = &wcd_pinctrl_ops;
> +       pctrldesc->confops = &wcd_pinconf_ops;
> +       pctrldesc->owner = THIS_MODULE;
> +       pctrldesc->name = dev_name(dev);
> +       pctrldesc->pins = pindesc;
> +       pctrldesc->npins = npins;
> +
> +       name = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
> +       if (!name)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < npins; i++, pindesc++) {
> +               name[i] = devm_kzalloc(dev, sizeof(char) * WCD_GPIO_STRING_LEN,
> +                                      GFP_KERNEL);
> +               if (!name[i])
> +                       return -ENOMEM;
> +
> +               pad = &pads[i];
> +               pindesc->drv_data = pad;
> +               pindesc->number = i;
> +               snprintf(name[i], (WCD_GPIO_STRING_LEN - 1), "gpio%d", (i+1));
> +               pindesc->name = name[i];

Why not use devm_kasprintf()? The 'name' array is also unnecessary?

> +               pad->offset = i;
> +               pad->is_valid  = true;
> +       }
> +
> +       priv_data->chip = wcd_gpio_chip;
> +       priv_data->chip.parent = dev;
> +       priv_data->chip.base = -1;
> +       priv_data->chip.ngpio = npins;
> +       priv_data->chip.label = dev_name(dev);
> +       priv_data->chip.of_gpio_n_cells = 2;
> +       priv_data->chip.can_sleep = false;
> +       platform_set_drvdata(pdev, priv_data);
> +
> +       priv_data->ctrl = devm_pinctrl_register(dev, pctrldesc, priv_data);
> +       if (IS_ERR(priv_data->ctrl)) {
> +               dev_err(dev, "%s: failed to register to pinctrl\n", __func__);
> +               return PTR_ERR(priv_data->ctrl);
> +       }
> +
> +       return gpiochip_add_data(&priv_data->chip, priv_data);

WHy not use devm_gpiochip_add_data()?

> +}
> +
> +static int wcd_pinctrl_remove(struct platform_device *pdev)
> +{
> +       struct wcd_gpio_priv *priv_data = platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&priv_data->chip);
> +
> +       return 0;

And drop this function?

> +}
> +
> +static const struct of_device_id wcd_pinctrl_of_match[] = {
> +       { .compatible = "qcom,wcd9340-pinctrl" },
> +       { .compatible = "qcom,wcd9341-pinctrl" },
> +       { },

Nitpick: Drop the comma on the sentinel.

> +};
> +
> +MODULE_DEVICE_TABLE(of, wcd_pinctrl_of_match);

Nitpick: Drop the newline between device table and match table.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
