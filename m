Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6C15A611
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 11:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A6B1665;
	Wed, 12 Feb 2020 11:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A6B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581502668;
	bh=AUx5NA7kQ/iXyY/tChwAV4PJuSyA8iuUd8BEXcFocTs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EH5hwdCqfa+B7xNZzwZn/VANuPoLTJYcROduQEBiUPhDYzhGbbhmcjWCebMVAdpGr
	 FH2bxVU0uEuingHBo0hwUZI8v2A+S6vicd5ZCqGQ9snB/3AVxCiLiBIdtcExG5V1rE
	 Rjf0ZgKnrVkRYSRNbFiZNidg5vglkZ3lFtgdU0nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E9CF800F0;
	Wed, 12 Feb 2020 11:16:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A62F800E7; Wed, 12 Feb 2020 11:16:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04A17F800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 11:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A17F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DRXxX5tK"
Received: from localhost (unknown [223.226.122.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3841C2073C;
 Wed, 12 Feb 2020 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581502559;
 bh=0ZfvCJyD4aws5BJOETfWcvOs5Q4TcRSl+cvngTFFj4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRXxX5tKi7piaFyca09jdXFxsKPiEvspBonnyZ0Dz+rdmgDlp7PZWbfSQxiu5WByV
 uSSt22QM8Rq5SK4NtQ7xuJBzHjHJlZAwd9cBlQeefylCVNRDA1MgMWStiu98e6C1QR
 SaA06dY+p9Nyoth4MBm5Pu7Hy3oewdHYwCIRyVbA=
Date: Wed, 12 Feb 2020 15:45:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200212101554.GB2618@vkoul-mobl>
References: <20200114234257.14336-1-pierre-louis.bossart@linux.intel.com>
 <20200114234257.14336-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114234257.14336-6-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 5/5] soundwire: intel: free all
	resources on hw_free()
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

On 14-01-20, 17:42, Pierre-Louis Bossart wrote:
> Make sure all calls to the SoundWire stream API are done and involve
> callback
> 
> Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 40 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index c498812522ab..e0c1fff7c4a0 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -550,6 +550,25 @@ static int intel_params_stream(struct sdw_intel *sdw,
>  	return -EIO;
>  }
>  
> +static int intel_free_stream(struct sdw_intel *sdw,
> +			     struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai,
> +			     int link_id)
> +{
> +	struct sdw_intel_link_res *res = sdw->link_res;
> +	struct sdw_intel_stream_free_data free_data;

where is this struct sdw_intel_stream_free_data defined. I dont see it
in this patch or this series..

> +
> +	free_data.substream = substream;
> +	free_data.dai = dai;
> +	free_data.link_id = link_id;
> +
> +	if (res->ops && res->ops->free_stream && res->dev)
> +		return res->ops->free_stream(res->dev,
> +					     &free_data);
> +
> +	return 0;
> +}
> +
>  /*
>   * bank switch routines
>   */
> @@ -817,6 +836,7 @@ static int
>  intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  {
>  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
> +	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_cdns_dma_data *dma;
>  	int ret;
>  
> @@ -824,12 +844,28 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  	if (!dma)
>  		return -EIO;
>  
> +	ret = sdw_deprepare_stream(dma->stream);
> +	if (ret) {
> +		dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
> +		return ret;
> +	}
> +
>  	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
>  			dma->stream->name, ret);
> +		return ret;
> +	}
>  
> -	return ret;
> +	ret = intel_free_stream(sdw, substream, dai, sdw->instance);
> +	if (ret < 0) {
> +		dev_err(dai->dev, "intel_free_stream: failed %d", ret);
> +		return ret;
> +	}
> +
> +	sdw_release_stream(dma->stream);

I think, free the 'name' here would be apt

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
