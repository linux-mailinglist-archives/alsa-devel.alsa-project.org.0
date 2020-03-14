Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BC18554D
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Mar 2020 10:54:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 043D1186F;
	Sat, 14 Mar 2020 10:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 043D1186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584179643;
	bh=+pW3YzUyH0cg/KHykqp6AOMoambL+e3V8FJ78cxYe98=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g8PEDNiPK5lqTGYrqrv0HIP2R+Bc74ZfkEsLH0XsoCih/WDKH0k0eGGRufNtvzqVC
	 oS4L3I8f9KrwHZLWBEJQWWtMUXK47jWA3h1A1TRwxuQ7DHAOi6cN4EQXOEfw1id5q2
	 USMstuxm0mTA7f9KPa7QEp9hCx7pxNepvNk/7c10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B448F8020C;
	Sat, 14 Mar 2020 10:52:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 164A4F801D9; Sat, 14 Mar 2020 10:52:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B43AEF80086
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 10:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B43AEF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UI4gKwVb"
Received: from localhost (unknown [122.167.115.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21A8120753;
 Sat, 14 Mar 2020 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584179537;
 bh=+pW3YzUyH0cg/KHykqp6AOMoambL+e3V8FJ78cxYe98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UI4gKwVbJiR+VoSLoyLynOf8+KRReIEuPsKxngmstltQhAlnUa/Ilta/1JSx1Y9TY
 ZFv+yJHLGutB2tkbph8fpenwAHqWFlGPf7GbxDzVsHgGStSQSgcG4VF3n4sw6MbG5n
 pDh07RrXWdCrpKcmXEyEFIJG/OL+zEunNP8WR1Ew=
Date: Sat, 14 Mar 2020 15:22:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 05/16] soundwire: cadence: add clock_stop/restart routines
Message-ID: <20200314095206.GR4885@vkoul-mobl>
References: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
 <20200311184128.4212-6-pierre-louis.bossart@linux.intel.com>
 <20200313122156.GG4885@vkoul-mobl>
 <6d38a58a-a840-169a-1078-e10c278c11fd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d38a58a-a840-169a-1078-e10c278c11fd@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 13-03-20, 12:07, Pierre-Louis Bossart wrote:
> 
> 
> On 3/13/20 7:21 AM, Vinod Koul wrote:
> > On 11-03-20, 13:41, Pierre-Louis Bossart wrote:
> > 
> > > @@ -225,12 +225,30 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
> > >   			return 0;
> > >   		timeout--;
> > > -		udelay(50);
> > > +		usleep_range(50, 100);
> > 
> > this seems okay change, but unrelated to this patch
> 
> ok. It doesn't really matter anyway, this function is removed in Patch 8

Ok pls drop from here.

> > > +int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
> > > +{
> > > +	bool slave_present = false;
> > > +	struct sdw_slave *slave;
> > > +	u32 status;
> > > +	int ret;
> > > +
> > > +	/* Check suspend status */
> > > +	status = cdns_readl(cdns, CDNS_MCP_STAT);
> > > +	if (status & CDNS_MCP_STAT_CLK_STOP) {
> > > +		dev_dbg(cdns->dev, "Clock is already stopped\n");
> > > +		return 1;
> > 
> > return of 1..? Does that indicate success/fail..?
> 
> success. I guess it could be moved as 0.

That would be better. We use 0 for success everywhere and -ve error
codes.

-- 
~Vinod
