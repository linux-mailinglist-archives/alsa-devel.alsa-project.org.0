Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108D203F0B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 20:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB321720;
	Mon, 22 Jun 2020 20:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB321720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592850070;
	bh=odb8Nk/vPstevE3cVSxgSuduxqvVE26mraIPN1wCtn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jo7Fcop9GvqWZPXn1/rfi7Lv4DrOH5IKouqWEQmmluzOYeDdYu3nZHaLQouEB6Kel
	 TqlrezDRdUj9nasWFeWri4mrUUf9/AT0tg91jAhBqdWiQLkV0khR7e1cJalNL0vxe1
	 YbVMzJ7dkQGyprBm+HAMeN4zCkSZR2Pc/x+XyMxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6E7F8015A;
	Mon, 22 Jun 2020 20:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B50CF801DB; Mon, 22 Jun 2020 20:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2DFEF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 20:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2DFEF8010E
IronPort-SDR: 6DDJZGdodtKmoVwhxKy8tRhJ50pEeTBUxXIt6r5jX+URE98zUuOzO3lSQTnhM0fYZGD9JD3l8X
 h5bzBG2me5vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="142090992"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="142090992"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 11:20:09 -0700
IronPort-SDR: 8mg3aGxPT8foyHBh3L2KNLDJ9DdpcCUThVylADwlIyzQt9XyQWrGnp5dO1fhvXYJIH6PbT9rnt
 9SLgU4GL9koA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="478476647"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2020 11:20:07 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jnR3B-00F8MJ-GO; Mon, 22 Jun 2020 21:20:09 +0300
Date: Mon, 22 Jun 2020 21:20:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/5] ASoC: Intel: kbl-rt5660: use .exit() dailink
 callback to release gpiod
Message-ID: <20200622182009.GH2428291@smile.fi.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622154241.29053-4-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org
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

On Mon, Jun 22, 2020 at 10:42:39AM -0500, Pierre-Louis Bossart wrote:
> The gpiod handling is inspired from the bdw-rt5677 code. Apply same
> fix to avoid reference count issue while removing modules for
> consistency.

...

> -	ctx->gpio_lo_mute = devm_gpiod_get(component->dev, "lineout-mute",
> -					   GPIOD_OUT_HIGH);
> +	ctx->gpio_lo_mute = gpiod_get(component->dev, "lineout-mute",
> +				      GPIOD_OUT_HIGH);
>  	if (IS_ERR(ctx->gpio_lo_mute)) {
>  		dev_err(component->dev, "Can't find GPIO_MUTE# gpio\n");
>  		return PTR_ERR(ctx->gpio_lo_mute);

Is it fatal? Then IS_ERR() is not needed below. For NULL I already told.

> +	/*
> +	 * The .exit() can be reached without going through the .init()
> +	 * so explicitly test if the gpiod is valid
> +	 */

This comment should be amended after fixing the code.

> +	if (!IS_ERR_OR_NULL(ctx->gpio_lo_mute))
> +		gpiod_put(ctx->gpio_lo_mute);
> +}

-- 
With Best Regards,
Andy Shevchenko


