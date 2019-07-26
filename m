Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4076E51
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E66720A8;
	Fri, 26 Jul 2019 17:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E66720A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564156449;
	bh=1BTILqnzLMvGyCrqctfnKco7/mlCckFCaPb1ylVLAT8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGF8W8rIbFYr8W1Dg9t32ojea49YljLjyDNAUhwvWWOLvM8kpodUjoEso+1tv0/BN
	 zHEbOzqGkYiEmhP0c3d3uBdRmrScUSOeHn9NOO/N/sOcca7+1XKYxUKnHxMr4VG1xa
	 1JsEwoF2mCMVWNCTDQ9w2pqcKPSsnCP4K+Vj/YZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFD3F800BE;
	Fri, 26 Jul 2019 17:52:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A1E0F80393; Fri, 26 Jul 2019 17:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74423F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74423F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="172261394"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2019 08:52:15 -0700
Date: Fri, 26 Jul 2019 17:52:14 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726155213.GK16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-36-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-36-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
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

On Thu, Jul 25, 2019 at 06:40:27PM -0500, Pierre-Louis Bossart wrote:
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

This isn't something, that this patch changes, but if the return value above is
ignored, maybe no need to assign it at all?

Thanks
Guennadi

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
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
