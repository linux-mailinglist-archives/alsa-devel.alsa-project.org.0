Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F7EC9FDA
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2019 15:51:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D711682;
	Thu,  3 Oct 2019 15:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D711682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570110663;
	bh=7Id2tmXl9yTLzh/j5OvnlHCUJFOWISlIaa3MMgvSw8o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K65DrDGO1V0NgGuV0wmr1NPAe5ngvuKQWa8cb+qiYDegNn7LqSVbtVB9Lh8sQAZm3
	 gvqclcrxHNOT6ryxHtHd3rO75CFiocbWzDaTPch9g4x9/OSddfHe1j7E+f9eW8ojsj
	 IWqamB3m2lCWu6TZCpdNGDwHLRacsPWvUDtuot30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0614F800DE;
	Thu,  3 Oct 2019 15:49:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F57F80506; Thu,  3 Oct 2019 15:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E8E8F800DE
 for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2019 15:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E8E8F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g5bqyc+S"
Received: by mail-pg1-x542.google.com with SMTP id e1so1827026pgj.6
 for <alsa-devel@alsa-project.org>; Thu, 03 Oct 2019 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qU/cSK+gU0JMwekDW0OdJ5TrbgcsghmAEgHcPcX1S2k=;
 b=g5bqyc+SxxFTKMciAJGqkfhULufeEd+uxmtC1Qt5rQ3zY8WPH3Un20Sh63H/Lr35Za
 /ok5MYSDtd7ExrDo8YQZXFhIpBqRTXdXF+N+MASVWyiFa5OGgaHb4k+ivGZkRBOwllZN
 eCCAdRZlcQJ8CtEvdwDy5ML8Yg3TuMLbX7UQc+bjnaGiME56qrXji23u7WRuTpwNNjir
 FjMmUUnBLer+Wm7FAKVClPjjJ6qg9i1XQ2A2jgcahWzHtLesUON4q6pGYe4LicQzF+Iw
 ITVMhAiJO3OBEnHYE/K/NlpMQLm99Sk8nea14nwtOR6ANFjYdsy4JFI29fYj2rcR9Mx7
 CipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qU/cSK+gU0JMwekDW0OdJ5TrbgcsghmAEgHcPcX1S2k=;
 b=kXlJPu8Qw/vWOzb52jb8iIS5co3+qOSgtVX6BTj7GQtEXXcEKvxg1ntSLpIjsT43gT
 6hrxJOPmyDjHT6WT1+YiXZpNsQ6FPtl4GGgh/S3BMsEkBfpSl4dND+Q3JDoWjLNRXUED
 moSvsThZHdFgbusrj40+0T50MaGEUavQfpxbv1KrTm1c0iF43gH/3LPj8ajHk9ubmama
 /oqEgV4H4gouFb4ciQkMwVEA/h2QfNtN9JDqRiS5rEJahx8ezfBmtp+dvOtoJaVp8L+F
 27eJNfTXlMLwG5UBeYSO2QxGOFHXDBbqMmh47G1FVKoUw7uU4eXD6wVSg73B9BYRfCIN
 MFxg==
X-Gm-Message-State: APjAAAUQlwmEC/hWeG5vSazpsfURZvbLLSIcnQowvFlmyIi2VRd9ZTIg
 Ec0q1MXsfj/tYKnzLSqrnLU=
X-Google-Smtp-Source: APXvYqzquTPlIumLqDSbquXgm9egj/HTho3XxuimSqPb+VpT9+lG1OV9vKSChaHrulANom6lBe+hIA==
X-Received: by 2002:aa7:98d2:: with SMTP id e18mr11127889pfm.188.1570110549253; 
 Thu, 03 Oct 2019 06:49:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d10sm3086757pfh.8.2019.10.03.06.49.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 06:49:07 -0700 (PDT)
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 mark.rutland@arm.com, robh+dt@kernel.org, wim@linux-watchdog.org
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
Date: Thu, 3 Oct 2019 06:49:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com, lgirdwood@gmail.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add
	reset controller
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

