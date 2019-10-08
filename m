Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB34CFC08
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 16:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA2E61660;
	Tue,  8 Oct 2019 16:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA2E61660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570543848;
	bh=aE0WBhQX/Z1/s+YEsZsMjNtpNVgiu2ZIixsDyoKnSFA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAbDK785JScGEkRx8yvDRk0ZjEKxO9TtaJ8zTMwFvEnsG0mVR2pwbAXT1xuKoFQMl
	 XiR93BRfHvcltA7TVm0bSnYjyjqAro8u5Vw4nEmWrLoWvbh6mqi0ORf6v336Tw457X
	 8Bq6C5o9iGtdsgJZp585w5Bh7THMIcCAZ3/O6rpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C31F80447;
	Tue,  8 Oct 2019 16:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF1DDF8038F; Tue,  8 Oct 2019 16:09:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B97DF80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 16:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B97DF80113
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iHqAL-0005tE-74; Tue, 08 Oct 2019 16:08:41 +0200
Message-ID: <1570543719.18914.7.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>, Yingjoe Chen
 <yingjoe.chen@mediatek.com>
Date: Tue, 08 Oct 2019 16:08:39 +0200
In-Reply-To: <70b77fb3-7186-734d-3415-64acb30bab8f@roeck-us.net>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
 <1570255179.29077.24.camel@mtksdaap41>
 <70b77fb3-7186-734d-3415-64acb30bab8f@roeck-us.net>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 yong.liang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
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

Hi Guenter, Yingjoe,

On Sat, 2019-10-05 at 07:46 -0700, Guenter Roeck wrote:
> On 10/4/19 10:59 PM, Yingjoe Chen wrote:
> > On Thu, 2019-10-03 at 06:49 -0700, Guenter Roeck wrote:
> > > On 9/27/19 3:31 AM, Jiaxin Yu wrote:
> > 
> > <snip..>
> > 
> > 
> > > > +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> > > > +			       unsigned long id)
> > > > +{
> > > > +	unsigned int tmp;
> > > > +	unsigned long flags;
> > > > +	struct toprgu_reset *data = container_of(rcdev,
> > > > +				struct toprgu_reset, rcdev);
> > > > +
> > > > +	spin_lock_irqsave(&data->lock, flags);
> > > > +
> > > > +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> > > > +	tmp |= BIT(id);
> > > > +	tmp |= WDT_SWSYS_RST_KEY;
> > > > +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> > > > +
> > > > +	spin_unlock_irqrestore(&data->lock, flags);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> > > > +				 unsigned long id)
> > > > +{
> > > > +	unsigned int tmp;
> > > > +	unsigned long flags;
> > > > +	struct toprgu_reset *data = container_of(rcdev,
> > > > +					struct toprgu_reset, rcdev);
> > > > +
> > > > +	spin_lock_irqsave(&data->lock, flags);
> > > > +
> > > > +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> > > > +	tmp &= ~BIT(id);
> > > > +	tmp |= WDT_SWSYS_RST_KEY;
> > > > +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> > > > +
> > > > +	spin_unlock_irqrestore(&data->lock, flags);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int toprgu_reset(struct reset_controller_dev *rcdev,
> > > > +			unsigned long id)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = toprgu_reset_assert(rcdev, id);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return toprgu_reset_deassert(rcdev, id);
> > > 
> > > Unless there is additional synchronization elsewhere, parallel calls
> > > to the -> assert, and ->reset callbacks may result in the reset being
> > > deasserted while at least one caller (the one who called the ->assert
> > > function) believes that it is still asserted.
> > > 
> > > [ ... and if there _is_ additional synchronization elsewhere, the
> > >     local spinlock would be unnecessary ]
> > > 
> > 
> > I'm not sure if this count as additional synchronization, but you could
> > get exclusive control to the reset by calling
> > reset_control_get_exclusive so others won't try to reset the component
> > while you are using it.
> > 
> > In this case, you still need spinlock because other drivers might trying
> > to reset their components and they share same register.
> 
> That isn't what I meant. I referred to synchronization in the reset
> controller core. AFAICS the reset controller core prevents parallel
> calls into the same reset controller driver using atomics.

No, it doesn't. The atomics in struct reset_control prevent parallel
calls on the same, reset control only, for shared reset controls.
Two calls on different reset controls can still run simultaneously on
the same rcdev.

> Unfortunately, it is not well defined if additional synchronization on
> driver level is needed - some drivers implement it, some drivers
> don't,

I think all drivers protect read/modify/write cycles to shared registers
with a spinlock. Those that don't either have separate set/clear
registers or use regmap, otherwise it might be a bug.

> and I don't find a documentation.

I am aware this is a problem.

regards
Philipp
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
