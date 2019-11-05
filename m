Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3AEFEDB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 14:40:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835E616FD;
	Tue,  5 Nov 2019 14:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835E616FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572961253;
	bh=qoiAr5i5u2zV209rhWSDWW6L5XL1GYXYwZYr+TagFI0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xfk9fZXtmTrta890zyh0wqY6nYaiJKMAq6DFSUXFJR2Cb+5mpQMd4+AGwEa37BOZP
	 jozvRKcKiRc3J46VloU4VKS+t8NHcapl+XBhBvYuWE+s60mCHKgTsMFk3IpXQWtMK6
	 23sSNFXRnTPmLM/N5Rpstg2yaFgIcZEC+phWgWdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A882CF8060E;
	Tue,  5 Nov 2019 14:38:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88873F8049B; Tue,  5 Nov 2019 13:55:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by alsa1.perex.cz (Postfix) with ESMTP id 1FFA8F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 13:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFA8F8015B
X-AuditID: c0a8fbf4-183ff70000001fa6-d4-5dc171253a3c
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 D5.26.08102.52171CD5; Tue,  5 Nov 2019 13:55:01 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 13:54:56 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQA=
Date: Tue, 5 Nov 2019 12:54:55 +0000
Message-ID: <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
In-Reply-To: <20191105122042.GO32742@smile.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <420D690570F7144C83BFECFDF3CB5C7A@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tb0wTZxjfe/f2eoDdjgrjBTWL3cyGi4pmH54szLBPO//ESZYsyxLCDrlR
 JrSsfxZc5oaic5R1owoBK+DWQChFttFiNisodMwhjgGDIgQYkpYpJBYXMAoI7o5O4dP97vn9
 ez48L0uri9kENltnEg06IUfDROI252LTti0ft6clTZ9IhqbgDQQDfT4KvP0sWI+XU1B8r5yG
 RutvGOaqujAMnHQjuGr9lYaFUIcSJvxvQ30phuFjlylY7Fmi4YTdgcFVdgnDpCdAQemjOgrc
 gUEFFDb8SYPn/CMEloV6Gvq9lQycq/kWw9iYC8HFqRAFlsGgAorm7AzcabypgM6a+wgm6isx
 VNZ2YqhealRAaOo9uOL5g4LZmasKaL99F0NfRQ8Nk2c9DCz97MZwqn5AkjUEEfTOD1NwpzkO
 Rj0eBVRcuIxg3luNYcR2BoF1ppaB1r9nUcou3n/Kq+R/mj3O8DNDJ5W8fbyb4SsWHZj3tiXw
 xbM+mr9kH1Pyff9eo3m3q4jhRwdbGL76eirvqfmC76n4HvEl9+5K44e16ODG96OSMwTTJ+9k
 Z+l27P4gShtqmqTyQlvzH18IUgXoVqIFRbCEe43YBuuxBUWyas6PyHyjUxH++R2RsuUppQWx
 LMMlE8uwUjbEcPvIQmgIyRqaC8SSQUchJRPrJc2NQicKi94gDeMeJoxfJ7YhPy1jzL1Eyrq7
 VrCKO0BGrPYVjZozEud9/0pBBAfE9lfbSg7iNpGigtBKPs3FEfc/DxThrTlS09JDh3EsmQos
 /z/XkNb5CSzvTHOJ5EfvjrA1hZT2luEw3kxKiyeU4RWiyfWzQVyCnrevabCvuu1r3PY1bvsa
 93dI4UIkV8jOyRJM4s7tBtG83aDX5kqfQ/pcNwof99wv6LFvjw9RLPKheJbSxKr2ZrenqZ/N
 0Gce0QpGbbrBnCMafYiwtCZG1VfRmqZWZQpHPhUN+ifUBhZr4lQvT9jS1JzcdVgU80TDE3Yj
 y2qIKj1PCo02iFli/ofZOaZVmmIj5PDIhBijqMsUDYLZpE2X7yPdKB2ITK2Teh16ya4y5gm5
 0jRs7UKvsiVTVQ6a7aiqddBqrNPrxIQ4lTtHknKyVGvWPS2aRnEs0qxXjcpB66QX/jRnWqqg
 pIr9gStyhUlYpRIKUNIsXjqQJu4rXLRRveabuP0F17hqcdq5u8lX9w377oOvut90ld+K//Lw
 GPnoUFB7+3PjwyRzvt1/7tgPeY3bDuRWTqdGpXy9KbFoT8vI0eXPFOXzz9Utec7Hjy5svvjW
 6dQz0c7YjozT/T1mzYudrxzde63ZvWU44Oxt2N+y65nmDV6rBhu1ws6ttMEo/AcOj0GOngQA
 AA==
