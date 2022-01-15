Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E191B48FBCF
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 09:51:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 726BD178D;
	Sun, 16 Jan 2022 09:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 726BD178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642323119;
	bh=/gjuMfUz9KjDRhemBPJsaT6ysy6n+TCNn0nRrA9SpLQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPEHQOhiMAJXkfAKMU5yhCLmleP5CfwsDoV/sc9cfKszcBOnSrV4G2+7SxiRcawLg
	 Rh8Ty8SghVfJl+pyLse0MTOb4JLXBtm41hFf7d1PniW1tmLljYBWb4v8pR6Mzrefyv
	 PanyzNG6dnKprbrctcY4dwQ/mMh+7WQMSryzWPlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF08F80117;
	Sun, 16 Jan 2022 09:50:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A04F801D8; Sat, 15 Jan 2022 14:09:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5E66F80141
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 14:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E66F80141
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru C601F202F0F4
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <386a7f56-38c8-229c-4fec-4b38a77c4121@omp.ru>
 <20220114202939.5kq5ud5opfosjlyc@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <cd89d952-b7a6-cd37-9df3-f3565cb2f802@omp.ru>
Date: Sat, 15 Jan 2022 16:08:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220114202939.5kq5ud5opfosjlyc@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Mailman-Approved-At: Sun, 16 Jan 2022 09:50:50 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter
 Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, MTD
 Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kishon Vijay
 Abraham I <kishon@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open
 list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan
 Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian
 Reichel <sre@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux
 MMC List <linux-mmc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James
 Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian
 Norris <computersforpeace@gmail.com>, "David S. Miller" <davem@davemloft.net>
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

On 1/14/22 11:29 PM, Uwe Kleine-König wrote:

>>> The subsystems regulator, clk and gpio have the concept of a dummy
>>> resource. For regulator, clk and gpio there is a semantic difference
>>> between the regular _get() function and the _get_optional() variant.
>>> (One might return the dummy resource, the other won't. Unfortunately
>>> which one implements which isn't the same for these three.) The
>>> difference between platform_get_irq() and platform_get_irq_optional() is
>>> only that the former might emit an error message and the later won't.
>>>
>>> To prevent people's expectations that there is a semantic difference
>>> between these too, rename platform_get_irq_optional() to
>>> platform_get_irq_silent() to make the actual difference more obvious.
>>>
>>> The #define for the old name can and should be removed once all patches
>>> currently in flux still relying on platform_get_irq_optional() are
>>> fixed.
>>
>>    Hm... I'm afraid that with this #define they would never get fixed... :-)
> 
> I will care for it.

  Ah! OK then. :-)

>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>> Hello,
>>>
>>> On Thu, Jan 13, 2022 at 02:45:30PM +0000, Mark Brown wrote:
>>>> On Thu, Jan 13, 2022 at 12:08:31PM +0100, Uwe Kleine-König wrote:
>>>>
>>>>> This is all very unfortunate. In my eyes b) is the most sensible
>>>>> sense, but the past showed that we don't agree here. (The most annoying
>>>>> part of regulator_get is the warning that is emitted that regularily
>>>>> makes customers ask what happens here and if this is fixable.)
>>>>
>>>> Fortunately it can be fixed, and it's safer to clearly specify things.
>>>> The prints are there because when the description is wrong enough to
>>>> cause things to blow up we can fail to boot or run messily and
>>>> forgetting to describe some supplies (or typoing so they haven't done
>>>> that) and people were having a hard time figuring out what might've
>>>> happened.
>>>
>>> Yes, that's right. I sent a patch for such a warning in 2019 and pinged
>>> occationally. Still waiting for it to be merged :-\
>>> (https://lore.kernel.org/r/20190625100412.11815-1-u.kleine-koenig@pengutronix.de)
>>>
>>>>> I think at least c) is easy to resolve because
>>>>> platform_get_irq_optional() isn't that old yet and mechanically
>>>>> replacing it by platform_get_irq_silent() should be easy and safe.
>>>>> And this is orthogonal to the discussion if -ENOXIO is a sensible return
>>>>> value and if it's as easy as it could be to work with errors on irq
>>>>> lookups.
>>>>
>>>> It'd certainly be good to name anything that doesn't correspond to one
>>>> of the existing semantics for the API (!) something different rather
>>>> than adding yet another potentially overloaded meaning.
>>>
>>> It seems we're (at least) three who agree about this. Here is a patch
>>> fixing the name.
>>
>>    I can't say I genrally agree with this patch...
> 
> Yes, I didn't count you to the three people signaling agreement.

   :-D

>> [...]
>>> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
>>> index 7c96f169d274..6d495f15f717 100644
>>> --- a/include/linux/platform_device.h
>>> +++ b/include/linux/platform_device.h
>>> @@ -69,7 +69,14 @@ extern void __iomem *
>>>  devm_platform_ioremap_resource_byname(struct platform_device *pdev,
>>>  				      const char *name);
>>>  extern int platform_get_irq(struct platform_device *, unsigned int);
>>> -extern int platform_get_irq_optional(struct platform_device *, unsigned int);
>>> +extern int platform_get_irq_silent(struct platform_device *, unsigned int);
>>> +
>>> +/*
>>> + * platform_get_irq_optional was recently renamed to platform_get_irq_silent.
>>> + * Fixup users to not break patches that were created before the rename.
>>> + */
>>> +#define platform_get_irq_optional(pdev, index) platform_get_irq_silent(pdev, index)
>>> +
>>
>>    Yeah, why bother fixing if it compiles anyway?
> 
> The plan is to remove the define in one or two kernel releases. The idea
> is only to not break patches that are currently in next.
> 
>>    I think an inline wrapper with an indication to gcc that the function is deprecated
>> (I just forgot how it should look) would be better instead...
> 
> The deprecated function annotation is generally frowned upon. See
> 771c035372a0.

   Not sure I share the sentiment but good to know about that.

> Best regards
> Uwe

MBR, Sergey
