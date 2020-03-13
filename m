Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D71846C8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944D717FA;
	Fri, 13 Mar 2020 13:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944D717FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584102255;
	bh=rDGI2YkB+1Ot7lMJwobaCUfsDpwRFEEBsurwzvYrh94=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1XzS5oOPUlT8NxCa1dx1QxPWnXbW1HBrToY+fllzzCQl8pSeIlNCZxFzXyllcdK2
	 abBkjfQtQxYFCWw1a7DhLZ8axJBdG51SS2lYg5UkaA4Wk/FSrOhmaWp2OnMN4dAD+I
	 hNxqLSCBfcGduxDJzZ9gAKSHPGBuLcFa7RbtfcAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4AFDF801EB;
	Fri, 13 Mar 2020 13:22:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B2FDF801EB; Fri, 13 Mar 2020 13:22:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29A3DF8013E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A3DF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mANDAO2t"
Received: from localhost (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2942620724;
 Fri, 13 Mar 2020 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584102122;
 bh=rDGI2YkB+1Ot7lMJwobaCUfsDpwRFEEBsurwzvYrh94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mANDAO2tC3XFzypAK7l7i3+Ay/pbKCW6EKkbRLWZFrtgCkBNIkPveguoVTsYRrQhE
 cBoBan2NSSSHy0p6kkomf1NeA6JZ+dMhxIheAN08u+2iT2ZAkbRipIyu1IcET2UK+C
 mTsv6PEdfAczPNPbZJgz7kzQBxEzXdVlrwJKJ/tk=
Date: Fri, 13 Mar 2020 17:51:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 05/16] soundwire: cadence: add clock_stop/restart routines
Message-ID: <20200313122156.GG4885@vkoul-mobl>
References: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
 <20200311184128.4212-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311184128.4212-6-pierre-louis.bossart@linux.intel.com>
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

On 11-03-20, 13:41, Pierre-Louis Bossart wrote:

> @@ -225,12 +225,30 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
>  			return 0;
>  
>  		timeout--;
> -		udelay(50);
> +		usleep_range(50, 100);

this seems okay change, but unrelated to this patch

> +int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
> +{
> +	bool slave_present = false;
> +	struct sdw_slave *slave;
> +	u32 status;
> +	int ret;
> +
> +	/* Check suspend status */
> +	status = cdns_readl(cdns, CDNS_MCP_STAT);
> +	if (status & CDNS_MCP_STAT_CLK_STOP) {
> +		dev_dbg(cdns->dev, "Clock is already stopped\n");
> +		return 1;

return of 1..? Does that indicate success/fail..?

-- 
~Vinod
