Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9948C8D1
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C60A71EEF;
	Wed, 12 Jan 2022 17:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C60A71EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006236;
	bh=cNBpfFoHqPuz0zcd6tz8l/vAk1K6ivBaRN+f33DpqwQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e7Nug+/hsarGY+SR0aryqJGVqwQdoreabzJNcG8Fm58QftqCB6QXgpHn4isykIJsf
	 CqAO3Q/fqVesFjGSArcgrZyVJAsX8bfK31AkptpLdlEpFgfyYVa8Fh5x0Xe/90eiNd
	 JF8XPN5FK6fC6HFcwt2Sstz4RiinRS8fnHEDJ39g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1702F80563;
	Wed, 12 Jan 2022 17:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE243F80236; Wed, 12 Jan 2022 17:27:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85580F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 17:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85580F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c9EUVuNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642004843; x=1673540843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cNBpfFoHqPuz0zcd6tz8l/vAk1K6ivBaRN+f33DpqwQ=;
 b=c9EUVuNqGkN21dS0ch7IIcgBTCwb50bWLCtWnMzdtqQuH2DldIn6SVzz
 rmo9f88rK4dzEFWvwgTnMyiYYiXTJR3uFO/QWf/Ofjlp/w7MCSAUZ2tG5
 Na/Z3SvuCCfV0bPd/Fw3wxga5H/VOizsH5qFtW5pZtuHNlwBcDiFDJldF
 7UBeUT6CkN/rmpnrxGhuuNNSQCSWkk7sS0jq07Mp7f9S9M4v8nTLJYPYK
 U3Pb9nNnW/vbBd9Z5asVzQugTP7ynHbuchVfH15h6BU5fLjHzhiyVqT9v
 xin7j6gVfmTX1TBuOWmqFO/SVzy4hAzXMSjb/xNbuRV7GrjnOZHndEGKu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="307120906"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="307120906"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 08:22:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="529239592"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 08:22:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n7gNK-009l6p-Ao; Wed, 12 Jan 2022 18:21:26 +0200
Date: Wed, 12 Jan 2022 18:21:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <Yd8ABkwagyVevTaE@smile.fi.intel.com>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <Yd7Z3Qwevb/lEwQZ@lunn.ch>
 <CAMuHMdV2cGvqMppwt9xhpze=pcnHfTozDZMjwT1DkivLD+_nbQ@mail.gmail.com>
 <CAJZ5v0iyAHtDe1kFObQorXOX0Xraxac0j29Dh+8sq7zxzbsmcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iyAHtDe1kFObQorXOX0Xraxac0j29Dh+8sq7zxzbsmcQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 netdev <netdev@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, Linux PWM List <linux-pwm@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Wed, Jan 12, 2022 at 03:41:38PM +0100, Rafael J. Wysocki wrote:
> On Wed, Jan 12, 2022 at 2:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Andrew,
> >
> > On Wed, Jan 12, 2022 at 2:38 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > > If an optional IRQ is not present, drivers either just ignore it (e.g.
> > > > for devices that can have multiple interrupts or a single muxed IRQ),
> > > > or they have to resort to polling. For the latter, fall-back handling
> > > > is needed elsewhere in the driver.
> > > > To me it sounds much more logical for the driver to check if an
> > > > optional irq is non-zero (available) or zero (not available), than to
> > > > sprinkle around checks for -ENXIO. In addition, you have to remember
> > > > that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
> > > > (or some other error code) to indicate absence. I thought not having
> > > > to care about the actual error code was the main reason behind the
> > > > introduction of the *_optional() APIs.
> > >
> > > The *_optional() functions return an error code if there has been a
> > > real error which should be reported up the call stack. This excludes
> > > whatever error code indicates the requested resource does not exist,
> > > which can be -ENODEV etc. If the device does not exist, a magic cookie
> > > is returned which appears to be a valid resources but in fact is
> > > not. So the users of these functions just need to check for an error
> > > code, and fail the probe if present.
> >
> > Agreed.
> >
> > Note that in most (all?) other cases, the return type is a pointer
> > (e.g. to struct clk), and NULL is the magic cookie.
> >
> > > You seems to be suggesting in binary return value: non-zero
> > > (available) or zero (not available)
> >
> > Only in case of success. In case of a real failure, an error code
> > must be returned.
> >
> > > This discards the error code when something goes wrong. That is useful
> > > information to have, so we should not be discarding it.
> >
> > No, the error code must be retained in case of failure.
> >
> > > IRQ don't currently have a magic cookie value. One option would be to
> > > add such a magic cookie to the subsystem. Otherwise, since 0 is
> > > invalid, return 0 to indicate the IRQ does not exist.
> >
> > Exactly. And using 0 means the similar code can be used as for other
> > subsystems, where NULL would be returned.
> >
> > The only remaining difference is the "dummy cookie can be passed
> > to other functions" behavior.  Which is IMHO a valid difference,
> > as unlike with e.g. clk_prepare_enable(), you do pass extra data to
> > request_irq(), and sometimes you do need to handle the absence of
> > the interrupt using e.g. polling.
> >
> > > The request for a script checking this then makes sense. However, i
> > > don't know how well coccinelle/sparse can track values across function
> > > calls. They probably can check for:
> > >
> > >    ret = irq_get_optional()
> > >    if (ret < 0)
> > >       return ret;
> > >
> > > A missing if < 0 statement somewhere later is very likely to be an
> > > error. A comparison of <= 0 is also likely to be an error. A check for
> > > > 0 before calling any other IRQ functions would be good. I'm
> > > surprised such a check does not already existing in the IRQ API, but
> > > there are probably historical reasons for that.
> >
> > There are still a few platforms where IRQ 0 does exist.
> 
> Not just a few even.  This happens on a reasonably recent x86 PC:

Yes, but the timer doesn't use platform_get_irq*() and friends.

> rafael@gratch:~/work/linux-pm> head -2 /proc/interrupts
>            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
>   0:         10          0          0          0          0          0
>  IR-IO-APIC    2-edge
> timer

-- 
With Best Regards,
Andy Shevchenko


