Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DB7F75E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 14:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44238171F;
	Fri,  2 Aug 2019 14:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44238171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564750492;
	bh=sES1Wm9smw4HdVqVT3O03FyMOu4zL4b7CIb5RyIxZV8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkaY1YfLWqk90of8iVpr6Sz7HSdQqr4TFqqagS2IUj64xoF1aOAg3IKUfqPTnrUFd
	 THfsNy9FXGMxWXNfShAYCtvY1eqdLky8ql1MYOmtOkBHMBRzG1x2vWqbPkgiZzJDp0
	 dHNt0qNXRKPjodSChCtPwipdnlJcuZWr0EqiGPpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB92F80527;
	Fri,  2 Aug 2019 14:51:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52993F8048E; Fri,  2 Aug 2019 14:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D55F8048F
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 14:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D55F8048F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WG0uqqW9"
Received: from localhost (unknown [122.167.106.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7084D217D7;
 Fri,  2 Aug 2019 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564747890;
 bh=ImImKWjCHy4YFIgagVeKR9W5LMcs+2219UOfhty+Q2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WG0uqqW9SfKCzRmNjQdogBNzU9ZcXwEU97C4iAJKIyb5GU0bs7811iIC78ZY1dAcS
 KZKu59+7PfBeQWcsS0FsO0LUt7+c6AYr+is2uEOjn+POKJu734cfjXWlkfBaKuyUvp
 J68e1VrRBaDOxlf6mTzmy8pKu16vAFRpuLkkikl0=
Date: Fri, 2 Aug 2019 17:40:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802121016.GN12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-13-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-13-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 12/40] soundwire: cadence_master:
 revisit interrupt settings
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

On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> Adding missing interrupt masks (parity, etc) and missing checks.
> Clarify which masks are for which usage.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index bdc3ed844829..0f3b9c160b01 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -76,9 +76,12 @@
>  #define CDNS_MCP_INT_DPINT			BIT(11)
>  #define CDNS_MCP_INT_CTRL_CLASH			BIT(10)
>  #define CDNS_MCP_INT_DATA_CLASH			BIT(9)
> +#define CDNS_MCP_INT_PARITY			BIT(8)
>  #define CDNS_MCP_INT_CMD_ERR			BIT(7)
> +#define CDNS_MCP_INT_RX_NE			BIT(3)
>  #define CDNS_MCP_INT_RX_WL			BIT(2)
>  #define CDNS_MCP_INT_TXE			BIT(1)
> +#define CDNS_MCP_INT_TXF			BIT(0)
>  
>  #define CDNS_MCP_INTSET				0x4C
>  
> @@ -689,6 +692,11 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
>  		}
>  	}
>  
> +	if (int_status & CDNS_MCP_INT_PARITY) {
> +		/* Parity error detected by Master */
> +		dev_err_ratelimited(cdns->dev, "Parity error\n");
> +	}
> +
>  	if (int_status & CDNS_MCP_INT_CTRL_CLASH) {
>  		/* Slave is driving bit slot during control word */
>  		dev_err_ratelimited(cdns->dev, "Bus clash for control word\n");
> @@ -761,10 +769,21 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>  	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
>  		    CDNS_MCP_SLAVE_INTMASK1_MASK);
>  
> +	/* enable detection of slave state changes */
>  	mask = CDNS_MCP_INT_SLAVE_RSVD | CDNS_MCP_INT_SLAVE_ALERT |
> -		CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH |
> -		CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
> -		CDNS_MCP_INT_RX_WL | CDNS_MCP_INT_IRQ | CDNS_MCP_INT_DPINT;
> +		CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH;
> +
> +	/* enable detection of bus issues */
> +	mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
> +		CDNS_MCP_INT_PARITY;
> +
> +	/* no detection of port interrupts for now */
> +
> +	/* enable detection of RX fifo level */
> +	mask |= CDNS_MCP_INT_RX_WL;
> +
> +	/* now enable all of the above */

I think this comment seems is at wrong line..?

> +	mask |= CDNS_MCP_INT_IRQ;
>  
>  	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>  
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
