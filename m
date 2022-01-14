Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6148F5E4
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 09:07:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB4F1FDA;
	Sat, 15 Jan 2022 09:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB4F1FDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642234032;
	bh=7fQaANU0270/1SCMJoJsLPPnp/ru6OboDT09EwUvaQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bb72rVqjL0/8zVamfp0+9852gItvVUghA4Xt9hrit5tBXTOIbgQgnXZ2zAHirqCCx
	 Ju2tJcoxmpMriymgUD4Y1ujsOhs97mxaot0R4GmMY21hGgy4INpUpEPnKTncyyqkWn
	 4LXvlODc1klMLp/B+eughGhITAUXy0SZl8H0kgOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C6BCF8053B;
	Sat, 15 Jan 2022 09:02:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF22F8030F; Fri, 14 Jan 2022 10:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1745FF800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 10:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1745FF800CE
Received: by mail-ua1-f45.google.com with SMTP id i5so15960016uaq.10
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 01:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LMpobQFf1iaA0D70o2w2ggZn7pjngkhXQg858+CLGTw=;
 b=RBJ8G8LzGRIM6lBAatGxYD4wzaSj7JIHAdw03OWHFH35ZmaPe8hm3MwLImb8cbsJ9t
 sBoghuUhCBAwR1K/URBVI1+Zn9/eMA4gLwHv+c6d1Aqh+01PGMb5aSMyE4jJsoBJCm2P
 bIs/Xuxc+oIaojLX2+avDz1r348l0AhCFh0bwfCsnn4e8OgbqeG+HdZXdU1cnuXMSScw
 8zPMOKu0wBcnjTgLJ9Mmnh4twcpXSSXatvpsJMXhuUiLiM/DUbXDhyq3i8eDU42hNZ1M
 U0LAvD45JQhGMwiskLjqrq0C/Z+m/dJutch4A6pFs9xzCWa6LETrOVOwqip7rpJ6JDN2
 XLnw==
X-Gm-Message-State: AOAM532gUq0xoUjZuDEmN4R2/6/9vJF1cMOMiSdbd3hV6rAF8D/588n7
 /Iw+ejyk3ClWu3q0SxlgeoeKt6GdDcdcMQ==
X-Google-Smtp-Source: ABdhPJzu+YxH7AI7UqVWzYPXOsXLF3gLtF6iIifbdJxWPw87CP4UZiQTXLKGQEXfaHIpQgICxJ8Wcg==
X-Received: by 2002:a05:6102:c08:: with SMTP id x8mr3281303vss.3.1642154343269; 
 Fri, 14 Jan 2022 01:59:03 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id d3sm2217971vsl.4.2022.01.14.01.59.02
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:59:03 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id r15so16073567uao.3
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 01:59:02 -0800 (PST)
X-Received: by 2002:a67:e905:: with SMTP id c5mr3767888vso.68.1642154342466;
 Fri, 14 Jan 2022 01:59:02 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
 <20220113224319.akljsjtu7ps75vun@pengutronix.de>
In-Reply-To: <20220113224319.akljsjtu7ps75vun@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 10:58:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
Message-ID: <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
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

On Thu, Jan 13, 2022 at 11:43 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Jan 13, 2022 at 11:57:43PM +0300, Sergey Shtylyov wrote:
> > On 1/13/22 11:17 PM, Mark Brown wrote:
> > >> The subsystems regulator, clk and gpio have the concept of a dummy
> > >> resource. For regulator, clk and gpio there is a semantic difference
> > >> between the regular _get() function and the _get_optional() variant.
> > >> (One might return the dummy resource, the other won't. Unfortunately
> > >> which one implements which isn't the same for these three.) The
> > >> difference between platform_get_irq() and platform_get_irq_optional(=
) is
> > >> only that the former might emit an error message and the later won't=
.
> >
> >    This is only a current difference but I'm still going to return 0 IS=
O
> > -ENXIO from latform_get_irq_optional(), no way I'd leave that -ENXIO th=
ere
> > alone... :-)
>
> This would address a bit of the critic in my commit log. But as 0 isn't
> a dummy value like the dummy values that exist for clk, gpiod and
> regulator I still think that the naming is a bad idea because it's not
> in the spirit of the other *_get_optional functions.
>
> Seeing you say that -ENXIO is a bad return value for
> platform_get_irq_optional() and 0 should be used instead, I wonder why
> not changing platform_get_irq() to return 0 instead of -ENXIO, too.
> This question is for now only about a sensible semantic. That actually
> changing platform_get_irq() is probably harder than changing
> platform_get_irq_optional() is a different story.
>
> If only platform_get_irq_optional() is changed and given that the
> callers have to do something like:
>
>         if (this_irq_exists()):
>                 ... (e.g. request_irq)
>         else:
>                 ... (e.g. setup polling)
>
> I really think it's a bad idea that this_irq_exists() has to be
> different for platform_get_irq() vs. platform_get_irq_optional().

For platform_get_irq(), the IRQ being absent is an error condition,
hence it should return an error code.
For platform_get_irq_optional(), the IRQ being absent is not an error
condition, hence it should not return an error code, and 0 is OK.

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
