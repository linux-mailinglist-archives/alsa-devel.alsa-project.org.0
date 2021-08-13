Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD143EB3FD
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 12:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF54A189E;
	Fri, 13 Aug 2021 12:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF54A189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628850286;
	bh=1XnPoB82BKpdrNdvBk/Mh5Y1LGfrRTWr7AOIQiJ7brw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4o/40We7FDSWJLhJz4sYHefbye/XDyk5rWnwU+04RH9cirSJrIhxaEOOLmo21V2d
	 Yina4qwdad7DzUYG6YS1PN99wBQZPzbmqTLihs1n7w8ZmxYMHfq84K41kf33tlJx2A
	 ZihNnHa548Xar2DScsmwoZ1qk6DK8bTkNQNNhVfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C775F8020D;
	Fri, 13 Aug 2021 12:23:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E31F804AE; Fri, 13 Aug 2021 12:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A09FF80129
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 12:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A09FF80129
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="202730337"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="202730337"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:23:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="677327923"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:23:38 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mEULc-0091yb-9v; Fri, 13 Aug 2021 13:23:32 +0300
Date: Fri, 13 Aug 2021 13:23:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/8] ASoC: Intel: boards: handle errors with
 acpi_dev_get_first_match_dev()
Message-ID: <YRZIJJxYNgEeSrRi@smile.fi.intel.com>
References: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
 <20210812224443.170144-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812224443.170144-3-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
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

On Thu, Aug 12, 2021 at 05:44:37PM -0500, Pierre-Louis Bossart wrote:
> acpi_dev_get_first_match_dev() searches for an acpi_handle
> instantiated by the ACPI table scanning done early during boot.
> 
> Two of three machine drivers using this search don't deal with errors
> and the one which does (bytcr_rt5651) returns -ENODEV, which doesn't
> make sense here: an alternate driver will not be probed.
> 
> Add consistent error handling and report -ENXIO

Missed period.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/intel/boards/bytcht_es8316.c | 3 +++
>  sound/soc/intel/boards/bytcr_rt5640.c  | 3 +++
>  sound/soc/intel/boards/bytcr_rt5651.c  | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index fcf7c9c04069..7c078a9f6deb 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -492,6 +492,9 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  			 "i2c-%s", acpi_dev_name(adev));
>  		put_device(&adev->dev);
>  		byt_cht_es8316_dais[dai_index].codecs->name = codec_name;
> +	} else {
> +		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
> +		return -ENXIO;
>  	}
>  
>  	/* override plaform name, if required */
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 808bfb7fd81e..60ed954d7277 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -1396,6 +1396,9 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  			 "i2c-%s", acpi_dev_name(adev));
>  		put_device(&adev->dev);
>  		byt_rt5640_dais[dai_index].codecs->name = byt_rt5640_codec_name;
> +	} else {
> +		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
> +		return -ENXIO;
>  	}
>  
>  	/*
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index 7033c07f8fd6..b4307d1d5527 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -921,7 +921,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  		byt_rt5651_dais[dai_index].codecs->name = byt_rt5651_codec_name;
>  	} else {
>  		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
> -		return -ENODEV;
> +		return -ENXIO;
>  	}
>  
>  	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


