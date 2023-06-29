Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB767424CE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7576584D;
	Thu, 29 Jun 2023 13:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7576584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688037039;
	bh=Dt51Frbc0VtpgKsRkoOje6ipINA90raC3oWM4OnSZKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bZd6tRMi1ejY0U8taEEXMvjk8A/9DS4eaaetOZQwpwOGLZKsiEYYk2lOHQPZDc9+N
	 jdt7iH8d5Ov4oHwv1yksBYVUO3TaE6UXj24KuZuRCJnKAtvIMogJjOGHxDxShp3SdK
	 Lr3j2KWCbyFCMvM6p6abX4xjXb4pGTi7Q9FNe4Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9CEDF8027B; Thu, 29 Jun 2023 13:09:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6509FF80093;
	Thu, 29 Jun 2023 13:09:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E984F80246; Thu, 29 Jun 2023 13:09:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1584CF80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1584CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UUEBY7in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036954; x=1719572954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dt51Frbc0VtpgKsRkoOje6ipINA90raC3oWM4OnSZKU=;
  b=UUEBY7inWbssPxMJizhTlTQgrKztrnuslYBeGXwY023Iepq+/5LYNdho
   7infI/TCGSD0GjJmh/he3QM+nQNi5pTdTCcAmZT6plUSJnLVJRIVdVJWx
   IY2+SXe2qdcRrLVSThcNhar+WzoQymodJlL8NvHTB7p79uSyGPFtYCEFB
   fjZJ3b+Fsv5FifUq9/uA9TZQhgTMv/X4ad5gSFeewJEGobGrNWPfAsXBq
   kYYNzogaQ1gjuaC7/x1pIKvxCnWboYqXo4+qLTbZC+Hx7kBiurhziNwK7
   1QvcPUFTqwY/ZBOXBH59dZP9JndPa6BSPJiU2d8IB6lzVREsT1wGxh7bO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362118843"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="362118843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="861890475"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="861890475"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2023 04:09:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qEpWM-000ps9-1A;
	Thu, 29 Jun 2023 14:09:06 +0300
Date: Thu, 29 Jun 2023 14:09:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 2/3] ASoC: rt5677: Use device_get_match_data()
Message-ID: <ZJ1mUmI7wOhp710M@smile.fi.intel.com>
References: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
 <20230629104603.88612-3-andriy.shevchenko@linux.intel.com>
 <33d3ba54-e391-454f-942c-67f498711078@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d3ba54-e391-454f-942c-67f498711078@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: RAX2CZBMZ25SLPNKGBJBRJPYNZAYDO2U
X-Message-ID-Hash: RAX2CZBMZ25SLPNKGBJBRJPYNZAYDO2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAX2CZBMZ25SLPNKGBJBRJPYNZAYDO2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 29, 2023 at 11:56:10AM +0100, Mark Brown wrote:
> On Thu, Jun 29, 2023 at 01:46:02PM +0300, Andy Shevchenko wrote:

...

> > +	rt5677->type = (enum rt5677_type)(uintptr_t)device_get_match_data(dev);

> Double casts, always a sign of a successful simplification! :P

Unfortunate of the C language and use of plain numbers when
pointers are required. :-( I feel your pain.

> > +	if (rt5677->type == 0)
> >  		return -EINVAL;
> > -	}

I would prefer to see in the ID table something like

	.compatible = "foo", .data = &codec[RT5677],

but in this driver it seems it will require quite a refactoring.

-- 
With Best Regards,
Andy Shevchenko


