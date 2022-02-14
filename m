Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E694B843A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BC4E18F7;
	Wed, 16 Feb 2022 10:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BC4E18F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003707;
	bh=iMfir8Hys8PoRkg7XbbXRj39pNMes8hLErnltaIltH8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAthmFfmmIMVVzIZmtcY0z2uWInzFKJJwqyJH5eUzmx8vSWT+UrQ1CBJPj8P652Ar
	 jViw91qMbd7K1bDnqqKp1sKkqBfOgFNI3217BhDfESzO1GC1NrC/MkYEAcOxJOnaLL
	 9uYpytF6RHEIxyNeBTCVS06GAZk1iCHrz5Ar2V3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C209CF8052E;
	Wed, 16 Feb 2022 10:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 136EDF800D8; Mon, 14 Feb 2022 11:16:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B11F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B11F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wa8LyAHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644833797; x=1676369797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iMfir8Hys8PoRkg7XbbXRj39pNMes8hLErnltaIltH8=;
 b=Wa8LyAHAgrA1h2k/KMPw8SgsmfCETNO676PCx1G6fa/DLWIxin2Bvm/H
 j/4JAQ0YGS+oV1PJGx5VdymEnoH8omv688M+r1mvEPiPigqBRXCqNgKen
 zzrTiUFs1ImDTty8A/4cgPBjUKJXmmPdaDudRMjqRdz//nsxqGw41wuA0
 bfPXZaQTwpU1rnzsE7pV9sYqO0VeekQtaH5wpxElNcmXARdgAt9GFNadX
 yC87IHx2rAgOB2ba1HmtRtO1wuunfes7Hvgs7wh6fWhrNsh5dOI16myxx
 GMKdfxhLRl/3vV0dA0hRgcd0Qgntkz5Ko5jwsHWok/qywTBbB3xIQD9Oy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="247654288"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="247654288"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:16:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="603187011"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:16:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nJYLy-004PC8-6n; Mon, 14 Feb 2022 12:13:06 +0200
Date: Mon, 14 Feb 2022 12:13:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <YgorLXUr8aT+1ttv@smile.fi.intel.com>
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
 <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Peter Korsgaard <peter@korsgaard.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-pwm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Zha Qipeng <qipeng.zha@intel.com>, Richard Weinberger <richard@nod.at>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
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

On Mon, Feb 14, 2022 at 08:13:51AM +0100, Uwe Kleine-König wrote:
> On Sat, Feb 12, 2022 at 11:16:30PM +0300, Sergey Shtylyov wrote:
> > This patch is based on the former Andy Shevchenko's patch:
> > 
> > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
> > 
> > Currently platform_get_irq_optional() returns an error code even if IRQ
> > resource simply has not been found.  It prevents the callers from being
> > error code agnostic in their error handling:
> > 
> > 	ret = platform_get_irq_optional(...);
> > 	if (ret < 0 && ret != -ENXIO)
> > 		return ret; // respect deferred probe
> > 	if (ret > 0)
> > 		...we get an IRQ...
> > 
> > All other *_optional() APIs seem to return 0 or NULL in case an optional
> > resource is not available.  Let's follow this good example, so that the
> > callers would look like:
> > 
> > 	ret = platform_get_irq_optional(...);
> > 	if (ret < 0)
> > 		return ret;
> > 	if (ret > 0)
> > 		...we get an IRQ...
> > 
> > Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> While this patch is better than v1, I still don't like it for the
> reasons discussed for v1. (i.e. 0 isn't usable as a dummy value which I
> consider the real advantage for the other _get_optional() functions.)

I think you haven't reacted anyhow to my point that you mixing apples and
bananas together when comparing this 0 to the others _optional APIs.

> Apart from that, I think the subject is badly chosen. With "Make
> somefunc() optional" I would expect that you introduce a Kconfig symbol
> that results in the function not being available when disabled.


-- 
With Best Regards,
Andy Shevchenko


