Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C04B8438
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99FC18EC;
	Wed, 16 Feb 2022 10:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99FC18EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003675;
	bh=o4djJT+Nc46ZQOFWYr21P8c+Y3h/ZltxqCc2xEws6gk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SiUUGv4QHBKZO/qteensmPlJUkVBg/i0LkZJ1v27+On9ta0FQ4Em0W8ExiOrub6VN
	 0GutITilruo47VVo8AM1igLw7J9EsnwQOvU26zd+nnT49EyE1rgiOJxcGli4Kg84Ns
	 vLnYRy4XZOICe18B1ZHWr2eFNY6Rb2KVw0FT8CmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F8FF8051E;
	Wed, 16 Feb 2022 10:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B69F80310; Mon, 14 Feb 2022 09:54:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 291B7F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 09:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291B7F800D8
Received: by mail-qt1-f181.google.com with SMTP id j12so14866053qtr.2
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 00:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlmHX1HHokXQyxG79YUgUTlDvUDqxBtLYhszaegEBgU=;
 b=sJnO1TZP7I+6prnghGHRk6iT9H6QxRW+QRyy3C9h/3yndVHoJErvMZeOf4aDAPYn1v
 CIDsy7/V3rqs1POXHRR3bvq8d2DYEZscyKXiYSctyL6Mc5xgN+RuPem/A3S2fZreBgoh
 /LUUa1IRQWwTWph2VmRy+0o2VVD863htWG3TTLqDZVoo3PJLXK1KhMiyF6EQH/JtR5Dp
 Di7xEMgPyR9/rD1CcpAwX5xQMnlELzmmjafiQJpIxKk7oA0t++tK8K1LKQM5vPvwr0S0
 MhMKWbYMly1b40q56zYwu45YUl0Ycp4o8hXzjwi7ZnYLsp8giH2fpwLQaXbJ2xsEVmfu
 aysg==
X-Gm-Message-State: AOAM531/q72KGClNcu9hHUHtXWArKviy5vYmiVHF3cRg8W55QY3k8mEB
 2BhhoYx1pAfBoQgafjGse1GVeVmEpK+dvq7m
X-Google-Smtp-Source: ABdhPJx0L4Vo3NMbabwEhdYx8WMX6URJQkA66JKH3XNCB6zJ8luBxAZ3mLDQeKcnuhxiOGiW8dKpUg==
X-Received: by 2002:a05:622a:101:: with SMTP id
 u1mr8494995qtw.559.1644828877296; 
 Mon, 14 Feb 2022 00:54:37 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com.
 [209.85.219.43])
 by smtp.gmail.com with ESMTPSA id b14sm1447436qkp.23.2022.02.14.00.54.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 00:54:37 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id fh9so14262307qvb.1
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 00:54:37 -0800 (PST)
X-Received: by 2002:a05:6122:c8f:: with SMTP id
 ba15mr3731293vkb.39.1644828865522; 
 Mon, 14 Feb 2022 00:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
In-Reply-To: <20220212201631.12648-2-s.shtylyov@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 09:54:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPxX7Tja6BCjEb4KDobNFPMcM66Fk7Z+VsO7pgb8JnjA@mail.gmail.com>
Message-ID: <CAMuHMdUPxX7Tja6BCjEb4KDobNFPMcM66Fk7Z+VsO7pgb8JnjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 linux-phy@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, openipmi-developer@lists.sourceforge.net,
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, kvm@vger.kernel.org,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Zha Qipeng <qipeng.zha@intel.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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

Hi Sergey,

On Sat, Feb 12, 2022 at 9:17 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> This patch is based on the former Andy Shevchenko's patch:
>
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
>
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found.  It prevents the callers from being
> error code agnostic in their error handling:
>
>         ret = platform_get_irq_optional(...);
>         if (ret < 0 && ret != -ENXIO)
>                 return ret; // respect deferred probe
>         if (ret > 0)
>                 ...we get an IRQ...
>
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available.  Let's follow this good example, so that the
> callers would look like:
>
>         ret = platform_get_irq_optional(...);
>         if (ret < 0)
>                 return ret;
>         if (ret > 0)
>                 ...we get an IRQ...
>
> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> Changes in version 2:

Thanks for the update!

