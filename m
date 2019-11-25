Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B81088AB
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 07:18:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79CD31898;
	Mon, 25 Nov 2019 07:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79CD31898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574662702;
	bh=gyG5h0dWof/bDgP3EghSVTBimM1Ip4cfic2OhGHBJKw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aY/jiZwK56vETHFHVLz8Y8eEfCUPW1VfdkNHONwn/EmwLsI+fVX3cWDSH7bdLRdjM
	 Ruq8nKOj/4zsYALc/y6WO96xo7ff9uqq51SBm5s0Pr2MpmIfds2Dvy1UpbCff6ceTU
	 c3xnNrK6iP6gHymKNF7Vx9yYAqfcRXJfAEyxZtYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF74F8019B;
	Mon, 25 Nov 2019 07:16:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A72BF8016F; Mon, 25 Nov 2019 07:16:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FAKE_REPLY_C,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA1A1F800AB
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 07:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA1A1F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fj9HaZFO"
Received: by mail-oi1-x244.google.com with SMTP id s71so12017013oih.11
 for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2019 22:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=NJpCr4R+3WAviM6SLTFzHWBfwjLNKZd7X8haWCV9GGo=;
 b=Fj9HaZFO/ioVEu7CN+ICTXq3cx8z6tPa5p49DKGQplUHKhsiDMoVlAuw9Ur7/7Zg71
 j5ysfoV4qmYlrCoK48AT2tExVSD7cg5YeEbPi3zPXvlaqiEGEV6tPGKeNbs7/FHMBGx6
 JJbxuQ/AIzJinJxFlEg0f7bbVz0xq3WhoNyqt40izHSVuvdvY7O8xwYuM8Xt4gCYdB12
 sAVXF4vaurV+9fJew7sfWyxEwPjVdc0ycOYPEAXwxxwO825ciVQ21t06cmgSBPej1cpb
 d2xG+ZA8dJNUeGzfs7wm3AoEIBKlwmdz06EGsQe0ZdpNTte70pPHbrDGX0oRHuU8EykR
 ummQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=NJpCr4R+3WAviM6SLTFzHWBfwjLNKZd7X8haWCV9GGo=;
 b=FQeskConn/0NRcwIk6WZ7QEC1/IgMpS3EawxxA+oh7yEtdV3XOGp06xLfbf/OImi1O
 FGZXeyt9wEtTm2XLtsiB6vw3XtFXUe5Df8PTiaRBFcL6S4R4R695Zj4viLQPqWojqEIO
 pgVRGI/N2RfrKhoDC1Te6hlMlef2B+NiZZVFS/jISId1NKqFDjXvDfQ/ArCNrP2sILQs
 Sc8W5njx0T8SE218ExhiNzc2NYgmO3nrmpVjB0FgF/urN2AnvvJg8BCX7oV7/uRQFE/Q
 c3Et0W7oPCUhcBlpJNAaprmOgIbBLEhBNcmzgVMbFGdYTo4GVI2OO/4shjIsA6BGLS11
 1wsw==
X-Gm-Message-State: APjAAAXhq4xIdklUyXjsM7DfUHimzNnMXarE1usHWu4ES9rItBP7J1r9
 6VDoCEq3axHMG6kp7BhEBlI=
X-Google-Smtp-Source: APXvYqyEa9YLh7eHkAthmKMtOoTEUu01iwoOqoASwt+6SYp3Biv4O6+q/c71MxSRFOvOQmoPm6v0WQ==
X-Received: by 2002:aca:5a08:: with SMTP id o8mr20541735oib.104.1574662588984; 
 Sun, 24 Nov 2019 22:16:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c1sm2112384otn.44.2019.11.24.22.16.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Nov 2019 22:16:28 -0800 (PST)
