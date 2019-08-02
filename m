Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18B80222
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 23:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED9E16B8;
	Fri,  2 Aug 2019 23:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED9E16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564780395;
	bh=cbtYyPetbXOeBjJGQNlrJjblt/hScjHTqw69SQqdC/M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4L5KkCugrDGD5ADfuI3qurEDMlS2NwQyeaWSvG3hEqE+k8kJSNKzuY4CNjSvhDm+
	 adTJIVRY8r8JLoMu2Xdu2zB8qyAHH9HskD9gkJ4E04VmVmjlRP9HQfiiVWay2i0dHg
	 /vfRGQ3kuEV51F+kPw1vwp+0zxSWqxOz+QQtGXxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4986F8048E;
	Fri,  2 Aug 2019 23:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F771F8048F; Fri,  2 Aug 2019 23:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F78BF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 23:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F78BF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="x9BL9G2K"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E4422173E;
 Fri,  2 Aug 2019 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564767148;
 bh=42TcOR8lS2f4rqcNgv/niQ1OOyQQzpjCyw97d3CbBJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x9BL9G2Kw4NQEbSxHNPZXSuhGOfSHgkh5qHdHBCyS5Wrf9VHcLOe8Oip+FTcTP51k
 3hLx2392faQcsX/oBnPZhQpxEzxA2877L+sTjU+0s0VgOs1GURmEPOexe/kD3/XTnc
 feAP8fSlqIrgQlrD20IyLpzECruU05jWXzabEXfg=
Date: Fri, 2 Aug 2019 23:01:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802173115.GE12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-36-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-36-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 35/40] soundwire: intel: export helper
	to exit reset
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

Here as well

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 9 +++++++--
>  drivers/soundwire/cadence_master.h | 1 +
>  drivers/soundwire/intel.c          | 4 ++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 4a189e487830..f486fe15fb46 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -780,7 +780,11 @@ EXPORT_SYMBOL(sdw_cdns_thread);
>   * init routines
>   */
>  
> -static int do_reset(struct sdw_cdns *cdns)
> +/**
> + * sdw_cdns_exit_reset() - Program reset parameters and start bus operations
> + * @cdns: Cadence instance
> + */
> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
>  {
>  	int ret;
>  
> @@ -804,6 +808,7 @@ static int do_reset(struct sdw_cdns *cdns)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(sdw_cdns_exit_reset);
>  
>  /**
>   * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
> @@ -839,7 +844,7 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>  
>  	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>  
> -	return do_reset(cdns);
> +	return 0;
>  }
>  EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
>  
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index de97bc22acb7..2b551f9226f3 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -161,6 +161,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
>  int sdw_cdns_init(struct sdw_cdns *cdns);
>  int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>  		      struct sdw_cdns_stream_config config);
> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>  int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>  
>  void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index a976480d6f36..9ebe38e4d979 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1112,6 +1112,8 @@ static int intel_probe(struct platform_device *pdev)
>  
>  	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>  
> +	ret = sdw_cdns_exit_reset(&sdw->cdns);
> +
>  	/* Register DAIs */
>  	ret = intel_register_dai(sdw);
>  	if (ret) {
> @@ -1199,6 +1201,8 @@ static int intel_resume(struct device *dev)
>  
>  	sdw_cdns_enable_interrupt(&sdw->cdns);
>  
> +	ret = sdw_cdns_exit_reset(&sdw->cdns);
> +
>  	return ret;
>  }
>  
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
