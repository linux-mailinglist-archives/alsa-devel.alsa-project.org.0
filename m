Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A546549F644
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:26:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4965216B2;
	Fri, 28 Jan 2022 10:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4965216B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643362013;
	bh=w17wqNo1lVdovhhPNZMo5HwsZm4SSuRC9WoO02SF49c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAx7VzIpE2ItigeE/q902CkbyUzTmEG1s5CDLAdWNgOfd/C5/cTmNO8haTpppDtdR
	 LEdQDDv2QT0kq0PyFiJZcDz9xIVkU10ptGJ0P87pdc7NpL1aostOP5EFNq0HIX/+u5
	 VbeES7Itg/YT27Ivq7gPXP8m2UyjLbgupmUfg2A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E416AF80510;
	Fri, 28 Jan 2022 10:24:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA7EF804C3; Tue, 25 Jan 2022 09:25:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC8BDF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 09:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC8BDF800D1
Received: by mail-vk1-f180.google.com with SMTP id d189so11925598vkg.3
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 00:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nj3tQtaS2Jftix8pFrL2+Rvw9SRm0Q+IWJ3wAkzl0s=;
 b=QpoGHmxHr4PWXSBqeDHqQ3ML6gqqgE/7ksv9U1Q3Egb6SIfA2bIZFMr+8ue5OVH5NH
 vWX8OMF+2P8AsiHKpQjn4ZacJekDgcG37TM4jRQhPpINRb8prsu+/7Kn4k9xQIRZDhlQ
 IWZT75bv0EZ56xXcznmIqlYPXjDDgtnqxxN4ZxheI9JZhh5wK6fMWe8/h1Ic9SBGbmYP
 0DQHfKzXxmQeWcgS0jueZiaO1oUrFVn8nDg6S+xmLgxkMIvKjfrw6PaUFgPsjB2fvsHO
 4BydbR14JEwdXNzK8rhiDCqZR+bXWlJ9IkWsAG6E3HqDkFdmhl9VWW6cQjMH5PVXdfZT
 7FQQ==
X-Gm-Message-State: AOAM5326HtdKz92/aYtWayYdfIiWJMCD9SSYkzLDb/VJZaEVnFH9JDD5
 tKR6sIgXeJ14OMEsU5E/gyCGxRXwiX1cQH2J
X-Google-Smtp-Source: ABdhPJwyuvUiHNldA5mOmQ/1QkqhdxsRpPARfW4liosC0Se2BjUu+5CIQqeXWAfVkX24KDc6j0sBNw==
X-Received: by 2002:a05:6122:2225:: with SMTP id
 bb37mr7202190vkb.27.1643099137852; 
 Tue, 25 Jan 2022 00:25:37 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id c124sm3263880vkb.51.2022.01.25.00.25.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 00:25:37 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id p1so35822925uap.9
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 00:25:37 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id
 t4mr1874173vsa.77.1643099137125; 
 Tue, 25 Jan 2022 00:25:37 -0800 (PST)
MIME-Version: 1.0
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
 <Ye6/NgfxsZnpXE09@smile.fi.intel.com>
 <15796e57-f7d4-9c66-3b53-0b026eaf31d8@omp.ru>
In-Reply-To: <15796e57-f7d4-9c66-3b53-0b026eaf31d8@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 09:25:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXouECKa43OwUgQ6dA+gNeOqEZHZgOmQzqknzYiA924YA@mail.gmail.com>
Message-ID: <CAMuHMdXouECKa43OwUgQ6dA+gNeOqEZHZgOmQzqknzYiA924YA@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
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
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
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

Hi Sergey,

On Mon, Jan 24, 2022 at 10:02 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 1/24/22 6:01 PM, Andy Shevchenko wrote:
> >>>>>>> It'd certainly be good to name anything that doesn't correspond to one
> >>>>>>> of the existing semantics for the API (!) something different rather
> >>>>>>> than adding yet another potentially overloaded meaning.
> >>>>>>
> >>>>>> It seems we're (at least) three who agree about this. Here is a patch
> >>>>>> fixing the name.
> >>>>>
> >>>>> And similar number of people are on the other side.
> >>>>
> >>>> If someone already opposed to the renaming (and not only the name) I
> >>>> must have missed that.
> >>>>
> >>>> So you think it's a good idea to keep the name
> >>>> platform_get_irq_optional() despite the "not found" value returned by it
> >>>> isn't usable as if it were a normal irq number?
> >>>
> >>> I meant that on the other side people who are in favour of Sergey's patch.
> >>> Since that I commented already that I opposed the renaming being a standalone
> >>> change.
> >>>
> >>> Do you agree that we have several issues with platform_get_irq*() APIs?
> [...]
> >>> 2. The vIRQ0 handling: a) WARN() followed by b) returned value 0
> >>
> >> I'm happy with the vIRQ0 handling. Today platform_get_irq() and it's
> >> silent variant returns either a valid and usuable irq number or a
> >> negative error value. That's totally fine.
> >
> > It might return 0.
> > Actually it seems that the WARN() can only be issued in two cases:
> > - SPARC with vIRQ0 in one of the array member
> > - fallback to ACPI for GPIO IRQ resource with index 0
>
>    You have probably missed the recent discovery that arch/sh/boards/board-aps4*.c
> causes IRQ0 to be passed as a direct IRQ resource?

So far no one reported seeing the big fat warning ;-)

> > The bottom line here is the SPARC case. Anybody familiar with the platform
> > can shed a light on this. If there is no such case, we may remove warning
> > along with ret = 0 case from platfrom_get_irq().
>
>    I'm afraid you're too fast here... :-)
>    We'll have a really hard time if we continue to allow IRQ0 to be returned by
> platform_get_irq() -- we'll have oto fileter it out in the callers then...

So far no one reported seeing the big fat warning?

> >>> 3. The specific cookie for "IRQ not found, while no error happened" case
> >>
> >> Not sure what you mean here. I have no problem that a situation I can
> >> cope with is called an error for the query function. I just do error
> >> handling and continue happily. So the part "while no error happened" is
> >> irrelevant to me.
> >
> > I meant that instead of using special error code, 0 is very much good for
> > the cases when IRQ is not found. It allows to distinguish -ENXIO from the
> > low layer from -ENXIO with this magic meaning.
>
>    I don't see how -ENXIO can trickle from the lower layers, frankly...

It might one day, leading to very hard to track bugs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
