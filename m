Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBB54947DC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2BC6193D;
	Thu, 20 Jan 2022 08:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2BC6193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662480;
	bh=z8lAAfJgt1If1UcBriYt8KxSb74cRSh/UnpQprwGLag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etEmoTs/Jm8cDZCYFM0Hh14hRmvMkSeDbSe/cjLVsk6OUaKGaJe/pbjDzUvsvPVo8
	 wL9vkFtS653RcPgs9Fvhcy3V/FAHqgCLciA6y0wfV7BL3ZSHtWdeZ1kFf2IXI90M2D
	 5IK+imCrU3i6HWdcIGxfTXyQqx/AgqgGAIngVkr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B15CF80542;
	Thu, 20 Jan 2022 08:03:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37937F800EB; Mon, 17 Jan 2022 14:08:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81826F800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 14:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81826F800EB
Received: by mail-ua1-f49.google.com with SMTP id u6so30392517uaq.0
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 05:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LbGCIVR09xEJePWZW3UCqvYJkRRDeetDnk36pAUGg0E=;
 b=tWOFmn0SV9WKTOmRUcseWV4RiechNPd3E8lhCMIzK56a6N9WVJqwPsU3ri08G9pByv
 PDDwHHY2ZsHvVn4auVrIuKqooMK4f9ygk/cw22MK+QJe+aYY8dWcGsZ/DfcJu0jgtOKf
 5gY/xJBc24us2+z7OyYOSva5kXBAXk5rjMKsbdw22hllg9GC1oPpzAdKm2rn/LMrNR5x
 NCeuqGznfpQPecjhUjsBBD9lOBflW53ubPvkdH8bsUWI1W5iC6F6jPSUA9Y+kvPbXWU+
 Nbc7giazHNoeD4/tLOXVPXvQUQdSFYlj7amI4ASIhHSobtwvNBwC/z3rzK4AwetmQNbe
 ql0w==
X-Gm-Message-State: AOAM531UcrSW3ih1Nk19PvL3P0cR5d9XP0hddJPhXw2S1c050/Zem6CB
 Lm1e7ng08NO226CE121WwHkvUvaPzXIRdpad
X-Google-Smtp-Source: ABdhPJymQLNbgbe7sUxwOg/sUGOIhPu/JmePse0RP8+JfN9NhdG25KYxEYEBT9XtKv8pg60r4QsbpQ==
X-Received: by 2002:a05:6102:2451:: with SMTP id
 g17mr7593726vss.8.1642424913362; 
 Mon, 17 Jan 2022 05:08:33 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id c22sm1139714vsq.11.2022.01.17.05.08.31
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 05:08:32 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id r15so30328289uao.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 05:08:31 -0800 (PST)
X-Received: by 2002:a67:e95a:: with SMTP id p26mr3535723vso.38.1642424911445; 
 Mon, 17 Jan 2022 05:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk> <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
In-Reply-To: <20220117114923.d5vajgitxneec7j7@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 14:08:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
Message-ID: <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
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
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 netdev <netdev@vger.kernel.org>
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

On Mon, Jan 17, 2022 at 12:49 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Jan 17, 2022 at 11:35:52AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 17, 2022 at 10:24 AM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Mon, Jan 17, 2022 at 09:41:42AM +0100, Geert Uytterhoeven wrote:
> > > > On Sat, Jan 15, 2022 at 9:22 PM Sergey Shtylyov <s.shtylyov@omp.ru>=
 wrote:
> > > > > On 1/14/22 11:22 PM, Uwe Kleine-K=C3=B6nig wrote:
> > > > > > You have to understand that for clk (and regulator and gpiod) N=
ULL is a
> > > > > > valid descriptor that can actually be used, it just has no effe=
ct. So
> > > > > > this is a convenience value for the case "If the clk/regulator/=
gpiod in
> > > > > > question isn't available, there is nothing to do". This is what=
 makes
> > > > > > clk_get_optional() and the others really useful and justifies t=
heir
> > > > > > existence. This doesn't apply to platform_get_irq_optional().
> > > > >
> > > > >    I do understand that. However, IRQs are a different beast with=
 their
