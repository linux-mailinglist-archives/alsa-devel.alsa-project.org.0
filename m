Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FE76B685
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 15:59:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9222823;
	Tue,  1 Aug 2023 15:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9222823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690898392;
	bh=ZKIy+hH5QB+KBuMy5Vbg4Dhcb8h2GptMzqQNMbJ5fGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iw1WMEUsHVqmluvgLkS6AVre0wvix+2ubhIKdsyd3sDgv1B+n3DPdnSOpOfKJuVfQ
	 X7QXdFQGGpVSYm8bOnuNRD6f60K2iDOb15c67LLl9KtKUX/RVZADcSHYCNuquNQnPy
	 YFIjs7YSb3K666HoTpEiwV65MhA5TR1UfT3hdd2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22DFDF80535; Tue,  1 Aug 2023 15:58:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22BD6F8016D;
	Tue,  1 Aug 2023 15:58:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F4E4F801D5; Tue,  1 Aug 2023 15:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEB10F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 15:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB10F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NYrXXU5j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690898305; x=1722434305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZKIy+hH5QB+KBuMy5Vbg4Dhcb8h2GptMzqQNMbJ5fGU=;
  b=NYrXXU5jr3WGwmh2Wz+N0FR0UXMVZgqo/t//gINB87bBJft8BKnX8jP8
   JBAPlVEc5FqpeBZPpl7gRAkpULoXz+d6wB22iFwOeDBWpKRO4DDyz1unN
   /M/BQ4pIuJASTdiMumkExGKZbmstNELRjA8qzZXntDH+MI+rUHLnSyZgY
   kS4G+HEg5N72i7mEGHce5Efl88bYQFpr9WJshqtcYvX8yZSKlldJ00UFB
   oQKzLK5vIwGzEEbfUsqLUFXq+fOIT+WwylycbPYudk3UlPG4AWpMxRuB9
   FtmnDa4rOaFqsrBlbk5+UXGhAJKsyFG+tudHpYv49oZdCg+04nEgiDNxz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400250893"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="400250893"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 06:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="763772313"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="763772313"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2023 06:57:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qQpsm-005MX9-2k;
	Tue, 01 Aug 2023 16:57:52 +0300
Date: Tue, 1 Aug 2023 16:57:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <ZMkPYFblXjxah6Xt@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6pjj2ui.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: UOHGEUUJJPKYJ3YLHSCYCIEFPO2WBGF7
X-Message-ID-Hash: UOHGEUUJJPKYJ3YLHSCYCIEFPO2WBGF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOHGEUUJJPKYJ3YLHSCYCIEFPO2WBGF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 19:20:54 +0200,
> Mark Brown wrote:
> > 
> > On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:
> > 
> > > this is a patch set to clean up the PCM copy ops using sockptr_t as a
> > > "universal" pointer, inspired by the recent patch from Andy
> > > Shevchenko:
> > >   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com
> > 
> > > Even though it sounds a bit weird, sockptr_t is a generic type that is
> > > used already in wide ranges, and it can fit our purpose, too.  With
> > > sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> > > be unified again gracefully.
> > 
> > It really feels like we ought to rename, or add an alias for, the type
> > if we're going to start using it more widely - it's not helping to make
> > the code clearer.
> 
> That was my very first impression, too, but I changed my mind after
> seeing the already used code.  An alias might work, either typedef or
> define genptr_t or such as sockptr_t.  But we'll need to copy the
> bunch of helper functions, too...

Maybe we should define a genptr_t (in genptr.h) and convert sockptr infra to
use it (in sockptr.h)? This will leave network and other existing users to
convert to it step-by-step.

Another approach is to simply copy sockptr.h to genptr.h with changed naming
scheme and add a deprecation note to the former.

Thank you, Takashi, for doing this!

-- 
With Best Regards,
Andy Shevchenko


