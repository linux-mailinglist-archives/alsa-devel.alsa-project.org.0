Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7975FBA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 09:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4251FED;
	Fri, 26 Jul 2019 09:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4251FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564125870;
	bh=4e4NQAJQIJDc796HJy+Pj7lZT15nQtoS6+qT/cGixMk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T09Vgel1Ehf2FRn9I3eeQ7LiGIR5ZfKo+UE5HOlwGP71F9VGktP9+YT7lGNHMLguf
	 SqZycchZ5J1wTfxyNLBMFzj/tc7PmF+Lf45sgoe5gcxh7YtcpTIbFNyXtd2TaKJ7Gg
	 4C0NHSkBOfzWmvdFOHeP6TDdMtEHILHdqn7j++n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6798F803D1;
	Fri, 26 Jul 2019 09:22:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8F8BF80393; Fri, 26 Jul 2019 09:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2973F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 09:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2973F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 00:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="369451492"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2019 00:22:35 -0700
Date: Fri, 26 Jul 2019 09:22:34 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726072234.GD16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-17-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-17-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 16/40] soundwire: cadence_master:
 improve startup sequence with link hw_reset
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

On Thu, Jul 25, 2019 at 06:40:08PM -0500, Pierre-Louis Bossart wrote:
> Enable interrupts first, then engage hardware bus reset with maximum
> duration to make sure the Slave(s) correctly detect the reset pattern
> and to ensure electrical conflicts can be resolved.
> 
> Without these changes the initialization is randomly corrupted by bus
> clashes, parity errors and Slave attachment does not generate any
> interrupt, despite the status showing them being attached.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 35 +++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 25d5c7267c15..442f78c00f09 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -778,6 +778,31 @@ EXPORT_SYMBOL(sdw_cdns_thread);
>   * init routines
>   */
>  
> +static int do_reset(struct sdw_cdns *cdns)
> +{
> +	int ret;
> +
> +	/* program maximum length reset to be safe */
> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
> +		     CDNS_MCP_CONTROL_RST_DELAY,
> +		     CDNS_MCP_CONTROL_RST_DELAY);
> +
> +	/* use hardware generated reset */
> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
> +		     CDNS_MCP_CONTROL_HW_RST,
> +		     CDNS_MCP_CONTROL_HW_RST);
> +
> +	/* enable bus operations with clock and data */
> +	cdns_updatel(cdns, CDNS_MCP_CONFIG,
> +		     CDNS_MCP_CONFIG_OP,
> +		     CDNS_MCP_CONFIG_OP_NORMAL);
> +
> +	/* commit changes */
> +	ret = cdns_update_config(cdns);
> +
> +	return ret;

+	return cdns_update_config(cdns);

and remove the "ret" variable.

Thanks
Guennadi

> +}
> +
>  /**
>   * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
>   * @cdns: Cadence instance
> @@ -809,7 +834,7 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>  
>  	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>  
> -	return 0;
> +	return do_reset(cdns);
>  }
>  EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
>  
> @@ -958,6 +983,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>  	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, CDNS_DEFAULT_SSP_INTERVAL);
>  	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, CDNS_DEFAULT_SSP_INTERVAL);
>  
> +	/* flush command FIFOs */
> +	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_RST,
> +		     CDNS_MCP_CONTROL_CMD_RST);
> +
>  	/* Set cmd accept mode */
>  	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
>  		     CDNS_MCP_CONTROL_CMD_ACCEPT);
> @@ -980,10 +1009,6 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>  	/* Set cmd mode for Tx and Rx cmds */
>  	val &= ~CDNS_MCP_CONFIG_CMD;
>  
> -	/* Set operation to normal */
> -	val &= ~CDNS_MCP_CONFIG_OP;
> -	val |= CDNS_MCP_CONFIG_OP_NORMAL;
> -
>  	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
>  
>  	/* commit changes */
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
