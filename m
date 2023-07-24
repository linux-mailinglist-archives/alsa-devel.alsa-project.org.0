Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB175F4C2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 13:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57797F8;
	Mon, 24 Jul 2023 13:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57797F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690197461;
	bh=qrAfN4pFwmKEkCyDG2aU1NgUas7wKrBSvcRpy76R1jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u+8ebUXK2sEXH1F2pHaGLHqhpNFBZS6chF2nFg5MY1cl62v7ySzlRmrNW58eV5K7I
	 kZvz90z+RNUpLfD1g/kDYs/Rb73ZDSVYK28GUBsshn5pdHgoIqHmLoPgYcl4FUNf0T
	 IhyQrzoxVeAQ4TzhGS2MCy2CNahoso8AI5u1O2ds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2ABCF8053B; Mon, 24 Jul 2023 13:16:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0AAF80163;
	Mon, 24 Jul 2023 13:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE4EF8019B; Mon, 24 Jul 2023 13:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D132F80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 13:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D132F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lXUfPz3n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690197393; x=1721733393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrAfN4pFwmKEkCyDG2aU1NgUas7wKrBSvcRpy76R1jI=;
  b=lXUfPz3nq1RxBelKOMte0msTgF8hkjnenJcI/2i7IfBkb/YiPLi0bNYl
   HJfhjfgE1CuAA9TsDUMNnf8nKJesJUY6ZIPPXXGSU1QqCJu6lkAyXa06N
   pbkr7dAUVIb2B8AWDONO2cV/I13FjBb6P3byNfXiTNod5Ko5z2oA6GRKY
   Vh0G//53yiKLWR4II0ExoQvgONfFvnpQ49PqX0PGDIzMvmkTGxcIjOSJ+
   C2OM+vKVVM9/uyybAq62OqbLEMzHudUyzipgNnoBWY4WINqkv7GjFLEi0
   GVPt4VJfOa/vymPberqCKwhOJtmNjQsNINvn12ZG4ghQ9TnhYZp6wIWQk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="371012551"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="371012551"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="728873056"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="728873056"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2023 04:16:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qNtY7-00AGs2-0G;
	Mon, 24 Jul 2023 14:16:23 +0300
Date: Mon, 24 Jul 2023 14:16:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Lu, Brent" <brent.lu@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Zhi, Yong" <yong.zhi@intel.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	"Bhat, Uday M" <uday.m.bhat@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	"Chiang, Mac" <mac.chiang@intel.com>,
	"R, Dharageswari" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Message-ID: <ZL5dhosg28uIpcFd@smile.fi.intel.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <dc6de509-6984-1434-b53f-9600e8bc7c49@linux.intel.com>
 <ZL5Jzod5NBETv9Dp@smile.fi.intel.com>
 <CY5PR11MB62579D3B679BB437017529D79702A@CY5PR11MB6257.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CY5PR11MB62579D3B679BB437017529D79702A@CY5PR11MB6257.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: DTWPJJ2A4ST63XKZ5VR3FYRZJZN75R7D
X-Message-ID-Hash: DTWPJJ2A4ST63XKZ5VR3FYRZJZN75R7D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTWPJJ2A4ST63XKZ5VR3FYRZJZN75R7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 24, 2023 at 11:06:02AM +0000, Lu, Brent wrote:
> > > > +/* helper function to get the number of specific codec */
> > 
> > ...and leak a lot of reference counts...
> > 
> > > > +static int get_num_codecs(const char *hid) {
> > > > +	struct acpi_device *adev = NULL;
> > > > +	int dev_num = 0;
> > > > +
> > > > +	do {
> > > > +		adev = acpi_dev_get_next_match_dev(adev, hid, NULL, -1);
> > >
> > > Humm, I am a bit worried about reference counts.
> > >
> > > See
> > > https://elixir.bootlin.com/linux/latest/source/drivers/acpi/utils.c#L9
> > > 16, it's not clear to me where the get() is done.
> > >
> > > Adding Andy to make sure this is done right.
> > 
> > Thank you for Cc'ing.
> > 
> > Yes, the above code is problematic. One has to use the respective for_each macro
> > (defined nearby the used API).
> > 
> > > > +		if (adev)
> > > > +			dev_num++;
> > > > +	} while (adev != NULL);
> > > > +
> > > > +	return dev_num;
> > > > +}

> Each invocation of acpi_dev_get_next_match_dev() calls acpi_dev_put() to release the
> adev from previous call. And the last call returns NULL. It seems to me the reference count
> should be fine. Is my understanding correct?

Ah, right. sorry for the confusion. That's why we have a macro
to not think about these details :-)

> I saw the macro for_each_acpi_dev_match and re-write the function as follow. Thanks for
> suggesting using the macro.
> 
> /* helper function to get the number of specific codec */
> static int get_num_codecs(const char *hid) {
> 	struct acpi_device *adev;

> 	int dev_num = 0;

size_t here or at least unsigned int is more correct.

> 	for_each_acpi_dev_match(adev, hid, NULL, -1)
> 		dev_num++;
> 
> 	return dev_num;
> }

Otherwise, yes, that's what I have in mind.

> Will test it in next few days.

-- 
With Best Regards,
Andy Shevchenko