>  drivers/base/platform.c                  | 60 +++++++++++++++---------

The core change LGTM.

I'm only looking at Renesas drivers below...

> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1465,14 +1465,14 @@ static int sh_mmcif_probe(struct platform_device *pdev)
>         sh_mmcif_sync_reset(host);
>         sh_mmcif_writel(host->addr, MMCIF_CE_INT_MASK, MASK_ALL);
>
> -       name = irq[1] < 0 ? dev_name(dev) : "sh_mmc:error";
> +       name = irq[1] <= 0 ? dev_name(dev) : "sh_mmc:error";

"== 0" should be sufficient here, if the code above would bail out
on errors returned by platform_get_irq_optional(), which it currently
doesn't do.
As this adds missing error handling, this is to be fixed by a separate
patch later?

>         ret = devm_request_threaded_irq(dev, irq[0], sh_mmcif_intr,
>                                         sh_mmcif_irqt, 0, name, host);
>         if (ret) {
>                 dev_err(dev, "request_irq error (%s)\n", name);
>                 goto err_clk;
>         }
> -       if (irq[1] >= 0) {
> +       if (irq[1] > 0) {

OK.

>                 ret = devm_request_threaded_irq(dev, irq[1],
>                                                 sh_mmcif_intr, sh_mmcif_irqt,
>                                                 0, "sh_mmc:int", host);

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -439,7 +439,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>         u32 val;
>         int ret;
>
> -       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >= 0) {
> +       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq > 0) {
>                 INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
>                 ret = request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
>                                   IRQF_SHARED, dev_name(channel->dev), channel);
> @@ -486,7 +486,7 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>                 val &= ~USB2_INT_ENABLE_UCOM_INTEN;
>         writel(val, usb2_base + USB2_INT_ENABLE);
>
> -       if (channel->irq >= 0 && !rcar_gen3_is_any_rphy_initialized(channel))
> +       if (channel->irq > 0 && !rcar_gen3_is_any_rphy_initialized(channel))
>                 free_irq(channel->irq, channel);
>
>         return 0;

LGTM, but note that all errors returned by platform_get_irq_optional()
are currently ignored, even real errors, which should be propagated
up.
As this adds missing error handling, this is to be fixed by a separate
patch later?

> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -432,6 +432,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>                 irq = platform_get_irq_optional(pdev, i);
>                 if (irq < 0)
>                         return irq;
> +               if (!irq)
> +                       return -ENXIO;

While correct, and preserving existing behavior, this looks strange
to me.  Probably this should return zero instead (i.e. the check
above should be changed to "<= 0"), and the caller should start caring
about and propagating up real errors.
As this adds missing error handling, this is to be fixed by a separate
patch later?

>
>                 irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
>                                          dev_name(dev), i);
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index fb65dc601b23..328ab074fd89 100644

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

I think you missed

    #define SCIx_IRQ_IS_MUXED(port)                 \
            ((port)->irqs[SCIx_ERI_IRQ] ==  \
             (port)->irqs[SCIx_RXI_IRQ]) || \
            ((port)->irqs[SCIx_ERI_IRQ] &&  \
             ((port)->irqs[SCIx_RXI_IRQ] < 0))

above? The last condition should become "<= 0".

> @@ -1915,7 +1915,7 @@ static int sci_request_irq(struct sci_port *port)
>                          * Certain port types won't support all of the
>                          * available interrupt sources.
>                          */
> -                       if (unlikely(irq < 0))
> +                       if (unlikely(irq <= 0))
>                                 continue;
>                 }
>
> @@ -1963,7 +1963,7 @@ static void sci_free_irq(struct sci_port *port)
>                  * Certain port types won't support all of the available
>                  * interrupt sources.
>                  */
> -               if (unlikely(irq < 0))
> +               if (unlikely(irq <= 0))
>                         continue;
>
>                 /* Check if already freed (irq was muxed) */
> @@ -2875,7 +2875,7 @@ static int sci_init_single(struct platform_device *dev,
>         if (sci_port->irqs[0] < 0)
>                 return -ENXIO;
>
> -       if (sci_port->irqs[1] < 0)
> +       if (sci_port->irqs[1] <= 0)
>                 for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
>                         sci_port->irqs[i] = sci_port->irqs[0];
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
