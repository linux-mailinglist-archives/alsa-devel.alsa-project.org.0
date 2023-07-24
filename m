Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B275F0BF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 11:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F5686C1;
	Mon, 24 Jul 2023 11:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F5686C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690192408;
	bh=scpBJ577mRimOo62TKgu6+oiwI4ovv5AJtXfkH9zf/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BGNhgVcqun+6ypN9sF3I92aPzsWX0YKEkWFITv7LRzgtonlWBYlFK8I7ldVUL0hf0
	 K5wy3Q+5WZEiaSdqy36bd1UJjF0UlKEcnuIKvRTWfNzd1hWuw0I6QckGIE4LUsPicp
	 oOAFIFake9UmdhcegpTCBmDe+trCSkKf0tQyUXBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D826DF80153; Mon, 24 Jul 2023 11:52:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5695EF80163;
	Mon, 24 Jul 2023 11:52:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B14C0F8019B; Mon, 24 Jul 2023 11:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 576A9F80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 11:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576A9F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ElY+n5lc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690192346; x=1721728346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=scpBJ577mRimOo62TKgu6+oiwI4ovv5AJtXfkH9zf/A=;
  b=ElY+n5lcUTxH0BORpya4YGnwQM7Jzpi1fvsJ+rLTayQpN86oKh+p7PBn
   dPU/NXKzPhJrQmQBM7MGe7E6MNaYxZPWRyptIjMC0C6h50phsQE8JVEdq
   dlqT9bYQ/MvJPRCsKpDH0/2zSjYtp3RI53S/nCw4BOQtP76aLyuHJlMvP
   3kPs6sF3Q58cPDQrWBU/Q5I0tbX10MG1cAMhttzNzzk+U+NuD4aAjcreo
   uxkw1PMmWP9EnlkkSm60zx6xaQWoIlt+chN8cBByqVz/F3c2BNvbGFUIG
   wPGHzfLUash9hCC5s5VXyoM77YK7xW+kXz6ASOuZV+CuyaMfIObPk5WS1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="367423784"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="367423784"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972201808"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="972201808"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 02:52:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qNsEg-007Lw4-1L;
	Mon, 24 Jul 2023 12:52:14 +0300
Date: Mon, 24 Jul 2023 12:52:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	Yong Zhi <yong.zhi@intel.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Message-ID: <ZL5Jzod5NBETv9Dp@smile.fi.intel.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <dc6de509-6984-1434-b53f-9600e8bc7c49@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc6de509-6984-1434-b53f-9600e8bc7c49@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: XPMYFLXFUFAUJOE3XGLGX7V3FWGLTT46
X-Message-ID-Hash: XPMYFLXFUFAUJOE3XGLGX7V3FWGLTT46
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPMYFLXFUFAUJOE3XGLGX7V3FWGLTT46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 24, 2023 at 11:08:17AM +0200, Pierre-Louis Bossart wrote:
> On 7/20/23 11:26, Brent Lu wrote:

...

> > +/* helper function to get the number of specific codec */

...and leak a lot of reference counts...

> > +static int get_num_codecs(const char *hid)
> > +{
> > +	struct acpi_device *adev = NULL;
> > +	int dev_num = 0;
> > +
> > +	do {
> > +		adev = acpi_dev_get_next_match_dev(adev, hid, NULL, -1);
> 
> Humm, I am a bit worried about reference counts.
> 
> See
> https://elixir.bootlin.com/linux/latest/source/drivers/acpi/utils.c#L916,
> it's not clear to me where the get() is done.
> 
> Adding Andy to make sure this is done right.

Thank you for Cc'ing.

Yes, the above code is problematic. One has to use the respective for_each
macro (defined nearby the used API).

> > +		if (adev)
> > +			dev_num++;
> > +	} while (adev != NULL);
> > +
> > +	return dev_num;
> > +}

-- 
With Best Regards,
Andy Shevchenko


