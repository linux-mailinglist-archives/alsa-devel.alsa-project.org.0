Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7975E49
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 07:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D774D1FED;
	Fri, 26 Jul 2019 07:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D774D1FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564118507;
	bh=X5RMR52LyC67wzf2PZx5g9wTzKx3Z8S1jBHo64Z1itI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOGdrHRaBD8d8yEazTQ3ZFYuMyMLGsdI4FfXjTm26JPsmv+VNoI64tAQk1w2+5Vxi
	 PbBal33oTP7iRVXlBBKPGd4baTIVnWBpqRw6QDy0ewCiZzSkirmEBHN5ZjJgmSEdP4
	 q6XBNKQC/68VfQkiEZW6+Glo0VvRTKmR14zleFzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 423F3F803D5;
	Fri, 26 Jul 2019 07:20:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF8FF80393; Fri, 26 Jul 2019 07:20:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D62F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 07:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D62F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 22:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="369939671"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.184.27])
 ([10.252.184.27])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 22:19:52 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <f38a5e3a-c797-ae53-f0d4-31ac46ec360b@linux.intel.com>
Date: Fri, 26 Jul 2019 13:19:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 7/26/2019 7:40 AM, Pierre-Louis Bossart wrote:
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
>   drivers/soundwire/cadence_master.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 10ebcef2e84e..18c6ac026e85 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -57,6 +57,7 @@
>   #define CDNS_MCP_SSP_CTRL1			0x28
>   #define CDNS_MCP_CLK_CTRL0			0x30
>   #define CDNS_MCP_CLK_CTRL1			0x38
> +#define CDNS_MCP_CLK_MCLKD_MASK		GENMASK(7, 0)
>   
>   #define CDNS_MCP_STAT				0x40
>   
> @@ -988,9 +989,11 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>   	/* Set clock divider */
>   	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
>   	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);


Do we still need to read cdns_readl(cdns, CDNS_MCP_CLK_CTRL0)

after this change?


> -	val |= divider;
> -	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
> -	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
> +
> +	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
> +		     CDNS_MCP_CLK_MCLKD_MASK, divider);
> +	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
> +		     CDNS_MCP_CLK_MCLKD_MASK, divider);
>   
>   	pr_err("plb: mclk %d max_freq %d divider %d register %x\n",
>   	       prop->mclk_freq,
> @@ -1064,8 +1067,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
>   		mcp_clkctrl_off = CDNS_MCP_CLK_CTRL0;
>   
>   	mcp_clkctrl = cdns_readl(cdns, mcp_clkctrl_off);


Same here.


> -	mcp_clkctrl |= divider;
> -	cdns_writel(cdns, mcp_clkctrl_off, mcp_clkctrl);
> +	cdns_updatel(cdns, mcp_clkctrl_off, CDNS_MCP_CLK_MCLKD_MASK, divider);
>   
>   	pr_err("plb: mclk * 2 %d curr_dr_freq %d divider %d register %x\n",
>   	       prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR,
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
