Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3348F5E1
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 09:06:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB011FE0;
	Sat, 15 Jan 2022 09:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB011FE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642234015;
	bh=mHOYnGAx6z4ePSSxC4Kub9/treCl50EMKcgf4VZ0j7Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlWMI8kl3gNkuTG1p+fmaVvnIL1TqvkKWfENn4HYGGaoKwslJ6BM8MR3fjdi0tshw
	 zszsSNZ8o7L0gHBOlvEf2vRshGCrj8oBwu++EureUvlZWSZBBaoVvNue05zyHKf5XO
	 PbdxhxbATq4xxrI3KvTKTpVYKjDOWgUehxKkhMdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1C2F8053A;
	Sat, 15 Jan 2022 09:02:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC79DF8030F; Fri, 14 Jan 2022 10:45:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E87BBF800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 10:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E87BBF800CE
Received: by mail-pf1-f170.google.com with SMTP id m21so2295123pfd.3
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 01:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XIsXuJfmE8JES6Mbtb18c2n3rWZVUZhPWhasZQeRi6Q=;
 b=WYyRqQNNUyUnXGJbsWoK+Be3fkZ2nyqQGgSbkDgSeM0hjMixyHJnxCcVPS2NCsaaQn
 DtdybPnvt2Ps8orU2K+oIle/uHb1BooT+xs4MAHRsX4I7+NRzMs9Mx+nsOfKhmf4EmRZ
 Nd4gUe0BQlVcaLH3sIDj+38GvVL0zwpAfjzgyx77zefoycqL50iQpcovPFw6hdY6mdiS
 /YBPM9sWR6OMclQhsGMQb/kYTfI6EZ+DIjhc8zzPwC1PJTC1qhzSUOiD0pjkoPPsYGEf
 smQ+pc1s64Ntf4mUa1BHU0YlQjmlsW7mpLzxcQRBkyTHbk/fp6KhJkoStzTO0OZI3897
 /kXQ==
X-Gm-Message-State: AOAM530ms/qR14Bgrg8mRIWI0YTngoA7NfVjc9tupfpixagEwWa5UdOm
 nTqymCe3Kge/BwFYNBrhFymlK8sVeOgj98O0
X-Google-Smtp-Source: ABdhPJx9QPbL48ppVp711N/UXtEGl2TxxRqzdnMA5tKo8k4Q5H+ud0J2D8cvepCCjbwROtZIXj7KYQ==
X-Received: by 2002:a05:6a00:1946:b0:492:64f1:61b5 with SMTP id
 s6-20020a056a00194600b0049264f161b5mr8193975pfk.52.1642153535836; 
 Fri, 14 Jan 2022 01:45:35 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50])
 by smtp.gmail.com with ESMTPSA id u7sm10774908pjy.6.2022.01.14.01.45.35
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:45:35 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so7091579pjl.0
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 01:45:35 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr3716211vsu.5.1642153159149; 
 Fri, 14 Jan 2022 01:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
In-Reply-To: <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 10:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcMNMYf82-rz8_057BGwYWyPyhjAh3e9ynrv82GMiHvg@mail.gmail.com>
Message-ID: <CAMuHMdVcMNMYf82-rz8_057BGwYWyPyhjAh3e9ynrv82GMiHvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 15 Jan 2022 09:02:46 +0100
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
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tony Luck <tony.luck@intel.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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

Hi Uwe,

