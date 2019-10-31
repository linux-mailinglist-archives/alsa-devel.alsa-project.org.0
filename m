Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87918EAD77
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 11:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B441204D;
	Thu, 31 Oct 2019 11:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B441204D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572517993;
	bh=G1LES7pAx2UWbga0OoqeF31nBBkWhclxnQt7Cb4YBhc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hWZhN7OJbuSZLH7V/mrxcrQV0exGmPWl6qySKyXy6WYl7T3s7UVmZ3pVE+UFZQ3Va
	 jHkwgcmvZ/XjxXcGr1Iq7IZNOyYDUW7b2BXjc0rTloKhpMQ+Ij7diJQqr3O8moWE7v
	 pvdqwZ1IfuLI/kYmRpkN/VXj0/8ZXene/EA0mXCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD20FF80392;
	Thu, 31 Oct 2019 11:31:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10E1EF80392; Thu, 31 Oct 2019 11:31:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B961F800F6
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 11:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B961F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FTzhdX6x"
Received: by mail-wm1-x343.google.com with SMTP id w9so5309200wmm.5
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NlAiN393nCfoZAygvg08JmQmUPznfSWcWyubnTUIKKE=;
 b=FTzhdX6xA9OuelCfgiKsLtlknqLLFGDnkv0Ewxq2ueMPposxkBjtBde1+K6HfGCUPt
 qIYL83dFAJt4Th0bz7plX90V/6hkhi6ob0yugsKsSgKe/ghH4tlSh+SoA1k9Tk54F0Jh
 V8nnC5ExLwC7ZcXv6m5ixQXNUy5M+WMBh4SmeLRarr+P1n5nDUHRCW1o1x5Pq+BcKLf2
 LDhTiUEXX9BfDRntrXDxlZyGXFsI+oRv1L8d94JIGzD3174pXs3lrMWpyAw8qRT6ukOs
 6G0lH4FT698KoWL74vFlbOofb40GvIoZx3r/XaxhbuO9AeGS7l+V/eqF6EPxVn+xokZU
 zqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NlAiN393nCfoZAygvg08JmQmUPznfSWcWyubnTUIKKE=;
 b=M+XwBkNqeZIhHyRvwEmNh+FMhN4xRKPeZn3wZ4dsa6jP0SkPsOPRRV1FRLtmQOQH+q
 mn49bendmkVuXKNmJRivhD7mxqw/JkJElRAXmcE4kw1T2nBN2XqFxawF8vluYcO9Pm/7
 iJnHxuXWjJYyfRebZeGZByFjtwaiDbMbgj47MCik18pGlh4wxYGxRINDymT3MCn8MMJV
 bLAVnyR141EcFjYnbx81/pJp7XgbH5sT59XNgHb3YPShYttLz8v2SYlVgRuaJKG+X4JS
 Gj5n6gui0/i3ObM9gpImML6ltLunZlcP6+R7g9cvsw5BMocbPiYWbRbN4LQZ/6Drpwf2
 qLrQ==
X-Gm-Message-State: APjAAAVg+JhmpyTtuaN017wvGcKh9W4uEzK10G+XSYYOvdAxJYVjCg3m
 b9umnmAgqnvh27+cuj3sYgxd/w==
X-Google-Smtp-Source: APXvYqwzIQFibqNdvPGWNk3heHcVRqkP3v0Z/1/+VvfGQ7xyaMJGSMdiwbE3vgpAkeqas6x5ShMlxA==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr4216403wmi.109.1572517881852; 
 Thu, 31 Oct 2019 03:31:21 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id d4sm4614799wrc.54.2019.10.31.03.31.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:31:20 -0700 (PDT)
To: Stephen Boyd <swboyd@chromium.org>, broonie@kernel.org,
 lee.jones@linaro.org, linus.walleij@linaro.org, robh@kernel.org
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
 <5db9a34f.1c69fb81.23dfc.7ea5@mx.google.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <85aa859f-9d20-2a13-caba-d4901f18829c@linaro.org>
