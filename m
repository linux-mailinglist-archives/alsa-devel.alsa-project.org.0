Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1148C8B9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5091918;
	Wed, 12 Jan 2022 17:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5091918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006007;
	bh=rNbFetErtz2h+0GVtuglsYDCdnXOzmk80VhiQmS8dwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LCamKtFpCV1inA+KmDVVX+w+ju+JFp1afoTY4ekuiUoo6yla1vdFo7I9QDFUinOLL
	 +kDCR0/eTAcb9bwWFCw9MDgcqg7Wfl87H5s8YsEAV597+MPgqVgVJF2W/QjEYhlTn7
	 XkV8UuYL34h5sHDeT0tQx862g4f7B+X+PZW74E54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D439F80272;
	Wed, 12 Jan 2022 17:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9672F8026A; Wed, 12 Jan 2022 09:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88586F80054
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 09:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88586F80054
Received: by mail-ua1-f53.google.com with SMTP id r15so3379671uao.3
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 00:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phWLHSZjGguJkLwzqhKqiJsmBiGXyQV/Ve2Tok5pS7g=;
 b=qqKmQHqAt32EUvoE/dnaClxLGW4qOcKHXPtTT4Y4J81QwqWw/Yu6BuS6kz+QaBQmAs
 vNW3nG3fvF4/2IpRwdPFzuk+DpxWY6TB8PTWY4eLCADMpJhEzIoWjhk4og31gKAZSCoY
 ORtwzi0Ax1JNaSwEITsy7efwe0Pzgkilf+hptLDI5VCLY0JbaR+RPvBwYU091Kb+OVts
 MEzEJaYu+H5ksPmhFGy3/OapX3ByGMMQSLYbpXUhWKhSbwkaUGAWqxae1etUFzML4Hui
 GQja7HX7M247nz9lTw5LlgaioYnMFEP91doiD5yiHXzARt4d0lzTD7ncTqtgo0tQFgaR
 AjSg==
X-Gm-Message-State: AOAM5337MWxVojqzCDFLk9jDXpptChRJNVZ3abxlrnLTwtCztSpIXg2w
 g2tc7YX1qQLJiiLM94sNSjM4Z1c2Amd139/X
X-Google-Smtp-Source: ABdhPJxh3A3RyeKNqN41v9kOdInMExvmpc9WdDG472lSUtG3lQDguD59of7+HeelJkvW9Xd8CMfOQQ==
X-Received: by 2002:a05:6102:d8a:: with SMTP id
 d10mr3663724vst.47.1641976442688; 
 Wed, 12 Jan 2022 00:34:02 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id 188sm4292884vkb.24.2022.01.12.00.34.00
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:34:00 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id h11so3352152uar.5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 00:34:00 -0800 (PST)
X-Received: by 2002:ab0:2118:: with SMTP id d24mr3735076ual.78.1641976440167; 
 Wed, 12 Jan 2022 00:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
In-Reply-To: <YdyilpjC6rtz6toJ@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 09:33:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
Message-ID: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 kvm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tony Luck <tony.luck@intel.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-pwm@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
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

Hi Andrew,

On Mon, Jan 10, 2022 at 10:20 PM Andrew Lunn <andrew@lunn.ch> wrote:
> On Mon, Jan 10, 2022 at 09:10:14PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Mon, Jan 10, 2022 at 10:54:48PM +0300, Sergey Shtylyov wrote:
> > > This patch is based on the former Andy Shevchenko's patch:
> > >
> > > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko=
@linux.intel.com/
> > >
> > > Currently platform_get_irq_optional() returns an error code even if I=
RQ
> > > resource simply has not been found. It prevents the callers from bein=
g
> > > error code agnostic in their error handling:
> > >
> > >     ret =3D platform_get_irq_optional(...);
> > >     if (ret < 0 && ret !=3D -ENXIO)
> > >             return ret; // respect deferred probe
> > >     if (ret > 0)
> > >             ...we get an IRQ...
> > >
> > > All other *_optional() APIs seem to return 0 or NULL in case an optio=
nal
> > > resource is not available. Let's follow this good example, so that th=
e
> > > callers would look like:
> > >
> > >     ret =3D platform_get_irq_optional(...);
> > >     if (ret < 0)
> > >             return ret;
> > >     if (ret > 0)
> > >             ...we get an IRQ...
> >
> > The difference to gpiod_get_optional (and most other *_optional) is tha=
t
> > you can use the NULL value as if it were a valid GPIO.
> >
> > As this isn't given with for irqs, I don't think changing the return
> > value has much sense.
>
> We actually want platform_get_irq_optional() to look different to all
> the other _optional() methods because it is not equivalent. If it
> looks the same, developers will assume it is the same, and get
> themselves into trouble.

Developers already assume it is the same, and thus forget they have
to check against -ENXIO instead of zero.

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
