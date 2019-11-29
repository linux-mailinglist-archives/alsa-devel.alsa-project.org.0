Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE6D10D44B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 11:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E926616D9;
	Fri, 29 Nov 2019 11:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E926616D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575024108;
	bh=n1AIoNZVO1OJ8TrvQvRrsEMhYnv0Q64uqW+peLogaG4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3Bi2W9Vf/6rD4vMId3+4Elxj2GbaFI8Il25e+zQ0+W/Ers6irQ0iUGLu7W0ePTo9
	 vMgPCQtrvzsa9rye6Ml28pUt61Eq8kAF7lUgT9fx9s/VSoaYBpVwTe2EUUT0NObC56
	 8DPVUzJ6FOF3/xRD7C4NUSEvjm/cXrIWc7cX2jik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2B4CF80141;
	Fri, 29 Nov 2019 11:40:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1884F80141; Fri, 29 Nov 2019 11:39:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id ACA79F800B3
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 11:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA79F800B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="S9fljcIm"
X-UUID: 54a532374be7472d9a922fd8af321a02-20191129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6cf6mmfNAO4UYSLfUL+2gAahPm940KNzW92/hNa0blE=; 
 b=S9fljcImchsBWS8XTYWwDM0oFmmOPEXhkL6FxMhwnRJsuAPjTQAXxIP1JEAWBTOAIQajifG+8yNUCeTlJIKr0KlPuJfQDh2A7KOu0zAhfjpIfQ9P8L8+FakE5H/EQZgLxV/OIF3e9X2nKvBFmR+TELH20WoYPq9Y13sXdIGxamo=;
X-UUID: 54a532374be7472d9a922fd8af321a02-20191129
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1855693442; Fri, 29 Nov 2019 18:39:28 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 29 Nov 2019 18:39:24 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 29 Nov 2019 18:39:36 +0800
Message-ID: <1575023965.7013.11.camel@mhfsdcap03>
From: Yong Liang <yong.liang@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 29 Nov 2019 18:39:25 +0800
In-Reply-To: <20191125061627.GA7313@roeck-us.net>
References: <20191125061627.GA7313@roeck-us.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5BAB322DC3378F90D8037FD05A9217D7F4FF5E31E670244183F6515D6B79EC0D2000:8
X-MTK: N
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tzungbi@google.com" <tzungbi@google.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Eason Yen =?UTF-8?Q?=28=E9=A1=8F=E5=BB=B7=E4=BB=BB=29?=
 <Eason.Yen@mediatek.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Mon, 2019-11-25 at 14:16 +0800, Guenter Roeck wrote:
