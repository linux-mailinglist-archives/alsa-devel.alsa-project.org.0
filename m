Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD348FBD9
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 09:54:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3ADB1832;
	Sun, 16 Jan 2022 09:53:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3ADB1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642323247;
	bh=yaYV1g277um5HLPe6lEsLO6FgK87nDFflSFNYdAsGbU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yqu+MqH9kuqcU7IcCA7+HVJlJ0mEQFRK4pWvPED99ofZzJc7E73yZCjfff7YtmSLd
	 ERVOJBKjE4mSz3cqD2rjVevV09AZBjJT6g8aAcnguFyCpOaDeK+6YgUxk9sqUxdenh
	 +AL94tsB5Bh3mxHpMcejk4b8a4fMGIgC5yWbAQhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6C7F80529;
	Sun, 16 Jan 2022 09:50:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46168F800B0; Sat, 15 Jan 2022 22:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D67F800B0
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 22:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D67F800B0
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 21DDC20ADE46
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
References: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
 <20220113224319.akljsjtu7ps75vun@pengutronix.de>
 <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
 <20220115152102.m47snsdrw2elagak@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <77cea138-977a-1454-4808-bd16dd7d2734@omp.ru>
Date: Sun, 16 Jan 2022 00:06:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220115152102.m47snsdrw2elagak@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Mailman-Approved-At: Sun, 16 Jan 2022 09:50:50 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, ALSA
 Development Mailing List <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Khuong
 Dinh <khuong@os.amperecomputing.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open
 list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>, Hans de
 Goede <hdegoede@redhat.com>, Robert Richter <rric@kernel.org>, Saravanan
 Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, Cornelia Huck <cohuck@redhat.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian
 Norris <computersforpeace@gmail.com>, netdev <netdev@vger.kernel.org>
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

On 1/15/22 6:21 PM, Uwe Kleine-König wrote:

[...]
>>>>>> The subsystems regulator, clk and gpio have the concept of a dummy
>>>>>> resource. For regulator, clk and gpio there is a semantic difference
>>>>>> between the regular _get() function and the _get_optional() variant.
>>>>>> (One might return the dummy resource, the other won't. Unfortunately
>>>>>> which one implements which isn't the same for these three.) The
>>>>>> difference between platform_get_irq() and platform_get_irq_optional() is
>>>>>> only that the former might emit an error message and the later won't.
>>>>
>>>>    This is only a current difference but I'm still going to return 0 ISO
>>>> -ENXIO from latform_get_irq_optional(), no way I'd leave that -ENXIO there
>>>> alone... :-)
>>>
>>> This would address a bit of the critic in my commit log. But as 0 isn't
>>> a dummy value like the dummy values that exist for clk, gpiod and
>>> regulator I still think that the naming is a bad idea because it's not
>>> in the spirit of the other *_get_optional functions.
>>>
>>> Seeing you say that -ENXIO is a bad return value for
>>> platform_get_irq_optional() and 0 should be used instead, I wonder why
>>> not changing platform_get_irq() to return 0 instead of -ENXIO, too.
>>> This question is for now only about a sensible semantic. That actually
>>> changing platform_get_irq() is probably harder than changing
>>> platform_get_irq_optional() is a different story.
>>>
>>> If only platform_get_irq_optional() is changed and given that the
>>> callers have to do something like:
>>>
>>>         if (this_irq_exists()):
>>>                 ... (e.g. request_irq)
>>>         else:
>>>                 ... (e.g. setup polling)
>>>
>>> I really think it's a bad idea that this_irq_exists() has to be
>>> different for platform_get_irq() vs. platform_get_irq_optional().
>>
>> For platform_get_irq(), the IRQ being absent is an error condition,
>> hence it should return an error code.
>> For platform_get_irq_optional(), the IRQ being absent is not an error
>> condition, hence it should not return an error code, and 0 is OK.
> 
> Please show a few examples how this simplifies the code. If it's only

   As for platform_get_irq(), returning -ENXIO simplifies things a lot: you don't
have to check for 0 at every freaking call site and have s/th like (every
time!):

	irq = platform_get_irq();
	if (irq <= 0)
		return irq ?: -ENXIO; // any error code you choose

instead of just:

	irq = platform_get_irq();
	if (irq < 0)
		return irq;

This scales better in my book.

> that a driver has to check for == 0 instead of == -ENXIO, than that's
> not a good enough motivation to make platform_get_irq_optional()
> different to platform_get_irq().

   Again, it scales better... good motivation in my eyes.

> Best regards
> Uwe

MBR, Sergey
