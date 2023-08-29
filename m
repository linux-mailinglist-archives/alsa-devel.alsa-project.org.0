Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F578C89E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 17:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469121E3;
	Tue, 29 Aug 2023 17:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469121E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693323055;
	bh=lSkUT8x0K7dSdxjSffC8SIGi4cJQxLsyuk82cFlOtTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PjC5qzBvdtZhLMlxqsAJ9e9fyygCPDE8rfvDVd9ChnLYzRPxh4fy2hkfgG+cfLoVk
	 gyX1NyY24lP2/3OniM3g3IYIDoAm+9FIOEpfYN5+dt0w1JpbAuFvu2OJ4yCjYI5U/s
	 ekDX6mHZgYEHZMGuS40wZCiEIVC053CHtBMFKeYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4F93F8025F; Tue, 29 Aug 2023 17:29:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 239ABF80155;
	Tue, 29 Aug 2023 17:29:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5A3F80158; Tue, 29 Aug 2023 17:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A33BAF800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 17:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A33BAF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eHfL52qa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693322977; x=1724858977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lSkUT8x0K7dSdxjSffC8SIGi4cJQxLsyuk82cFlOtTA=;
  b=eHfL52qaoxVLsa3EEE+P5LKoF0s64FqCq9Yhx5AFlLvKfn44ukpKkfBz
   XZMXejySVHgnw5zUlTnghRKHdWY91/99Vd4evqQW6aVqGLaIZ3ExzHc10
   nAaDNBg6LF998mh+ywQoNoFAykLlSkvUOcGMJlk/z5mv/Wshmksif37dm
   NM8tbSq+/fWzY/ANl8aweEuTAZf3ZrVo1ZZaEDixTKh77LIsJ9N3gZ//y
   RHJ+t85Mq7zZexVEINPEZtN5q8Do3/Fn2xio7ESR0DgLx6EIZq8clDltS
   foCzvMqGt4DUY0yodx95asGL/h9S/jY5/bjXeMWg0UmqrNe8g6QhLfjKS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461765703"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="461765703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862279324"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="862279324"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 08:18:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb0Tn-004uen-1H;
	Tue, 29 Aug 2023 18:18:07 +0300
Date: Tue, 29 Aug 2023 18:18:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wm8580: Simplify probe()
Message-ID: <ZO4ML5Iykmt5xL2e@smile.fi.intel.com>
References: <20230828174019.119250-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828174019.119250-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: WABCANSN3LB5ZGGGJRMT2EVAKKNXW3M3
X-Message-ID-Hash: WABCANSN3LB5ZGGGJRMT2EVAKKNXW3M3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WABCANSN3LB5ZGGGJRMT2EVAKKNXW3M3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 06:40:19PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> While at it, remove comma in the terminator entry and simplify probe()
> by replacing dev_err->dev_err_probe().

dev_err() --> dev_err_probe()

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -static const struct of_device_id wm8580_of_match[] = {
> -	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
> -	{ .compatible = "wlf,wm8581", .data = &wm8581_data },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, wm8580_of_match);

This doesn't change anything functional, please do it in a separate change.

-- 
With Best Regards,
Andy Shevchenko


