Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812AC1CC5
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 10:19:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C107166F;
	Mon, 30 Sep 2019 10:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C107166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569831560;
	bh=YsHE5AYRLywu2Vqqe7g0zhasOkdv8EYApHGdgLIaitM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkAN8O+iyD8XoPEI6J+RHKauS3f/GS+jvBadXQZTVzDRl4FfrQMcMrx5Bp/+IcP9y
	 c4MuNQI04gt/GCUHvh1JVb0zQJCnOQHF986Fm8q0r/khkwStsqXK+aq03t0oEmuzgA
	 s7bct0c1TL/KJpjrAuhMPqBrf7f2RJeEQjJXGuXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4FDF80391;
	Mon, 30 Sep 2019 10:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADA0EF8036E; Mon, 30 Sep 2019 10:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 999C9F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 10:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 999C9F800D0
X-UUID: 961f3dbc56d04faa99af32a43511a526-20190930
X-UUID: 961f3dbc56d04faa99af32a43511a526-20190930
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1501313422; Mon, 30 Sep 2019 16:17:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Sep 2019 16:17:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Sep 2019 16:17:18 +0800
Message-ID: <1569831439.15728.9.camel@mtksdaap41>
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 30 Sep 2019 16:17:19 +0800
In-Reply-To: <20190928174923.GA25512@roeck-us.net>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <20190928174923.GA25512@roeck-us.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, wim@linux-watchdog.org,
 broonie@kernel.org, yong.liang@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, lgirdwood@gmail.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, eason.yen@mediatek.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 2019-09-28 at 10:49 -0700, Guenter Roeck wrote:
> On Fri, Sep 27, 2019 at 06:31:55PM +0800, Jiaxin Yu wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> > 
> > Provide assert/deassert/reset API in watchdog driver.
> > Register reset controller for toprgu device in watchdog probe.
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > ---
> >  drivers/watchdog/Kconfig   |   1 +
> >  drivers/watchdog/mtk_wdt.c | 110 ++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 110 insertions(+), 1 deletion(-)
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

<...snip...> 

> > +static void toprgu_register_reset_controller(struct platform_device *pdev,
> > +					     int regofs)
> > +{
> > +	int ret;
> > +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> > +
> > +	spin_lock_init(&mtk_wdt->reset_controller.lock);
> > +
> > +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> > +	mtk_wdt->reset_controller.toprgu_swrst_base = mtk_wdt->wdt_base;
> > +	mtk_wdt->reset_controller.regofs = regofs;
> > +	mtk_wdt->reset_controller.rcdev.owner = THIS_MODULE;
> > +	mtk_wdt->reset_controller.rcdev.nr_resets =
> > +				mtk_wdt->dev_comp->sw_rst_num;
> > +	mtk_wdt->reset_controller.rcdev.ops = &toprgu_reset_ops;
> > +	mtk_wdt->reset_controller.rcdev.of_node = pdev->dev.of_node;
> > +	ret = reset_controller_register(&mtk_wdt->reset_controller.rcdev);
> > +	if (ret != 0)
> > +		dev_err(&pdev->dev,
> > +			"couldn't register wdt reset controller: %d\n", ret);
> > +}
> > +
> >  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
> >  			   unsigned long action, void *data)
> >  {
> > @@ -187,9 +287,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  	if (unlikely(err))
> >  		return err;
> >  
> > -	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> > +	dev_info(&pdev->dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> >  		 mtk_wdt->wdt_dev.timeout, nowayout);
> >  
> > +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> > +	if (mtk_wdt->dev_comp)
> > +		toprgu_register_reset_controller(pdev, WDT_SWSYSRST);
> 
> Please explain why you can not use the watchdog device built-in support
> for handling system resets.

Guenter,

This is not about system reset.
Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
camera, codec and connectivity) software reset functionality. Software
can use this to reset specific sub-system.

This patch add support for this using reset controller framework. We
follow the case of drivers/clk/mediatek/reset.c to add this
functionality in watchdog driver.

Joe.C



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
