Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F777729FF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 18:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FEA827;
	Mon,  7 Aug 2023 18:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FEA827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691424086;
	bh=Z/4FddksZRjYPF/sctXV9wacx6/6dUIpgpIazoNeWKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UPXLx1kvZt1MadSxLzIVwIpC52xsrrlSWsgjN/mSMPEMq//3uKsmgBtU5riOI8kRI
	 A5GHhuaGJ5LyM2qQ6jO0XG2CtNxD0vtHJkIOHgBR9rZIKJl89KkSq4UMo9dPRalz3D
	 g6xTOqzNAYhjX4Xz5CEIHRAsoq9fhKev4IYIJsrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56A3AF80544; Mon,  7 Aug 2023 18:00:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED647F8016B;
	Mon,  7 Aug 2023 18:00:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26665F8016D; Mon,  7 Aug 2023 18:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51D12F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 18:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D12F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jt+qlb36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691424021; x=1722960021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z/4FddksZRjYPF/sctXV9wacx6/6dUIpgpIazoNeWKI=;
  b=Jt+qlb36smc462clv5Mfjqab8sDjw8yOijUPLoZpmCgazAfcQflmRGck
   3OeP7vOYqMN8RAjv4dSCya3v2s/9RZcuMj8ZZFr8csfX153QXIN2OxrY6
   DE79SsEPQmZNLvq07fOpNH3OQRmYsB5EKGUV+kzyVflbM4GZJYniopKXe
   NJdRjOds4Iktdp4tL4rUC8uLvuXh/SoTjwwuP9MdfumOvfpYdUUCIC4qJ
   //CJJqi52v/QFV919KmnOZKPbmJKclId7y9lPpZHFGxTGgL1SGQY3BdLJ
   uNjrCLlJ2qnujQwWOv4bdBLdlZMsMXLqpzpwrh2qlWlf1E/VoMNjKOOi0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401553722"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="401553722"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 09:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977491938"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="977491938"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2023 09:00:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qT2eN-000sgs-2E;
	Mon, 07 Aug 2023 19:00:07 +0300
Date: Mon, 7 Aug 2023 19:00:07 +0300
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
Message-ID: <ZNEVB8ZJah9Y9Bua@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
 <ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
 <87pm3yj2s5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm3yj2s5.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ANL54CCX45RX4VPBC4VF23SVRIK6DD3P
X-Message-ID-Hash: ANL54CCX45RX4VPBC4VF23SVRIK6DD3P
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 07, 2023 at 05:22:18PM +0200, Takashi Iwai wrote:
> On Tue, 01 Aug 2023 19:51:39 +0200, Andy Shevchenko wrote:
> > On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:

...

> I rather wonder why it can't be simple strncpy().

This is obvious. To avoid compiler warning about 0 (possible) truncation.

...

> > Taking all remarks into account I would rather go with sockptr.h being
> > untouched for now, just a big
> > 
> > /* DO NOT USE, it's obsolete, use uniptr.h instead! */
> > 
> > to be added.
> 
> Possibly that's a safer choice.  But the biggest question is whether
> we want a generic type or not.  Let's try to ask it first.
> 
> Interestingly, this file doesn't belong to any subsystem in
> MAINTAINERS, so I'm not sure who to be Cc'ed.  Chirstoph as the
> original author and net dev, maybe.

Yes, but actually it's fine to just copy and change sockptr.h to say
"that's blablabla for net subsystem" (maybe this is implied by the name?).
In that case we just introduce our copy and can do whatever modifications
we want (see previous reply).

-- 
With Best Regards,
Andy Shevchenko


