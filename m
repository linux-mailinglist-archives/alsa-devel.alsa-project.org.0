Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45828B8CE
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 15:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD9E1695;
	Mon, 12 Oct 2020 15:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD9E1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602510977;
	bh=kvWMlVgmfGKjE6XBZIGcdTqMjuE1m8L9P2yrSRWqdYM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASTbPF/9DrGbfwBeYkIE7FeYLg0PvJ6J+k4zgLqYcK6LwbUL4+MWuskfrw5YSAoi8
	 vHF9JmGfuuUf5ZopAKNNm1QA+K8sBijMClgfUn7Ajw/IS5RJ9Nsq6oQHQU7+3oaR+P
	 lNec/cJEOAiINPeA/CBAThbtD5mYBF8+tfToYFtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC92F8020D;
	Mon, 12 Oct 2020 15:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4670F80217; Mon, 12 Oct 2020 15:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB24F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 15:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB24F80141
IronPort-SDR: Fs6piAWRbxnTPucc8lRTCOJt3N+tkTJ9ILwplK27T1ZfLRNbVFv4v8gTRmA3AIH1nCiDuJY9PL
 Ano9OotD4IeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="164955901"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="164955901"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 06:54:27 -0700
IronPort-SDR: yezdhakfdhACCH/l0Xi6XT6Y1WvN246+7Ay6q0vinebHsTVQ3qcsXhLxyubkG2XbSaFwmb6gm9
 8Sw6kHWVbL1Q==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="463114206"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 06:54:25 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kRyIR-00539g-St; Mon, 12 Oct 2020 16:55:27 +0300
Date: Mon, 12 Oct 2020 16:55:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201012135527.GW4077@smile.fi.intel.com>
References: <20201008161105.21804-1-broonie@kernel.org>
 <20201009102751.GS4077@smile.fi.intel.com>
 <20201009103124.GT4077@smile.fi.intel.com>
 <20201012133745.GD4332@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012133745.GD4332@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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

On Mon, Oct 12, 2020 at 02:37:45PM +0100, Mark Brown wrote:
> On Fri, Oct 09, 2020 at 01:31:24PM +0300, Andy Shevchenko wrote:
> 
> > What is the best way for individual ASoC drivers to be sure that at load time
> > they have or have not DMA resources available?
> 
> > Now, seems the approach is to check dma-names property present and thus, try to
> > switch to DMA mode, otherwise PIO. But this seems to me a bit fragile. Why ASoC
> > core can't simple recognize DMA resources as optional (for the drivers that
> > want to know if they available or not)?
> 
> I'm not sure what you mean by "recognize DMA resources as optional"
> here?  At present drivers that think something might not have appeared
> should go through the resources and check them individually, anything
> that hard errored won't be there.

For example, when the board supports PIO and DMA mode and during the probe time
it wants to check which mode is desired (by means of DT references or alike).

Currently those drivers need to do something like:

	if (of_property_is_present("dma-names"))
		ret = try DMA mode;
	else
		ret = try PIO mode;

but this seems to me a bit stricter than needed. What if DMA mode fails, shall
we fail the probe of the driver?

If ASoC supports optional DMA resources, above can be simplified to something
like:

	ret = try DMA mode;
	if (ret != DMA mode ok)
		ret = try PIO mode;

which makes OF dependent parts gone along with relying on the properties rather
than real resource availability.

-- 
With Best Regards,
Andy Shevchenko


