Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B848C8C6
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7371E77;
	Wed, 12 Jan 2022 17:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7371E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006154;
	bh=TaON2KKIxRn7gxQegT0UxSp35fFXllGJwAhXnF5Te4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K4qRZL+RV/LWiGdjJoE6EzPbRsVfu8+Dj5K8ZBMKi6lHDh073ihzDsmrXHdhUD0MX
	 SkUqiiTgxk2Fyv5QyM1LeQnSKMvIAqCDrBCvRTTbLeA2kvbiF6QPnySdl3eKtkggpn
	 H8S2ehYLQsowwInihlMHPn5X8OEvyEPpZpi64LLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 438EAF8053A;
	Wed, 12 Jan 2022 17:45:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80544F8026A; Wed, 12 Jan 2022 15:01:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A738CF80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 15:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A738CF80236
Received: by mail-pj1-f42.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so12241052pjf.3
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 06:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=liYNFdlsWo55pmV9ntmO9rGWUh5k4VTb3DRABECHgIo=;
 b=XpVUscC5nrdxgd0sFRr1NQLeO7Bp8eSyXd11xXiDliI3jk+g7DVFkMc6ERH9WHhLaz
 YsjXXFHZ3dnsOcZk9mvvP8EzH3qpW1q97v2NuYQImP7PcXam+87/QcJ8V423EdGbSsil
 Hf6zjkM7iAA6QcpDqq/uVNYe37CKJrd+39DE9L0BORXJJSfOfqBqe+jRqu8cpaE8I1GR
 +MYARwD5QmFgJrBmK58hmdwOZ7A8uCmLLb8WaxLW+L5Bx5aFGPk/qSgFq0cCVLv4cdyI
 k6/nVYzjO5JLww21sWttCONJ8rOxB7tAxK+MWOdGBpc6IMStNn9K6CtKe4aVSJRwBr+B
 fdxQ==
X-Gm-Message-State: AOAM530HuiUtJQPqWfZCAj1S5UaZ60IkgTrpTpjmi9s1eoY85iAOWh4g
 uzxoisft0rf8YvRWnVuUtevK3D/rhqumvSNP
X-Google-Smtp-Source: ABdhPJw3XvHJDZnpS1bfoBmiIiM2kPJzMwhZAdbFzPUg8LKmiXVb3nAl4QzCjrIy5TnArQzOZYagHA==
X-Received: by 2002:a17:903:1110:b0:149:a428:19f1 with SMTP id
 n16-20020a170903111000b00149a42819f1mr9749601plh.120.1641996099733; 
 Wed, 12 Jan 2022 06:01:39 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49])
 by smtp.gmail.com with ESMTPSA id p37sm15691410pfh.97.2022.01.12.06.01.39
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 06:01:39 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id hv15so5009697pjb.5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 06:01:39 -0800 (PST)
X-Received: by 2002:ac5:c967:: with SMTP id t7mr4740789vkm.20.1641995696856;
 Wed, 12 Jan 2022 05:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <Yd7Z3Qwevb/lEwQZ@lunn.ch>
In-Reply-To: <Yd7Z3Qwevb/lEwQZ@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 14:54:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2cGvqMppwt9xhpze=pcnHfTozDZMjwT1DkivLD+_nbQ@mail.gmail.com>
Message-ID: <CAMuHMdV2cGvqMppwt9xhpze=pcnHfTozDZMjwT1DkivLD+_nbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 KVM list <kvm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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

Hi Andrew,

On Wed, Jan 12, 2022 at 2:38 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > If an optional IRQ is not present, drivers either just ignore it (e.g.
> > for devices that can have multiple interrupts or a single muxed IRQ),
> > or they have to resort to polling. For the latter, fall-back handling
> > is needed elsewhere in the driver.
> > To me it sounds much more logical for the driver to check if an
> > optional irq is non-zero (available) or zero (not available), than to
> > sprinkle around checks for -ENXIO. In addition, you have to remember
> > that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
> > (or some other error code) to indicate absence. I thought not having
> > to care about the actual error code was the main reason behind the
> > introduction of the *_optional() APIs.
>
> The *_optional() functions return an error code if there has been a
> real error which should be reported up the call stack. This excludes
> whatever error code indicates the requested resource does not exist,
> which can be -ENODEV etc. If the device does not exist, a magic cookie
> is returned which appears to be a valid resources but in fact is
> not. So the users of these functions just need to check for an error
> code, and fail the probe if present.

Agreed.

Note that in most (all?) other cases, the return type is a pointer
(e.g. to struct clk), and NULL is the magic cookie.

> You seems to be suggesting in binary return value: non-zero
> (available) or zero (not available)

Only in case of success. In case of a real failure, an error code
must be returned.

> This discards the error code when something goes wrong. That is useful
> information to have, so we should not be discarding it.

No, the error code must be retained in case of failure.

> IRQ don't currently have a magic cookie value. One option would be to
> add such a magic cookie to the subsystem. Otherwise, since 0 is
> invalid, return 0 to indicate the IRQ does not exist.

Exactly. And using 0 means the similar code can be used as for other
subsystems, where NULL would be returned.

The only remaining difference is the "dummy cookie can be passed
to other functions" behavior.  Which is IMHO a valid difference,
as unlike with e.g. clk_prepare_enable(), you do pass extra data to
request_irq(), and sometimes you do need to handle the absence of
the interrupt using e.g. polling.

> The request for a script checking this then makes sense. However, i
> don't know how well coccinelle/sparse can track values across function
> calls. They probably can check for:
>
>    ret = irq_get_optional()
>    if (ret < 0)
>       return ret;
>
> A missing if < 0 statement somewhere later is very likely to be an
> error. A comparison of <= 0 is also likely to be an error. A check for
> > 0 before calling any other IRQ functions would be good. I'm
> surprised such a check does not already existing in the IRQ API, but
> there are probably historical reasons for that.

There are still a few platforms where IRQ 0 does exist.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
