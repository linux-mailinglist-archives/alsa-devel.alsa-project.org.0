Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA5D7428C5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 16:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9BB20C;
	Thu, 29 Jun 2023 16:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9BB20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688049928;
	bh=l6/fsB8WyUAC8c3jQmgFNRD0AvMmRQIcX4wvRqe5bAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uKIKkYxgVmZU/oGFfvQYPZxPyCUGNWCBSYvXvWKfYXDp5Krz7DiZURE14UFcGHm1t
	 cOHNwXm7fII4mBVbmCZdMhijSVDGrXc1pl9yTOkesP2ntB/8FhqAwlzAn839CtSC6e
	 /BfoopDi7oxPpB3v8eNMOyoqKyqTz3I86V2rV/o4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F94BF8051E; Thu, 29 Jun 2023 16:44:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDEAF80212;
	Thu, 29 Jun 2023 16:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 403F2F80246; Thu, 29 Jun 2023 16:44:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB6ACF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 16:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB6ACF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cBstBS0y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688049869; x=1719585869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6/fsB8WyUAC8c3jQmgFNRD0AvMmRQIcX4wvRqe5bAo=;
  b=cBstBS0yGYxkSVm40VqLal05nzr9XyVOsrLmLadq2obUb8tono7/DO8s
   q+/zC9ej3siDUjMckggqdv7aj4rwxnUWbWdqUqEJOKV+Noqevdc+YFD2U
   IMns1spu7HftRoXkdHTHKdkyVYlNOYpchyEYMqnl9VgLgVADcI2mmFsh3
   9aZKQk3TuAuf/BBrEeilenN69opnN7aQTHgtVaCESCzafbwobfnSYoE7d
   03LU7OHcdzFwSB5MNDUqKOBFCjWf+29zkERiDY2Tn9aaAklV6/rEvxEfd
   Wgq5tBfQ9yUtMC+zNBboGXh9tXv6OqvUY3Cw3FK1+nQZwgqNCl+m4hRIy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392848652"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="392848652"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667555125"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="667555125"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 29 Jun 2023 07:44:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qEssK-000sk9-2D;
	Thu, 29 Jun 2023 17:44:00 +0300
Date: Thu, 29 Jun 2023 17:44:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/3] ASoC: rt5677: Use agnostic
 irq_domain_create_linear()
Message-ID: <ZJ2YsMJhFLLjd1Lr@smile.fi.intel.com>
References: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
 <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: HAEE6C7RVRE4ETVP2EKX4CRDSZIXJNFH
X-Message-ID-Hash: HAEE6C7RVRE4ETVP2EKX4CRDSZIXJNFH
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAEE6C7RVRE4ETVP2EKX4CRDSZIXJNFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 29, 2023 at 01:46:01PM +0300, Andy Shevchenko wrote:
> Instead of irq_domain_add_linear() that requires of_node,
> use irq_domain_create_linear() that works outside of OF world.

...

> -	rt5677->domain = irq_domain_add_linear(i2c->dev.of_node,
> +	rt5677->domain = irq_domain_create_linear(dev_fwnode(i2c->dev),
>  			RT5677_IRQ_NUM, &rt5677_domain_ops, rt5677);

Oops, this won't compile :-(
Seems I tried in another branch that has this module disabled.

>  	if (!rt5677->domain) {
>  		dev_err(&i2c->dev, "Failed to create IRQ domain\n");

-- 
With Best Regards,
Andy Shevchenko