> On Mon, Nov 25, 2019 at 11:03:50AM +0800, Jiaxin Yu wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> > 
> > Add reset controller API in watchdog driver.
> > Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
> > camera, codec and connectivity) software reset functionality.
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > ---
> >  drivers/watchdog/Kconfig   |   1 +
> >  drivers/watchdog/mtk_wdt.c | 111 ++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 111 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 2e07caab9db2..629249fe5305 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
> >  	tristate "Mediatek SoCs watchdog support"
> >  	depends on ARCH_MEDIATEK || COMPILE_TEST
> >  	select WATCHDOG_CORE
> > +	select RESET_CONTROLLER
> >  	help
> >  	  Say Y here to include support for the watchdog timer
> >  	  in Mediatek SoCs.
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index 9c3d0033260d..d29484c7940a 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -9,6 +9,9 @@
> >   * Based on sunxi_wdt.c
> >   */
> >  
> > +#include <dt-bindings/reset-controller/mt2712-resets.h>
> > +#include <dt-bindings/reset-controller/mt8183-resets.h>
> > +#include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> > @@ -16,10 +19,12 @@
> >  #include <linux/module.h>
> >  #include <linux/moduleparam.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <linux/watchdog.h>
> > -#include <linux/delay.h>
> >  
> >  #define WDT_MAX_TIMEOUT		31
> >  #define WDT_MIN_TIMEOUT		1
> > @@ -44,6 +49,9 @@
> >  #define WDT_SWRST		0x14
> >  #define WDT_SWRST_KEY		0x1209
> >  
> > +#define WDT_SWSYSRST		0x18U
> > +#define WDT_SWSYS_RST_KEY	0x88000000
> > +
> >  #define DRV_NAME		"mtk-wdt"
> >  #define DRV_VERSION		"1.0"
> >  
> > @@ -53,8 +61,99 @@ static unsigned int timeout;
> >  struct mtk_wdt_dev {
> >  	struct watchdog_device wdt_dev;
> >  	void __iomem *wdt_base;
> > +	spinlock_t lock; /* protects WDT_SWSYSRST reg */
> > +	struct reset_controller_dev rcdev;
> > +};
> > +
> > +struct mtk_wdt_data {
> > +	int sw_rst_num;
> >  };
> >  
> > +static const struct mtk_wdt_data mt2712_data = {
> > +	.sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> > +};
> > +
> > +static const struct mtk_wdt_data mt8183_data = {
> > +	.sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> > +};
> 
> The number of resets can be set in .data directly; there is no need
> for the structures.
> 
> > +
> > +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> > +			       unsigned long id)
> > +{
> > +	unsigned int tmp;
> > +	unsigned long flags;
> > +	struct mtk_wdt_dev *data =
> > +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> > +
> > +	spin_lock_irqsave(&data->lock, flags);
> > +
> > +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
> > +	tmp |= BIT(id);
> > +	tmp |= WDT_SWSYS_RST_KEY;
> > +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
> > +
> > +	spin_unlock_irqrestore(&data->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> > +				 unsigned long id)
> > +{
> > +	unsigned int tmp;
> > +	unsigned long flags;
> > +	struct mtk_wdt_dev *data =
> > +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> > +
> > +	spin_lock_irqsave(&data->lock, flags);
> > +
> > +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
> > +	tmp &= ~BIT(id);
> > +	tmp |= WDT_SWSYS_RST_KEY;
> > +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
> > +
> > +	spin_unlock_irqrestore(&data->lock, flags);
> > +
> > +	return 0;
> > +}
> 
> There is a lot of duplication in those functions. Only one line
> is different. I think this is a good example where a helper function
> with an additional argument indicating set or reset would be helpful.
> 
> > +
> > +static int toprgu_reset(struct reset_controller_dev *rcdev,
> > +			unsigned long id)
> > +{
> > +	int ret;
> > +
> > +	ret = toprgu_reset_assert(rcdev, id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return toprgu_reset_deassert(rcdev, id);
> > +}
> > +
> > +static const struct reset_control_ops toprgu_reset_ops = {
> > +	.assert = toprgu_reset_assert,
> > +	.deassert = toprgu_reset_deassert,
> > +	.reset = toprgu_reset,
> > +};
> > +
> > +static int toprgu_register_reset_controller(struct platform_device *pdev,
> > +					    int rst_num)
> > +{
> > +	int ret;
> > +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> > +
> > +	spin_lock_init(&mtk_wdt->lock);
> > +
> > +	mtk_wdt->rcdev.owner = THIS_MODULE;
> > +	mtk_wdt->rcdev.nr_resets = rst_num;
> > +	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
> > +	mtk_wdt->rcdev.of_node = pdev->dev.of_node;
> > +	ret = reset_controller_register(&mtk_wdt->rcdev);
> > +	if (ret != 0)
> > +		dev_err(&pdev->dev,
> > +			"couldn't register wdt reset controller: %d\n", ret);
> > +	return ret;
> > +}
> > +
> >  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
> >  			   unsigned long action, void *data)
> >  {
> > @@ -155,6 +254,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct mtk_wdt_dev *mtk_wdt;
> > +	struct mtk_wdt_data *wdt_data;
> >  	int err;
> >  
> >  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> > @@ -190,6 +290,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> >  		 mtk_wdt->wdt_dev.timeout, nowayout);
> >  
> > +	wdt_data = (struct mtk_wdt_data *)of_device_get_match_data(dev);
> > +	if (wdt_data) {
> > +		err = toprgu_register_reset_controller(pdev,
> > +						       wdt_data->sw_rst_num);
> > +		if (err)
> > +			return err;
> 
> If this happens, the user will wonder why there was a message "Watchdog
> enabled", but there is no watchdog. It would be better to call this
> function before the dev_info() above.
> 
> Guenter

  It will return err just if .compatible has no .data value, just like
"mediatek,mt6589-wdt". Bus watchdog is still enable.
> 
> > +	}
> >  	return 0;
> >  }
> >  
> > @@ -218,7 +325,9 @@ static int mtk_wdt_resume(struct device *dev)
> >  #endif
> >  
> >  static const struct of_device_id mtk_wdt_dt_ids[] = {
> > +	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> >  	{ .compatible = "mediatek,mt6589-wdt" },
> > +	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> > -- 
> > 2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
