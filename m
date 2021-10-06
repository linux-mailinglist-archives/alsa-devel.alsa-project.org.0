Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED78424382
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BA6C1666;
	Wed,  6 Oct 2021 18:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BA6C1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633539439;
	bh=VB0GFOY/XQRuyYK4RFNV+VMTlxaAbIAdDAE49N7hf28=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=srWVjRSZVGJfvn6F6u6vUWqcSzbWGHi6WQAPjYAksHsyITJ2ydjmdcD6tQ0v/94fI
	 3SsYdrXXEhAGg3RfsAgbo13R0TvYLZPn2hDgvZEleLMoeLIk/7n2N3EicfOFsiVpvH
	 4BWh78krBu7MHHuzHgIsj2WOime8GWBF1qd+EwD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED9AAF80240;
	Wed,  6 Oct 2021 18:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6004AF802D2; Wed,  6 Oct 2021 18:56:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58F5BF80240
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58F5BF80240
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="223440597"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="223440597"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:50:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="589827690"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:50:48 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mYA7x-009GE4-DA; Wed, 06 Oct 2021 19:50:45 +0300
Date: Wed, 6 Oct 2021 19:50:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
Message-ID: <YV3T5evF+hghuwge@smile.fi.intel.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
 <YV3NZnb6mg43nUC1@smile.fi.intel.com>
 <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

On Wed, Oct 06, 2021 at 11:37:24AM -0500, Pierre-Louis Bossart wrote:
> On 10/6/21 11:23 AM, Andy Shevchenko wrote:
> > On Wed, Oct 06, 2021 at 10:51:52AM -0500, Pierre-Louis Bossart wrote:
> >> On 10/6/21 10:04 AM, Andy Shevchenko wrote:

...

> >>>  	if (SND_SOC_DAPM_EVENT_ON(event)) {
> >>> -		if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
> >>> -			ret = clk_prepare_enable(priv->mclk);
> >>> -			if (ret < 0) {
> >>> -				dev_err(card->dev,
> >>> -					"could not configure MCLK state");
> >>> -				return ret;
> >>> -			}
> >>> +		ret = clk_prepare_enable(priv->mclk);
> >>> +		if (ret < 0) {
> >>> +			dev_err(card->dev, "could not configure MCLK state");
> >>> +			return ret;
> >>>  		}
> >>
> >> I don't get why you removed the test on the BYT_RT5651_MCLK_EN quirk,
> >> see below it was designed as a fall-back mode. We don't want to return
> >> an error when we know the clock is not present/desired.
> > 
> > Why should we do a unneeded test? When we switch to the optional, there
> > will be no error from these CCF APIs. Besides that it drops indentation
> > level and makes code neat.
> 
> By looking at this code only one cannot really visualize that it's a
> no-op. I personally prefer to see explicit intent rather than have to
> dig hundreds of lines below what this clock is optional.
> 
> I am also not even sure that in real products this clock is actually
> optional,

The code tells that it's optional. If it's not the case, the code has
to be fixed accordingly.

> the default is to make use of it:
> 
> #define BYT_RT5651_DEFAULT_QUIRKS	(BYT_RT5651_MCLK_EN | \
> 
> and the only platform without this clock is "Minnowboard Max B3" -
> probably not used by anyone. I fried mine a long time ago.
> 
> We'd need to Hans to comment on this since he's really the only one
> maintaining this code.

Additional pair of eyes and a brain is always good to have!

...

> >> that part in the probe looks fine, but the changes above are controversial.
> > 
> > I didn't get. How controversial? Why? The whole point of _optional is to get
> > rid of unneeded checks (since they are _anyway_ be called).
> 
> It's inconsistent since you kept the following part but no longer use it:

It's used in some cases, but not with CLK APIs where it's redundant.

Otherwise I would remove it completely (actually it's possible to replace
it with the !priv->mclk test.

> +		/*
> +		 * Fall back to bit clock usage when clock is not
> +		 * available likely due to missing dependencies.
> +		 */
> +		if (!priv->mclk)
> +			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;

-- 
With Best Regards,
Andy Shevchenko