Date: Sun, 24 Nov 2019 22:16:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Message-ID: <20191125061627.GA7313@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 eason.yen@mediatek.com, yingjoe.chen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 2/2] watchdog: mtk_wdt: mt8183: Add
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 25, 2019 at 11:03:50AM +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add reset controller API in watchdog driver.
> Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
>  drivers/watchdog/Kconfig   |   1 +
>  drivers/watchdog/mtk_wdt.c | 111 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 2e07caab9db2..629249fe5305 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
>  	tristate "Mediatek SoCs watchdog support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select WATCHDOG_CORE
> +	select RESET_CONTROLLER
>  	help
>  	  Say Y here to include support for the watchdog timer
>  	  in Mediatek SoCs.
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 9c3d0033260d..d29484c7940a 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,9 @@
>   * Based on sunxi_wdt.c
>   */
>  
> +#include <dt-bindings/reset-controller/mt2712-resets.h>
> +#include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -16,10 +19,12 @@
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> -#include <linux/delay.h>
>  
>  #define WDT_MAX_TIMEOUT		31
>  #define WDT_MIN_TIMEOUT		1
> @@ -44,6 +49,9 @@
>  #define WDT_SWRST		0x14
>  #define WDT_SWRST_KEY		0x1209
>  
> +#define WDT_SWSYSRST		0x18U
> +#define WDT_SWSYS_RST_KEY	0x88000000
> +
>  #define DRV_NAME		"mtk-wdt"
>  #define DRV_VERSION		"1.0"
>  
> @@ -53,8 +61,99 @@ static unsigned int timeout;
>  struct mtk_wdt_dev {
>  	struct watchdog_device wdt_dev;
>  	void __iomem *wdt_base;
> +	spinlock_t lock; /* protects WDT_SWSYSRST reg */
> +	struct reset_controller_dev rcdev;
> +};
> +
> +struct mtk_wdt_data {
> +	int sw_rst_num;
>  };
>  
> +static const struct mtk_wdt_data mt2712_data = {
> +	.sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +};
> +
> +static const struct mtk_wdt_data mt8183_data = {
> +	.sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> +};

The number of resets can be set in .data directly; there is no need
for the structures.

> +
> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct mtk_wdt_dev *data =
> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
> +	tmp |= BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
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
> +	struct mtk_wdt_dev *data =
> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
> +	tmp &= ~BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}

There is a lot of duplication in those functions. Only one line
is different. I think this is a good example where a helper function
with an additional argument indicating set or reset would be helpful.

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
> +}
> +
> +static const struct reset_control_ops toprgu_reset_ops = {
> +	.assert = toprgu_reset_assert,
> +	.deassert = toprgu_reset_deassert,
> +	.reset = toprgu_reset,
> +};
> +
> +static int toprgu_register_reset_controller(struct platform_device *pdev,
> +					    int rst_num)
> +{
> +	int ret;
> +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&mtk_wdt->lock);
> +
> +	mtk_wdt->rcdev.owner = THIS_MODULE;
> +	mtk_wdt->rcdev.nr_resets = rst_num;
> +	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
> +	mtk_wdt->rcdev.of_node = pdev->dev.of_node;
> +	ret = reset_controller_register(&mtk_wdt->rcdev);
> +	if (ret != 0)
> +		dev_err(&pdev->dev,
> +			"couldn't register wdt reset controller: %d\n", ret);
> +	return ret;
> +}
> +
>  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>  			   unsigned long action, void *data)
>  {
> @@ -155,6 +254,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
> +	struct mtk_wdt_data *wdt_data;
>  	int err;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -190,6 +290,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>  		 mtk_wdt->wdt_dev.timeout, nowayout);
>  
> +	wdt_data = (struct mtk_wdt_data *)of_device_get_match_data(dev);
> +	if (wdt_data) {
> +		err = toprgu_register_reset_controller(pdev,
> +						       wdt_data->sw_rst_num);
> +		if (err)
> +			return err;

If this happens, the user will wonder why there was a message "Watchdog
enabled", but there is no watchdog. It would be better to call this
function before the dev_info() above.

Guenter

> +	}
>  	return 0;
>  }
>  
> @@ -218,7 +325,9 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> -- 
> 2.18.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
