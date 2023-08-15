Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334F77CD8E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 15:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1781F2;
	Tue, 15 Aug 2023 15:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1781F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692107559;
	bh=gEWWWn6PnBw0uP74Ou/fHMCn6RcO7ifuOGqpIrzxB3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s/gvk+wsf+3ZLzrcQUbjNRaKpggDkgZYN21tYHCVoKdgo/urc0dn1+aSMD30xTeLj
	 v2pfmy6NR64681vRXLllXHvv7K9ld+QAPlEN10MDXPD2NIDpKz8Dd7KcngiquP1jNN
	 OZNK/Wbo+/k5G5gGBQTv1mCYxwdSWjovSKEwYofQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABE8BF80074; Tue, 15 Aug 2023 15:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 645B6F8016A;
	Tue, 15 Aug 2023 15:51:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D9D4F8016D; Tue, 15 Aug 2023 15:51:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47CD3F80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CD3F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LMvA3xG3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692107499; x=1723643499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gEWWWn6PnBw0uP74Ou/fHMCn6RcO7ifuOGqpIrzxB3I=;
  b=LMvA3xG3yvnitHeBcSU3C10qUDrx/aRameHn5arvWO3BEJtGTEDYJqpI
   3hKeoczKTd5I7vH4xHuXKtF33wXxWCH/9Fq/5zW4SOv1bOYUcZxclQ1M7
   Y4KOVI+3ef2PvNUv1x8+P1mjxoMRkSMEC0kVMPpVjH5B8XVA08kGUUEgv
   ih0odm81UVWYmh4OcS76krpKCkFqp+gF8PeGkCewzog+KozdvWVjojoNT
   yL4krvAfeGAqagcfEoCotKAaZ89IKt/Cfq/ufL6V73T4iaRYxJS6a0wmh
   0yJSGdkyWQmWyAqETh74Cn9OQwJYO9a0xL3+WZpJIt4oO+oeALTtYVZPQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371188862"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="371188862"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803827030"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="803827030"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 06:51:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qVuSI-003wZW-1S;
	Tue, 15 Aug 2023 16:51:30 +0300
Date: Tue, 15 Aug 2023 16:51:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/25] ALSA: core: Add memory copy helpers between
 iov_iter and iomem
Message-ID: <ZNuC4qKYOR4piQQU@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-4-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-4-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: OE42AFMJZJWEZUJST6V7BO3F3SGDA5RQ
X-Message-ID-Hash: OE42AFMJZJWEZUJST6V7BO3F3SGDA5RQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OE42AFMJZJWEZUJST6V7BO3F3SGDA5RQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 01:55:01PM +0200, Takashi Iwai wrote:
> Add two more helpers for copying memory between iov_iter and iomem,
> which will be used by the new PCM copy ops in a few drivers.
> The existing helpers became wrappers of those now.
> 
> Note that copy_from/to_iter() returns the copied bytes, hence the
> error condition is inverted from copy_from/to_user().

...

> -	return copy_to_user(dst, (const void __force*)src, count) ? -EFAULT : 0;
> +	return !copy_to_iter((const void __force *)src, count, dst) ? -EFAULT : 0;

Inverted means, I believe, this

	return copy_to_iter((const void __force *)src, count, dst) == count ? 0 : -EFAULT;

as far as I understand the idea behind the copy_to_user() return value.

Ditto for other cases.

-- 
With Best Regards,
Andy Shevchenko


