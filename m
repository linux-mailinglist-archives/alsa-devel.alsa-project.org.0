Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 844384B843B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3641B1923;
	Wed, 16 Feb 2022 10:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3641B1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003726;
	bh=YQung3I6nLH1X2bSWZFxSHoQgofub5OjT2yQnWh7W40=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GaX1mgAmwZQSk3HU4LIAXe2OgpOeAh3uy9Fn1t2Mflq2VQARQRDR/AP6T+4fXo+8z
	 wXhjXJVCyWHjR9kBv/Qu05lzoAktCDRriNmPmg9Cy4xngkTmQVchpTvd5p0z1UmC6m
	 weU5HUZeekkIdjYcNYG55n8XqYJ/aRslGcFupqpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B666F80535;
	Wed, 16 Feb 2022 10:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56024F800D8; Mon, 14 Feb 2022 11:43:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A3DCF800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A3DCF800D8
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 5C61B20EAFAD
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
 <CAMuHMdUPxX7Tja6BCjEb4KDobNFPMcM66Fk7Z+VsO7pgb8JnjA@mail.gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <41b49828-e0bc-3e7a-32d7-5ee41c778206@omp.ru>
Date: Mon, 14 Feb 2022 13:43:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUPxX7Tja6BCjEb4KDobNFPMcM66Fk7Z+VsO7pgb8JnjA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 linux-phy@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Guenter
 Roeck <groeck@chromium.org>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, openipmi-developer@lists.sourceforge.net,
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, kvm@vger.kernel.org,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Zha Qipeng <qipeng.zha@intel.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, Liam
 Girdwood <lgirdwood@gmail.com>, John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi
 Iwai <tiwai@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
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

Hello!

On 2/14/22 11:54 AM, Geert Uytterhoeven wrote:

[...]

>> This patch is based on the former Andy Shevchenko's patch:
>>
>> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
>>
>> Currently platform_get_irq_optional() returns an error code even if IRQ
>> resource simply has not been found.  It prevents the callers from being
>> error code agnostic in their error handling:
>>
>>         ret = platform_get_irq_optional(...);
>>         if (ret < 0 && ret != -ENXIO)
>>                 return ret; // respect deferred probe
>>         if (ret > 0)
>>                 ...we get an IRQ...
>>
>> All other *_optional() APIs seem to return 0 or NULL in case an optional
>> resource is not available.  Let's follow this good example, so that the
>> callers would look like:
>>
>>         ret = platform_get_irq_optional(...);
>>         if (ret < 0)
>>                 return ret;
>>         if (ret > 0)
>>                 ...we get an IRQ...
>>
>> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>> Changes in version 2:
> 
> Thanks for the update!
> 
>>  drivers/base/platform.c                  | 60 +++++++++++++++---------
> 
> The core change LGTM.

   Thanx! :-)

> I'm only looking at Renesas drivers below...
> 
>> --- a/drivers/mmc/host/sh_mmcif.c
>> +++ b/drivers/mmc/host/sh_mmcif.c
>> @@ -1465,14 +1465,14 @@ static int sh_mmcif_probe(struct platform_device *pdev)
>>         sh_mmcif_sync_reset(host);
>>         sh_mmcif_writel(host->addr, MMCIF_CE_INT_MASK, MASK_ALL);
>>
>> -       name = irq[1] < 0 ? dev_name(dev) : "sh_mmc:error";
>> +       name = irq[1] <= 0 ? dev_name(dev) : "sh_mmc:error";
> 
> "== 0" should be sufficient here, if the code above would bail out
> on errors returned by platform_get_irq_optional(), which it currently
> doesn't do.
> As this adds missing error handling, this is to be fixed by a separate
> patch later?

   Yes.

[...]
>>                 ret = devm_request_threaded_irq(dev, irq[1],
>>                                                 sh_mmcif_intr, sh_mmcif_irqt,
>>                                                 0, "sh_mmc:int", host);
> 
>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -439,7 +439,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>>         u32 val;
>>         int ret;
>>
>> -       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >= 0) {
>> +       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq > 0) {
>>                 INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
>>                 ret = request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
>>                                   IRQF_SHARED, dev_name(channel->dev), channel);
>> @@ -486,7 +486,7 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>>                 val &= ~USB2_INT_ENABLE_UCOM_INTEN;
>>         writel(val, usb2_base + USB2_INT_ENABLE);
>>
>> -       if (channel->irq >= 0 && !rcar_gen3_is_any_rphy_initialized(channel))
>> +       if (channel->irq > 0 && !rcar_gen3_is_any_rphy_initialized(channel))
>>                 free_irq(channel->irq, channel);
>>
>>         return 0;
> 
> LGTM, but note that all errors returned by platform_get_irq_optional()
> are currently ignored, even real errors, which should be propagated
> up.
> As this adds missing error handling, this is to be fixed by a separate
> patch later?

   Yes.

>> --- a/drivers/thermal/rcar_gen3_thermal.c
>> +++ b/drivers/thermal/rcar_gen3_thermal.c
>> @@ -432,6 +432,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>>                 irq = platform_get_irq_optional(pdev, i);
>>                 if (irq < 0)
>>                         return irq;
>> +               if (!irq)
>> +                       return -ENXIO;
> 
> While correct, and preserving existing behavior, this looks strange
> to me.  Probably this should return zero instead (i.e. the check
> above should be changed to "<= 0"), and the caller should start caring
> about and propagating up real errors.

   Hm, you're right... should be <= 0 there, it seems.

> As this adds missing error handling, this is to be fixed by a separate
> patch later?

   Propagating errors from the probe() method is a matter of separate patch, yes.

>>
>>                 irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
>>                                          dev_name(dev), i);
>> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
>> index fb65dc601b23..328ab074fd89 100644
> 
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
> 
> I think you missed
> 
>     #define SCIx_IRQ_IS_MUXED(port)                 \
>             ((port)->irqs[SCIx_ERI_IRQ] ==  \
>              (port)->irqs[SCIx_RXI_IRQ]) || \
>             ((port)->irqs[SCIx_ERI_IRQ] &&  \
>              ((port)->irqs[SCIx_RXI_IRQ] < 0))
> 
> above? The last condition should become "<= 0".

   Yes, probably... TY!

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergey
