Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A934C4947FF
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:15:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A1530CE;
	Thu, 20 Jan 2022 08:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A1530CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662905;
	bh=aFWqf+IiEiBqt8+VBJnp96NSrYtNXcvgwa8NJ95Sg28=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpcDpSBIAp0XVWJJj1+zcTeqZuAH6zkQKYMNrgqUJASNnnFZkoZDTEHMw153TC0NL
	 kfgByU3XB4ikZ9hilah9bDzYMY3ft+Zrvpx+pwosjuvsyCR+PMEBeE/JbnhswxuvC4
	 qd3M+HpZMwsL6F06by0OyKKehbmyBzhYF56Rn0FA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACC75F80600;
	Thu, 20 Jan 2022 08:04:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2011F801F7; Wed, 19 Jan 2022 16:50:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A467F800F8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 16:50:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A467F800F8
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru D5BDB20C97D7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <770fb569-03c8-78f9-c174-94b31e866017@omp.ru>
 <20220119150238.5sru3vtuwsswdnkx@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f0470e8b-67af-6788-0bca-0be03bb5d0b3@omp.ru>
Date: Wed, 19 Jan 2022 18:50:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220119150238.5sru3vtuwsswdnkx@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Florian
 Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org, Robert
 Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, Mark
 Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org, Alex
 Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian
 Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
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

On 1/19/22 6:02 PM, Uwe Kleine-König wrote:

[...]
>>> This patch is based on the former Andy Shevchenko's patch:
>>>
>>> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
>>>
>>> Currently platform_get_irq_optional() returns an error code even if IRQ
>>> resource simply has not been found. It prevents the callers from being
>>> error code agnostic in their error handling:
>>>
>>> 	ret = platform_get_irq_optional(...);
>>> 	if (ret < 0 && ret != -ENXIO)
>>> 		return ret; // respect deferred probe
>>> 	if (ret > 0)
>>> 		...we get an IRQ...
>>>
>>> All other *_optional() APIs seem to return 0 or NULL in case an optional
>>> resource is not available. Let's follow this good example, so that the
>>> callers would look like:
>>>
>>> 	ret = platform_get_irq_optional(...);
>>> 	if (ret < 0)
>>> 		return ret;
>>> 	if (ret > 0)
>>> 		...we get an IRQ...
>>>
>>> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> [...]
>>
>>    Please don't merge this as yet, I'm going thru this patch once again
>> and have already found some sloppy code. :-/
> 
> Who would you expect to merge this? I would have expected Greg, but he

   Me too, it's his area, the message was addressed to Greg KH...

> seems to have given up this thread.

   You instill too much uncertainty in him. :-)

>>> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
>>> index 7450904e330a..fdc63bfa5be4 100644
>>> --- a/drivers/char/ipmi/bt-bmc.c
>>> +++ b/drivers/char/ipmi/bt-bmc.c
>>> @@ -382,12 +382,14 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>>>  	bt_bmc->irq = platform_get_irq_optional(pdev, 0);
>>>  	if (bt_bmc->irq < 0)
>>>  		return bt_bmc->irq;
>>> +	if (!bt_bmc->irq)
>>> +		return 0;
>>
>>    Hm, this is sloppy. Will recast and rebase to the -next branch.
> 
> I didn't think about what you mean with sloppy, but the code is
> equivalent to
> 
> 	if (bt_bmc->irq <= 0)
> 		return bt_bmc->irq;

   Exactly.

[...]
>>> diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
>>> index 2ccd1db5e98f..0d1bdd27cd78 100644
>>> --- a/drivers/edac/xgene_edac.c
>>> +++ b/drivers/edac/xgene_edac.c
>>> @@ -1917,7 +1917,7 @@ static int xgene_edac_probe(struct platform_device *pdev)
>>>  
>>>  		for (i = 0; i < 3; i++) {
>>>  			irq = platform_get_irq_optional(pdev, i);
>>
>>    Is *_optinal() even correct here?
> 
> _optinal isn't correct, _optional maybe is. :-)

   No. :-)

> Anyhow, look at e26124cd5f7099949109608845bba9e9bf96599c, the driver was
> fixed not to print two error messages and the wrong option was picked.

   I think this patch is wrong...

>>> -			if (irq < 0) {
>>> +			if (irq <= 0) {
>>>  				dev_err(&pdev->dev, "No IRQ resource\n");

   This is what needed to be thrown overboard... :-)

>>>  				rc = -EINVAL;
>>>  				goto out_err;
> 
> What's wrong here is that the return code is hardcoded ...

  This is wrong as well -- kills the deferred probing. I have 2 separate patches
for this driver now... just need some time to get 'em ready...

[...]
>>> index bdf924b73e47..51289700a7ac 100644
>>> --- a/drivers/power/supply/mp2629_charger.c
>>> +++ b/drivers/power/supply/mp2629_charger.c
>>> @@ -581,9 +581,9 @@ static int mp2629_charger_probe(struct platform_device *pdev)
>>>  	platform_set_drvdata(pdev, charger);
>>>  
>>>  	irq = platform_get_irq_optional(to_platform_device(dev->parent), 0);
>>
>>    Again, is *_optional() even correct here?
>>
>>> -	if (irq < 0) {
>>> +	if (irq <= 0) {
>>>  		dev_err(dev, "get irq fail: %d\n", irq);
>>> -		return irq;
>>> +		return irq < 0 ? irq : -ENXIO;
> 
> Ack, could be simplified by switching to platform_get_irq().

   Have a draft patch...

> Best regards
> Uwe

MBR, Sergey
