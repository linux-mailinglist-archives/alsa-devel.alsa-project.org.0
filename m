Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B105494802
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:15:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F12E130F5;
	Thu, 20 Jan 2022 08:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F12E130F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662955;
	bh=UxCJC6eWdEdNah12KsCkH6nSMwzBaq9zmFaRweUROSw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3wLiB9XxHsmKSnZcyjJhr4mpnY/unED72OLfK6+TW7rzZb53lNy/gQGUmqf59V6E
	 qx1ye90RnMmAesopxZtVlrvfnQkrghsOekkSAwPG/be+L7cC0Qdfn6GBvnDv6RDC/a
	 aLnF5wQi6L5UFaKBJYz+jmKFl1qLpNmA6w7OQIjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6668AF80609;
	Thu, 20 Jan 2022 08:04:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E6CF80162; Wed, 19 Jan 2022 20:15:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6428BF80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 20:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6428BF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I8HNlvd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642619754; x=1674155754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UxCJC6eWdEdNah12KsCkH6nSMwzBaq9zmFaRweUROSw=;
 b=I8HNlvd9/HLW4SxMwrNSHBiPUvfqIZbuFcQxkwmZsKx5JdoDXp+bVeXq
 yomLbx3QheKKy4ZHM77alEnt57aNZj3/4BbSY+4Rn2IKvqbuqsfq9mXDm
 uREeR1tlESUIJlWBOvCmXB+eE2OacXQ6zAn/M0vykdxgpuLhJv15Jdnbr
 +5WLLUStbArPm418RxkebL8UIUPI0+gzGRH4TXwiUIx/caVieE/onSSik
 OHi85Fqba9EiN1gj9JZPLJw0ecZX0qbJ2anhTITGs25koS9PcWcZmWBty
 qLUFOMF8RBUm8OjCBSXPX//u2eXd5MgF7jnUX1dJKlhBl+RjE3Sm1ghI5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="243983971"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="243983971"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 10:38:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="518285423"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 10:38:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nAFpH-00CDps-NH; Wed, 19 Jan 2022 20:36:55 +0200
Date: Wed, 19 Jan 2022 20:36:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <YehaRwIe4LjymMhS@smile.fi.intel.com>
References: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <745c601f-c782-0904-f786-c9bfced8f11c@gmail.com>
 <cae0b73e-46df-a491-4a8e-415205038c2c@omp.ru>
 <20220115135550.dr4ngiz2c6rfs2rl@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220115135550.dr4ngiz2c6rfs2rl@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tony Luck <tony.luck@intel.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
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

On Sat, Jan 15, 2022 at 02:55:50PM +0100, Uwe Kleine-König wrote:
> On Fri, Jan 14, 2022 at 08:55:07PM +0300, Sergey Shtylyov wrote:
> > On 1/14/22 12:42 AM, Florian Fainelli wrote:

> So you oppose to the name chosen, but not the renaming as such.

I oppose the name change. The unneeded churn right now since it won't fix
the issues with the underneath API (platform_get_irq() in this case) and
will require one more iteration over callers again.

The main issue that platform_get_irq*() returns magic error code while
treating 0 in a very special way (issuing WARN() and considering it as
a successful cookie) and this all is quite confusing.

If you are going to fix the underlying issue, welcome! Now I see only
the step to somewhere. I.o.w. this change _standalone_ makes no sense
to me.

-- 
With Best Regards,
Andy Shevchenko


