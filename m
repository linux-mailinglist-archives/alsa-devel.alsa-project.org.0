Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD9896A4D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF2512C8B;
	Wed,  3 Apr 2024 11:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF2512C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135809;
	bh=ZM/3Byxpxed4P8WSswonfevzf2brOiTU9TshRQSMaj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fNY9rKkjWohFgL/5mVwaXfXEVpZSC1h+eh1aLYRE7FrEOkWUdelX6mqmJVUZ+MFf1
	 aCr5XduDtv8jyxW1vmkR9Ej8LLthCdRtsTAumwh4DhTDYKOSEcW1tA5BmVpH+yD3qc
	 YMneULaVUD3SorHyf4HRUwv9JzOLA5WP74t8uWwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDC96F80579; Wed,  3 Apr 2024 11:15:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF46F8062D;
	Wed,  3 Apr 2024 11:15:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30784F80579; Wed,  3 Apr 2024 11:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B57D6F80615
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57D6F80615
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lwaupJZT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135730; x=1743671730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZM/3Byxpxed4P8WSswonfevzf2brOiTU9TshRQSMaj0=;
  b=lwaupJZTI3poxopThukG7Tecav2ArFDP62jKRxC5WQ8yEdtixdjODWnp
   yT1HHsOpbynbRnwZacnyIPI8LzSkK4ZXrsKPWrxAL1f2NIEaVPJOI84DU
   gO8BbJuvXAYJ4CI/97XHB7DUfn9x8aFCaNZb7v7KVTVzTkKN0RjH3r4Gu
   22vYT8yfI9dWriiGo8UwpwPR+KYox55pyANGvuE6b2vl/KriYsgacvskM
   PR4vCMnmkGkRFU9/TSThphfI6ztcqo8Y6tGLzy8sUwI8ahzNLuo10K+iM
   X/Qt4DUOwS3GZ00uTAmmqR8qtBYRyeDJgIulm/X7Z+7ZtudapdJVBusDC
   Q==;
X-CSE-ConnectionGUID: RCn/zjdESQim+nPT2wMS5A==
X-CSE-MsgGUID: F6QVTLq+RYuHYjQ1eMIZ/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7217320"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7217320"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915175371"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="915175371"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:15:17 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rrwiA-000000014UU-0axT;
	Wed, 03 Apr 2024 12:15:14 +0300
Date: Wed, 3 Apr 2024 12:15:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yinchuan Guo <guoych37@mail2.sysu.edu.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 32/34] ASoC: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Message-ID: <Zg0eIZDS3F_PQLyB@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-33-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-33-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: GZPG6YEZCXKQXOFKROYMQLUAL3PKTNNN
X-Message-ID-Hash: GZPG6YEZCXKQXOFKROYMQLUAL3PKTNNN
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZPG6YEZCXKQXOFKROYMQLUAL3PKTNNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Apr 03, 2024 at 10:06:50AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
> warnings enabled, a lot of driver cause a warning about an unused
> ID table:
> 
> sound/soc/atmel/sam9x5_wm8731.c:187:34: error: unused variable 'sam9x5_wm8731_of_match' [-Werror,-Wunused-const-variable]
> sound/soc/codecs/rt5514-spi.c:496:34: error: unused variable 'rt5514_of_match' [-Werror,-Wunused-const-variable]
> sound/soc/samsung/aries_wm8994.c:524:34: error: unused variable 'samsung_wm8994_of_match' [-Werror,-Wunused-const-variable]
> 
> The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
> that remove the reference, rather than adding another #ifdef just for build
> testing for a configuration that doesn't matter in practice.

...

> index d6cdb6d9fdd6..ffc105759994 100644
> --- a/sound/soc/amd/acp3x-rt5682-max9836.c
> +++ b/sound/soc/amd/acp3x-rt5682-max9836.c
> @@ -543,7 +543,7 @@ MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
>  static struct platform_driver acp3x_audio = {
>  	.driver = {
>  		.name = "acp3x-alc5682-max98357",
> -		.acpi_match_table = ACPI_PTR(acp3x_audio_acpi_match),
> +		.acpi_match_table = acp3x_audio_acpi_match,
>  		.pm = &snd_soc_pm_ops,
>  	},
>  	.probe = acp3x_probe,

Replace acpi_match_device() by device_get_match_data() and acpi.h by
mod_devicetable.h + property.h.

I really would like to see agnostic drivers (when they don't need of*.h/acpi.h
to be included as "proxy" headers).

With this, the change probably needs to be separated from this patch.

If you address as suggested,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

The rest I haven't checked, it might be possible to do something similar there
as well.

-- 
With Best Regards,
Andy Shevchenko


