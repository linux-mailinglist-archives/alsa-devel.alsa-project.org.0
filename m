Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F177CDA5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 15:58:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C61182C;
	Tue, 15 Aug 2023 15:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C61182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692107882;
	bh=Z5boj+fMC+VijeKK6y8yvEseWJ2SPZpwxEoI0tsFjS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e6PI8/H13naQEMgCA5S/jaq9vVKTkjlqusPqThOzOf14tZ3ihTjMAUCaAaK8v5X6J
	 KbO7VgkzOuFIuw9WzJpjoLu1BHa30kfPAh+NdvAJKZR/idNC6ecTlVr0kITTBzrPrw
	 P4hQubsmLA+25hf3frAbyG81HH5gCG248/NjCSHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1852EF80290; Tue, 15 Aug 2023 15:57:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C713AF8016A;
	Tue, 15 Aug 2023 15:57:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29D8AF8016D; Tue, 15 Aug 2023 15:57:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07CBBF80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07CBBF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ie7ZlIBk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692107826; x=1723643826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z5boj+fMC+VijeKK6y8yvEseWJ2SPZpwxEoI0tsFjS0=;
  b=ie7ZlIBkWvKj+d8kNS36Nz/otKW/RB4WKd4b46XGWI2yqBDKGrJ8PrEp
   qWxU3JUF+3MiXJVj2o/voQbLisifhy6lX+rCBh7WmKtLlh28RCwOC3atL
   xgHO2MjauV2QdbOvSURi1qgM0tJC0NU0PFIVevTYnSwAQazmmueke4EzN
   ugdY9rAk5eWkFVoUuMWek9436Dc2FSi4fy7OzlDdcRThVrdSXAvRM+tBZ
   hYkDp0NyxgvP2Sw8bQ3eA5oSl78pCVG5gXCi1mmcPcXrTSaA9FdrIvVQb
   O/X4E9VghIBI0GT7HBQMNhSo8XNinyeYBMInYVMhCo16aUH6kf/XDM9Ki
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403259499"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="403259499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="733854769"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="733854769"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 15 Aug 2023 06:57:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qVuXb-0048Sm-09;
	Tue, 15 Aug 2023 16:56:59 +0300
Date: Tue, 15 Aug 2023 16:56:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 18/25] ASoC: component: Add generic PCM copy ops
Message-ID: <ZNuEKmBUN3VPg8IO@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-19-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-19-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: WVU2PMM3P664TXCCTF3JPD2RHLBFPMYO
X-Message-ID-Hash: WVU2PMM3P664TXCCTF3JPD2RHLBFPMYO
X-MailFrom: andriy.shevchenko@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVU2PMM3P664TXCCTF3JPD2RHLBFPMYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 01:55:16PM +0200, Takashi Iwai wrote:
> For following the ALSA PCM core change, a new PCM copy ops is added
> toe ASoC component framework: snd_soc_component_driver receives the
> copy ops, and snd_soc_pcm_component_copy() helper is provided.
> 
> This also fixes a long-standing potential bug where the ASoC driver
> covers only copy_user PCM callback and misses the copy from kernel
> pointers (such as OSS PCM layer), too.
> 
> As of this patch, the old copy_user is still kept, but it'll be
> dropped later after all drivers are converted.

...

> +	/* FIXME. it returns 1st copy now */
> +	for_each_rtd_components(rtd, i, component)
> +		if (component->driver->copy)
> +			return soc_component_ret(
> +				component,

This can be on the previous line.

> +				component->driver->copy(
> +					component, substream, channel,

Ditto for the component parameter.

> +					pos, buf, bytes));

-- 
With Best Regards,
Andy Shevchenko


