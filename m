Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAFF4947D6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E1B82E54;
	Thu, 20 Jan 2022 08:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E1B82E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662431;
	bh=jfCa5L8RZqKrjHGxOCAfqBkc7LTLWblTOuwvdThPYrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFub8fDICWFZkix8bMalpWFsIzThXdV6UoNvbBTlShNop8pywYFMHpN+WDTtjtCOu
	 m+WGUHhYl4CzPgZ/I4m74lkz7NpSqymN9vvYiH0JMBn8sps3nwDwpumiybSiLBTE2J
	 TNEW3nip2+y12JOecwU5wCCIsOsaNuv4pQNjHmMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A54F8052D;
	Thu, 20 Jan 2022 08:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81DFAF80249; Mon, 17 Jan 2022 11:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28F56F800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 11:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28F56F800EB
Received: by mail-ua1-f45.google.com with SMTP id i10so7597113uab.8
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 02:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8wbyaDOKHzyncR/a8atHHiwf57S6QrlnXekhvOqZ5Zc=;
 b=yvkePvVucIJdecsH5bfWfAMBzE54FlQO+V3+7Nx02NlKxO8vfGBMunZ46NiHX7BCJI
 bmdHGXjT4y1YczMyNxKJ5KHJpoHSJqD0VqGCHt4zP8ggKIukFZEPemRKpslThuuhRxe0
 zfsuYgPwjMe0EVe0baVYX+xbK4oUPtSuldFuNMxKepiM+9qAZ+8EDa3bfEW6mGVI3UKo
 rwBa9UfBCff8mOh1dVzetvveDg60wk0QDAiX/gWCAeAxZr6Ub8jAuBh/pqcJaTOCVIJU
 qsZ17qmg77TGxRyWP7O54cDo6hTolijERVWZjFPun8ouE1IQooU+Xu8uEPdRFPbrDCM+
 ehWQ==
X-Gm-Message-State: AOAM533b/6ZHMkc2F1CUp35Smimf7njTeWgbOAnQACm/JEfMZ+Qa5VrC
 84f4odH/Yw5VmdU8WlS5oxNNhJkrXqdUJYIr
X-Google-Smtp-Source: ABdhPJzfJ2htKryyZlArVTEKi6ZhWPofry27w5LqgYiml5oCHWIt6rXspAlpOW+1SQB77xrJs1tCyQ==
X-Received: by 2002:a67:26c1:: with SMTP id m184mr6774569vsm.48.1642415765688; 
 Mon, 17 Jan 2022 02:36:05 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id k125sm1271996vsk.17.2022.01.17.02.36.04
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 02:36:04 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id h11so29572365uar.5
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 02:36:04 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr5738849uag.78.1642415764003;
 Mon, 17 Jan 2022 02:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
In-Reply-To: <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 11:35:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
Message-ID: <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:34 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tony Luck <tony.luck@intel.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, netdev <netdev@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
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

Hi Uwe,

On Mon, Jan 17, 2022 at 10:24 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Jan 17, 2022 at 09:41:42AM +0100, Geert Uytterhoeven wrote:
> > On Sat, Jan 15, 2022 at 9:22 PM Sergey Shtylyov <s.shtylyov@omp.ru> wro=
te:
> > > On 1/14/22 11:22 PM, Uwe Kleine-K=C3=B6nig wrote:
> > > > You have to understand that for clk (and regulator and gpiod) NULL =
is a
> > > > valid descriptor that can actually be used, it just has no effect. =
So
> > > > this is a convenience value for the case "If the clk/regulator/gpio=
d in
> > > > question isn't available, there is nothing to do". This is what mak=
es
> > > > clk_get_optional() and the others really useful and justifies their
> > > > existence. This doesn't apply to platform_get_irq_optional().
> > >
> > >    I do understand that. However, IRQs are a different beast with the=
ir
> > > own justifications...
> >
> > > > clk_get_optional() is sane and sensible for cases where the clk mig=
ht be
> > > > absent and it helps you because you don't have to differentiate bet=
ween
> > > > "not found" and "there is an actual resource".
> > > >
> > > > The reason for platform_get_irq_optional()'s existence is just that
> > > > platform_get_irq() emits an error message which is wrong or subopti=
mal
> > >
> > >    I think you are very wrong here. The real reason is to simplify th=
e
> > > callers.
> >
> > Indeed.
>
> The commit that introduced platform_get_irq_optional() said:
>
>         Introduce a new platform_get_irq_optional() that works much like
>         platform_get_irq() but does not output an error on failure to
>         find the interrupt.
>
> So the author of 8973ea47901c81a1912bd05f1577bed9b5b52506 failed to
> mention the real reason? Or look at
> 31a8d8fa84c51d3ab00bf059158d5de6178cf890:
>
>         [...] use platform_get_irq_optional() to get second/third IRQ
>         which are optional to avoid below error message during probe:
>         [...]
>
> Look through the output of
>
>         git log -Splatform_get_irq_optional
>
> to find several more of these.

Commit 8973ea47901c81a1 ("driver core: platform: Introduce
platform_get_irq_optional()") and the various fixups fixed the ugly
printing of error messages that were not applicable.
In hindsight, probably commit 7723f4c5ecdb8d83 ("driver core:
platform: Add an error message to platform_get_irq*()") should have
been reverted instead, until a platform_get_irq_optional() with proper
semantics was introduced.  But as we were all in a hurry to kill
the non-applicable error message, we went for the quick and dirty fix.

> Also I fail to see how a caller of (today's) platform_get_irq_optional()
> is simpler than a caller of platform_get_irq() given that there is no
> semantic difference between the two. Please show me a single
> conversion from platform_get_irq to platform_get_irq_optional that
> yielded a simplification.

That's exactly why we want to change the latter to return 0 ;-)

> So you need some more effort to convince me of your POV.
>
> > Even for clocks, you cannot assume that you can always blindly use
> > the returned dummy (actually a NULL pointer) to call into the clk
> > API.  While this works fine for simple use cases, where you just
> > want to enable/disable an optional clock (clk_prepare_enable() and
> > clk_disable_unprepare()), it does not work for more complex use cases.
>
> Agreed. But for clks and gpiods and regulators the simple case is quite
> usual. For irqs it isn't.

It is for devices that can have either separate interrupts, or a single
multiplexed interrupt.

The logic in e.g. drivers/tty/serial/sh-sci.c and
drivers/spi/spi-rspi.c could be simplified and improved (currently
it doesn't handle deferred probe) if platform_get_irq_optional()
would return 0 instead of -ENXIO.

> And if you cannot blindly use the dummy, then you're not the targetted
> caller of *_get_optional() and should better use *_get() and handle
> -ENODEV explicitly.

No, because the janitors tend to consolidate error message handling,
by moving the printing up, inside the *_get() methods.  That's exactly
what happened here.
So there are three reasons: because the absence of an optional IRQ
is not an error, and thus that should not cause (a) an error code
to be returned, and (b) an error message to be printed, and (c)
because it can simplify the logic in device drivers.

Commit 8973ea47901c81a1 ("driver core: platform: Introduce
platform_get_irq_optional()") fixed (b), but didn't address (a) and
(c).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
