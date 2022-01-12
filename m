Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11A48C8BF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:47:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 053191AFC;
	Wed, 12 Jan 2022 17:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 053191AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006073;
	bh=1qNYhBPeDyjL3RrPfEgyuY4SiXrb4YYGq0tPJWXa7D8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mHlkErkW9regaUZWQIuRQH0th6C69FT3+RePD7YW/YxSYePFEaWdZB+qaGp6v7WUL
	 1YwGbZT0oxW8ZgkeCisVSv6DSsVp2Wxz0pMMn75PlEB4p8nakbR/ouxaAgugmX2XVS
	 xITAto7BCYYPfri8791h0Md6HKu3eyyjytUWNYu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F4D1F8051D;
	Wed, 12 Jan 2022 17:45:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9611F80236; Wed, 12 Jan 2022 11:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCD69F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 11:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD69F80236
Received: by mail-ua1-f50.google.com with SMTP id p1so3794607uap.9
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 02:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bq/EV5whRByTBzcA7NkMG0ZHqS/XeQEEEioGL5IxVZo=;
 b=R8PJkyfm2O/BEQ4utShG1G2QOjzATMqm3etc8dcVJyXY2HnIgC8Ieu6BjewiKXDH4i
 JMPlNTxb/1F8bP9FqpqJrUgLflIhsBZvG8gU+z4KqNk0KecHVMXXk9npr5U5VkKWjqbD
 26A7rZ/7AkdnGBQY80f32x36MUCYa+H15K9AJd5zNetHEvSBq5aKMXSpce3rO5I5wg4K
 0L26POvMVhhlZqAqVPe/MpXrqTFUC8CX60MebSeVL5/hDadxcnRR6F7R5KuHaX1jUMog
 feFBoT6i2wHhqLBMxVJrcKP6MUWvJrxZluV3fgn+bn0qdAqEyzFT0Uyd791oT3zDOpn7
 MA+A==
X-Gm-Message-State: AOAM533Z1c9avIOopbZUNPDi2c2icgxeb4PSmTPVeNsmOQqTnm+xvuTw
 idLyzwvypGyswjgSp8ZznAxNh+ZlsV8gw6I3
X-Google-Smtp-Source: ABdhPJwPljhS7RBTFqskVQnO+F6AFiTQDPLW/gMo6Ljhe6WkFnubS41VQkjVdR7WhH6gvXhD+v5j1Q==
X-Received: by 2002:a67:346:: with SMTP id 67mr2409666vsd.15.1641983236969;
 Wed, 12 Jan 2022 02:27:16 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id g43sm7109815uae.2.2022.01.12.02.27.14
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:27:15 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id v12so3816604uar.7
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 02:27:14 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr3809205vsg.57.1641983234508; 
 Wed, 12 Jan 2022 02:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
In-Reply-To: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 11:27:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
Message-ID: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
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
 Linux PWM List <linux-pwm@vger.kernel.org>,
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
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
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

On Wed, Jan 12, 2022 at 9:51 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Jan 12, 2022 at 09:33:48AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 10, 2022 at 10:20 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > On Mon, Jan 10, 2022 at 09:10:14PM +0100, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > On Mon, Jan 10, 2022 at 10:54:48PM +0300, Sergey Shtylyov wrote:
> > > > > This patch is based on the former Andy Shevchenko's patch:
> > > > >
> > > > > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevch=
enko@linux.intel.com/
> > > > >
> > > > > Currently platform_get_irq_optional() returns an error code even =
if IRQ
> > > > > resource simply has not been found. It prevents the callers from =
being
> > > > > error code agnostic in their error handling:
> > > > >
> > > > >     ret =3D platform_get_irq_optional(...);
> > > > >     if (ret < 0 && ret !=3D -ENXIO)
> > > > >             return ret; // respect deferred probe
> > > > >     if (ret > 0)
> > > > >             ...we get an IRQ...
> > > > >
> > > > > All other *_optional() APIs seem to return 0 or NULL in case an o=
ptional
> > > > > resource is not available. Let's follow this good example, so tha=
t the
> > > > > callers would look like:
> > > > >
> > > > >     ret =3D platform_get_irq_optional(...);
> > > > >     if (ret < 0)
> > > > >             return ret;
> > > > >     if (ret > 0)
> > > > >             ...we get an IRQ...
> > > >
> > > > The difference to gpiod_get_optional (and most other *_optional) is=
 that
> > > > you can use the NULL value as if it were a valid GPIO.
> > > >
> > > > As this isn't given with for irqs, I don't think changing the retur=
n
> > > > value has much sense.
> > >
> > > We actually want platform_get_irq_optional() to look different to all
> > > the other _optional() methods because it is not equivalent. If it
> > > looks the same, developers will assume it is the same, and get
> > > themselves into trouble.
> >
> > Developers already assume it is the same, and thus forget they have
> > to check against -ENXIO instead of zero.
>
> Is this an ack for renaming platform_get_irq_optional() to
> platform_get_irq_silent()?

No it isn't ;-)

If an optional IRQ is not present, drivers either just ignore it (e.g.
for devices that can have multiple interrupts or a single muxed IRQ),
or they have to resort to polling. For the latter, fall-back handling
is needed elsewhere in the driver.
To me it sounds much more logical for the driver to check if an
optional irq is non-zero (available) or zero (not available), than to
sprinkle around checks for -ENXIO. In addition, you have to remember
that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
(or some other error code) to indicate absence. I thought not having
to care about the actual error code was the main reason behind the
introduction of the *_optional() APIs.

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
