Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD1578C888
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 17:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4AB208;
	Tue, 29 Aug 2023 17:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4AB208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693322733;
	bh=S2OrXeEetaXxJWO+nOv8YwZ1HTZJEMQj0WR/NSWMXcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U1hLB8ksFdPtZU42NMUaQ8DbrGXg6bCNtdw/TjsCPrhjwj9FFQXaMlhqVgTAibMF+
	 w8NRGZmWC8k5Z6RhBRHmXetiDzCnECOkX+rFv7kT4MgLAMfFNlH81gfHTy+8jPhLgl
	 ODV9U3JGJPkJme/WgS4KRblwC8hYp7PB/QDijIkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9B79F8032D; Tue, 29 Aug 2023 17:24:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 390ECF80155;
	Tue, 29 Aug 2023 17:24:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C1A7F80158; Tue, 29 Aug 2023 17:24:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCE42F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 17:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE42F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YHeJGnu+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693322678; x=1724858678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S2OrXeEetaXxJWO+nOv8YwZ1HTZJEMQj0WR/NSWMXcA=;
  b=YHeJGnu+A3tXutZj2HdA9wdE5CKFgI7NNdfewoUjDoAr2NC92JaN4DXA
   L4dlrG70GEUWRlTjVdzQ+3kD/pqL+DlQaYFatwjxWyEWJKxeOUvv7mxKA
   s4zGN2OUvP3d+tbI218WZk1gXqN0jcYsAf1I2s5mEEb+uvZ5roCEJJwuB
   XnyQUn0p5Ryud0wxJFZHDSJ9Swqh5q9NxY1PNtpb/emQKpg9xbH/v4jIO
   8ggaziMOjoW8ey2kbsJ2aR8jJTtYQXzfhUI5rIMBmMWBqtkhdpBNx9oQ+
   zlVB60o3pSEkQLWupBEBcBtwIOi0lRNdmUEtTEfjASB8TdjAgJ56xTIS7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406392732"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="406392732"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="853321234"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="853321234"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2023 08:24:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb0Zx-004ukL-1k;
	Tue, 29 Aug 2023 18:24:29 +0300
Date: Tue, 29 Aug 2023 18:24:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: ak4642: Simplify probe()
Message-ID: <ZO4NrT36gbwc27+0@smile.fi.intel.com>
References: <20230828180003.127896-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828180003.127896-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 3KZ6LIHQWI24SS63O7UMDKSUPQJJZBCQ
X-Message-ID-Hash: 3KZ6LIHQWI24SS63O7UMDKSUPQJJZBCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KZ6LIHQWI24SS63O7UMDKSUPQJJZBCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 07:00:03PM +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data() and replace
> dev_err()->dev_err_probe().

...

> -	if (np) {
> -		const struct of_device_id *of_id;
> -

> +	if (dev_fwnode(dev)) {

Why do we need this at all?

>  		mcko = ak4642_of_parse_mcko(dev);
>  		if (IS_ERR(mcko))
>  			mcko = NULL;

This can suffice on its own, right?

Can be done in a separate change as a precursor to this one.

> -
> -		of_id = of_match_device(ak4642_of_match, dev);
> -		if (of_id)
> -			drvdata = of_id->data;
> -	} else {
> -		const struct i2c_device_id *id =
> -			i2c_match_id(ak4642_i2c_id, i2c);
> -		drvdata = (const struct ak4642_drvdata *)id->driver_data;
>  	}

-- 
With Best Regards,
Andy Shevchenko


