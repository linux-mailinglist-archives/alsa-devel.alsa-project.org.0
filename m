Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17A75DD93
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98791FA;
	Sat, 22 Jul 2023 19:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98791FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045638;
	bh=y3U5YtvNwSlmhqbceBhaWkXGNHLjY7z5svvk/Su/I6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zz+2RiekEPr5c5DIBV1AYBBxRSkMq0g/cuGDAoxcEcVSgtTuHfTV3f5zWC6Xy3dAo
	 xNxEW4FUtLiv3OUQc1M+YNo1++wwZj4W418EiTYRrBJGuoNrT/iICPc2RuZiUY9YSL
	 3qAP6j3f8098VESCrYsffh4icKgr/VaLWwVxIm/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA3C5F80557; Sat, 22 Jul 2023 19:05:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD96BF80544;
	Sat, 22 Jul 2023 19:05:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DA3CF8047D; Fri, 21 Jul 2023 15:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7308F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7308F8007E
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433255161"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="433255161"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728103153"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="728103153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 06:46:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMqSj-006s0v-2p;
	Fri, 21 Jul 2023 16:46:29 +0300
Date: Fri, 21 Jul 2023 16:46:29 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Kris Bahnsen <kris@embeddedts.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lukasz Majewski <lukma@denx.de>, Mark Brown <broonie@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>,
	Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Reichel <sre@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 03/42] clk: ep93xx: add DT support for Cirrus EP93xx
Message-ID: <ZLqMNU6XtTEO2a1R@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-3-3d63a5f1103e@maquefel.me>
 <3fcb760c101c5f7081235290362f5c02.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fcb760c101c5f7081235290362f5c02.sboyd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andy@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UWBZS3WEHLGP4XGYRURH7KCK2YZN7FZW
X-Message-ID-Hash: UWBZS3WEHLGP4XGYRURH7KCK2YZN7FZW
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:03:50 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWBZS3WEHLGP4XGYRURH7KCK2YZN7FZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 04:27:45PM -0700, Stephen Boyd wrote:
> Quoting Nikita Shubin via B4 Relay (2023-07-20 04:29:03)

...

> > +static bool is_best(unsigned long rate, unsigned long now,
> > +                    unsigned long best)
> > +{
> > +       return abs(rate - now) < abs(rate - best);
> 
> Another case where we need abs_diff() so that it doesn't get confused
> when trying to do signed comparison.

Here you are: Message-Id: <20230721134235.15517-1-andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