On Fri, Jan 14, 2022 at 10:26 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Jan 13, 2022 at 11:35:34PM +0300, Sergey Shtylyov wrote:
> > On 1/13/22 12:45 AM, Mark Brown wrote:
> > >>> To me it sounds much more logical for the driver to check if an
> > >>> optional irq is non-zero (available) or zero (not available), than =
to
> > >>> sprinkle around checks for -ENXIO. In addition, you have to remembe=
r
> > >>> that this one returns -ENXIO, while other APIs use -ENOENT or -ENOS=
YS
> > >>> (or some other error code) to indicate absence. I thought not havin=
g
> > >>> to care about the actual error code was the main reason behind the
> > >>> introduction of the *_optional() APIs.
> > >
> > >> No, the main benefit of gpiod_get_optional() (and clk_get_optional()=
) is
> > >> that you can handle an absent GPIO (or clk) as if it were available.
> >
> >    Hm, I've just looked at these and must note that they match 1:1 with
> > platform_get_irq_optional(). Unfortunately, we can't however behave the
> > same way in request_irq() -- because it has to support IRQ0 for the sak=
e
> > of i8253 drivers in arch/...
>
> Let me reformulate your statement to the IMHO equivalent:
>
>         If you set aside the differences between
>         platform_get_irq_optional() and gpiod_get_optional(),
>         platform_get_irq_optional() is like gpiod_get_optional().
>
> The introduction of gpiod_get_optional() made it possible to simplify
> the following code:
>
>         reset_gpio =3D gpiod_get(...)
>         if IS_ERR(reset_gpio):
>                 error =3D PTR_ERR(reset_gpio)
>                 if error !=3D -ENDEV:
>                         return error
>         else:
>                 gpiod_set_direction(reset_gpiod, INACTIVE)
>
> to
>
>         reset_gpio =3D gpiod_get_optional(....)
>         if IS_ERR(reset_gpio):
>                 return reset_gpio
>         gpiod_set_direction(reset_gpiod, INACTIVE)
>
> and I never need to actually know if the reset_gpio actually exists.
> Either the line is put into its inactive state, or it doesn't exist and
> then gpiod_set_direction is a noop. For a regulator or a clk this works
> in a similar way.
>
> However for an interupt this cannot work. You will always have to check
> if the irq is actually there or not because if it's not you cannot just
> ignore that. So there is no benefit of an optional irq.
>
> Leaving error message reporting aside, the introduction of
> platform_get_irq_optional() allows to change
>
>         irq =3D platform_get_irq(...);
>         if (irq < 0 && irq !=3D -ENXIO) {
>                 return irq;
>         } else if (irq >=3D 0) {
>                 ... setup irq operation ...
>         } else { /* irq =3D=3D -ENXIO */
>                 ... setup polling ...
>         }
>
> to
>
>         irq =3D platform_get_irq_optional(...);
>         if (irq < 0 && irq !=3D -ENXIO) {
>                 return irq;
>         } else if (irq >=3D 0) {
>                 ... setup irq operation ...
>         } else { /* irq =3D=3D -ENXIO */
>                 ... setup polling ...
>         }
>
> which isn't a win. When changing the return value as you suggest, it can
> be changed instead to:
>
>         irq =3D platform_get_irq_optional(...);
>         if (irq < 0) {
>                 return irq;
>         } else if (irq > 0) {
>                 ... setup irq operation ...
>         } else { /* irq =3D=3D 0 */
>                 ... setup polling ...
>         }
>
> which is a tad nicer. If that is your goal however I ask you to also
> change the semantic of platform_get_irq() to return 0 on "not found".

Please don't make that change. If platform_get_irq() would return 0 on
"not found", all existing users have to be changed to:

        irq =3D platform_get_irq(...);
        if (irq < 0) {
                return irq;
        } else if (!irq) {
                return -ENOENT;
        } else {
                ... setup irq operation ...
        }

If the IRQ is not optional, there should be an error code when it is
not present. This keeps error handling simple.

The _optional() difference lies in the zero/NULL vs. error code in
case of not present.

> Note the win is considerably less compared to gpiod_get_optional vs
> gpiod_get however. And then it still lacks the semantic of a dummy irq
> which IMHO forfeits the right to call it ..._optional().
>
> Now I'm unwilling to continue the discussion unless there pops up a
> suggestion that results in a considerable part (say > 10%) of the
> drivers using platform_get_irq_optional not having to check if the
> return value corresponds to "not found".

Usually drivers do have to check if the interrupt was present or
not, because they may have to change the operation of the driver,
depending on interrupt-based or timer/polling-based processing.

Clocks, regulators, and resets are different, as their absence is
really a no-op.  The absence of an interrupt is not a no-op (except
for the separate interrupts vs. a single muxed interrupt case).

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
