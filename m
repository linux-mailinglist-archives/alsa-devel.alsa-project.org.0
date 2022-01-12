Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4048C8D0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:50:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DB61EE7;
	Wed, 12 Jan 2022 17:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DB61EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006221;
	bh=Ia0GVVVZimYE53fiTv7yRe/fb4wu6JiKUqIUDUNk3PU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCUxL3wtGOzcNQOMkLVwKzL0bWaG4tBy4p2+C8z99S21og9MdGuWIMBOxgvJuZj++
	 KY7Gs8Tb9DZtXfme/fNgS0Lik2oxEQnE6xDT4tFgTpOOJKStvzcq8Frdw2Iz/PfpHu
	 o3Cy6JYPlF76N/CFnuaQweMvlQC7LIMSCArJduPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AFDDF80559;
	Wed, 12 Jan 2022 17:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4166FF80236; Wed, 12 Jan 2022 16:48:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A988AF80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 16:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A988AF80236
Received: by mail-qt1-f180.google.com with SMTP id bp39so3428064qtb.6
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 07:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kircZLJvKwRq35Roqu4N6EMju+IOfz7v3tu0eijvuOU=;
 b=P7HL5yoElxe3fGEPZXMhvlVfpHkR0ygGR5zDjPq6N5cP9pxH1XEpRzNZ1GtRafHlWN
 2QHXauctosNctUvQqDOkzkJqY0Ax4P/eRDWXb9u6RRNmo+xgz3NQP8SNOxxm9S1U4YVM
 gb7KxGrV+jLM0DyNYJW6DrMGitbgl5h7+tcpWW3WnTp5EWaf6eEY9HMdLMpQX43iT0Jv
 CZlcwQFxppPT8EP+uqYXDuhx171fPcDfFlaVk7BfoIfCAi7g1U/piJmMkR6guR3bf+aK
 +gd+0WcIxrjX/KZWabJy2bX+f6jvECdYM4Ot+D3y2Exz44czhih/YiMwMdIqihQsPICW
 osKQ==
X-Gm-Message-State: AOAM5319A30RP78TH/za6+0ZNiTIXP30PS6Z5yBbGNUTHq7lr04F9sOM
 kqdrzB/l12oXhctTuT+SAhI0Osx487OgC4avHGU=
X-Google-Smtp-Source: ABdhPJxfYKk7N1kK4CG7HmXjc71yVz5vqxe5I1MLV5trX7z8Y3w5M287yv5s5mrOzbSUgk5scgell01Doa8kJvJe/HQ=
X-Received: by 2002:a05:622a:178e:: with SMTP id
 s14mr61437qtk.302.1642002505776; 
 Wed, 12 Jan 2022 07:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <Yd7Z3Qwevb/lEwQZ@lunn.ch>
 <CAMuHMdV2cGvqMppwt9xhpze=pcnHfTozDZMjwT1DkivLD+_nbQ@mail.gmail.com>
 <CAJZ5v0iyAHtDe1kFObQorXOX0Xraxac0j29Dh+8sq7zxzbsmcQ@mail.gmail.com>
 <78a17bae-435b-e35e-b2dc-1166777725a0@omp.ru>
 <e6487826-7683-2f29-c057-e5d7b913800c@redhat.com>
In-Reply-To: <e6487826-7683-2f29-c057-e5d7b913800c@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 12 Jan 2022 16:48:14 +0100
Message-ID: <CAJZ5v0iy7DhWniXhcf+CGriaGpzg0txOTETrwLPr1kZbZKos1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
 netdev <netdev@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