Date: Thu, 31 Oct 2019 10:31:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5db9a34f.1c69fb81.23dfc.7ea5@mx.google.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org,
 Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>, linux-gpio@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Stephen for reviewing this patch.

On 30/10/2019 14:50, Stephen Boyd wrote:
> Quoting Srinivas Kandagatla (2019-10-29 04:26:58)
>> From: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
>>
>> This patch adds support to wcd934x pinctrl block found in
>> WCD9340/WC9341 Audio codecs.
>>
>> [Srini: multiple cleanups to the code]
> 
> This goes after the author signoff and before yours. Can you add more
> details too?
I agree, will fix this in next spin.
> 
>> Signed-off-by: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/pinctrl/qcom/Kconfig                |   7 +
>>   drivers/pinctrl/qcom/Makefile               |   1 +
>>   drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c | 365 ++++++++++++++++++++
>>   3 files changed, 373 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>> new file mode 100644
>> index 000000000000..1aff88d0bcb3
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>> @@ -0,0 +1,365 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2019, Linaro Limited
>> +
>> +#include <linux/module.h>
>> +#include <linux/gpio.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_gpio.h>
>> +
>> +#include "../core.h"
>> +#include "../pinctrl-utils.h"
>> +
>> +#define WCD_REG_DIR_CTL_OFFSET 0x42
>> +#define WCD_REG_VAL_CTL_OFFSET 0x43
>> +#define WCD_GPIO_PULL_UP       1
>> +#define WCD_GPIO_PULL_DOWN     2
>> +#define WCD_GPIO_BIAS_DISABLE  3
>> +#define WCD_GPIO_STRING_LEN    20
>> +#define WCD934X_NPINS          5
>> +
>> +/**
>> + * struct wcd_gpio_pad - keep current GPIO settings
>> + * @offset: offset of gpio.
>> + * @is_valid: Set to false, when GPIO in high Z state.
>> + * @value: value of a pin
>> + * @output_enabled: Set to true if GPIO is output and false if it is input
>> + * @pullup: Constant current which flow through GPIO output buffer.
>> + * @strength: Drive strength of a pin
>> + */
>> +struct wcd_gpio_pad {
>> +       u16  offset;
>> +       bool is_valid;
>> +       bool value;
>> +       bool output_enabled;
>> +       unsigned int pullup;
>> +       unsigned int strength;
>> +};
>> +
>> +struct wcd_gpio_priv {
>> +       struct device *dev;
>> +       struct regmap *map;
>> +       struct pinctrl_dev *ctrl;
>> +       struct gpio_chip chip;
>> +};
>> +
>> +static int wcd_gpio_read(struct wcd_gpio_priv *priv_data,
>> +                        struct wcd_gpio_pad *pad, unsigned int addr)
>> +{
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       ret = regmap_read(priv_data->map, addr, &val);
>> +       if (ret < 0)
>> +               dev_err(priv_data->dev, "%s: read 0x%x failed\n",
>> +                       __func__, addr);
>> +       else
>> +               ret = (val >> pad->offset);
>> +
>> +       return ret;
>> +}
>> +
>> +static int wcd_gpio_write(struct wcd_gpio_priv *priv_data,
>> +                         struct wcd_gpio_pad *pad, unsigned int addr,
>> +                         unsigned int val)
>> +{
>> +       int ret;
>> +
>> +       ret = regmap_update_bits(priv_data->map, addr, (1 << pad->offset),
>> +                                val << pad->offset);
>> +       if (ret < 0)
>> +               dev_err(priv_data->dev, "write 0x%x failed\n", addr);
> 
> Is there value in these error messages? Also, use %#x to get '0x'.

I can add ret in the err message.

I did not knew about "%#x".. nice, I will use this in future!
> 
>> +
>> +       return ret;
>> +}
> [...]
>> +
>> +static int wcd_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct pinctrl_pin_desc *pindesc;
>> +       struct pinctrl_desc *pctrldesc;
>> +       struct wcd_gpio_pad *pad, *pads;
>> +       struct wcd_gpio_priv *priv_data;
>> +       u32 npins = WCD934X_NPINS;
>> +       char **name;
>> +       int i;
>> +
>> +       priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
>> +       if (!priv_data)
>> +               return -ENOMEM;
>> +
>> +       priv_data->dev = dev;
>> +       priv_data->map = dev_get_regmap(dev->parent, NULL);
>> +       if (!priv_data->map) {
>> +               dev_err(dev, "%s: failed to get regmap\n", __func__);
>> +               return  -EINVAL;
>> +       }
>> +
>> +       pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
>> +       if (!pindesc)
>> +               return -ENOMEM;
>> +
>> +       pads = devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
>> +       if (!pads)
>> +               return -ENOMEM;
> 
> Is it possible to put the pad struct around the pindesc struct? It's
> sort of sad that we have to allocate a chunk of memory twice for the
> pindesc and the pads when we could either use container_of() on the
> pindesc or just point the pindesc driver data member to the container
> structure for the qcom specific bits.
> 

