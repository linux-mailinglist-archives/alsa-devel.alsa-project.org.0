Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F30D4947E2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E142EF0;
	Thu, 20 Jan 2022 08:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E142EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662512;
	bh=X8SHJBTX3oOByfr1h/LY+Q/lDDDeMm9UK166PYu8LPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwmLTCT0ZWz8r3QabzubrwTZoJPG+qYthWk2FbanaAUzvsAY2Nhhuvrz4aB+Nt8Yd
	 NvblYhr4/ZrjKAi1jnnlMdkvKJIfxxBt42A1nwQsbDwr29fRwyn99AxAzD5/FwRCF0
	 ERx9KoRUzX0xH/92QRjmRNyz+8L4GOlC4hyQgOJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B04DF80553;
	Thu, 20 Jan 2022 08:03:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5D37F8023B; Tue, 18 Jan 2022 09:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F3ADF800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 09:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F3ADF800D8
Received: by mail-qt1-f173.google.com with SMTP id l17so21443593qtk.7
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 00:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wwyuk2lsKqIfL1r34uR4hiV5J4os/EyMOhjZZucVxAA=;
 b=P1tzFkXBxWW1MtLpgWEPHaNCJfOG0GU7W3lNBZ0UboHvDYYStw9KyTfYFy9y8664jA
 zyWW64EZxp3Q94r/8Tx58pdyx/Bpi95orPqtvhX7iFl+9F577z4ikOjgvixj4FLpDZmU
 zd3j5s3ukwLw5iQsVLlOHEDy4uuW1g7R7nxy8PBXsbTiCUx4W+DioT0OA5yEQDRUr27s
 SuA/emXFUxZkQj/QAJFTiuGPjbXGh6mZDmG7Pd27yeXefput8xSDVOe8sHqu1sRXBgi3
 f8KPTWKB91qRbTrtD2w0mKP1syEsS7ubS/VPojDC1l9eLrsqaZzP8T1P1TiuT5hyN2zc
 mbmA==
X-Gm-Message-State: AOAM5330jG+N/N8KcXOJ8vTIxgKnXEbOjVQUlIJ612VvJ2XYO/CRpzoy
 zrmHp5s7rgjDxNo3LbvO56Rm00xXjXyoJCon
X-Google-Smtp-Source: ABdhPJxeAAl1al8NeicDMzSrRihj99HuKEE+xhXE1YsZipHklkLLR2cDkuYNsPJcmIN2FzpBbu5KRA==
X-Received: by 2002:ac8:5906:: with SMTP id 6mr9138429qty.95.1642494789587;
 Tue, 18 Jan 2022 00:33:09 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id s1sm10519253qtw.25.2022.01.18.00.33.09
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 00:33:09 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id g14so53400682ybs.8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 00:33:09 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr7281422uag.78.1642494312957;
 Tue, 18 Jan 2022 00:25:12 -0800 (PST)
MIME-Version: 1.0
References: <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
In-Reply-To: <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 09:25:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
Message-ID: <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
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
 netdev <netdev@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
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
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
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

On Mon, Jan 17, 2022 at 6:06 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Jan 17, 2022 at 02:08:19PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 17, 2022 at 12:49 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > > The logic in e.g. drivers/tty/serial/sh-sci.c and
> > > > drivers/spi/spi-rspi.c could be simplified and improved (currently
> > > > it doesn't handle deferred probe) if platform_get_irq_optional()
> > > > would return 0 instead of -ENXIO.

> > > Also for spi-rspi.c I don't see how platform_get_irq_byname_optional(=
)
> > > returning 0 instead of -ENXIO would help. Please talk in patches.

[...]

> This is not a simplification, just looking at the line count and the
> added gotos. That's because it also improves error handling and so the
> effect isn't easily spotted.

Yes, it's larger because it adds currently missing error handling.

> What about the following idea (in pythonic pseudo code for simplicity):

No idea what you gain by throwing in a language that is irrelevant
to kernel programming (why no Rust? ;-)

> > > > So there are three reasons: because the absence of an optional IRQ
> > > > is not an error, and thus that should not cause (a) an error code
> > > > to be returned, and (b) an error message to be printed, and (c)
> > > > because it can simplify the logic in device drivers.
> > >
> > > I don't agree to (a). If the value signaling not-found is -ENXIO or 0
> > > (or -ENODEV) doesn't matter much. I wouldn't deviate from the return
> > > code semantics of platform_get_irq() just for having to check against=
 0
> > > instead of -ENXIO. Zero is then just another magic value.
> >
> > Zero is a natural magic value (also for pointers).
> > Errors are always negative.
> > Positive values are cookies (or pointers) associated with success.
>
> Yeah, the issue where we don't agree is if "not-found" is special enough
> to deserve the natural magic value. For me -ENXIO is magic enough to
> handle the absence of an irq line. I consider it even the better magic
> value.

It differs from other subsystems (clk, gpio, reset), which do return
zero on not found.
What's the point in having *_optional() APIs if they just return the
same values as the non-optional ones?


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
