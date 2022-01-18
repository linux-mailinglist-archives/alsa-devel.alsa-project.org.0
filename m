Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6E4947E8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CC9B2FCD;
	Thu, 20 Jan 2022 08:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CC9B2FCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662610;
	bh=oqq4Zc1pv8Iqz6ZWNScbus5PYjnrYMDm+DtDEYqWHwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beyxPjLg1G9hkSwXSpjNGoGSo/3wItsHATQTog/z5GpFThnynmw1nzxMA7r3kY2bA
	 L6McD8EeN+wnOLpkeYv0orIdGuWl6gQjNFXX6ufnWlFYj5rM4BLelakAaaRYg9snia
	 wX20/16fLC9Ss2jWzH3bbI/rfFWD3H/NfTWcFuPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43CF1F8058C;
	Thu, 20 Jan 2022 08:03:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0142BF8023B; Tue, 18 Jan 2022 13:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3831F80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 13:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3831F80100
Received: by mail-ua1-f43.google.com with SMTP id c36so36155146uae.13
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 04:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iDNGF1VjVomGlE1aVlmhPbvwByegTECQGcsrxubfQG0=;
 b=6HgjR5qag+qFDSGo6ucVg4RihwxmT2J5WyCZwefUDiR/q8pHuFOmV1RY1eatxzOjI4
 W5pQsL/+DZUhqAzx2ZGKoTpyRImgYOID79fw0KdoBJV0ZY64RqTc9nqSZU6i1u5LjfcS
 Oilq54iYKwgfA6Jz7GjnSJtMf3iImuf5rjAcRPBNVoXaYgkGongGlFGKDIoMmoGadRud
 xw8ViUb1ExCJ1pnTMCV8aONrEewsQrJbNfIeAonzPB70TzbHaAedsKaXe3JjP58DlasE
 YjC/qyaJrtSKipfWpV37iHmMem0LR7k/NlOayv9oLJLafQN9fFzBSbOPM8UT+c2ozHBF
 k6pg==
X-Gm-Message-State: AOAM531vIKrtnPRVKyn+4V96FaYbTfbwn5DDpu9T8qMt7ONum+bqqTqo
 rpkcWSBOcwbel+ZRG8C26mEYfYdFvj8OUvHI
X-Google-Smtp-Source: ABdhPJwnzb+39veyYMp03zwhfJFjBUDkJfL4NgGYJodMPBilUtzBPHaOB2f0Du81Otqldndd/CGuVw==
X-Received: by 2002:a67:c98c:: with SMTP id y12mr9234871vsk.54.1642510168743; 
 Tue, 18 Jan 2022 04:49:28 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id u124sm3839533vkg.3.2022.01.18.04.49.27
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:49:27 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id c36so36154893uae.13
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 04:49:27 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr9266907vsu.5.1642510166831; 
 Tue, 18 Jan 2022 04:49:26 -0800 (PST)
MIME-Version: 1.0
References: <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
 <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
 <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
 <CAMuHMdUW8+Y_=uszD+JOZO3Lpa9oDayk+GO+cg276i2f2T285w@mail.gmail.com>
 <20220118120806.pbjsat4ulg3vnhsh@pengutronix.de>
In-Reply-To: <20220118120806.pbjsat4ulg3vnhsh@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 13:49:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkwV9XE_R5FZ=jPtDwLpDbEngG6+X2JmiDJCZJZvUjYA@mail.gmail.com>
Message-ID: <CAMuHMdWkwV9XE_R5FZ=jPtDwLpDbEngG6+X2JmiDJCZJZvUjYA@mail.gmail.com>
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
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
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

On Tue, Jan 18, 2022 at 1:08 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jan 18, 2022 at 10:37:25AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Jan 18, 2022 at 10:09 AM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > For the (clk|gpiod|regulator)_get_optional() you don't have to check
> > > against the magic not-found value (so no implementation detail magic
> > > leaks into the caller code) and just pass it to the next API function=
.
> > > (And my expectation would be that if you chose to represent not-found=
 by
> > > (void *)66 instead of NULL, you won't have to adapt any user, just th=
e
> > > framework internal checks. This is a good thing!)
> >
> > Ah, there is the wrong assumption: drivers sometimes do need to know
> > if the resource was found, and thus do need to know about (void *)66,
> > -ENODEV, or -ENXIO.  I already gave examples for IRQ and clk before.
> > I can imagine these exist for gpiod and regulator, too, as soon as
> > you go beyond the trivial "enable" and "disable" use-cases.
>
> My premise is that every user who has to check for "not found"
> explicitly should not use (clk|gpiod)_get_optional() but
> (clk|gpiod)_get() and do proper (and explicit) error handling for
> -ENODEV. (clk|gpiod)_get_optional() is only for these trivial use-cases.
>
> > And 0/NULL vs. > 0 is the natural check here: missing, but not
> > an error.
>
> For me it it 100% irrelevant if "not found" is an error for the query
> function or not. I just have to be able to check for "not found" and
> react accordingly.
>
> And adding a function
>
>         def platform_get_irq_opional():
>                 ret =3D platform_get_irq()
>                 if ret =3D=3D -ENXIO:
>                         return 0
>                 return ret
>
> it's not a useful addition to the API if I cannot use 0 as a dummy
> because it doesn't simplify the caller enough to justify the additional
> function.
>
> The only thing I need to be able is to distinguish the cases "there is
> an irq", "there is no irq" and anything else is "there is a problem I
> cannot handle and so forward it to my caller". The semantic of
> platform_get_irq() is able to satisfy this requirement[1], so why introdu=
ce
> platform_get_irq_opional() for the small advantage that I can check for
> not-found using
>
>         if (!irq)
>
> instead of
>
>         if (irq !=3D -ENXIO)
>
> ? The semantic of platform_get_irq() is easier ("Either a usable
> non-negative irq number or a negative error number") compared to
> platform_get_irq_optional() ("Either a usable positive irq number or a
> negative error number or 0 meaning not found"). Usage of
> platform_get_irq() isn't harder or more expensive (neither for a human
> reader nor for a maching running the resulting compiled code).
> For a human reader
>
>         if (irq !=3D -ENXIO)
>
> is even easier to understand because for
>
>         if (!irq)
>
> they have to check where the value comes from, see it's
> platform_get_irq_optional() and understand that 0 means not-found.

"vIRQ zero does not exist."

> This function just adds overhead because as a irq framework user I have
> to understand another function. For me the added benefit is too small to
> justify the additional function. And you break out-of-tree drivers.
> These are all no major counter arguments, but as the advantage isn't
> major either, they still matter.
>
> Best regards
> Uwe
>
> [1] the only annoying thing is the error message.

So there's still a need for two functions.

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
