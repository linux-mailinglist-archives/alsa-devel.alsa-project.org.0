Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B447D0EA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 12:21:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F7E1770;
	Wed, 22 Dec 2021 12:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F7E1770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640172080;
	bh=6+4R+FyB099Qr49bH3/1NFQGuuybyBlmj9/KUyRv5pE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XNP5Gfk/m0tzWHv2/RGsPMa2ZTD/aOzGA+ePa6cZFAv0712M3h/UciKxNjbjjGrt8
	 zRtbf0Crv05fqkbclGphYEJ+qa9IraOWGlvvKDPPmyHjLX284L2YqvzWlRlAg0xp19
	 kyqRaMGcnfZzaRjP5TAO6CASo02IjR9XkjvKsixg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8F5F80111;
	Wed, 22 Dec 2021 12:20:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B0DDF80109; Wed, 22 Dec 2021 12:20:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 812DEF80084
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 12:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812DEF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ALQ87rN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640172005; x=1671708005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6+4R+FyB099Qr49bH3/1NFQGuuybyBlmj9/KUyRv5pE=;
 b=ALQ87rN5bF2jnB8BzmK4lzbUS3weEeyT9NziupkZnS+tkZESwgOS0RDH
 4os0Oc2Nk6xh8wYsfNLByHsTRYxbdw060JvisNkswNOqjTgr6I4YJlD6t
 oahDCSGKLiwJsCv0TyjZIklpl/7dtij4esrYEeCfk21klAB2QKZ6HbdsL
 TLVg18xxVcBK4AGnVDxoRl+fz58DsLoE0Yg9gDV0jHga3YROk645K7ZrB
 Gg53IobuC2ns6iugE8q9hqSkGPgwOArsepAogTao4Mb3NvjM7Kd+L2ulZ
 UTUuyM+BS0SRmJyzbQ1U9+6PVAJvRVSO277OlJzKemTKeBZFQPe8Nw74s Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="301365033"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="301365033"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 03:20:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="484727047"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 03:19:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mzzdd-000jnv-Iv; Wed, 22 Dec 2021 13:18:29 +0200
Date: Wed, 22 Dec 2021 13:18:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 2/4] soundwire: intel: Use auxiliary_device driver data
 helpers
Message-ID: <YcMJhXQNXabezOya@smile.fi.intel.com>
References: <20211221235852.323752-1-david.e.box@linux.intel.com>
 <20211221235852.323752-3-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221235852.323752-3-david.e.box@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 hdegoede@redhat.com, mustafa.ismail@intel.com, leon@kernel.org, mst@redhat.com,
 linux-rdma@vger.kernel.org, gregkh@linuxfoundation.org, jasowang@redhat.com,
 vkoul@kernel.org, davem@davemloft.net, jgg@ziepe.ca, dledford@redhat.com,
 yung-chuan.liao@linux.intel.com, netdev@vger.kernel.org, kuba@kernel.org,
 virtualization@lists.linux-foundation.org, shiraz.saleem@intel.com,
 saeedm@nvidia.com, linux-kernel@vger.kernel.org
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

On Tue, Dec 21, 2021 at 03:58:50PM -0800, David E. Box wrote:
> Use auxiliary_get_drvdata and auxiliary_set_drvdata helpers.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/soundwire/intel.c      | 8 ++++----
>  drivers/soundwire/intel_init.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 78037ffdb09b..d082d18e41a9 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1293,7 +1293,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
>  	bus->ops = &sdw_intel_ops;
>  
>  	/* set driver data, accessed by snd_soc_dai_get_drvdata() */
> -	dev_set_drvdata(dev, cdns);
> +	auxiliary_set_drvdata(auxdev, cdns);
>  
>  	/* use generic bandwidth allocation algorithm */
>  	sdw->cdns.bus.compute_params = sdw_compute_params;
> @@ -1321,7 +1321,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>  {
>  	struct sdw_cdns_stream_config config;
>  	struct device *dev = &auxdev->dev;
> -	struct sdw_cdns *cdns = dev_get_drvdata(dev);
> +	struct sdw_cdns *cdns = auxiliary_get_drvdata(auxdev);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_bus *bus = &cdns->bus;
>  	int link_flags;
> @@ -1463,7 +1463,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>  static void intel_link_remove(struct auxiliary_device *auxdev)
>  {
>  	struct device *dev = &auxdev->dev;
> -	struct sdw_cdns *cdns = dev_get_drvdata(dev);
> +	struct sdw_cdns *cdns = auxiliary_get_drvdata(auxdev);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_bus *bus = &cdns->bus;
>  
> @@ -1488,7 +1488,7 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
>  	void __iomem *shim;
>  	u16 wake_sts;
>  
> -	sdw = dev_get_drvdata(dev);
> +	sdw = auxiliary_get_drvdata(auxdev);
>  	bus = &sdw->cdns.bus;
>  
>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index e329022e1669..d99807765dfe 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -244,7 +244,7 @@ static struct sdw_intel_ctx
>  			goto err;
>  
>  		link = &ldev->link_res;
> -		link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
> +		link->cdns = auxiliary_get_drvdata(&ldev->auxdev);
>  
>  		if (!link->cdns) {
>  			dev_err(&adev->dev, "failed to get link->cdns\n");
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


