Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B99877141
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 20:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1148F20D3;
	Fri, 26 Jul 2019 20:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1148F20D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564165651;
	bh=FeKZCL1wp5ccrGpZkA+CPBXRfO/mfj1p5XbOYgqPPXo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hsUXosoib5Z1r7L9cUOOV1n41XF7xVO9UwwEKz6hOnsnrGwGtJRxeSKoMS7a0640D
	 mQVOSnRYMz/Ty8go5ealcBqWOTQHW2PrkbSVuKorc2fC0kozlBq9KGyfBgeL3YWkVa
	 7YF7KYuOE+XiA7Rk+dpl/fmKSPGgbpoA7Gdv6KkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14960F80393;
	Fri, 26 Jul 2019 20:25:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66C2DF80393; Fri, 26 Jul 2019 20:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_10, SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C878FF800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 20:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C878FF800E8
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 11:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="370158312"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2019 11:25:36 -0700
Date: Fri, 26 Jul 2019 20:25:35 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726182534.GO16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <45a912c5-134b-8642-70ef-8c1060389300@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45a912c5-134b-8642-70ef-8c1060389300@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-pm@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 26, 2019 at 01:08:57PM -0500, Pierre-Louis Bossart wrote:
> This thread became unreadable with interleaved top-posting, allow me restate
> the options and ask PM folks what they think
> 
> On 7/25/19 6:40 PM, Pierre-Louis Bossart wrote:
> > Not all platforms support runtime_pm for now, let's use runtime_pm
> > only when enabled.
> > 
> > Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > ---
> >   drivers/soundwire/bus.c | 25 ++++++++++++++++---------
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> > index 5ad4109dc72f..0a45dc5713df 100644
> > --- a/drivers/soundwire/bus.c
> > +++ b/drivers/soundwire/bus.c
> > @@ -332,12 +332,16 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> >   	if (ret < 0)
> >   		return ret;
> > -	ret = pm_runtime_get_sync(slave->bus->dev);
> > -	if (ret < 0)
> > -		return ret;
> > +	if (pm_runtime_enabled(slave->bus->dev)) {
> > +		ret = pm_runtime_get_sync(slave->bus->dev);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> >   	ret = sdw_transfer(slave->bus, &msg);
> > -	pm_runtime_put(slave->bus->dev);
> > +
> > +	if (pm_runtime_enabled(slave->bus->dev))
> > +		pm_runtime_put(slave->bus->dev);
> 
> This is option1: we explicitly test if pm_runtime is enabled before calling
> _get_sync() and _put()
> 
> option2 (suggested by Jan Kotas): catch the -EACCESS error code
> 
>  	ret = pm_runtime_get_sync(slave->bus->dev);
> -	if (ret < 0)
> +	if (ret < 0 && ret != -EACCES)
>  		return ret;
> 
> option3: ignore the return value as done in quite a few drivers
> 
> Are there any other options? I am personally surprised this is not handled
> in the pm_runtime core, not sure why users need to test for this?

option 4: fix this in runtime PM :-) This seems like the best option to me,
but probably not the easiest one. Otherwise I'd go with (2), I think, since
that's also the official purpose of the -EACCESS return code:

https://lists.linuxfoundation.org/pipermail/linux-pm/2011-June/031930.html

Thanks
Guennadi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
