Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D177CDAC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF43844;
	Tue, 15 Aug 2023 16:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF43844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692108089;
	bh=jFg6+ygBgtTz0t27/ZViFNE4X16j6COx/+N58kJrkiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R8vCn8Cq3s9G1+yeiNEkOpGeE1UkVj1oHKgNUp6ELwaqUGzim2SCxC9SFB1ZTYA19
	 9LAtl1pp90Wyj7mZgIaAYfU/pgrMF+1832+Nd0Zlv3EKA7XS+RUkl5Coacq2sjbSSG
	 YxuQfJhASb9Iz0eR0Mr8RfSw2c9WLzwoXR+VYnz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF9DF80510; Tue, 15 Aug 2023 16:00:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C600F80027;
	Tue, 15 Aug 2023 16:00:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84BBBF8016D; Tue, 15 Aug 2023 16:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A904F80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A904F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O/2DHzUO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692108012; x=1723644012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFg6+ygBgtTz0t27/ZViFNE4X16j6COx/+N58kJrkiA=;
  b=O/2DHzUOWdVb/lTN1MI9RnefqnfKAVlyUUW6ZHyJHivIWohciQL0Sup1
   WlIkiy97hbgyIH7UWUmBB7wNLSkolFGeZ1bEVHBrJYIQuqfNkaXl5C0qp
   w4SncAfYIXkeBBkrQy/8iyHSxKuj9UqR/Rzo5hBttsuYR3k5KbUQcf+7S
   uqXRUfCSpoTf9nAEMJgdCNDojpVkvn0iMJhUJALZLojn/HyaM7Yb9+g/P
   b7mniZ/nGXSEPbxjmAsG8X3YuYrs+2PC1KcRZACypoUbcVj3uh9DZFWmB
   UTlMWkwBh01UYVbMgr/keBUx+sP15j43DEHUhE6m3q4rNIU5R/mPGAT26
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375051126"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="375051126"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 07:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683660812"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="683660812"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 07:00:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qVuab-004EoF-2h;
	Tue, 15 Aug 2023 17:00:05 +0300
Date: Tue, 15 Aug 2023 17:00:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 21/25] ASoC: dmaengine: Convert to generic PCM copy ops
Message-ID: <ZNuE5UunDd40e8vW@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-22-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-22-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: J72PP5WWRKN4MTRPCPOZMYNH7G7WH6WG
X-Message-ID-Hash: J72PP5WWRKN4MTRPCPOZMYNH7G7WH6WG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J72PP5WWRKN4MTRPCPOZMYNH7G7WH6WG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 01:55:19PM +0200, Takashi Iwai wrote:
> This patch converts the ASoC dmaenging driver code to use the new
> unified PCM copy callback.  It's a straightforward conversion from
> *_user() to *_iter() variants.
> 
> The process callback is still using the direct pointer as of now, but
> it'll be converted in the next patch.
> 
> Note that copy_from/to_iter() returns the copied bytes, hence the
> error condition is inverted from copy_from/to_user().

...

>  	if (is_playback)
> -		if (copy_from_user(dma_ptr, buf, bytes))
> +		if (!copy_from_iter(dma_ptr, bytes, buf))

!= bytes ?

>  			return -EFAULT;

Can be compressed to a single conditional:

	if (is_playback && copy_from_iter(dma_ptr, bytes, buf) != bytes)

...

>  	if (!is_playback)
> -		if (copy_to_user(buf, dma_ptr, bytes))
> +		if (!copy_to_iter(dma_ptr, bytes, buf))
>  			return -EFAULT;

As per above.

-- 
With Best Regards,
Andy Shevchenko


