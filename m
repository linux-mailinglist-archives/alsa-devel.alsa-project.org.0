Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35F1AAE6A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 18:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBEA91662;
	Wed, 15 Apr 2020 18:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBEA91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586969147;
	bh=1V7bTS8hJtHnyewIxglL6roHI427met7ojZCpPvNXIE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAXj4qYpazeXnegGdZPtHslLYFolhreJSGy2t0pt4vxf2RxoTObhFP/NIyr4nNnBx
	 Yki9DlKdRK1zg3L1+jAZTzMagO5Cb7N9UgYLTPsKJFMwHQfFuxi1OW68Ir+74zjFMK
	 mxD3AbjaGxDvcPfXs1v21qf0TabaAIhlrXwOCnjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8D0EF80115;
	Wed, 15 Apr 2020 18:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA4B8F80245; Wed, 15 Apr 2020 18:44:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD9CF80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD9CF80124
IronPort-SDR: PBp8zH3aB5iEJonc92lsn9eRptDjaj28onWUWA0fsAQY/RKmRLa4CUaEMR1TcrvbWXFUlcSY8o
 rEbIt+lnIH0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 09:43:55 -0700
IronPort-SDR: fuagpmujq77Rziv1zLS89tA66hrokcG+kqQcDL48t9oyYrlnE8kYF9kpV2ECtPeXNwsgFX/yNK
 WglxWEVbKDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="256912004"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006.jf.intel.com with ESMTP; 15 Apr 2020 09:43:52 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOl8l-000pTo-38; Wed, 15 Apr 2020 19:43:55 +0300
Date: Wed, 15 Apr 2020 19:43:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 8/9] ASoC: rt5645: Switch DMI table match to a test of
 variable
Message-ID: <20200415164355.GW185537@smile.fi.intel.com>
References: <20200415145524.31745-1-andriy.shevchenko@linux.intel.com>
 <20200415145524.31745-9-andriy.shevchenko@linux.intel.com>
 <20200415162507.GG5265@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415162507.GG5265@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Apr 15, 2020 at 05:25:07PM +0100, Mark Brown wrote:
> On Wed, Apr 15, 2020 at 05:55:23PM +0300, Andy Shevchenko wrote:
> > Since we have a common x86 quirk that provides an exported variable,
> > use it instead of local DMI table match.
> > 
> > Note, arch/x86/kernel/quirks.c::early_platform_detect_quirk() prints
> > the detected platform.
> 
> > @@ -3674,13 +3675,6 @@ static const struct dmi_system_id dmi_platform_data[] = {
> >  		},
> >  		.driver_data = (void *)&intel_braswell_platform_data,
> >  	},
> > -	{
> > -		.ident = "Microsoft Surface 3",
> > -		.matches = {
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
> > -		},
> > -		.driver_data = (void *)&intel_braswell_platform_data,
> > -	},
> >  	{
> 
> Are we going to convert all the other platforms to using a variable too?

It makes sense to ones that have spread quirks over the kernel, like Apple.

-- 
With Best Regards,
Andy Shevchenko


