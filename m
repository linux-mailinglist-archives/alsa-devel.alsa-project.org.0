Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339CC94D265
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 16:44:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75951AE8;
	Fri,  9 Aug 2024 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75951AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723214669;
	bh=jfeOKs/97i1MZB9mZgQc/1uRPFTjG8+Gzz1wmjHvPLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aLzHaT9zOfIVBnfRCegeQdGJvs6cXUlgr5QQaJi8u2Ua81gnnkUjbYhxfW5ZzMTrn
	 10ZGeOQbNWil3GyEYS6W6r2Rb9Y6isZt+51Zze7uw/bH5ytnfS1Ie7HI5J/OKZwz5Y
	 OUy42U5TvBqVuI3BJ8LT7rfDZhfp5XAOk6n1TFDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FB7CF800B0; Fri,  9 Aug 2024 16:43:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30163F805AE;
	Fri,  9 Aug 2024 16:43:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22B2EF802DB; Fri,  9 Aug 2024 16:36:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07C53F800B0
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 16:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07C53F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fSmel+A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723214208; x=1754750208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jfeOKs/97i1MZB9mZgQc/1uRPFTjG8+Gzz1wmjHvPLc=;
  b=fSmel+A3CeYZTXBB1HCJaPzEtXdl/iQlBtAty8XuqxW/61Abs4RnyCro
   Z70jFMkGJKETy0a19UTmVPDymNttchxhqg7mT/SyqWFGJ5Kb8qHQDpyMC
   8RAtMo1GVu9lQl+rkKz0XTugLN1ac9nobqjZxZeBF34lLorGGvU4q+0pG
   THTTI/IMCQHjHgrMVfRNE20OLQVq5qeuhR4aJXBYzZuHLuZRVT/hY28DW
   /k/K9cIO/c0/0ni5AbYLVp3K6uukhpObj545C8XNrK0zpeslB5hTvEVf7
   cnBtal0jJaiF9M1Di8kdXsJx25NKJOqYq//BQa3x2IbcvwzRFv2XeMWp4
   A==;
X-CSE-ConnectionGUID: Bt0RyoDnThqD3Tp9ZPDXZw==
X-CSE-MsgGUID: DEFn0xQlRF+PFnqOudCfPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21532039"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800";
   d="scan'208";a="21532039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:36:43 -0700
X-CSE-ConnectionGUID: W/40TGxYRI6DXUcx3PHw2g==
X-CSE-MsgGUID: 6RIEOof2RXGhCJWAdN5VlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800";
   d="scan'208";a="57228455"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:36:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1scQjK-0000000DRau-1e7G;
	Fri, 09 Aug 2024 17:36:34 +0300
Date: Fri, 9 Aug 2024 17:36:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"judyhsiao@google.com" <judyhsiao@google.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Salazar, Ivan" <i-salazar@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Chadha, Jasjot Singh" <j-chadha@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"bard.liao@intel.com" <bard.liao@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Rao, Dipa" <dipa@ti.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"tiwai@suse.de" <tiwai@suse.de>, "Xu, Baojun" <baojun.xu@ti.com>,
	"soyer@irl.hu" <soyer@irl.hu>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"cujomalainey@google.com" <cujomalainey@google.com>,
	"Kutty, Aanya" <aanya@ti.com>,
	"Mahmud, Nayeem" <nayeem.mahmud@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add Calibration
 Kcontrols and tas2563 digtial gain for Chromebook
Message-ID: <ZrYpcjC_vf7ldnie@smile.fi.intel.com>
References: <20240522112942.994-1-shenghao-ding@ti.com>
 <Zk3eq0k2Eq-gtejq@smile.fi.intel.com>
 <6b6a0af1e55241c4b2acde42e9966e3b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b6a0af1e55241c4b2acde42e9966e3b@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: COPRZU6LTRINAD7HIJ6FVEKRAHABDNT7
X-Message-ID-Hash: COPRZU6LTRINAD7HIJ6FVEKRAHABDNT7
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COPRZU6LTRINAD7HIJ6FVEKRAHABDNT7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 24, 2024 at 11:42:11AM +0000, Ding, Shenghao wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Wednesday, May 22, 2024 8:02 PM
> > To: Ding, Shenghao <shenghao-ding@ti.com>
> > On Wed, May 22, 2024 at 07: 29: 41PM +0800, Shenghao Ding wrote: >


(some comments were not answered, are you agree on all of the points?)

...

> > > +	cali_data->data = devm_kzalloc(tas_priv->dev, tas_priv->ndev *
> > > +		(cali_data->reg_array_sz * 4 + 1), GFP_KERNEL);
> > 
> > No way. First of all, we have kcalloc(), second, there is an overflow.h that has
> > necessary macros to calculate sizes for memory allocations.
> Memory allocated with devm_kzalloc is automatically freed on driver detach while kcalloc can’t

Yes, we have devm variant for kcalloc(), why can it be not utilised?

> > > +	if (!cali_data->data)
> > > +		return -ENOMEM;

-- 
With Best Regards,
Andy Shevchenko


