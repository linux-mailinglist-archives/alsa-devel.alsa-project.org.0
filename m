Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC04947DB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:07:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1503D2F86;
	Thu, 20 Jan 2022 08:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1503D2F86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662463;
	bh=tRvOiQ8QnQ1OaktHyx/WkUvFa2lq15c6Cngrxb3MGdY=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxkRI7REfCQ/KY6bJXm5YSjmk3P7plGO3NHMnpZ3QwzzxRAdYSchnxWPHQ12tCd7r
	 K50l3zqSe8sD5Jxi2NuI+sC5mSD3vNsyF7qBP39GR4zuY3GeE7jFSsDUNT/Na1kF1H
	 mPDSbekycJko1WhIBFzMeKDVFqI1sGBRTrF9UAGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9186AF80538;
	Thu, 20 Jan 2022 08:03:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3553F80249; Mon, 17 Jan 2022 12:57:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E46B7F80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 12:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46B7F80100
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 2B84620D27D1
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <770fb569-03c8-78f9-c174-94b31e866017@omp.ru>
Date: Mon, 17 Jan 2022 14:57:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220110195449.12448-2-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Guenter
 Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 openipmi-developer@lists.sourceforge.net,
 Saravanan Sekar <sravanhome@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, kvm@vger.kernel.org,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 John Garry <john.garry@huawei.com>, Robert Richter <rric@kernel.org>,
 Zha Qipeng <qipeng.zha@intel.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>, William
 Breathitt Gray <vilhelm.gray@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
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

On 1/10/22 10:54 PM, Sergey Shtylyov wrote:

> This patch is based on the former Andy Shevchenko's patch:
> 
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
> 
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found. It prevents the callers from being
> error code agnostic in their error handling:
> 
> 	ret = platform_get_irq_optional(...);
> 	if (ret < 0 && ret != -ENXIO)
> 		return ret; // respect deferred probe
> 	if (ret > 0)
> 		...we get an IRQ...
> 
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available. Let's follow this good example, so that the
> callers would look like:
> 
> 	ret = platform_get_irq_optional(...);
> 	if (ret < 0)
> 		return ret;
> 	if (ret > 0)
> 		...we get an IRQ...
> 
> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
[...]

   Please don't merge this as yet, I'm going thru this patch once again
and have already found some sloppy code. :-/

> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 7450904e330a..fdc63bfa5be4 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -382,12 +382,14 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>  	bt_bmc->irq = platform_get_irq_optional(pdev, 0);
>  	if (bt_bmc->irq < 0)
>  		return bt_bmc->irq;
> +	if (!bt_bmc->irq)
> +		return 0;

   Hm, this is sloppy. Will recast and rebase to the -next branch.

>  
>  	rc = devm_request_irq(dev, bt_bmc->irq, bt_bmc_irq, IRQF_SHARED,
>  			      DEVICE_NAME, bt_bmc);
>  	if (rc < 0) {
>  		dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> -		bt_bmc->irq = rc;
> +		bt_bmc->irq = 0;

   This change isn't needed...

>  		return rc;
>  	}
>  
[...]
> diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
> index 2ccd1db5e98f..0d1bdd27cd78 100644
> --- a/drivers/edac/xgene_edac.c
> +++ b/drivers/edac/xgene_edac.c
> @@ -1917,7 +1917,7 @@ static int xgene_edac_probe(struct platform_device *pdev)
>  
>  		for (i = 0; i < 3; i++) {
>  			irq = platform_get_irq_optional(pdev, i);

   Is *_optinal() even correct here?

> -			if (irq < 0) {
> +			if (irq <= 0) {
>  				dev_err(&pdev->dev, "No IRQ resource\n");
>  				rc = -EINVAL;
>  				goto out_err;
[...]
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index f75929783b94..ac222985efde 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -1521,7 +1521,7 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
>  
>  	/* check if you need to piggy back on the ctrlrdy irq */
>  	if (ctrl->edu_pending) {
> -		if (irq == ctrl->irq && ((int)ctrl->edu_irq >= 0))
> +		if (irq == ctrl->irq && ((int)ctrl->edu_irq > 0))

   Note to self: the cast to *int* isn't needed, the edu_irq field is *int* already...

[...]
> diff --git a/drivers/power/supply/mp2629_charger.c b/drivers/power/supply/mp2629_charger.c
> index bdf924b73e47..51289700a7ac 100644
> --- a/drivers/power/supply/mp2629_charger.c
> +++ b/drivers/power/supply/mp2629_charger.c
> @@ -581,9 +581,9 @@ static int mp2629_charger_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, charger);
>  
>  	irq = platform_get_irq_optional(to_platform_device(dev->parent), 0);

   Again, is *_optional() even correct here?

> -	if (irq < 0) {
> +	if (irq <= 0) {
>  		dev_err(dev, "get irq fail: %d\n", irq);
> -		return irq;
> +		return irq < 0 ? irq : -ENXIO;
>  	}
>  
>  	for (i = 0; i < MP2629_MAX_FIELD; i++) {
[...]
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 43eb25b167bc..776cfed4339c 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -430,7 +430,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>  
>  	for (i = 0; i < 2; i++) {
>  		irq = platform_get_irq_optional(pdev, i);
> -		if (irq < 0)
> +		if (irq <= 0)
>  			return irq;

   Sloppy code again? We shouldn't return 0...

[...]
> diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
> index 68a1c87066d7..cd7494933563 100644
> --- a/drivers/vfio/platform/vfio_platform.c
> +++ b/drivers/vfio/platform/vfio_platform.c
> @@ -32,8 +32,12 @@ static struct resource *get_platform_resource(struct vfio_platform_device *vdev,
>  static int get_platform_irq(struct vfio_platform_device *vdev, int i)
>  {
>  	struct platform_device *pdev = (struct platform_device *) vdev->opaque;
> +	int ret;
>  
> -	return platform_get_irq_optional(pdev, i);
> +	ret = platform_get_irq_optional(pdev, i);
> +	if (ret < 0)
> +		return ret;
> +	return ret > 0 ? ret : -ENXIO;

   Could be expressed more concisely:

	return ret ? : -ENXIO;

just like vfio_amba.c does it...

[...]

MBR, Sergey