I will give that a go in next version!

>> +
>> +       pctrldesc = devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
>> +       if (!pctrldesc)
>> +               return -ENOMEM;
>> +
>> +       pctrldesc->pctlops = &wcd_pinctrl_ops;
>> +       pctrldesc->confops = &wcd_pinconf_ops;
>> +       pctrldesc->owner = THIS_MODULE;
>> +       pctrldesc->name = dev_name(dev);
>> +       pctrldesc->pins = pindesc;
>> +       pctrldesc->npins = npins;
>> +
>> +       name = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
>> +       if (!name)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < npins; i++, pindesc++) {
>> +               name[i] = devm_kzalloc(dev, sizeof(char) * WCD_GPIO_STRING_LEN,
>> +                                      GFP_KERNEL);
>> +               if (!name[i])
>> +                       return -ENOMEM;
>> +
>> +               pad = &pads[i];
>> +               pindesc->drv_data = pad;
>> +               pindesc->number = i;
>> +               snprintf(name[i], (WCD_GPIO_STRING_LEN - 1), "gpio%d", (i+1));
>> +               pindesc->name = name[i];
> 
> Why not use devm_kasprintf()? The 'name' array is also unnecessary?
Am not sure why its not used her, but I can do that change in next version.

> 
>> +               pad->offset = i;
>> +               pad->is_valid  = true;
>> +       }
>> +
>> +       priv_data->chip = wcd_gpio_chip;
>> +       priv_data->chip.parent = dev;
>> +       priv_data->chip.base = -1;
>> +       priv_data->chip.ngpio = npins;
>> +       priv_data->chip.label = dev_name(dev);
>> +       priv_data->chip.of_gpio_n_cells = 2;
>> +       priv_data->chip.can_sleep = false;
>> +       platform_set_drvdata(pdev, priv_data);
>> +
>> +       priv_data->ctrl = devm_pinctrl_register(dev, pctrldesc, priv_data);
>> +       if (IS_ERR(priv_data->ctrl)) {
>> +               dev_err(dev, "%s: failed to register to pinctrl\n", __func__);
>> +               return PTR_ERR(priv_data->ctrl);
>> +       }
>> +
>> +       return gpiochip_add_data(&priv_data->chip, priv_data);
> 
> WHy not use devm_gpiochip_add_data()?

Good idea, will do that in next spin.
> 
>> +}
>> +
>> +static int wcd_pinctrl_remove(struct platform_device *pdev)
>> +{
>> +       struct wcd_gpio_priv *priv_data = platform_get_drvdata(pdev);
>> +
>> +       gpiochip_remove(&priv_data->chip);
>> +
>> +       return 0;
> 
> And drop this function?
> 
>> +}
>> +
>> +static const struct of_device_id wcd_pinctrl_of_match[] = {
>> +       { .compatible = "qcom,wcd9340-pinctrl" },
>> +       { .compatible = "qcom,wcd9341-pinctrl" },
>> +       { },
> 
> Nitpick: Drop the comma on the sentinel.
> 
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, wcd_pinctrl_of_match);
> 
> Nitpick: Drop the newline between device table and match table.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
