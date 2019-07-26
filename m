Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70476E66
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30B520AB;
	Fri, 26 Jul 2019 17:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30B520AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564156753;
	bh=kuFyfI5rO2B39SRVcqUURfSGicTAl4v8wB9je19lQ6o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBlDjxjjwZV28qrA/1um7Ogi8aYShoJPCA6p1JalD6SVpxaLgeJF2AnIZJpLroIhR
	 jXtfCLGx5szZRVC6UpxC0t0OHsuKaULldix5D0eq0uU5VG+vfNQv3i4Gyt9GBz5dDR
	 uzRjA5gng8mmy4cEBnV/3AGXoGoamHC803PHdQgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BCBF803D5;
	Fri, 26 Jul 2019 17:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A03A3F80393; Fri, 26 Jul 2019 17:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7981F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7981F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="172262285"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2019 08:57:18 -0700
Date: Fri, 26 Jul 2019 17:57:17 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726155717.GM16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-38-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-38-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 37/40] soundwire: cadence_master: add
 hw_reset capability in debugfs
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

On Thu, Jul 25, 2019 at 06:40:29PM -0500, Pierre-Louis Bossart wrote:
> This is to kick devices into reset and see what software does
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index fa7230b0f200..53278aa2436f 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -331,6 +331,25 @@ static const struct file_operations cdns_reg_fops = {
>  	.llseek = default_llseek,
>  };
>  
> +static int cdns_hw_reset(void *data, u64 value)
> +{
> +	struct sdw_cdns *cdns = data;
> +	int ret;
> +
> +	if (value != 1)
> +		return 0;
> +
> +	dev_info(cdns->dev, "starting link hw_reset\n");
> +
> +	ret = sdw_cdns_exit_reset(cdns);
> +
> +	dev_info(cdns->dev, "link hw_reset done\n");

Both really should be dev_info()? Maybe at least one of them can be dev_dbg()?

Thanks
Guennadi

> +
> +	return ret;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(cdns_hw_reset_fops, NULL, cdns_hw_reset, "%llu\n");
> +
>  /**
>   * sdw_cdns_debugfs_init() - Cadence debugfs init
>   * @cdns: Cadence instance
> @@ -339,6 +358,9 @@ static const struct file_operations cdns_reg_fops = {
>  void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
>  {
>  	debugfs_create_file("cdns-registers", 0400, root, cdns, &cdns_reg_fops);
> +
> +	debugfs_create_file_unsafe("cdns-hw-reset", 0200, root, cdns,
> +				   &cdns_hw_reset_fops);
>  }
>  EXPORT_SYMBOL_GPL(sdw_cdns_debugfs_init);
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
