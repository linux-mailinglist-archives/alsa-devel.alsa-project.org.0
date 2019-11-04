Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10DEE93C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 21:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1BE31716;
	Mon,  4 Nov 2019 21:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1BE31716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572898249;
	bh=VeDhWXrJUJE+WLuUoGFPxCshLPHV2OaHI9bgEHU4bBg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBdzb6A1mKpY6wBLJQFU/bU6dkqTxc34rM/FW2GzZ3OIvMtPv8/Re5n6BHPHTAurA
	 cQv0dCQMfQgEXnsIwNbcXG0cQByX/ozxMkjWK2cIhZRG6ln//Yp19KpYdHMq0n4FRZ
	 iD3mAvtWc3HJPZmG3kWpfBiU/N+Sej9QV59Or7dU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04AB9F803F4;
	Mon,  4 Nov 2019 21:09:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47016F803F4; Mon,  4 Nov 2019 21:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44A8F8019B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 21:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44A8F8019B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 12:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="376445080"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.83.74])
 ([10.251.83.74])
 by orsmga005.jf.intel.com with ESMTP; 04 Nov 2019 12:08:47 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-14-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <42403ea0-e337-81b6-f11a-2a32c1473750@intel.com>
Date: Mon, 4 Nov 2019 21:08:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023212823.608-14-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 13/14] soundwire: intel: free all resources
	on hw_free()
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

On 2019-10-23 23:28, Pierre-Louis Bossart wrote:
> Make sure all calls to the SoundWire stream API are done and involve
> callback
> 
> Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/intel.c | 40 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index af24fa048add..cad1c0b64ee3 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -548,6 +548,25 @@ static int intel_params_stream(struct sdw_intel *sdw,
>   	return -EIO;
>   }
>   
> +static int intel_free_stream(struct sdw_intel *sdw,
> +			     struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai,
> +			     int link_id)
> +{
> +	struct sdw_intel_link_res *res = sdw->link_res;
> +	struct sdw_intel_stream_free_data free_data;
> +
> +	free_data.substream = substream;
> +	free_data.dai = dai;
> +	free_data.link_id = link_id;
> +
> +	if (res->ops && res->ops->free_stream && res->dev)

Can res->dev even be null?

> +		return res->ops->free_stream(res->dev,
> +					     &free_data);
> +
> +	return 0;
> +}
> +
>   /*
>    * bank switch routines
>    */
> @@ -816,6 +835,7 @@ static int
>   intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>   {
>   	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
> +	struct sdw_intel *sdw = cdns_to_intel(cdns);
>   	struct sdw_cdns_dma_data *dma;
>   	int ret;
>   
> @@ -823,12 +843,28 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>   	if (!dma)
>   		return -EIO;
>   
> +	ret = sdw_deprepare_stream(dma->stream);
> +	if (ret) {
> +		dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
> +		return ret;
> +	}
> +

I understand that you want to be transparent to caller with failure 
reasons via dev_err/_warn. However, sdw_deprepare_stream already dumps 
all the logs we need. The same applies for most of the other calls (and 
not just in this patch..).

Do we really need to be that verbose? Maybe just agree on caller -or- 
subject being the source for the messaging, align existing usages and 
thus preventing further duplication?

Not forcing anything, just asking for your opinion on this.

>   	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
> -	if (ret < 0)
> +	if (ret < 0) {
>   		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
>   			dma->stream->name, ret);
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
> +
> +	return 0;
>   }

Given the structure of this function, shouldn't the generic flow be 
handled by upper layer i.e. part of sdw core?. Apart from 
intel_free_stream, the rest looks pretty generic to me and this sole 
call could easily be extracted into ops.

>   
>   static void intel_shutdown(struct snd_pcm_substream *substream,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
