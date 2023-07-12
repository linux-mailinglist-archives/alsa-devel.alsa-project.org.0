Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13706750C81
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 17:32:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5C583E;
	Wed, 12 Jul 2023 17:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5C583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689175961;
	bh=+P6DY1kMpYQo5BltfsoW7T7wXyR4mMsyCwiFJRuKxMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BSzXGFi7jk17vVUApcTQvbWZ7LE32piryl3vr9+ER3b3Wah5JDeK6yEWYxbUA+Glr
	 sJxFbq4P4pGmmAo8sz7pVwGWCl0vKfVft1sigtQsu99tVxWrgb8mKeMkk6y+82padO
	 If2Uh5csB9dYT5ecwjprUzYGSxtL/40NGfptA0no=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43BE9F80093; Wed, 12 Jul 2023 17:31:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD60F80236;
	Wed, 12 Jul 2023 17:31:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F9D6F80249; Wed, 12 Jul 2023 17:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E930F800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 17:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E930F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lzy0w47L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689175901; x=1720711901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+P6DY1kMpYQo5BltfsoW7T7wXyR4mMsyCwiFJRuKxMA=;
  b=lzy0w47LftwN1bfP9UsspCWucJIpBG3ZWUNYShYhkE7JTdS0oVxRltsT
   13AcYWTkD8xxdy56rF5Xrb9kenPGqeyvx7tbYbOJQ9nd0b7cP2X4SuOId
   hQqBkmk0nfIfxOUc9ak+ZhIb8dG7G2GiXQH00hjAnIi572Tuq4lDuVkZn
   yXY7/TaKTTCL7WZ37SMmC3RInO51urON0jE0wDeNAZYb6wCvCmzn+LnDv
   /iBxAr9B5Siezt0IpcgjnLlDrfg8yY+YXkYjlAD8U56YmO29AIgqCOnEb
   hZdDzTJUpYbP3BYam9k60bwNXdmE84a7HkHWuOEQJGcBcIw7AcUCKdPK9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="354833463"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200";
   d="scan'208";a="354833463"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 08:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="791664496"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200";
   d="scan'208";a="791664496"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 08:31:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJboP-002AJr-13;
	Wed, 12 Jul 2023 18:31:29 +0300
Date: Wed, 12 Jul 2023 18:31:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 0/4] ASoC: rt5677: Refactor GPIO and use
 device_get_match_data()
Message-ID: <ZK7HUTyKB6hoaBtV@smile.fi.intel.com>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
 <168916242630.46574.7633971537485557226.b4-ty@kernel.org>
 <ZK6xI8l7Vdp35yJG@smile.fi.intel.com>
 <d5cac1ef-1d44-4ab7-a933-b381108b1eaa@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5cac1ef-1d44-4ab7-a933-b381108b1eaa@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: D2TL4CZ3T2FDKRUY55MFHEINPFQEQS7X
X-Message-ID-Hash: D2TL4CZ3T2FDKRUY55MFHEINPFQEQS7X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2TL4CZ3T2FDKRUY55MFHEINPFQEQS7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

+Cc: Konstantin.

Konstantin, seems b4 doesn't handle long Subject lines for merge commits
(PR mode).

On Wed, Jul 12, 2023 at 04:23:11PM +0100, Mark Brown wrote:
> On Wed, Jul 12, 2023 at 04:56:51PM +0300, Andy Shevchenko wrote:
> 
> > JFYI: You might need to amend your scripts (?) as in the merge commit
> >       the Subject is cut (I believe that your scripts doesn't handle
> >       RFC2822 long lines in the email headers).
> 
> Report that to Konstantin, this is just b4.



-- 
With Best Regards,
Andy Shevchenko


