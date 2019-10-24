Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A630E304F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF15B167D;
	Thu, 24 Oct 2019 13:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF15B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571916353;
	bh=BUdNSVGYj/1Ok7jZdSiPk+/bIDEpSbUIjehfWDQo3u4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KciN2SMcbCD+nEiD2B9/XIf6ZP5OxZYS71/jzd6IoolOC83cbqZ4fGi4TpmxHvp9u
	 I8WewWb40XDS4ZX5YE/nQvSYmCn6IPDHLmzyzkL2QWWKe/GPUWt2rHw32BGitIULxo
	 fV4dQCff8yPvaodPVVtSV9dlBvpiITuY91CgS2yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 332C1F8036B;
	Thu, 24 Oct 2019 13:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1B94F8036B; Thu, 24 Oct 2019 13:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00F56F80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F56F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v/diBaZc"
Received: from localhost (unknown [122.181.210.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE2152084C;
 Thu, 24 Oct 2019 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571916241;
 bh=g+R7dOXwcKElWRvz7nfCK0CoS/QqY5FvmWjQtXYXq/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v/diBaZcHhDWIo+d+S3cwC1M/W56n2/OKrdFxsOE29WIddOrDJOiJE939fYB6f+wr
 ODZud7Q8KKyseuJi4mAQmDp58BR7ZJLemuOE7wiIq5XXXpa78RfGKwxczTO//LyzZ0
 JJwSN3501O/+N/dCEA6sXvX2WxPHxRLcNGf5NhfM=
Date: Thu, 24 Oct 2019 16:53:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191024112356.GA2620@vkoul-mobl>
References: <20191022232948.17156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022232948.17156-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: intel: fix PDI/stream mapping
	for Bulk
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

On 22-10-19, 18:29, Pierre-Louis Bossart wrote:
> The previous formula is incorrect for PDI0/1, the mapping is not
> linear but has a discontinuity between PDI1 and PDI2.
> 
> This change has no effect on PCM PDIs (same mapping).
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index b403ccc832b6..c984261fcc33 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -480,7 +480,10 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
>  	unsigned int link_id = sdw->instance;
>  	int pdi_conf = 0;
>  
> -	pdi->intel_alh_id = (link_id * 16) + pdi->num + 5;
> +	/* the Bulk and PCM streams are not contiguous */
> +	pdi->intel_alh_id = (link_id * 16) + pdi->num + 3;
> +	if (pdi->num >= 2)
> +		pdi->intel_alh_id += 2;
>  
>  	/*
>  	 * Program stream parameters to stream SHIM register
> @@ -509,7 +512,10 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
>  	unsigned int link_id = sdw->instance;
>  	unsigned int conf;
>  
> -	pdi->intel_alh_id = (link_id * 16) + pdi->num + 5;
> +	/* the Bulk and PCM streams are not contiguous */
> +	pdi->intel_alh_id = (link_id * 16) + pdi->num + 3;
> +	if (pdi->num >= 2)
> +		pdi->intel_alh_id += 2;

The change is repeated so how about:

        intel_pdi_update_alh() or similar which does this rather than
repeat the pattern

>  
>  	/* Program Stream config ALH register */
>  	conf = intel_readl(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id));
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
