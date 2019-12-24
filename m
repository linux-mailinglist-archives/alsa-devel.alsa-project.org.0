Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7933E129EA3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Dec 2019 08:48:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17C941699;
	Tue, 24 Dec 2019 08:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17C941699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577173710;
	bh=VPg5NRUAPQSf3C0Yt5C052FQc8IbI6zIV7svYXnt5tw=;
	h=In-Reply-To:References:From:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Su7klcjqZf7stye8Z3uC/SPF/qPxkT4MNeUkdZ6Ux9eb3/f621CJKJ49DjTnc70kQ
	 UPqwSfMeiiUh5ct9Y+t7eobSEFeFgxqkiPVFSXVjNHUwtr+mcDY9s+ibrs7we4RRNV
	 D83mo0liDYry2AFREsRdMhgDRBIdiocFQdtOhAiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE1FF8014C;
	Tue, 24 Dec 2019 08:46:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 280EBF800E3; Tue, 24 Dec 2019 08:46:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61F49F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 Dec 2019 08:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F49F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JdfRkv/i"
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1589220706;
 Tue, 24 Dec 2019 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577173599;
 bh=1BJxrvDxsrR7VIQZMUVHbOxilZxPHKLhLbtnCYK0wCI=;
 h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
 b=JdfRkv/iA1GPjKltY9g+b6rJwS1+cIxjN0vr48ttnpmYMEX8QPn5meFCchbWv1huh
 l5/CLVEWnsvGvfxUOH+WSJj1UElcjrFHTrpxVoM+UwvZIgbLRtqAKwkA5RoQzbHRTr
 W3VvVkpDVzCB4m2PWvDaoMi4Nd5r5ZrjumyhIS7s=
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-11-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-11-daniel@zonque.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Daniel Mack <daniel@zonque.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date: Mon, 23 Dec 2019 23:46:38 -0800
Message-Id: <20191224074639.1589220706@mail.kernel.org>
Cc: lars@metafoo.de, mturquette@baylibre.com, robh+dt@kernel.org,
 broonie@kernel.org, pascal.huerst@gmail.com, lee.jones@linaro.org,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [alsa-devel] [PATCH 09/10] clk: Add support for AD242x clock
	output providers
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

Quoting Daniel Mack (2019-12-09 10:35:10)
> diff --git a/drivers/clk/clk-ad242x.c b/drivers/clk/clk-ad242x.c
> new file mode 100644
> index 000000000000..201789d8f174
> --- /dev/null
> +++ b/drivers/clk/clk-ad242x.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>

Is this include used?

> +#include <linux/mfd/ad242x.h>

Any way we can avoid this build dependency? Maybe just put defines in
this driver that deals with the clk bits of the device?

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/adi,ad242x.h>
> +
> +#define AD242X_NUM_CLKS 2
> +
> +struct ad242x_clk_hw {
> +       struct clk_hw hw;
> +       struct clk_init_data init;

Do we need to keep around this init data after probe? I'd rather leave
this out.

> +       struct ad242x_node *node;

What's the point of this structure? Can we use dev->parent->regmap and
just store the struct regmap pointer here instead of using this custom
struct?

> +       u8 reg;
> +};
> +
> +struct ad242x_clk_driver_data {
> +       struct ad242x_clk_hw hw[AD242X_NUM_CLKS];

If this is the only drvdata, then I'd prefer just the array and not
another struct so we can have clarity.

> +};
> +
> +static inline struct ad242x_clk_hw *to_ad242x_clk(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct ad242x_clk_hw, hw);
> +}
> +
[...]
> +
> +static long ad242x_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                 unsigned long *parent_rate)
> +{
> +       unsigned long pll_rate = *parent_rate * 2048UL;
> +       unsigned long prediv, div;
> +
> +       if (rate > pll_rate / 4 || rate < pll_rate / 1024UL)
> +               return -EINVAL;

This callback should round the rate to something valid. If the rate is
larger than pll_rate / 4 then it should clamp to be the highest rate
supported. Likewise for something slow.

> +
> +       ad242x_do_div(rate, pll_rate, &prediv, &div);
> +
> +       return pll_rate / (prediv * div);
> +}
> +
[...]
> +
> +static struct clk_hw *
> +ad242x_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct ad242x_clk_driver_data *drvdata = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       return &drvdata->hw[idx].hw;

It looks quite a bit like of_clk_hw_onecell_get(). Can that be used? Or
at least check for out of bounds and return failure?

> +}
> +
> +static int ad242x_clk_probe(struct platform_device *pdev)
> +{
> +       const char *clk_names[AD242X_NUM_CLKS] = { "clkout1", "clkout2" };
> +       u8 regs[AD242X_NUM_CLKS] = { AD242X_CLK1CFG, AD242X_CLK2CFG };
> +       struct ad242x_clk_driver_data *drvdata;
> +       struct device *dev = &pdev->dev;
> +       const char *sync_clk_name;
> +       struct ad242x_node *node;
> +       int i, ret;
> +
> +       if (!dev->of_node)
> +               return -ENODEV;

Please drop this. It's not useful.

> +
> +       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +       if (!drvdata)
> +               return -ENOMEM;
> +
> +       node = dev_get_drvdata(dev->parent);

Add a NULL check on node?

> +       sync_clk_name = ad242x_master_get_clk_name(node->master);
> +
> +       for (i = 0; i < AD242X_NUM_CLKS; i++) {
> +               const char *name;
> +
> +               if (of_property_read_string_index(dev->of_node,
> +                                                 "clock-output-names",
> +                                                 i, &name) == 0)
> +                       drvdata->hw[i].init.name = name;
> +               else
> +                       drvdata->hw[i].init.name = clk_names[i];

Do you need unique names? Or can you generate psuedo unique names based
on the device name and clk number?

> +
> +               drvdata->hw[i].reg = regs[i];
> +               drvdata->hw[i].init.ops = &ad242x_clk_ops;
> +               drvdata->hw[i].init.num_parents = 1;
> +               drvdata->hw[i].init.parent_names = &sync_clk_name;
> +               drvdata->hw[i].hw.init = &drvdata->hw[i].init;
> +               drvdata->hw[i].node = node;
> +
> +               ret = devm_clk_hw_register(dev, &drvdata->hw[i].hw);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       return devm_of_clk_add_hw_provider(dev, ad242x_of_clk_get, drvdata);
> +}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
