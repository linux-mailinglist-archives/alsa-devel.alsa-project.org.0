Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55E78C757
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:21:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C9BDEE;
	Tue, 29 Aug 2023 16:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C9BDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318917;
	bh=5fE5tAjAqKWPXrD1injHuzkNkqZ2cGTf1jxfBM2m15s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HrksS13iWzmoa8T9W0cPx+VGxtXqwx28sE4yO1rceP8S/tFkkdIvX7C7/3HCbAyUk
	 7g63VIOP7Ya5HN8NTgHOfJ77pXxSxI4brSkpQAzdxvPt8rI2PWIBUV3CVeVQ1nRMrH
	 hsIOaEr+qsE84sYuy6WHf/7KuCdcGFvMqU1oiwo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5460F804DA; Tue, 29 Aug 2023 16:20:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B4F2F80155;
	Tue, 29 Aug 2023 16:20:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68720F80158; Tue, 29 Aug 2023 16:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B15FF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B15FF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uo2vhC+w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693318840; x=1724854840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5fE5tAjAqKWPXrD1injHuzkNkqZ2cGTf1jxfBM2m15s=;
  b=Uo2vhC+wlQ2XPh3L81Ww1mTs9g+WmuI9yoMn43cjVERoUa48yaclY7k9
   KJJ1SsgTqz8zqE9ELMgjBVaWqdHuk7ujR29AiiyQMUFh4tu/eoQBcuH31
   CuthambBHdhi1Slfuq92P8+GQZyzMbiIIc6vyuyLiUPwfNE6tCszzd1DC
   va7PUuk+XK9esGWKZuY9eNYlY1+fJbjD7Un1IyiZ1uQiZk1qgGa3rfVIY
   GLnsRCA6XmMh8q/AXWCGsSJ5S1uLY+MWQY5UimcN7/6f6LXyTg+urR1GQ
   lNjJgvtpr2N8I3z9H10EtwOY0IZdT7jZGC1ww8EMnof3vbDRPOJe5lCO0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378097309"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="378097309"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732228250"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="732228250"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 07:20:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qaza5-004tth-3C;
	Tue, 29 Aug 2023 17:20:33 +0300
Date: Tue, 29 Aug 2023 17:20:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA: control: Use list_for_each_entry_safe()
Message-ID: <ZO3+sVKQrQT+Sefj@smile.fi.intel.com>
References: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
 <9b71579b-3c2c-aafc-64d0-ae16603de82b@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b71579b-3c2c-aafc-64d0-ae16603de82b@perex.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 25M2UQ3EZKIVIUKM4X4C4X3TBFV2J2SN
X-Message-ID-Hash: 25M2UQ3EZKIVIUKM4X4C4X3TBFV2J2SN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25M2UQ3EZKIVIUKM4X4C4X3TBFV2J2SN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 04:10:24PM +0200, Jaroslav Kysela wrote:
> On 29. 08. 23 15:52, Andy Shevchenko wrote:

...

> > Takashi, if you have anybody or want yourself to spend some time,
> > I believe you can simplify a lot the parser in this file with
> > the help of lib/cmdline.c APIs.
> 
> You probably mean next_arg() function. Unfortunately, it does not handle all
> cases we need to parse. The control IDs are a bit different than standard
> arguments.

Not only that, but also get_option() / get_options().
It might still make sense to look into and expand next_arg() to do
what you want (like I have done to get_option() which later allows
to have parse_int_array_user() be implemented).

It also have test cases, which can be expanded / amended as well.

...

> > -	list_for_each_entry(lctl, &led->controls, list)
> > +	list_for_each_entry(lctl, _lctl, &led->controls, list)
> 
> The list_for_each_entry_safe() should be used here, too.

Oh, good catch!

> With the fix:
> 
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>

Thank you, I'll send a v2 soon.

-- 
With Best Regards,
Andy Shevchenko