On 9/27/19 3:31 AM, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Provide assert/deassert/reset API in watchdog driver.
> Register reset controller for toprgu device in watchdog probe.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>   drivers/watchdog/Kconfig   |   1 +
>   drivers/watchdog/mtk_wdt.c | 110 ++++++++++++++++++++++++++++++++++++-
>   2 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 2e07caab9db2..629249fe5305 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
>   	tristate "Mediatek SoCs watchdog support"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
>   	select WATCHDOG_CORE
> +	select RESET_CONTROLLER
>   	help
>   	  Say Y here to include support for the watchdog timer
>   	  in Mediatek SoCs.
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 9c3d0033260d..660fb0e48d8e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -20,6 +20,10 @@
>   #include <linux/types.h>
>   #include <linux/watchdog.h>
>   #include <linux/delay.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/reset.h>
> +#include <linux/of_device.h>
>   
>   #define WDT_MAX_TIMEOUT		31
>   #define WDT_MIN_TIMEOUT		1
> @@ -44,17 +48,113 @@
>   #define WDT_SWRST		0x14
>   #define WDT_SWRST_KEY		0x1209
>   
> +#define WDT_SWSYSRST		0x18U
> +#define WDT_SWSYS_RST_KEY	0x88000000
> +
>   #define DRV_NAME		"mtk-wdt"
>   #define DRV_VERSION		"1.0"
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
>   static unsigned int timeout;
>   
> +struct toprgu_reset {
> +	spinlock_t lock; /* Protects reset_controller access */
> +	void __iomem *toprgu_swrst_base;
> +	int regofs;
> +	struct reset_controller_dev rcdev;
> +};
> +
>   struct mtk_wdt_dev {
>   	struct watchdog_device wdt_dev;
>   	void __iomem *wdt_base;
> +	struct toprgu_reset reset_controller;
> +	const struct mtk_wdt_compatible *dev_comp;

"dev_comp" suggests that this would be a device name. In practice,
the only value there is sw_rst_num, and the value is only
used in toprgu_register_reset_controller(). Might as well pass
it as argument and drop this pointer.

> +};
> +
> +struct mtk_wdt_compatible {
> +	int sw_rst_num;
> +};
> +
"compatible" is an odd name for this structure. I would suggest
to select a more common name such as "mtk_wdt_data".

> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct toprgu_reset *data = container_of(rcdev,
> +				struct toprgu_reset, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> +	tmp |= BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct toprgu_reset *data = container_of(rcdev,
> +					struct toprgu_reset, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> +	tmp &= ~BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int toprgu_reset(struct reset_controller_dev *rcdev,
> +			unsigned long id)
> +{
> +	int ret;
> +
> +	ret = toprgu_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return toprgu_reset_deassert(rcdev, id);

Unless there is additional synchronization elsewhere, parallel calls
to the -> assert, and ->reset callbacks may result in the reset being
deasserted while at least one caller (the one who called the ->assert
function) believes that it is still asserted.

[ ... and if there _is_ additional synchronization elsewhere, the
   local spinlock would be unnecessary ]

> +}
> +
> +static struct reset_control_ops toprgu_reset_ops = {
> +	.assert = toprgu_reset_assert,
> +	.deassert = toprgu_reset_deassert,
> +	.reset = toprgu_reset,
>   };
>   
> +static void toprgu_register_reset_controller(struct platform_device *pdev,
> +					     int regofs)

Since there is only one well defined offset, it seems unnecessary to pass
regofs as parameter.

> +{
> +	int ret;
> +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&mtk_wdt->reset_controller.lock);
> +
> +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);

Duplicate, and not really needed. Just pass sw_rst_num as argument.

> +	mtk_wdt->reset_controller.toprgu_swrst_base = mtk_wdt->wdt_base;
> +	mtk_wdt->reset_controller.regofs = regofs;
> +	mtk_wdt->reset_controller.rcdev.owner = THIS_MODULE;
> +	mtk_wdt->reset_controller.rcdev.nr_resets =
> +				mtk_wdt->dev_comp->sw_rst_num;
> +	mtk_wdt->reset_controller.rcdev.ops = &toprgu_reset_ops;
> +	mtk_wdt->reset_controller.rcdev.of_node = pdev->dev.of_node;
> +	ret = reset_controller_register(&mtk_wdt->reset_controller.rcdev);
> +	if (ret != 0)
> +		dev_err(&pdev->dev,
> +			"couldn't register wdt reset controller: %d\n", ret);
> +}
> +
>   static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>   			   unsigned long action, void *data)
>   {
> @@ -187,9 +287,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   	if (unlikely(err))
>   		return err;
>   
> -	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> +	dev_info(&pdev->dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>   		 mtk_wdt->wdt_dev.timeout, nowayout);
>   
> +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> +	if (mtk_wdt->dev_comp)
> +		toprgu_register_reset_controller(pdev, WDT_SWSYSRST);
>   	return 0;
>   }
>   
> @@ -217,7 +320,12 @@ static int mtk_wdt_resume(struct device *dev)
>   }
>   #endif
>   
> +static const struct mtk_wdt_compatible mt8183_compat = {
> +	.sw_rst_num = 18,

Please no such magic numbers. This should be a define in an include file.

> +};
> +
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
> +	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_compat },
>   	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ /* sentinel */ }
>   };
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
