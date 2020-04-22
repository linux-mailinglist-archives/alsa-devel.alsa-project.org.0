Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C01B3BB9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 11:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03C216C6;
	Wed, 22 Apr 2020 11:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03C216C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587548957;
	bh=6PD/53qNMiyPZw/NZZBQuHzDuCI5uFDu1XpNJqp1aJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odcaEh/ryVV+TbkbjsH/e8jfutA6PGj08kuSOyY9+VKIe/3V9qo+SqXFGShJJqTgI
	 ZF1R48NPnc77TUi/h2efuBShSloKba9ypNQQf2rOLVD4+GLNmwS7me/X3/UTgq/i3Y
	 FCKFFo2+n2/0bYFUB34F74JwzVhKWv9M2v4qqzHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECE04F80142;
	Wed, 22 Apr 2020 11:47:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88300F801D9; Wed, 22 Apr 2020 11:47:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110C5F800F2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 11:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110C5F800F2
IronPort-SDR: nVipJak5yNl4p4cKFpC9K9C1uSNQ3S8XeevW/KbHS0uOBUpmGmbLYEyjxNI1JspX0wlDl6pVeH
 pZ+9LKglgq9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 02:47:28 -0700
IronPort-SDR: 3aN7PojsIhZcUS0QDEfAJyxsjD1t1zD6WtaWFaWz45joO8ATB/Jbbakkgv8rZUN3zxRGc+3uB0
 QjpKwd1cSl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,413,1580803200"; d="scan'208";a="402489946"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 22 Apr 2020 02:47:24 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jRByZ-002PzX-07; Wed, 22 Apr 2020 12:47:27 +0300
Date: Wed, 22 Apr 2020 12:47:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
Message-ID: <20200422094726.GZ185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
 <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158754793532.132238.9824423478783177623@swboyd.mtv.corp.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

On Wed, Apr 22, 2020 at 02:32:15AM -0700, Stephen Boyd wrote:
> Quoting Pierre-Louis Bossart (2020-04-09 12:58:37)
> > On ACPI platforms the of_ functions are irrelevant, conditionally
> > compile them out and add devm_clk_hw_register_clkdev() call instead.

...

> Use if (!IS_ENABLED(CONFIG_ACPI)) instead?
> 
> >         ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
> >                                      &proclk->hw);

I'm rather wondering if we have OF stuff integrated properly to CLK framework
to avoid first branch completely.

> > +#else
> > +       ret = devm_clk_hw_register_clkdev(dev, &proclk->hw,
> > +                                         init.name, NULL);
> > +#endif

-- 
With Best Regards,
Andy Shevchenko


