Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8A203F06
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 20:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EEB61711;
	Mon, 22 Jun 2020 20:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EEB61711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592850020;
	bh=M9FPpa33qCjwEaLIj0qXg8vg1ESbz43ychKJ34GyVRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnD6Zk7hRhGQVVtVStH3vl0/YsMP20N63kz4vqaTXTfLFNUZsSRqeoR1XCn66Fbvx
	 fLJVt9krn4bgt9Sc+futoK5J6pdZO5inNKkn3A1qCBrM9snGrhbbBJebNLphaLfncH
	 2wwdcgQ/NR8sN6KznHDFqdPRTHFwNqcyn5yLohYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27744F8010D;
	Mon, 22 Jun 2020 20:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C490EF8015B; Mon, 22 Jun 2020 20:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E46AF8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 20:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E46AF8010D
IronPort-SDR: 6DYdXd2Ksd+oaU2KS7MWtp0155G6KK6mENvbPdn80xinrQm46Vvyt6854I5kzc8caiikktNee2
 UtLyfg3fb9yA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="141342163"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="141342163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 11:18:24 -0700
IronPort-SDR: Qb2AXzjWGzosONw9DYBFjD7ibGZcZ7uJrVk4JLb/sw4S7GCHiL5Pas6MXtxOJMl1uToX3ujtY8
 V7VOlYDHz1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="478476359"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2020 11:18:22 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jnR1U-00F8LE-EV; Mon, 22 Jun 2020 21:18:24 +0300
Date: Mon, 22 Jun 2020 21:18:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
Message-ID: <20200622181824.GG2428291@smile.fi.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
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

On Mon, Jun 22, 2020 at 10:42:38AM -0500, Pierre-Louis Bossart wrote:
> The mainline code currently prevents modules from being removed.
> 
> The BE dailink .init() function calls devm_gpiod_get() using the codec
> component device as argument. When the machine driver is removed, the
> references to the gpiod are not released, and it's not possible to
> remove the codec driver module - which is the only entity which could
> free the gpiod.
> 
> This conceptual deadlock can be avoided by invoking gpiod_get() in the
> .init() callback, and calling gpiod_put() in the exit() callback.
> 
> Tested on SAMUS Chromebook with SOF driver.

> +static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct bdw_rt5677_priv *bdw_rt5677 =
> +			snd_soc_card_get_drvdata(rtd->card);
> +
> +	/*
> +	 * The .exit() can be reached without going through the .init()
> +	 * so explicitly test if the gpiod is valid
> +	 */

> +	if (!IS_ERR_OR_NULL(bdw_rt5677->gpio_hp_en))

_OR_NULL is redundant. gpiod_put() is explicitly NULL-aware.

IS_ERR() I suppose can be avoided by using gpiod_get_optional(), if it suits the case.
Otherwise it would be questionable why we got error pointer value on ->exit().

> +		gpiod_put(bdw_rt5677->gpio_hp_en);
> +}

-- 
With Best Regards,
Andy Shevchenko


