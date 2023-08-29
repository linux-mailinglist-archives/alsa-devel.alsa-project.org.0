Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592078C876
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 17:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257831E3;
	Tue, 29 Aug 2023 17:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257831E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693322439;
	bh=l7lBilpGq2tKtr5VFFRR9ZyJDMuDoY2t4wphNMtdaLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rhT1KxbtV7frgO+YZem3pVBgv+AiNTqPU00Z8jqmTX1RNSes97vdh1HQQtVD0ASZt
	 BSQwr2oZi9hbZNXffanVvAMfsAGhtfScPocYixjoRT2RZNYlUGTsFouUSPdoM27mqx
	 Le5h7maP0zmVBt0xiHTyq4LyrgaUAh0flR2i5CJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE4CDF800F5; Tue, 29 Aug 2023 17:19:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79C03F80155;
	Tue, 29 Aug 2023 17:19:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6EFCF80158; Tue, 29 Aug 2023 17:19:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3103F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 17:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3103F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=blBhrP+j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693322383; x=1724858383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7lBilpGq2tKtr5VFFRR9ZyJDMuDoY2t4wphNMtdaLY=;
  b=blBhrP+jUHHox+vnUmKGODSYAAsKOFu5uYmJGmLGv3JyihLHZdvo5bTe
   lnRcGYLvZdgztP9d7BkJb/iUPmZH+YxFfiasiJzlc4b6aCv/mn18KgfSY
   IPtmFrZSLfC5sN6GYrR7PP+oI5tRK7PkqC6z2hbEh31aBays2ijIfmvy5
   1EwKn+3KQTOFZ8ozbL3JnQSPUb9n2mlI4Fu9m7ZMPfmcdbesWQ8Txy3Sy
   9ZHt/NssQ0mEb6YXuAyibictE0a0OCW4Zhf8rUBocPaRjmR0ZW8JMFoS0
   IuWtRkdEzMzG285uqX70B+R6io1HZv3u6mXZBftbKpOB/jp/Eax8+357Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439350230"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="439350230"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804158067"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="804158067"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 08:19:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb0VB-004ug7-1s;
	Tue, 29 Aug 2023 18:19:33 +0300
Date: Tue, 29 Aug 2023 18:19:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: cs42xx8-i2c: Simplify probe()
Message-ID: <ZO4MhWUmamTqJvXd@smile.fi.intel.com>
References: <20230828174856.122559-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828174856.122559-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: VKI43SHXH27ZXRSSWXVLJ34D4JF7GVQ6
X-Message-ID-Hash: VKI43SHXH27ZXRSSWXVLJ34D4JF7GVQ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKI43SHXH27ZXRSSWXVLJ34D4JF7GVQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 06:48:56PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table. Also replace
> dev_err()->dev_err_probe() to simplify the code.

...

Can also be

	struct device *dev = &i2c->dev;

>  	int ret;
>  	struct cs42xx8_driver_data *drvdata;
> -	const struct of_device_id *of_id;
> -
> -	of_id = of_match_device(cs42xx8_of_match, &i2c->dev);
> -	if (!of_id) {
> -		dev_err(&i2c->dev, "failed to find driver data\n");
> -		return -EINVAL;
> -	}
>  
> -	drvdata = (struct cs42xx8_driver_data *)of_id->data;
> +	drvdata = (struct cs42xx8_driver_data *)i2c_get_match_data(i2c);
> +	if (!drvdata)

> +		return dev_err_probe(&i2c->dev, -EINVAL,
> +				     "failed to find driver data\n");

		return dev_err_probe(dev, -EINVAL, "failed to find driver data\n");

-- 
With Best Regards,
Andy Shevchenko


