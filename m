Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3978AEC4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 13:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2AEAE8;
	Mon, 28 Aug 2023 13:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2AEAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693222071;
	bh=COMTdWf3DBFde9p8NBPZiGOQHPVjxLDVseDRnlFzbIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ESmrY8e7DJ1PDKrni6HrQRV+zMGGr1UHsPoSc1aGGjmC7o3AeXAFVVR5JUFfCDO7Y
	 BDOfgEETyQnaGuAtKOJAOzYu7S1YLqfiBBANip82jYqt/Yr8WBj5rd4eY3XDni3gXH
	 v3Xy2scfefnnlRzr3nFsKpU2WIKHutayYsqlLuY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BD34F80249; Mon, 28 Aug 2023 13:27:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F9A8F80155;
	Mon, 28 Aug 2023 13:27:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02361F80158; Mon, 28 Aug 2023 13:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2A19F80094
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 13:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A19F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TVmGbRHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693222017; x=1724758017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=COMTdWf3DBFde9p8NBPZiGOQHPVjxLDVseDRnlFzbIM=;
  b=TVmGbRHXPz9Sy++GJhMHk9GnXkPVHQkR8Knax1Fo7WOdOG3p3XRpwKyb
   lVMUUWtgdQ0dkUAy4jjWLeBcdjlaWuv6OS0eEsD6fOSwtvmR7xFw7SRFk
   ajfuHJKk89RDv0E018hH66NWeVbi5zrIttHU2kePdSvPXStihtC2N/m8N
   nCbulXY8dEXrnMKi+Pldcdx/QYK27cVPBYLifVvUXiTqgOoRP00r4ccUE
   EAvGJsxwN3rPL4V5UuMmCWFNzCvB3sXqczNww7UC5+oF2uYeAQ3jTVWz6
   qT0DnFM+DOYSBulCsYpx9+BbXzrp0PffvttAQAisSVh0+6ZgnWLe1o0+7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="441424402"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="441424402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 04:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="881910720"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 04:26:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qaaOO-00G7vB-0Z;
	Mon, 28 Aug 2023 14:26:48 +0300
Date: Mon, 28 Aug 2023 14:26:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4642: Simplify probe()
Message-ID: <ZOyEd+mTIPLFVhGW@smile.fi.intel.com>
References: <20230826193447.113378-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826193447.113378-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ANEQKVK5F7HT7XW3IXJFT672ZLR4ZITO
X-Message-ID-Hash: ANEQKVK5F7HT7XW3IXJFT672ZLR4ZITO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANEQKVK5F7HT7XW3IXJFT672ZLR4ZITO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 26, 2023 at 08:34:47PM +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data().
> 
> While at it, drop local variable np from probe() by using dev->of_node.

...

> +	if (dev->of_node) {

No, please use (it needed at all) the respective API.

...

> -		-EINVAL;

> +		-ENODEV

...being not explained.

-- 
With Best Regards,
Andy Shevchenko


