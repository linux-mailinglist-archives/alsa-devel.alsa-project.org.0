Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F449F65A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:30:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C86F616D5;
	Fri, 28 Jan 2022 10:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C86F616D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643362207;
	bh=z6iO4goP/6mOntNu6iUnXj156J2xRO3zDzNJWbq5fzg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uoD7Q7o5JSn+pu2vsKOBhNINUatVga4XeJnOk93h/Y4CYOYFVK0+XjjybyU0dUnk6
	 IgCOUon4kWoJktuWY3+MyfVnFKarJpL80Ym0BJSnTBQ0wZYl/G6TitvckltZIJ6t+Q
	 KUGIV8lkdxOm+cAha7dMSOw3WWBEn8qWwCJJGQIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD4EF80564;
	Fri, 28 Jan 2022 10:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E105BF804C3; Tue, 25 Jan 2022 15:03:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DA7F80118
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 15:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DA7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XUIx8tfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643119432; x=1674655432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z6iO4goP/6mOntNu6iUnXj156J2xRO3zDzNJWbq5fzg=;
 b=XUIx8tfcpXEQrfT6COBuJvl9jJUb5NaRlYjmwxZbimDPkG8xhSv+EkPE
 UJSzZLGOlXcO5ZspFLXU7zRTfnsgY1PBDWFH9xk4zIKyx3s/IwbEAFK9I
 DDLOEjzZ3B3o4FTlmgNR7+pcZ6Z1JGLnjeOv/ljHb6/l1NQQm9aut/O/H
 3BF4WkU7qQNmIGQDxtb74P+eTIotdEVFpnw4L6NDnq6Docy+JGpGnTkG+
 GeHvQ6GA+/tKfzSZU5IBI6Kpa61g0jJXd5MR+tp5tAXlvg02dhy6hyJF9
 31GQ4itGXrPoNrKB610bFX9OyH5a8NZIRemgNiqoUk4vkIIoAaAOtbiaO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246249062"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="246249062"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 06:02:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="695840276"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 06:02:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCMNp-00EGb4-Aj; Tue, 25 Jan 2022 16:01:17 +0200
Date: Tue, 25 Jan 2022 16:01:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <YfACrffZCCeleOjK@smile.fi.intel.com>
References: <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeF05vBOzkN+xYCq@smile.fi.intel.com>
 <20220115154539.j3tsz5ioqexq2yuu@pengutronix.de>
 <YehdsUPiOTwgZywq@smile.fi.intel.com>
 <20220120075718.5qtrpc543kkykaow@pengutronix.de>
 <Ye6/NgfxsZnpXE09@smile.fi.intel.com>
 <15796e57-f7d4-9c66-3b53-0b026eaf31d8@omp.ru>
 <CAMuHMdXouECKa43OwUgQ6dA+gNeOqEZHZgOmQzqknzYiA924YA@mail.gmail.com>
 <33e55c4c0a637b23d76db5d33872378ad04121bd.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33e55c4c0a637b23d76db5d33872378ad04121bd.camel@ew.tq-group.com>
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
 Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tony Luck <tony.luck@intel.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
 Sergey Shtylyov <s.shtylyov@omp.ru>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
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

On Tue, Jan 25, 2022 at 01:56:05PM +0100, Matthias Schiffer wrote:
> On Tue, 2022-01-25 at 09:25 +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 24, 2022 at 10:02 PM Sergey Shtylyov <s.shtylyov@omp.ru>
> > wrote:
> > > On 1/24/22 6:01 PM, Andy Shevchenko wrote:

...

> > > > > > 2. The vIRQ0 handling: a) WARN() followed by b) returned
> > > > > > value 0
> > > > > 
> > > > > I'm happy with the vIRQ0 handling. Today platform_get_irq() and
> > > > > it's
> > > > > silent variant returns either a valid and usuable irq number or
> > > > > a
> > > > > negative error value. That's totally fine.
> > > > 
> > > > It might return 0.
> > > > Actually it seems that the WARN() can only be issued in two
> > > > cases:
> > > > - SPARC with vIRQ0 in one of the array member
> > > > - fallback to ACPI for GPIO IRQ resource with index 0
> > > 
> > >    You have probably missed the recent discovery that
> > > arch/sh/boards/board-aps4*.c
> > > causes IRQ0 to be passed as a direct IRQ resource?
> > 
> > So far no one reported seeing the big fat warning ;-)
> 
> FWIW, we had a similar issue with an IRQ resource passed from the
> tqmx86 MFD driver do the GPIO driver, which we noticed due to this
> warning, and which was fixed
> in a946506c48f3bd09363c9d2b0a178e55733bcbb6
> and 9b87f43537acfa24b95c236beba0f45901356eb2.