X-Mailman-Approved-At: Tue, 05 Nov 2019 14:38:15 +0100
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/62] Add definition for GPIO direction
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Andy,

On Tue, 2019-11-05 at 14:20 +0200, Andy Shevchenko wrote:
> On Tue, Nov 05, 2019 at 12:09:10PM +0200, Matti Vaittinen wrote:
> > The patch series adds definitions for GPIO line directions.
> > 
> > For occasional GPIO contributor like me it is always a pain to
> > remember
> > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging
> > the
> > fact that I removed few comments like:
> > 
> > /* Return 0 if output, 1 if input */
> > /* This means "out" */
> > return 1; /* input */
> > return 0; /* output */
> > 
> > it seems at least some others may find it hard to remember too.
> > Adding
> > defines for these values helps us who really have good - but short
> > duration - memory :]
> > 
> > Please also see the last patch. It adds warning prints to be
> > emitted
> > from gpiolib if other than defined values are used. This patch can
> > be
> > dropped out if there is a reason for that to still be allowed.
> > 
> > This idea comes from RFC series for ROHM BD71828 PMIC and was
> > initially
> > discussed with Linus Walleij here:
> > https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
> > but as this has no dependencies to BD71828 work (which probably
> > takes a
> > while) I decided to make it independent series.
> > 
> > Patches are compile-tested only. I have no HW to really test them.
> > Thus I'd
> > appreciate carefull review. This work is mainly about converting
> > zeros
> > and ones to the new defines but it wouldn't be first time I get it
> > wrong
> > in one of the patches :)
> 
> For all patches I have been Cc'ed to, NAK.
> 
> I don't see the advantages now since all known hardware uses the
> single bit to
> describe direction (even for Intel where we have separate gating for
> in and out
> buffers the direction we basically rely on the bit that enables out
> buffer).
> 
> So, that said the direction is always 1 bit and basically 0/1 value. 

Yes. At least for now. And this patch didn't change that although it
makes it possible to do so if required.

> Which one
> is in and which one is out just a matter of an agreement we did.

This one is exactly the problem patch series was created for. Which one
is IN and which is OUT is indeed a matter of an agreement - but this
agreement should be clearly visible, well defined and same for all.

It's *annoying* to try finding out whether it was 1 or 0 one should
return from get_direction callback for OUTPUT. This is probably the
reason we have comments like

return 1; /* input */

there.

As this is global agreement for all GPIO framework users - not
something that can be agreed per driver basis - we should have GPIO
framework wide definitions for this. We can just add definitions for
new drivers to benefit - but I think adding them also for existing
drivers improves readability significantly (see below).

> I would also like to see bloat-o-meter statistics before and after
> your patch.
> My guts tell me that the result will be not in the favour of yours
> solution.

Can you please tell me what type of stats you hope to see? I can try
generating what you are after. The cover letter contained typical +/-
change stats from git and summary:

62 files changed, 228 insertions(+), 104 deletions(-)

It sure shows that amount of lines was increased (roughly 2 lines more
/ changed file) - but I guess that was expected as I don't like
ternary. So pretty much each

return !!foo;

was changed to

if (foo)
	return GPIO_LINE_DIRECTION_IN;

return GPIO_LINE_DIRECTION_OUT;

For me (and hopefully others who don't remember whether 1 is IN or OUT)
this is improved readability while bloat-factor is still pretty low.

From

return !!foo;

one does not know what the foo should be for IN or OUT without reading
some spec or browsing through comments. From latter it is obvious that
if foo is zero the direction is output.

Br,
	Matti
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
