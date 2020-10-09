Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96BB2886E1
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 12:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE55015F9;
	Fri,  9 Oct 2020 12:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE55015F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602239324;
	bh=o15PEaXhOban6wraFBVVeWqUSFRJGFg91PCGpxlt3ws=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CqgylkBh7YQBlJEiJIjVSH9peGkWIlhcxPYsODQ0sfw6Phy/vqw56cFmr1RvrlMw7
	 aYOes8b56pNjMXkQH2NVUduMpgMbFxTJU8lvAjn5/2ClqTJd/zDdCGU3IF604J/Auk
	 /SHpCzyVhXSuYO0U/FBxVr9YOJ9ArnN6eU7paCqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE0CF80165;
	Fri,  9 Oct 2020 12:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C05DDF8015B; Fri,  9 Oct 2020 12:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EA36F800BF
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 12:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA36F800BF
IronPort-SDR: kEz3S3oAd/+v+TLluqHCpjx1SjjjPwMN1aTl+l4oSgW2t2f0huVkGjzmVV3h6ECq4ded7EJTzo
 LKF9ogA4hQcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165582213"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="165582213"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 03:26:50 -0700
IronPort-SDR: Wqop7G7qq7T1XWEMEIH+oIUeEBxqIwEfUEpNutIVR1Qw6PnHObQZCw+VmGxyigr8j8DbDw0/ze
 OkmZzcR/zdOA==
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; d="scan'208";a="343761654"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 03:26:48 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kQpct-002WQe-GR; Fri, 09 Oct 2020 13:27:51 +0300
Date: Fri, 9 Oct 2020 13:27:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201009102751.GS4077@smile.fi.intel.com>
References: <20201008161105.21804-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008161105.21804-1-broonie@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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

On Thu, Oct 08, 2020 at 05:11:05PM +0100, Mark Brown wrote:
> We intentionally do not return an error if we get a permanent failure
> from dma_request_chan() in order to support systems which have TX only
> or RX only channels. Add a comment documenting this.

Thanks, makes sense!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/soc-generic-dmaengine-pcm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index fb95c1464e66..9ef80a48707e 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -386,6 +386,11 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
>  			name = config->chan_names[i];
>  		chan = dma_request_chan(dev, name);
>  		if (IS_ERR(chan)) {
> +			/*
> +			 * Only report probe deferral errors, channels
> +			 * might not be present for devices that
> +			 * support only TX or only RX.
> +			 */
>  			if (PTR_ERR(chan) == -EPROBE_DEFER)
>  				return -EPROBE_DEFER;
>  			pcm->chan[i] = NULL;
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


