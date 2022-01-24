Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4E49F642
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:26:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2B81673;
	Fri, 28 Jan 2022 10:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2B81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643361983;
	bh=12MT7URXnDq/Fp4XFhkmyf3ldBVGzHv0vwmewAlkDXU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3yWES2XvYZoCyoM0FFkhpZ19sFdXPhxJQ206Q8QP9p9T1iOsqoGvjyagitVOfueN
	 26FlJL6iypo5fdKLzUw9bFo7znlPpVRe3P2JuuYEpAXqXrpOnnVdALZQaYkhwELxpj
	 poX8FyUOK6cpoUuGwGkUfhCzz3PpoPpN2wroZytc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C389CF804A9;
	Fri, 28 Jan 2022 10:24:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1AA4F8027C; Mon, 24 Jan 2022 16:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EB60F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 16:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB60F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dn++osdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036577; x=1674572577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=12MT7URXnDq/Fp4XFhkmyf3ldBVGzHv0vwmewAlkDXU=;
 b=Dn++osdZMKvStt8yh3wgFpa1NMZUBl95JZ48ht2Z3zExERZpGGlu7BPo
 lNTLuaw3iWoFKz7OgBrov5ulsL34/ERXOIubscDpuSHlrgs3u60uTwlbZ
 SkofIJNdkxlgmA61R+Eup+oUoZjIRrBzeFW+I0T5FZ41G0IKQhxVDzPA9
 kaCTGJoxylBtpPK9hwAkpojN2cU6AGBKQzW0TTtLlWJL+CXiIWB8JWLO8
 Hoh1L/2OfrVJLCVga0XnXg1e4br/OMQh9F66TwjCImPpz/DXuRttKO8nD
 jUPPwpsGtJl+tP2Al/tyX7UIBS6mXfCKnrAvGIravU0xzHPRLL86aWq5c Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="244896977"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="244896977"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:02:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519972062"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:02:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nC0qE-00Dvkq-Jt; Mon, 24 Jan 2022 17:01:10 +0200
Date: Mon, 24 Jan 2022 17:01:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <Ye6/NgfxsZnpXE09@smile.fi.intel.com>
References: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeF05vBOzkN+xYCq@smile.fi.intel.com>
 <20220115154539.j3tsz5ioqexq2yuu@pengutronix.de>
 <YehdsUPiOTwgZywq@smile.fi.intel.com>
 <20220120075718.5qtrpc543kkykaow@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120075718.5qtrpc543kkykaow@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 28 Jan 2022 10:24:41 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 John Garry <john.garry@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 netdev@vger.kernel.org
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

On Thu, Jan 20, 2022 at 08:57:18AM +0100, Uwe Kleine-König wrote:
> On Wed, Jan 19, 2022 at 08:51:29PM +0200, Andy Shevchenko wrote:
> > On Sat, Jan 15, 2022 at 04:45:39PM +0100, Uwe Kleine-König wrote:
> > > On Fri, Jan 14, 2022 at 03:04:38PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Jan 13, 2022 at 08:43:58PM +0100, Uwe Kleine-König wrote:
> > > > > > It'd certainly be good to name anything that doesn't correspond to one
> > > > > > of the existing semantics for the API (!) something different rather
> > > > > > than adding yet another potentially overloaded meaning.
> > > > > 
> > > > > It seems we're (at least) three who agree about this. Here is a patch
> > > > > fixing the name.
> > > > 
> > > > And similar number of people are on the other side.
> > > 
> > > If someone already opposed to the renaming (and not only the name) I
> > > must have missed that.
> > > 
> > > So you think it's a good idea to keep the name
> > > platform_get_irq_optional() despite the "not found" value returned by it
> > > isn't usable as if it were a normal irq number?
> > 
> > I meant that on the other side people who are in favour of Sergey's patch.
> > Since that I commented already that I opposed the renaming being a standalone
> > change.
> > 
> > Do you agree that we have several issues with platform_get_irq*() APIs?
> > 
> > 1. The unfortunate naming
> 
> unfortunate naming for the currently implemented semantic, yes.

Yes.

> > 2. The vIRQ0 handling: a) WARN() followed by b) returned value 0
> 
> I'm happy with the vIRQ0 handling. Today platform_get_irq() and it's
> silent variant returns either a valid and usuable irq number or a
> negative error value. That's totally fine.

It might return 0.
Actually it seems that the WARN() can only be issued in two cases:
- SPARC with vIRQ0 in one of the array member
- fallback to ACPI for GPIO IRQ resource with index 0

But the latter is bogus, because it would mean a bug in the ACPI code.

The bottom line here is the SPARC case. Anybody familiar with the platform
can shed a light on this. If there is no such case, we may remove warning
along with ret = 0 case from platfrom_get_irq().

> > 3. The specific cookie for "IRQ not found, while no error happened" case
> 
> Not sure what you mean here. I have no problem that a situation I can
> cope with is called an error for the query function. I just do error
> handling and continue happily. So the part "while no error happened" is
> irrelevant to me.

I meant that instead of using special error code, 0 is very much good for
the cases when IRQ is not found. It allows to distinguish -ENXIO from the
low layer from -ENXIO with this magic meaning.

> Additionally I see the problems:
> 
> 4. The semantic as implemented in Sergey's patch isn't better than the
> current one.

I disagree on this. See above on why.

> platform_get_irq*() is still considerably different from
> (clk|gpiod)_get* because the not-found value for the _optional variant
> isn't usuable for the irq case. For clk and gpio I get rid of a whole if
> branch, for irq I only change the if-condition. (And if that change is
> considered good or bad seems to be subjective.)

You are mixing up two things:
 - semantics of the pointer
 - semantics of the cookie

Like I said previously the mistake is in putting an equal sign between apples
and oranges (or in terms of Python, which is a good example here, None and
False objects, where in both case 0 is magic and Python `if X`, `while `X` will
work in the same way, the `typeof(X)` is different semantically).

> For the idea to add a warning to platform_get_irq_optional for all but
> -ENXIO (and -EPROBE_DEFER), I see the problem:
> 
> 5. platform_get_irq*() issuing an error message is only correct most of
> the time and given proper error handling in the caller (which might be
> able to handle not only -ENXIO but maybe also -EINVAL[1]) the error message
> is irritating. Today platform_get_irq() emits an error message for all
> but -EPROBE_DEFER. As soon as we find a driver that handles -EINVAL we
> need a function platform_get_irq_variant1 to be silent for -EINVAL,
> -EPROBE_DEFER and -ENXIO (or platform_get_irq_variant2 that is only
> silent for -EINVAL and -EPROBE_DEFER?)
> 
> IMHO a query function should always be silent and let the caller do the
> error handling. And if it's only because
> 
> 	mydev: IRQ index 0 not found
> 
> is worse than
> 
> 	mydev: neither TX irq not a muxed RX/TX irq found
> 
> . Also "index 0" is irritating for devices that are expected to have
> only a single irq (i.e. the majority of all devices).

Yeah, ack the #5.

> Yes, I admit, we can safe some code by pushing the error message in a
> query function. But that doesn't only have advantages.

> [1] Looking through the source I wonder: What are the errors that can happen
>     in platform_get_irq*()? (calling everything but a valid irq number
>     an error) Looking at many callers, they only seem to expect "not
>     found" and some "probe defer" (even platform_get_irq() interprets
>     everything but -EPROBE_DEFER as "IRQ index %u not found\n".)
>     IMHO before we should consider to introduce a platform_get_irq*()
>     variant with improved semantics, some cleanup in the internals of
>     the irq lookup are necessary.

-- 
With Best Regards,
Andy Shevchenko


