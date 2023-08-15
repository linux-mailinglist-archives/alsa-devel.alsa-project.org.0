Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30AE77CDA7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 15:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37029839;
	Tue, 15 Aug 2023 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37029839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692107946;
	bh=AMwlw5rr1xM9LnWBVlGLBOruP5s9VUwls2zs+mXeGDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HlOsDE99zdqSGYWhbjxvVN+SHKU2BXcD0M00nbcY/YiWHvnhx1fVEDUb+VxAaS25a
	 yL+FlHKZg23UzOvWDGqxPuoinNZjQ6IvvGigN0ELZwgTtjryJWaYMt1xFDPIsR5x2u
	 gYujpEH0ivoVAp4/3agAAohbvQPlo7Br2e4oNe0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E12BDF80536; Tue, 15 Aug 2023 15:58:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69BFCF8016D;
	Tue, 15 Aug 2023 15:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A0CF801EB; Tue, 15 Aug 2023 15:58:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 19F92F8016A
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F92F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IuAYFqqE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692107889; x=1723643889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AMwlw5rr1xM9LnWBVlGLBOruP5s9VUwls2zs+mXeGDo=;
  b=IuAYFqqEeqtLxOIt1WELuGb+9OJm8mS906YfSgcZAjcYKD4PaQweYQVN
   1hgNVsMsTDrF+PcH/xaSlyGk/EJmcM+/DQorIRIS/ugeBp7Rbp3IVVKsN
   kiCwRqXxhARNvqSDEeTGeEJDp35SZ5SkbzqVL5pP7ODuoWOvX50/gqPbV
   32FBS8IebKRgAr9HAlv7wfwqpUsMw4rRnFOi8SzhQFZv5xzvFeq8TEiEt
   wB5hyBFVb+BsC7Vun9cRGjNtQqEwS4x+IaGenzuJ47lQ2SqS7thO4hOai
   pk00C+UyoLN6ZcCw+dVjLZL1+cHr2jS2hfrwInkmV/c9ECQxVwlLbQnIb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375050875"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="375050875"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683660599"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="683660599"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 06:58:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qVuYd-004Act-0n;
	Tue, 15 Aug 2023 16:58:03 +0300
Date: Tue, 15 Aug 2023 16:58:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 19/25] ASoC: mediatek: Convert to generic PCM copy ops
Message-ID: <ZNuEajC4gqoqniEw@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-20-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-20-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 6Z5T7OLGG3ILKWXCH2IR57ZN7ZYO3OUH
X-Message-ID-Hash: 6Z5T7OLGG3ILKWXCH2IR57ZN7ZYO3OUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Z5T7OLGG3ILKWXCH2IR57ZN7ZYO3OUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 01:55:17PM +0200, Takashi Iwai wrote:
> This patch converts the mediatek BT SCO driver code to use the new
> unified PCM copy callback.  It's a straightforward conversion from
> *_user() to *_iter() variants.  As copy_form/to_iter() updates the
> internal offset at each read/write, we can drop the cur_*_idx counter
> in the loop, too.
> 
> Note that copy_from/to_iter() returns the copied bytes, hence the
> error condition is inverted from copy_from/to_user().

...

> +		if (!copy_to_iter(bt->rx_packet_buf + cur_read_idx,

!= read_size ?

> +				  read_size, buf)) {
>  			dev_warn(bt->dev, "%s(), copy_to_user fail\n",

Forgot to fix the message.

>  				 __func__);
>  			return -EFAULT;

...

> +		if (!copy_from_iter(bt->tx_packet_buf + cur_write_idx,
> +				    write_size, buf)) {
>  			dev_warn(bt->dev, "%s(), copy_from_user fail\n",
>  				 __func__);
>  			return -EFAULT;

As per above.

-- 
With Best Regards,
Andy Shevchenko


