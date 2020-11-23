Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30B2C0A7B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 14:42:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 594141670;
	Mon, 23 Nov 2020 14:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 594141670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606138953;
	bh=EYqYXFpsFIiQHZU8iQQ1Fq2qHnHtwZvvGSIe8qUi83s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ECIVW0Y6sSEns1xBcAfGIc9+XI0FS1Rw4PiQ0sUHO/pwLTFmR/Lw3YyreMf1eYulc
	 /jNzbycfNZ2sgDuZ+I6y7KhkYvbfU8123YySe9inXiUlXoupu4vBFGBN5Lt0wOH8W4
	 qFgTDzZrOptJ2CLGpicdeaVQArpqHphzDtpFYGsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8300F80268;
	Mon, 23 Nov 2020 14:40:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6542DF80255; Mon, 23 Nov 2020 14:40:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B0BF80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 14:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B0BF80128
IronPort-SDR: ygEzvFl41JqL8VHiHy1iwMX1e2ePfMcBc/XIM8WvoSw2yfMr8dTOBFcDPrbWcqYrnJS6ezFQGb
 trnuYEJWNJPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="189879635"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="189879635"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 05:40:48 -0800
IronPort-SDR: 3TVv61qLh3jys0yf/ai6P3eILCIAnAKEr5FdTsJXPN1MoL9wBBUcHF6byFEyoZoQSIEWNHz2Ug
 ZYoYP1HWt2Lg==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="370040760"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 05:40:46 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1khC6F-009ARV-V6; Mon, 23 Nov 2020 15:41:47 +0200
Date: Mon, 23 Nov 2020 15:41:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123134147.GE4077@smile.fi.intel.com>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
 <20201123104832.GY4077@smile.fi.intel.com>
 <20201123123731.GA6322@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123123731.GA6322@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>
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

On Mon, Nov 23, 2020 at 12:37:31PM +0000, Mark Brown wrote:
> On Mon, Nov 23, 2020 at 12:48:32PM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 22, 2020 at 11:59:20AM +0100, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 20, 2020 at 08:04:29PM +0000, Mark Brown wrote:
> 
> > > > Surely if that's the desired outcome the fix is to change the definition
> > > > of of_match_ptr() such that it leaves the reference with CONFIG_ACPI,
> > > > perhaps hidden behind a config option for PRP0001?  That seems better
> > > > than going through the entire tree like this.
> 
> > > That could be indeed an easier way to achieve this.
> 
> > ...easier and wrong in my opinion. Not all drivers need that.
> > What the point to touch it in the driver which is OF-only?
> > (For IP which will quite unlikely to be present in ACPI world)
> > Or if the device will get the correct ACPI ID?
> 
> That feels like something that should be done with Kconfig dependencies
> like a direct OF dependency (possibly a !PRP0001 dependency?) for the
> driver or possibly with having a variant of_match_ptr() for things that
> really don't want to support PRP0001.  Just removing all the use of
> of_match_ptr() is both noisy and confusing in that it looks like it's
> creating issues to fix, it makes it hard to understand when and why one
> should use the macro.

My personal opinion is that in 99% using that macro (as well as ACPI_PTR() one)
is kinda mistake. We save dozen of bytes here and there by adding macro,
necessary ifdeferry, and dropping user to know that the driver might serve for
other device IDs as provided by OF / ACPI.

But I'm not the one who makes a decision here and I could see some want to have
a possibility to reduce their kernel memory footprint as much as possible.

-- 
With Best Regards,
Andy Shevchenko


