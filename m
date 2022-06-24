Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF009558FF2
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 06:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8134B18BE;
	Fri, 24 Jun 2022 06:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8134B18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656044919;
	bh=V15RsvX1+kM5FL7HzYFUlsvJt53ggBmFiKd/GuXmjCs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1f7fY84J9lqBbRvsB9yzVR2dNY7aP8YVZzAWf/8UHSyFfA710U4jqodtCcYMZ1wl
	 RD3Q/zNWgQsF0LdUPcNZvSr7kgZ0S+EfPXp0FE/wgVWtcYHPuMzW3H306NmouLRBc5
	 Q5sER9dITLA61B3t2bu/zGPYbTK2xl+3SRm/q8Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4292F80137;
	Fri, 24 Jun 2022 06:27:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 478FDF80139; Fri, 24 Jun 2022 06:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D51F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 06:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D51F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NmvU82pa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 578AF620F7;
 Fri, 24 Jun 2022 04:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC198C34114;
 Fri, 24 Jun 2022 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656044852;
 bh=V15RsvX1+kM5FL7HzYFUlsvJt53ggBmFiKd/GuXmjCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmvU82paGPiRMAiacFz4FNJVJxeI1JbNtw1jbHoW5e3CVlH8tpmUdd6lv5BSwcdM1
 v4uL9Z7gi4ooLx2Ipm3aBWYTsPLztS/myXB1ropefpunTGcqBnKgapgHR8Z7qNpNlm
 CtAWngEOk9V9dqcka22jrMTwBN35I0NbNLic/7xIH46rzszA/U65ddirNeJx92VHb4
 /F28tF9VLYMqgi/oZAwrTyK4Tk/CN5emI9bQkR3X7AoHtWD5GIAt7+F7/aE2Bxtxt0
 /wQ8RzJWkoUSdHAEjCp57j6a422udJVCSevxb2JaSHjkTYDn7TLqN9dkFAUjOM+gkV
 OxLqHRgK6hALw==
Date: Fri, 24 Jun 2022 09:57:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 1/2] soundwire: Intel: add trigger callback
Message-ID: <YrU9MEAVQojxE5i4@matsya>
References: <20220616011758.21155-1-yung-chuan.liao@linux.intel.com>
 <20220616011758.21155-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616011758.21155-2-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, sanyog.r.kale@intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

On 16-06-22, 09:17, Bard Liao wrote:
> When a pipeline is split into FE and BE parts, the BE pipeline may need to
> be triggered separately in the BE trigger op. So add the trigger callback
> in the link_res ops that will be invoked during BE DAI trigger.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  drivers/soundwire/intel.c           | 8 ++++++++
>  include/linux/soundwire/sdw_intel.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 505c5ef061e3..2e7c27d303b4 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1004,9 +1004,17 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
>  {
>  	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
> +	struct sdw_intel_link_res *res = sdw->link_res;
>  	struct sdw_cdns_dma_data *dma;
>  	int ret = 0;
>  
> +	/* The .trigger callback is used to send required IPC to audio
> +	 * firmware. The .free_stream callback will still be called
> +	 * by intel_free_stream() in the TRIGGER_SUSPEND case.
> +	 */

we dont use this style multi-line comment, pls fix it to:
        /*
         * The .trigger callback is used to send required IPC to ..
         * ...
         */

with that fixed:

Acked-By: Vinod Koul <vkoul@kernel.org>

> +	if (res->ops && res->ops->trigger)
> +		res->ops->trigger(dai, cmd, substream->stream);
> +
>  	dma = snd_soc_dai_get_dma_data(dai, substream);
>  	if (!dma) {
>  		dev_err(dai->dev, "failed to get dma data in %s\n",
> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
> index b5b489ea1aef..ec16ae49e6a4 100644
> --- a/include/linux/soundwire/sdw_intel.h
> +++ b/include/linux/soundwire/sdw_intel.h
> @@ -121,6 +121,7 @@ struct sdw_intel_ops {
>  			     struct sdw_intel_stream_params_data *params_data);
>  	int (*free_stream)(struct device *dev,
>  			   struct sdw_intel_stream_free_data *free_data);
> +	int (*trigger)(struct snd_soc_dai *dai, int cmd, int stream);
>  };
>  
>  /**
> -- 
> 2.17.1

-- 
~Vinod