On Wed, Jan 12, 2022 at 4:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/12/22 16:05, Sergey Shtylyov wrote:
> > On 1/12/22 5:41 PM, Rafael J. Wysocki wrote:
> >
> > [...]
> >>>>> If an optional IRQ is not present, drivers either just ignore it (e.g.
> >>>>> for devices that can have multiple interrupts or a single muxed IRQ),
> >>>>> or they have to resort to polling. For the latter, fall-back handling
> >>>>> is needed elsewhere in the driver.
> >>>>> To me it sounds much more logical for the driver to check if an
> >>>>> optional irq is non-zero (available) or zero (not available), than to
> >>>>> sprinkle around checks for -ENXIO. In addition, you have to remember
> >>>>> that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
> >>>>> (or some other error code) to indicate absence. I thought not having
> >>>>> to care about the actual error code was the main reason behind the
> >>>>> introduction of the *_optional() APIs.
> >>>>Hi,
> >>>> The *_optional() functions return an error code if there has been a
> >>>> real error which should be reported up the call stack. This excludes
> >>>> whatever error code indicates the requested resource does not exist,
> >>>> which can be -ENODEV etc. If the device does not exist, a magic cookie
> >>>> is returned which appears to be a valid resources but in fact is
> >>>> not. So the users of these functions just need to check for an error
> >>>> code, and fail the probe if present.
> >>>
> >>> Agreed.
> >>>
> >>> Note that in most (all?) other cases, the return type is a pointer
> >>> (e.g. to struct clk), and NULL is the magic cookie.
> >>>
> >>>> You seems to be suggesting in binary return value: non-zero
> >>>> (available) or zero (not available)
> >>>
> >>> Only in case of success. In case of a real failure, an error code
> >>> must be returned.
> >>>
> >>>> This discards the error code when something goes wrong. That is useful
> >>>> information to have, so we should not be discarding it.
> >>>
> >>> No, the error code must be retained in case of failure.
> >>>
> >>>> IRQ don't currently have a magic cookie value. One option would be to
> >>>> add such a magic cookie to the subsystem. Otherwise, since 0 is
> >>>> invalid, return 0 to indicate the IRQ does not exist.
> >>>
> >>> Exactly. And using 0 means the similar code can be used as for other
> >>> subsystems, where NULL would be returned.
> >>>
> >>> The only remaining difference is the "dummy cookie can be passed
> >>> to other functions" behavior.  Which is IMHO a valid difference,
> >>> as unlike with e.g. clk_prepare_enable(), you do pass extra data to
> >>> request_irq(), and sometimes you do need to handle the absence of
> >>> the interrupt using e.g. polling.
> >>>
> >>>> The request for a script checking this then makes sense. However, i
> >>>> don't know how well coccinelle/sparse can track values across function
> >>>> calls. They probably can check for:
> >>>>
> >>>>    ret = irq_get_optional()
> >>>>    if (ret < 0)
> >>>>       return ret;
> >>>>
> >>>> A missing if < 0 statement somewhere later is very likely to be an
> >>>> error. A comparison of <= 0 is also likely to be an error. A check for
> >>>>> 0 before calling any other IRQ functions would be good. I'm
> >>>> surprised such a check does not already existing in the IRQ API, but
> >>>> there are probably historical reasons for that.
> >>>
> >>> There are still a few platforms where IRQ 0 does exist.
> >>
> >> Not just a few even.  This happens on a reasonably recent x86 PC:
> >>
> >> rafael@gratch:~/work/linux-pm> head -2 /proc/interrupts
> >>            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
> >>   0:         10          0          0          0          0          0
> >>  IR-IO-APIC    2-edge
> >> timer
> >
> >    IIRC Linus has proclaimed that IRQ0 was valid for the i8253 driver (living in
> > arch/x86/); IRQ0 only was frowned upon when returned by platform_get_irq() and its
> > ilk.
> >
> > MBR, Sergey
>
> Right, platform_get_irq() has this:
>
>         WARN(ret == 0, "0 is an invalid IRQ number\n");
>
> So given that platform_get_irq() returning 0 is not expected, it seems
> reasonable for platform_get_irq_optional() to use 0 as a special
> "no irq available" return value, matching the NULL returned by
> gpiod_get_optional().

Sounds reasonable to me.
