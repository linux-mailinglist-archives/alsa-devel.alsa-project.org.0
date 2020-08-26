Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC37252AA9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 11:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E36811614;
	Wed, 26 Aug 2020 11:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E36811614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598435311;
	bh=xqg0uPoIsVRT6yhZLnpmkmckUCu1vQcTgykvXhOQk4Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPqgUyn1Efoke/gjvamqH1yh7olQa77fRTkxvzzz36QcgdQcD5QELYjhVPD1M1/XQ
	 4+/ZehyazifN7Lw2LOksKS7s6yDjbCGLK2U5+80weV6hiy+ph52rbLmuKdNhIvA1+Y
	 LD2Rej4bn0qvut3deWUivEiF9EWRK7Rbe6/95RVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D887DF801EC;
	Wed, 26 Aug 2020 11:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B733F801EC; Wed, 26 Aug 2020 11:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8034F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 11:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8034F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YDEVZ6pU"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3C802075E;
 Wed, 26 Aug 2020 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598435200;
 bh=xqg0uPoIsVRT6yhZLnpmkmckUCu1vQcTgykvXhOQk4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YDEVZ6pUUy3KFjaL+7TIb/v++RViP+I9EUHWTesVAAN8ap7NpBUO0uUPXDllMr8YX
 7RH6J+xGVF4b9v099nyVEgm0FXKh0WdTNmPXWDj85ZXDsEmGjybOs4Qand/ZnzBgCU
 IZKOmP5X2z3+b7JDlIEcD3P4HIP9IThclEIwlF4E=
Date: Wed, 26 Aug 2020 15:16:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 07/11] soundwire: intel: Only call sdw stream APIs for
 the first cpu_dai
Message-ID: <20200826094636.GB2639@vkoul-mobl>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 18-08-20, 10:41, Bard Liao wrote:
> We should call these APIs once per stream. So we can only call it
> when the dai ops is invoked for the first cpu dai.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 45 +++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 89a8ad1f80e8..7c63581270fd 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -941,11 +941,13 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
>  static int intel_prepare(struct snd_pcm_substream *substream,
>  			 struct snd_soc_dai *dai)
>  {
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *first_cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_cdns_dma_data *dma;
>  	int ch, dir;
> -	int ret;
> +	int ret = 0;
>  
>  	dma = snd_soc_dai_get_dma_data(dai, substream);
>  	if (!dma) {
> @@ -985,7 +987,13 @@ static int intel_prepare(struct snd_pcm_substream *substream,
>  			goto err;
>  	}
>  
> -	ret = sdw_prepare_stream(dma->stream);
> +	/*
> +	 * All cpu dais belong to a stream. To ensure sdw_prepare_stream
> +	 * is called once per stream, we should call it only when
> +	 * dai = first_cpu_dai.
> +	 */
> +	if (first_cpu_dai == dai)
> +		ret = sdw_prepare_stream(dma->stream);

Hmmm why not use the one place which is unique in the card to call this,
hint machine dais are only called once.

>  
>  err:
>  	return ret;
> @@ -994,9 +1002,19 @@ static int intel_prepare(struct snd_pcm_substream *substream,
>  static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
>  			 struct snd_soc_dai *dai)
>  {
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *first_cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>  	struct sdw_cdns_dma_data *dma;
>  	int ret;
>  
> +	/*
> +	 * All cpu dais belong to a stream. To ensure sdw_enable/disable_stream
> +	 * are called once per stream, we should call them only when
> +	 * dai = first_cpu_dai.
> +	 */
> +	if (first_cpu_dai != dai)
> +		return 0;
> +
>  	dma = snd_soc_dai_get_dma_data(dai, substream);
>  	if (!dma) {
>  		dev_err(dai->dev, "failed to get dma data in %s", __func__);
> @@ -1031,6 +1049,8 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
>  static int
>  intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  {
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *first_cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_cdns_dma_data *dma;
> @@ -1040,12 +1060,25 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  	if (!dma)
>  		return -EIO;
>  
> -	ret = sdw_deprepare_stream(dma->stream);
> -	if (ret) {
> -		dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
> -		return ret;
> +	/*
> +	 * All cpu dais belong to a stream. To ensure sdw_deprepare_stream
> +	 * is called once per stream, we should call it only when
> +	 * dai = first_cpu_dai.
> +	 */
> +	if (first_cpu_dai == dai) {
> +		ret = sdw_deprepare_stream(dma->stream);
> +		if (ret) {
> +			dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
> +			return ret;
> +		}
>  	}
>  
> +	/*
> +	 * The sdw stream state will transition to RELEASED when stream->
> +	 * master_list is empty. So the stream state will transition to
> +	 * DEPREPARED for the first cpu-dai and to RELEASED for the last
> +	 * cpu-dai.
> +	 */
>  	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
>  	if (ret < 0) {
>  		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
> -- 
> 2.17.1

-- 
~Vinod
