Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968F4947F5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D66307E;
	Thu, 20 Jan 2022 08:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D66307E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662773;
	bh=KGLVQi6QQGNSvXeEuE3AZqdmrA7eAbBtnVk/70VhHcM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8mXRj3L+bVty89JAKfugLLXarNtnrUMNJTCxSc8aKGm+rhCrpQwY2DFMPBY58YG1
	 as+/LB4vBkCOb3UpwwFbGsw790boVNnhL7QBqHIwon8wvWLVDnadOQo2ZYRtl0fEuQ
	 6GNlMFWm/sWEG9GeFM7z2j+IzN5N+H0QB6+0kmBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7395FF805E0;
	Thu, 20 Jan 2022 08:03:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC745F801F7; Wed, 19 Jan 2022 12:42:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09863F80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 12:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09863F80100
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 385F120D1C64
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
 (summary)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de> <YeQpWu2sUVOSaT9I@kroah.com>
 <20220118091819.zzxpffrxbckoxiys@pengutronix.de>
 <b6038ec2-da4a-de92-b845-cac2be0efcd1@omp.ru>
 <20220119113314.tpqfdgi6nurmzfun@pengutronix.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a42e1c8b-2c3d-e3f2-e48c-ad145322ad3d@omp.ru>
Date: Wed, 19 Jan 2022 14:42:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220119113314.tpqfdgi6nurmzfun@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Khuong
 Dinh <khuong@os.amperecomputing.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jiri
 Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John
 Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod
 Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
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

On 1/19/22 2:33 PM, Uwe Kleine-König wrote:

[...]
>>>>> A possible compromise: We can have both. We rename
>>>>> platform_get_irq_optional() to platform_get_irq_silent() (or
>>>>> platform_get_irq_silently() if this is preferred) and once all users are
>>>>> are changed (which can be done mechanically), we reintroduce a
>>>>> platform_get_irq_optional() with Sergey's suggested semantic (i.e.
>>>>> return 0 on not-found, no error message printking).
>>>>
>>>> Please do not do that as anyone trying to forward-port an old driver
>>>> will miss the abi change of functionality and get confused.  Make
>>>> build-breaking changes, if the way a function currently works is
>>>> changed in order to give people a chance.
>>>
>>> Fine for me. I assume this is a Nack for Sergey's patch?
>>
>>    Which patch do you mean? I'm starting to get really muddled... :-(
> 
> I'm talking about "[PATCH 1/2] platform: make
> platform_get_irq_optional() optional"

   I thought GregKH was talking about your renaming patch... :-/

> because "trying to forward-port an
> old driver will miss the abi" applies to it.

   Mhm... why not tell me right from the start? Jr even tell that to Andy
instead of merging his patch, so I wouldn't get sucked into this work? 
I wouldn't bother with v2 and it would have saved a lot of time spent on
email... :-(
   Do we also remember that "the stable API is a nonsense" thing? :-)

> Best regards
> Uwe

MBR, Sergey