> > > > > own justifications...
> > > >
> > > > > > clk_get_optional() is sane and sensible for cases where the clk=
 might be
> > > > > > absent and it helps you because you don't have to differentiate=
 between
> > > > > > "not found" and "there is an actual resource".
> > > > > >
> > > > > > The reason for platform_get_irq_optional()'s existence is just =
that
> > > > > > platform_get_irq() emits an error message which is wrong or sub=
optimal
> > > > >
> > > > >    I think you are very wrong here. The real reason is to simplif=
y the
> > > > > callers.
> > > >
> > > > Indeed.
> > >
> > > The commit that introduced platform_get_irq_optional() said:
> > >
> > >         Introduce a new platform_get_irq_optional() that works much l=
ike
> > >         platform_get_irq() but does not output an error on failure to
> > >         find the interrupt.
> > >
> > > So the author of 8973ea47901c81a1912bd05f1577bed9b5b52506 failed to
> > > mention the real reason? Or look at
> > > 31a8d8fa84c51d3ab00bf059158d5de6178cf890:
> > >
> > >         [...] use platform_get_irq_optional() to get second/third IRQ
> > >         which are optional to avoid below error message during probe:
> > >         [...]
> > >
> > > Look through the output of
> > >
> > >         git log -Splatform_get_irq_optional
> > >
> > > to find several more of these.
> >
> > Commit 8973ea47901c81a1 ("driver core: platform: Introduce
> > platform_get_irq_optional()") and the various fixups fixed the ugly
> > printing of error messages that were not applicable.
> > In hindsight, probably commit 7723f4c5ecdb8d83 ("driver core:
> > platform: Add an error message to platform_get_irq*()") should have
> > been reverted instead, until a platform_get_irq_optional() with proper
> > semantics was introduced.
>
> ack.
>
> > But as we were all in a hurry to kill the non-applicable error
> > message, we went for the quick and dirty fix.
> >
> > > Also I fail to see how a caller of (today's) platform_get_irq_optiona=
l()
> > > is simpler than a caller of platform_get_irq() given that there is no
> > > semantic difference between the two. Please show me a single
> > > conversion from platform_get_irq to platform_get_irq_optional that
> > > yielded a simplification.
> >
> > That's exactly why we want to change the latter to return 0 ;-)
>
> OK. So you agree to my statement "The reason for
> platform_get_irq_optional()'s existence is just that platform_get_irq()
> emits an error message [...]". Actually you don't want to oppose but
> say: It's unfortunate that the silent variant of platform_get_irq() took
> the obvious name of a function that could have an improved return code
> semantic.
>
> So my suggestion to rename todays platform_get_irq_optional() to
> platform_get_irq_silently() and then introducing
> platform_get_irq_optional() with your suggested semantic seems
> intriguing and straigt forward to me.

I don't really see the point of needing platform_get_irq_silently(),
unless as an intermediary step, where it's going to be removed again
once the conversion has completed.
Still, the rename would touch all users at once anyway.

> Another thought: platform_get_irq emits an error message for all
> problems. Wouldn't it be consistent to let platform_get_irq_optional()
> emit an error message for all problems but "not found"?
> Alternatively remove the error printk from platform_get_irq().

Yes, all problems but not found are real errors.

> > > So you need some more effort to convince me of your POV.
> > >
> > > > Even for clocks, you cannot assume that you can always blindly use
> > > > the returned dummy (actually a NULL pointer) to call into the clk
> > > > API.  While this works fine for simple use cases, where you just
> > > > want to enable/disable an optional clock (clk_prepare_enable() and
> > > > clk_disable_unprepare()), it does not work for more complex use cas=
es.
> > >
> > > Agreed. But for clks and gpiods and regulators the simple case is qui=
te
> > > usual. For irqs it isn't.
> >
> > It is for devices that can have either separate interrupts, or a single
> > multiplexed interrupt.
> >
> > The logic in e.g. drivers/tty/serial/sh-sci.c and
> > drivers/spi/spi-rspi.c could be simplified and improved (currently
> > it doesn't handle deferred probe) if platform_get_irq_optional()
> > would return 0 instead of -ENXIO.
>
> Looking at sh-sci.c the irq handling logic could be improved even
> without a changed platform_get_irq_optional():
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 968967d722d4..c7dc9fb84844 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2873,11 +2873,13 @@ static int sci_init_single(struct platform_device=
 *dev,
>          * interrupt ID numbers, or muxed together with another interrupt=
.
>          */
>         if (sci_port->irqs[0] < 0)
> -               return -ENXIO;
> +               return sci_port->irqs[0];
>
> -       if (sci_port->irqs[1] < 0)
> +       if (sci_port->irqs[1] =3D=3D -ENXIO)
>                 for (i =3D 1; i < ARRAY_SIZE(sci_port->irqs); i++)
>                         sci_port->irqs[i] =3D sci_port->irqs[0];
> +       else if (sci_port->irqs[1] < 0)
> +               return sci_port->irqs[1];
>
>         sci_port->params =3D sci_probe_regmap(p);
>         if (unlikely(sci_port->params =3D=3D NULL))
>
> And then the code flow is actively irritating. sci_init_single() copies
> irqs[0] to all other irqs[i] and then sci_request_irq() loops over the
> already requested irqs and checks for duplicates. A single place that
> identifies the exact set of required irqs would already help a lot.

Yeah, it's ugly and convoluted, like the wide set of hardware the
driver supports.

> Also for spi-rspi.c I don't see how platform_get_irq_byname_optional()
> returning 0 instead of -ENXIO would help. Please talk in patches.

--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -1420,17 +1420,25 @@ static int rspi_probe(struct platform_device *pdev)
        ctlr->max_native_cs =3D rspi->ops->num_hw_ss;

        ret =3D platform_get_irq_byname_optional(pdev, "rx");
-       if (ret < 0) {
+       if (ret < 0)
+               goto error2;
+
+       if (!ret) {
                ret =3D platform_get_irq_byname_optional(pdev, "mux");
-               if (ret < 0)
+               if (!ret)
                        ret =3D platform_get_irq(pdev, 0);
+               if (ret < 0)
+                       goto error2;
+
                if (ret >=3D 0)
                        rspi->rx_irq =3D rspi->tx_irq =3D ret;
        } else {
                rspi->rx_irq =3D ret;
                ret =3D platform_get_irq_byname(pdev, "tx");
-               if (ret >=3D 0)
-                       rspi->tx_irq =3D ret;
+               if (ret < 0)
+                       goto error2;
+
+               rspi->tx_irq =3D ret;
        }

        if (rspi->rx_irq =3D=3D rspi->tx_irq) {

I like it when the "if (ret < ) ..." error handling is the first check to d=
o.
With -ENXIO, it becomes more convoluted. and looks less nice (IMHO).

> Preferably first simplify in-driver logic to make the conversion to the
> new platform_get_irq_optional() actually reviewable.

So I have to choose between

    if (ret < 0 && ret !=3D -ENXIO)
            return ret;

    if (ret) {
            ...
    }

and

    if (ret =3D=3D -ENXIO) {
            ...
    } else if (ret < 0)
            return ret;
    }

with the final target being

    if (ret < 0)
            return ret;

    if (ret) {
            ...
    }

So the first option means the final change is smaller, but it looks less
nice than the second option (IMHO).
But the second option means more churn.

> > So there are three reasons: because the absence of an optional IRQ
> > is not an error, and thus that should not cause (a) an error code
> > to be returned, and (b) an error message to be printed, and (c)
> > because it can simplify the logic in device drivers.
>
> I don't agree to (a). If the value signaling not-found is -ENXIO or 0
> (or -ENODEV) doesn't matter much. I wouldn't deviate from the return
> code semantics of platform_get_irq() just for having to check against 0
> instead of -ENXIO. Zero is then just another magic value.

Zero is a natural magic value (also for pointers).
Errors are always negative.
Positive values are cookies (or pointers) associated with success.

> (c) still has to be proven, see above.
>
> > Commit 8973ea47901c81a1 ("driver core: platform: Introduce
> > platform_get_irq_optional()") fixed (b), but didn't address (a) and
> > (c).
>
> Yes, it fixed (b) and picked a bad name for that.

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
