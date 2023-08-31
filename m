Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6DB78EF3D
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 16:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65E3D208;
	Thu, 31 Aug 2023 16:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65E3D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693490781;
	bh=2jUcdYXZ5BuGaoIZv4/2jO2chufivloxZgc2KVoSycY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Js9D7oJFSIUkUBECZowi/zs7KhIxM0OeqmLKNHH00NHq9XkUq6e4RkXrlz30xnksE
	 b+s+7rC0i/d1azRSzOocEaNEzPBmX11TO5y38WrBzzDjeOqnx8vT066SvLSK+uKF3f
	 h78Rjk+n3iAN8GXpte2AkN06cYUuu3cthvxq2XNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12EB3F804F3; Thu, 31 Aug 2023 16:05:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2490F800F5;
	Thu, 31 Aug 2023 16:05:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59079F80155; Thu, 31 Aug 2023 16:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8373BF800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 16:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8373BF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TOKQ0S9o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490704; x=1725026704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2jUcdYXZ5BuGaoIZv4/2jO2chufivloxZgc2KVoSycY=;
  b=TOKQ0S9oGWzQg3IwuOLxSkXliXsVy20fUZbU3bZzxLWW6PjzcbmxEA8U
   QgC/S+33onbAhmeGhgXJNcKWNe2z0i7xEW8t5tyDQ+MNSmaPE0L1naJ88
   CXtIIbU+wjdmmfTLitS2ffy35a39HUV+G2R5AMLfm5t871d7j5XvsaWlk
   /hfHvWQ8JX3YbGWq03bvlWeh1kG5Xi2BPRYjIWJwEhjGF9vDW3LHHTuNH
   pCKV+lpLDBVdMKOa9EX+eaMVL7KV2AtVwCMpMyXnN/mWSeSgBSDnbaKoT
   SezgJNM1AfirW8k/wgw+RN8fZyYxjZ7eyR/mNckI9LhpQMA+J471oozJ/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442332117"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000";
   d="scan'208";a="442332117"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 06:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913256033"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="913256033"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 06:37:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qbhrA-005OmL-2Y;
	Thu, 31 Aug 2023 16:37:08 +0300
Date: Thu, 31 Aug 2023 16:37:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: ak4642: Simplify probe()
Message-ID: <ZPCXhDHMVAYHqhFC@smile.fi.intel.com>
References: <20230828180003.127896-1-biju.das.jz@bp.renesas.com>
 <ZO4NrT36gbwc27+0@smile.fi.intel.com>
 <OS0PR01MB5922A08379222B0DF6D0323286E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <OS0PR01MB5922A08379222B0DF6D0323286E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: AYYJPQYHJAG5B7UET4YJR3PH2JS23CHR
X-Message-ID-Hash: AYYJPQYHJAG5B7UET4YJR3PH2JS23CHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYYJPQYHJAG5B7UET4YJR3PH2JS23CHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 06:02:51PM +0000, Biju Das wrote:
> > On Mon, Aug 28, 2023 at 07:00:03PM +0100, Biju Das wrote:

...

> > > -	if (np) {
> > > -		const struct of_device_id *of_id;
> > > -
> > 
> > > +	if (dev_fwnode(dev)) {
> > 
> > Why do we need this at all?
> It is replacement for np.

I am questioning it's necessity to begin with (even before your patch).

> > >  		mcko = ak4642_of_parse_mcko(dev);
> > >  		if (IS_ERR(mcko))
> > >  			mcko = NULL;
> > 
> > This can suffice on its own, right?
> > 
> > Can be done in a separate change as a precursor to this one.
> 
> Agreed.

-- 
With Best Regards,
Andy Shevchenko


