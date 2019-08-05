Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAD8173E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 12:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9305386F;
	Mon,  5 Aug 2019 12:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9305386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565001684;
	bh=CtzL7LR7u9YNxh5D87lA0CNRtLSX28GQlofe/vsLPok=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UuoIdn8XXf8K+x66WbSyDVgGSohFFgrL+si4JRGS3qES1awQgpuJdSNsfqpe1BoJy
	 8tXtLcDRkg1s3aShFEtw17TRnCVUCHU6YnzGiOLHW1R0jFsmVsF+9SsgxZyYJRIIZa
	 YnCRccZ2SVjh8CKx8Ma4qFypuoH/D5lLThOrWZp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA77EF80529;
	Mon,  5 Aug 2019 12:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 459EEF80533; Mon,  5 Aug 2019 12:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E792F800F4
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 12:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E792F800F4
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 03:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="181642793"
Received: from buildpc-hp-z230.iind.intel.com (HELO buildpc-HP-Z230)
 ([10.223.89.34])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2019 03:38:55 -0700
Date: Mon, 5 Aug 2019 16:10:47 +0530
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190805104047.GG22437@buildpc-HP-Z230>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 26/40] soundwire: cadence_master: fix
 divider setting in clock register
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

On Thu, Jul 25, 2019 at 06:40:18PM -0500, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@linux.intel.com>
> 
> The existing code uses an OR operation which would mix the original
> divider setting with the new one, resulting in an invalid
> configuration that can make codecs hang.
> 
> Add the mask definition and use cdns_updatel to update divider
> 
> Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 10ebcef2e84e..18c6ac026e85 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -57,6 +57,7 @@
>  #define CDNS_MCP_SSP_CTRL1			0x28
>  #define CDNS_MCP_CLK_CTRL0			0x30
>  #define CDNS_MCP_CLK_CTRL1			0x38
> +#define CDNS_MCP_CLK_MCLKD_MASK		GENMASK(7, 0)
>  
>  #define CDNS_MCP_STAT				0x40
>  
> @@ -988,9 +989,11 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>  	/* Set clock divider */
>  	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
>  	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);

reg read of CLK_CTRL0 can be removed.

> -	val |= divider;
> -	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
> -	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
> +
> +	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
> +		     CDNS_MCP_CLK_MCLKD_MASK, divider);
> +	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
> +		     CDNS_MCP_CLK_MCLKD_MASK, divider);
>  
>  	pr_err("plb: mclk %d max_freq %d divider %d register %x\n",
>  	       prop->mclk_freq,
> @@ -1064,8 +1067,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
>  		mcp_clkctrl_off = CDNS_MCP_CLK_CTRL0;
>  
>  	mcp_clkctrl = cdns_readl(cdns, mcp_clkctrl_off);

same as above.

> -	mcp_clkctrl |= divider;
> -	cdns_writel(cdns, mcp_clkctrl_off, mcp_clkctrl);
> +	cdns_updatel(cdns, mcp_clkctrl_off, CDNS_MCP_CLK_MCLKD_MASK, divider);
>  
>  	pr_err("plb: mclk * 2 %d curr_dr_freq %d divider %d register %x\n",
>  	       prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR,
> -- 
> 2.20.1
> 

-- 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