No, it's not, unfortunately :-( You just band aided the warning issue, but the
root cause is the WARN() and possibility to see valid (v)IRQ0 in the resources.
See below.

> I believe these changes are what promted this whole discussion and led
> to my "Reported-by" on the patch?
> 
> It is not entirely clear to me when IRQ 0 is valid and when it isn't,
> but the warning seems useful to me. Maybe it would make more sense to
> warn when such an IRQ resource is registered for a platform device, and
> not when it is looked up?
> 
> My opinion is that it would be very confusing if there are any places
> in the kernel (on some platforms) where IRQ 0 is valid,

And those places are board files like yours :( They have to be fixed
eventually. Ideally by using IRQ domains. At least that's how it's
done elsewhere.

> but for
> platform_get_irq() it would suddenly mean "not found". Keeping a
> negative return value seems preferable to me for this reason.

IRQ 0 is valid, vIRQ0 (or read it as cookie) is not.

Now, the problem in your case is that you are talking about board files, while
ACPI and DT never gives resource with vIRQ0. For board files some (legacy) code
decides that it's fine to supply HW IRQ, while the de facto case is that
platform_get_resource() returns whatever is in the resource, while
platform_get_irq() should return a cookie.

> (An alternative, more involved idea would be to add 1 to all IRQ
> "cookies", so IRQ 0 would return 1, leaving 0 as a special value. I
> have absolutely no idea how big the API surface is that would need
> changes, and it is likely not worth the effort at all.)

This is what IRQ domains do, they start vIRQs from 1.

> > > > The bottom line here is the SPARC case. Anybody familiar with the
> > > > platform
> > > > can shed a light on this. If there is no such case, we may remove
> > > > warning
> > > > along with ret = 0 case from platfrom_get_irq().
> > > 
> > >    I'm afraid you're too fast here... :-)
> > >    We'll have a really hard time if we continue to allow IRQ0 to be
> > > returned by
> > > platform_get_irq() -- we'll have oto fileter it out in the callers
> > > then...
> > 
> > So far no one reported seeing the big fat warning?
> > 
> > > > > > 3. The specific cookie for "IRQ not found, while no error
> > > > > > happened" case
> > > > > 
> > > > > Not sure what you mean here. I have no problem that a situation
> > > > > I can
> > > > > cope with is called an error for the query function. I just do
> > > > > error
> > > > > handling and continue happily. So the part "while no error
> > > > > happened" is
> > > > > irrelevant to me.
> > > > 
> > > > I meant that instead of using special error code, 0 is very much
> > > > good for
> > > > the cases when IRQ is not found. It allows to distinguish -ENXIO
> > > > from the
> > > > low layer from -ENXIO with this magic meaning.
> > > 
> > >    I don't see how -ENXIO can trickle from the lower layers,
> > > frankly...
> > 
> > It might one day, leading to very hard to track bugs.
> 
> As gregkh noted, changing the return value without also making the
> compile fail will be a huge PITA whenever driver patches are back- or
> forward-ported, as it would require subtle changes in error paths,
> which can easily slip through unnoticed, in particular with half-
> automated stable backports.

Let's not modify kernel at all then, because in many cases it is a PITA
for back- or forward-porting :-)

> Even if another return value like -ENODEV might be better aligned with
> ...regulator_get_optional() and similar functions, or we even find a
> way to make 0 usable for this, none of the proposed changes strike me
> as big enough a win to outweigh the churn caused by making such a
> change at all.

Yeah, let's continue to suffer from ugly interface and see more band aids
landing around...

-- 
With Best Regards,
Andy Shevchenko


