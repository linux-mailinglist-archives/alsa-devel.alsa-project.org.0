Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952731AAB53
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38D5A1672;
	Wed, 15 Apr 2020 17:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38D5A1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586963243;
	bh=t15Z+kxbz6ZKJgwUaVuGm9uLDuxC92hM2iZk+puD2E0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpMXeAjiEFYyr606GgxyrbkswYcaSw7lER8TaG2jwwuspn64ZJvF6IzE23lKuTYzB
	 qFVa9u6rbtZozFGeJd1tezcSD+DUtfZa9EyLmHH6a2gAQu02l9fLz65tKZKgYQ5Ol2
	 lWmC/h2yeua1sgGlJ7pdTGT0kjjSux00xGhQ5Woc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EB58F8025F;
	Wed, 15 Apr 2020 17:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E1B5F80245; Wed, 15 Apr 2020 17:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B84E3F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 17:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84E3F80115
IronPort-SDR: ffaeA9ZTgfaFSkxsEQp5FBaTeZ5dWtmurflH/r70dDEGlb1PIvV08MWwsZ1nzeYTvSr+1piJnv
 GjgYJ1+0zuOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 08:05:31 -0700
IronPort-SDR: DA5pbUVIM9dhuNIOm/c2PX9rXy+iuiumR0TT1Jl1n5jr026uTcRG8Lj5KVoWG3uzYc5UuCW1YI
 C6wjTkTQVWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="242331814"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 15 Apr 2020 08:05:27 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOjbV-000oOJ-SM; Wed, 15 Apr 2020 18:05:29 +0300
Date: Wed, 15 Apr 2020 18:05:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry
 DAC+ PRO
Message-ID: <20200415150529.GN185537@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
 <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
 <20200415095526.GP34613@smile.fi.intel.com>
 <664999e7-f345-7296-feca-56cb53a27eb1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <664999e7-f345-7296-feca-56cb53a27eb1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Wed, Apr 15, 2020 at 09:07:20AM -0500, Pierre-Louis Bossart wrote:
> On 4/15/20 4:55 AM, Andy Shevchenko wrote:
> > On Tue, Apr 14, 2020 at 01:02:12PM -0500, Pierre-Louis Bossart wrote:
> > > On 4/14/20 12:20 PM, Andy Shevchenko wrote:
> > > > On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:

...

> > > > > +	if (IS_ERR(ctx->sclk)) {
> > > > 
> > > > > +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
> > > > 
> > > > Sounds like devm_clk_get_optional().
> > > 
> > > I am not sure about the semantic here. This driver selects the one which
> > > implements this clock, so if we get a -ENOENT return it's a very bad sign.
> > > Not sure what suppressing the error and converting to NULL would do?
> > 
> > Same as per GPIO.
> > Can it work without this clock? How did it work before your change?
> > 
> > When you add any hard dependency always ask yourself above questions.
> 
> The clock is not required in codec slave mode, it's provided by the SOC.
> 
> The clock is required when the codec is configured as master. Without these
> GPIO selection there will be no audio. So yes we could move this to
> devm_clk_get_optional() and change the test to IS_ERR_OR_NULL.

Hmm... I do not understand. If it's optional, why to check for NULL?

Perhaps you need to split code to show explicitly master / slave paths and for
the first one call everything w/o _optinal() suffix?

> > > > > +		goto skip_dacpro;
> > > > > +	}

-- 
With Best Regards,
Andy Shevchenko


