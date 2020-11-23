Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FA2C039C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 11:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 278E61693;
	Mon, 23 Nov 2020 11:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 278E61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606128557;
	bh=BlVhhz4Rtrg7KOoCGnUYGZfn1P0ZP+EqpPtj3Nzw2oc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q86vKYxGCxMXm8l2XgOUlacGPFq7zjyECJhS+tQeL+Y5f7QfmjTOT+tnmCBXu4bX7
	 YvntbcsxPXYTx1TqUM9Ti1AZfyehmdUKT9M6Zfsx4YAxIDjlioIFSQH8cx+dfOYRLo
	 IVlGVbmxPQESJzDF53DLERHMi/+h7O2bCQ+2ScCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6661F8015B;
	Mon, 23 Nov 2020 11:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21160F80255; Mon, 23 Nov 2020 11:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB8ABF80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 11:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB8ABF80128
IronPort-SDR: noplg2fddXPOgn5OeCm1nRApAXc1StiVEIXGCAvLRp08GvCLLDz1nusqgojPws+Nmw+pXA5G65
 jeUaIt7PAWnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="170956528"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="170956528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 02:47:32 -0800
IronPort-SDR: LfCAwxo4F4lVV9uPanZd01eRoxiOe650zTpb1q8P5GTEj11B2+EglGZ6JL4EGO8guQ+SPx0DxF
 xUo9YGhZy0ng==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="312842482"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 02:47:30 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kh9Oa-0097y3-2s; Mon, 23 Nov 2020 12:48:32 +0200
Date: Mon, 23 Nov 2020 12:48:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123104832.GY4077@smile.fi.intel.com>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122105813.GA3780@kozik-lap>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

On Sun, Nov 22, 2020 at 11:59:20AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2020 at 08:04:29PM +0000, Mark Brown wrote:
> > On Fri, Nov 20, 2020 at 08:42:45PM +0100, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 20, 2020 at 04:56:34PM +0000, Mark Brown wrote:
> > 
> > > > It would be better to fix these by annotating the table as potentially
> > > > unused, if nothing else it means if someone wants to add ACPI support
> > > > (or it just works on their ACPI system with the plain old I2C ID) then
> > > > they don't need to revert this change.
> > 
> > > The point is after this patch - removal of of_match_ptr() - they will
> > > already support the ACPI matching through the PRP0001.
> > 
> > > Keeping of_match_ptr() and maybe_unused will prevent any ACPI re-usage
> > > unless explicit ACPI table is added
> > 
> > Surely if that's the desired outcome the fix is to change the definition
> > of of_match_ptr() such that it leaves the reference with CONFIG_ACPI,
> > perhaps hidden behind a config option for PRP0001?  That seems better
> > than going through the entire tree like this.
> 
> That could be indeed an easier way to achieve this.

...easier and wrong in my opinion. Not all drivers need that.
What the point to touch it in the driver which is OF-only?
(For IP which will quite unlikely to be present in ACPI world)
Or if the device will get the correct ACPI ID?

> +Cc Andy, Rafael,

I guess Rafael can correct me or others.

> I saw you were doing similar way as I did here [1] for the 698fffc2705c
> ("rtc: ds1307: Drop of_match_ptr and CONFIG_OF protections") with the
> same reasoning as mine ("These prevent use of this driver with ACPI via
> PRP0001.").

The above is a device which can be connected to any system, including
ACPI-based one. The patch has been cooked to have some means to make
it usable on such systems (because previous patch removes wrong ACPI IDs).

> Do you have thoughts on Mark's proposal above (to change the
> of_match_ptr())?
> 
> [1] https://lore.kernel.org/lkml/20201120161653.445521-1-krzk@kernel.org/

-- 
With Best Regards,
Andy Shevchenko


