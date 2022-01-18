Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B24947E6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868052FD4;
	Thu, 20 Jan 2022 08:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868052FD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662576;
	bh=nclM6slyrdniZfcjjUJQ/Ru3W/HCfMY1IKsBBInZlkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDwHDhLf9mZmj/RMDclmYqb2+btqsdspN58BEUcxMBhRoS/j+K1W2veOLdNQtaNUC
	 LLcqNUZC1gr9fxSXpKyHtT3VZPmi97rxH+Wc/eGQ8njP2/3kePqz8Tt+MB0mCHmNXM
	 r+RcUTMtZYzXZ/5mSaDB+y4dfTxFziB95Bi1OM6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA2BF80579;
	Thu, 20 Jan 2022 08:03:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E407BF8023B; Tue, 18 Jan 2022 10:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D99ABF80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 10:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D99ABF80100
Received: by mail-vk1-f174.google.com with SMTP id b77so12026745vka.11
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 01:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=94RJUajJnozufTpAr/gV3w0KHJpzlohNQuBpMs4wyR0=;
 b=yKXaRs0633xw+gY0tVxC/5vCiaG0jTEi+vgILdVqSSOWxUiRQ9QLqgUuIYXfUpBrTQ
 JbaSwvWKNhNgHnvztEbTus4tVxO7TjmC4Jm82Y7ltpMI8ZZ8pWZ50KxLCh+r/WIR3V/x
 55u55FVaRBV/JgalU2bu4nrHmqbkKOkAvWm+3hpNOpoAYtRJ6uZ2aqt4kvpGZ/Q4kFkk
 LeXKsUYqYCiCSogtkhd8qEWgGMol18zovxpkHrieGJCpgneS5ggn9tgHRVWbjs/L+IZK
 fAsb9C87HGro/k46dg5nQT/5py7j/nK5oGbukKR1r9TlQVL8i83XqYKZhdIz8+DqekDf
 evXA==
X-Gm-Message-State: AOAM533MIIm3cJcJJhFpjRQWwfNnOkUgDD5DJ/RJsdc/xg42GOo7s5ri
 axNHTwH3c2XdxO8qsiFrj/eeUDYNR9Ysd+1V
X-Google-Smtp-Source: ABdhPJzFxDxrL1hCekxDCVxWUR8DDdRYV1a/ldYapgLy8tUlOvGFsJAHzUflh19FSiENFJofla9EZw==
X-Received: by 2002:a1f:948f:: with SMTP id w137mr7823268vkd.0.1642498658983; 
 Tue, 18 Jan 2022 01:37:38 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id 7sm3767307uan.19.2022.01.18.01.37.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:37:37 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id m90so35446856uam.2
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 01:37:37 -0800 (PST)
X-Received: by 2002:a67:bc17:: with SMTP id t23mr5014894vsn.57.1642498657061; 
 Tue, 18 Jan 2022 01:37:37 -0800 (PST)
MIME-Version: 1.0
References: <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
 <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
 <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
In-Reply-To: <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 10:37:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
Message-ID: <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
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
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
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
 netdev <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Tue, Jan 18, 2022 at 10:09 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jan 18, 2022 at 09:25:01AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 17, 2022 at 6:06 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Mon, Jan 17, 2022 at 02:08:19PM +0100, Geert Uytterhoeven wrote:
> > > > On Mon, Jan 17, 2022 at 12:49 PM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > So there are three reasons: because the absence of an optional =
IRQ
> > > > > > is not an error, and thus that should not cause (a) an error co=
de
> > > > > > to be returned, and (b) an error message to be printed, and (c)
> > > > > > because it can simplify the logic in device drivers.
> > > > >
> > > > > I don't agree to (a). If the value signaling not-found is -ENXIO =
or 0
> > > > > (or -ENODEV) doesn't matter much. I wouldn't deviate from the ret=
urn
> > > > > code semantics of platform_get_irq() just for having to check aga=
inst 0
> > > > > instead of -ENXIO. Zero is then just another magic value.
> > > >
> > > > Zero is a natural magic value (also for pointers).
> > > > Errors are always negative.
> > > > Positive values are cookies (or pointers) associated with success.
> > >
> > > Yeah, the issue where we don't agree is if "not-found" is special eno=
ugh
> > > to deserve the natural magic value. For me -ENXIO is magic enough to
> > > handle the absence of an irq line. I consider it even the better magi=
c
> > > value.
> >
> > It differs from other subsystems (clk, gpio, reset), which do return
> > zero on not found.
>
> IMHO it doesn't matter at all that the return value is zero, relevant is
> the semantic of the returned value. For clk, gpio, reset and regulator
> NULL is a usable dummy, for irqs it's not. So what you do with the value
> returned by platform_get_irq_whatever() is: you compare it with the
> (magic?) not-found value, and if it matches, you enter a suitable
> if-block.
>
> For the (clk|gpiod|regulator)_get_optional() you don't have to check
> against the magic not-found value (so no implementation detail magic
> leaks into the caller code) and just pass it to the next API function.
> (And my expectation would be that if you chose to represent not-found by
> (void *)66 instead of NULL, you won't have to adapt any user, just the
> framework internal checks. This is a good thing!)

Ah, there is the wrong assumption: drivers sometimes do need to know
if the resource was found, and thus do need to know about (void *)66,
-ENODEV, or -ENXIO.  I already gave examples for IRQ and clk before.
I can imagine these exist for gpiod and regulator, too, as soon as
you go beyond the trivial "enable" and "disable" use-cases.

And 0/NULL vs. > 0 is the natural check here: missing, but not
an error.  Even for IRQ this was envisioned before, when it was
decided that vIRQ zero does not exist.
(Inconsistent) Error codes are not, as missing optional resources
are not error conditions.

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
