Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8CF1AAB85
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36FB1670;
	Wed, 15 Apr 2020 17:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36FB1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586963552;
	bh=IY3lAQXm1eku/C/j2WafFfTWRdUDbscLKyErOeuVDk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGCOMc8fQdRhw9prEtuasp7X+B3FPCTzGkU0wNbY+Pw/SKtRWVmqF0GMCtc/JD6wK
	 Gj1MOn4sJPT5K+KRTUs2o2OFE6d1mvSKkPoxY1WMXX3PGHjI+WqSOHB6kL/vzToR4/
	 3SBGo2Z1PwK39eplOzRHBGbPduqp59dJ9SSqKSAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A5A9F8025F;
	Wed, 15 Apr 2020 17:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85438F80245; Wed, 15 Apr 2020 17:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89EAEF800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 17:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EAEF800ED
IronPort-SDR: 1ylstOutn9PU20otXzEHZp3zNigTV/ZxsFTO8my7OO8SOX1Fw4yDpBxt4WKNcSuv2+2XRfSTzT
 E9ttN9hawzVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 08:10:43 -0700
IronPort-SDR: A9e9OyYKXg5fzBSY5uySqqjAa199d8r4pqrr6x3TGL0zJeGVoWdu/D9Ag/O8Nj5Om7sWXdb4f7
 jitJ7LFk805g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="253550057"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 08:10:39 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOjgY-000oRQ-2E; Wed, 15 Apr 2020 18:10:42 +0300
Date: Wed, 15 Apr 2020 18:10:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200415151042.GO185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414171125.GB34613@smile.fi.intel.com>
 <7c0e7f81-cb1c-9c59-4421-baf41b8d015b@linux.intel.com>
 <20200415095228.GO34613@smile.fi.intel.com>
 <84cfd063-55d4-2e07-89ba-c03cbe856b6d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84cfd063-55d4-2e07-89ba-c03cbe856b6d@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
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

On Wed, Apr 15, 2020 at 09:19:10AM -0500, Pierre-Louis Bossart wrote:
> On 4/15/20 4:52 AM, Andy Shevchenko wrote:
> > On Tue, Apr 14, 2020 at 12:54:25PM -0500, Pierre-Louis Bossart wrote:
> > > On 4/14/20 12:11 PM, Andy Shevchenko wrote:
> > > > On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
> > > > > Using devm_clk_get() with a NULL string fails on ACPI platforms, use
> > > > > the "sclk" string as a fallback.
> > > > 
> > > > This is fishy a bit.
> > > 
> > > I didn't find a single example where we use a NULL string in ACPI cases?
> > 
> > ...
> > 
> > > > If no, why not simple switch to devm_clk_get_optional()?
> > > 
> > > Not sure what that would change?
> > 
> > Hmm... Who is the provider of this clock?
> 
> Well, at the hardware level, the clock is provided by two local oscillators
> controlled by the codec GPIOs. So you could consider that the codec is both
> the provider and consumer of the clock.

Is it internal component to the codec or discrete (outside of codec chip)?
I bet it is the latter. Thus, codec is not provider. Board, where this
configuration is used, *is* provider of the clock(s).

> In the Linux world, the PCM512x codec driver creates a gpiochip. And the clk
> driver uses the gpios to expose a clk used by the PCM512x codec driver.

Yeah, hardware cyclic dependency :-)

> I am not fully happy with this design because it creates a double dependency
> which makes it impossible to remove modules. But I don't know how to model
> it otherwise.

I guess it should be clock provider which uses GPIO as a parameter to switch
clock rates, and codec driver, which provides GPIO chip and instantiates
(after) the clock provider instance. One module or several, is an
implementation detail.

> But to go back to your question, the two parts are really joined at the hip
> since the same gpios exposed by one is used by the other.

I got it, thanks for explanation.

-- 
With Best Regards,
Andy Shevchenko


