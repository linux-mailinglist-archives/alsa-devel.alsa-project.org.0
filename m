Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559E1A99B2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 11:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C011616;
	Wed, 15 Apr 2020 11:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C011616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586944641;
	bh=95OXE3XWuC3Bb9Rn8bhhCaj4plWG+dFTa0P5mJ0qVtY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjrPBr+br64NhGSTxGMezLDyYwKw348Wfr4d9391pc0iywYoFilXU3utgD7D+UYq8
	 GZ486pbzFNfXHNjsZ+DGDkSW3Rl1tqPinN86LtfcHgS97xDTuSJMzI7vrwvAKFG7FR
	 g0IerK0W3UIqYYqxmllAbR/epHWHESUGBITyzKVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F1C6F80124;
	Wed, 15 Apr 2020 11:55:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C977F80245; Wed, 15 Apr 2020 11:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14853F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 11:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14853F80115
IronPort-SDR: gE7cfcNAW1rKSJ0WwvrqXOCd5bNh5lXtNrc70ogl+E9brixHHD5JtpO+8y8uvB9sp4v1tcdnml
 jwyORWQG+O1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 02:55:27 -0700
IronPort-SDR: WHPT8+Gg5iTH6yvnDF7OIqInGJCBbqX2ZmU9Aj1/G6YOQ5VMqOwBwaZzFkv4wFgLHdMGkgdFy7
 2YSOsbDPHF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427381313"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 15 Apr 2020 02:55:24 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOelS-000kEZ-F8; Wed, 15 Apr 2020 12:55:26 +0300
Date: Wed, 15 Apr 2020 12:55:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry
 DAC+ PRO
Message-ID: <20200415095526.GP34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
 <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Matuschek <daniel@hifiberry.com>,
 linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
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

On Tue, Apr 14, 2020 at 01:02:12PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 12:20 PM, Andy Shevchenko wrote:
> > On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:

...

> > > +	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
> > 
> > Is this in the bindings?
> 
> Not for now. the 'sclk' part is only used by me myself and I in an ACPI
> context. I can add this description if desired.

Unfortunately you need to add this to the bindings, because it's a part of it
and somebody may use it outside of your scope.

> > > +	if (IS_ERR(ctx->sclk)) {
> > 
> > > +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
> > 
> > Sounds like devm_clk_get_optional().
> 
> I am not sure about the semantic here. This driver selects the one which
> implements this clock, so if we get a -ENOENT return it's a very bad sign.
> Not sure what suppressing the error and converting to NULL would do?

Same as per GPIO.
Can it work without this clock? How did it work before your change?

When you add any hard dependency always ask yourself above questions.

> > > +		goto skip_dacpro;
> > > +	}

-- 
With Best Regards,
Andy Shevchenko


