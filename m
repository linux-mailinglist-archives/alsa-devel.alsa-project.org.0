Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819370C544
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 20:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65CA485D;
	Mon, 22 May 2023 20:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65CA485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684780500;
	bh=jwdz15fUCXCtoEVD6kRwMHhqO3XrNhvirt4nBQx8GFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DLFeh5ROBlyq/cH9T+4MvdyBNgec3wsrN6kEgZISROQCrI+qAxREoxeQyLcmSYNHr
	 Xy1XLYKcyHtR9RCWaRDWuHwpxEZxDj6ylqV6LBZbZpPaFLza3I3nLufv+roNiR+sir
	 XLsgzW7AQ/T39XLQOCZHxWWrjTaVil9a5aQVPjDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEC7DF8057E; Mon, 22 May 2023 20:33:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5504DF80553;
	Mon, 22 May 2023 20:33:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E267FF8026A; Mon, 22 May 2023 20:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B64BBF80249
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 20:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64BBF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DZ21JyJ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684780335; x=1716316335;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jwdz15fUCXCtoEVD6kRwMHhqO3XrNhvirt4nBQx8GFE=;
  b=DZ21JyJ8fD4Y5MTzN02xP2RnLL+gRLxK63uGH/CDj6TCKXYYYVCHAtof
   iA70Wp+jsweocifN3b8PMU7kT2ft1FxtSI7dwowwaI2uxygPSfd/D1oPN
   2uKlUixE+mlLQayjGrWt8t2SmwYz91OwvmHn12RsJgYWxqlzYOx9sk3y6
   6PPXZ40yYLjoHFxnnID9RS00d2+ic7dUhuYtLjOw5dbS4ME5wXORFhjsQ
   HLuU7xuEoUPv30yQ/kdo6mRSZoQFOIUuoJXiUz+YKj3ZlFCkKIC3xkUDe
   KmkeJHjQDQndDlZXRa7gBqoJCtbvPG9Z9tANuwTj1NaGx+hPG6M0nLH3j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="356235178"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="356235178"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697740860"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="697740860"
Received: from ljgreene-mobl.amr.corp.intel.com (HELO [10.209.124.121])
 ([10.209.124.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:51 -0700
Message-ID: <b3812c08-96fe-f125-66c6-a7db518a37ba@linux.intel.com>
Date: Mon, 22 May 2023 13:20:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 6/9] ASoC: amd: ps: add pm ops support for SoundWire
 dma driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-7-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230522133122.166841-7-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3AVNP7TUWIOYNA4CUN4CU3DZKZT6ZJ6B
X-Message-ID-Hash: 3AVNP7TUWIOYNA4CUN4CU3DZKZT6ZJ6B
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AVNP7TUWIOYNA4CUN4CU3DZKZT6ZJ6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> @@ -464,16 +488,79 @@ static int acp63_sdw_platform_probe(struct platform_device *pdev)
>  	status = devm_snd_soc_register_component(&pdev->dev,
>  						 &acp63_sdw_component,
>  						 NULL, 0);
> -	if (status)
> +	if (status) {
>  		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
> +		return status;
> +	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_allow(&pdev->dev);

Can you remind me why you need the pm_runtime_allow()? I can't recall
where the _forbid() is done.

Also is there not a pm_runtime_set_active() missing?

> +	return 0;
> +}
>  
> -	return status;
> +static int acp63_sdw_platform_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	return 0;
>  }
>  
> +static int __maybe_unused acp63_sdw_pcm_resume(struct device *dev)
> +{
> +	struct sdw_dma_dev_data *sdw_data;
> +	struct acp_sdw_dma_stream *stream;
> +	struct snd_pcm_runtime *runtime;
> +	u32 period_bytes, buf_size, water_mark_size_reg;
> +	int ret;
> +	int index;
> +
> +	sdw_data = dev_get_drvdata(dev);
> +	for (index = 0; index < ACP63_SDW0_DMA_MAX_STREAMS; index++) {
> +		if (sdw_data->sdw0_dma_stream[index] &&
> +		    sdw_data->sdw0_dma_stream[index]->runtime) {
> +			water_mark_size_reg = sdw0_dma_ring_buf_reg[index].water_mark_size_reg;
> +			runtime = sdw_data->sdw0_dma_stream[index]->runtime;
> +			stream = runtime->private_data;
> +			period_bytes = frames_to_bytes(runtime, runtime->period_size);
> +			buf_size = frames_to_bytes(runtime, runtime->buffer_size);
> +			acp63_config_dma(stream, sdw_data->acp_base, index);
> +			ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, index,
> +							     buf_size, ACP_SDW0);
> +			if (ret)
> +				return ret;
> +			writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
> +		}
> +	}
> +	for (index = 0; index < ACP63_SDW1_DMA_MAX_STREAMS; index++) {
> +		if (sdw_data->sdw1_dma_stream[index] &&
> +		    sdw_data->sdw1_dma_stream[index]->runtime) {
> +			water_mark_size_reg = sdw1_dma_ring_buf_reg[index].water_mark_size_reg;
> +			runtime = sdw_data->sdw1_dma_stream[index]->runtime;
> +			stream = runtime->private_data;
> +			period_bytes = frames_to_bytes(runtime, runtime->period_size);
> +			buf_size = frames_to_bytes(runtime, runtime->buffer_size);
> +			acp63_config_dma(stream, sdw_data->acp_base, index);
> +			ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, index,
> +							     buf_size, ACP_SDW1);
> +			if (ret)
> +				return ret;
> +			writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
> +		}
> +	}

Isn't this set of configurations something that needs to be done already
somewhere else, i.e. could there be a common helper?

> +	acp63_enable_disable_sdw_dma_interrupts(sdw_data->acp_base, true);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops acp63_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp63_sdw_pcm_resume)
> +};
> +
>  static struct platform_driver acp63_sdw_dma_driver = {
>  	.probe = acp63_sdw_platform_probe,
> +	.remove = acp63_sdw_platform_remove,
>  	.driver = {
>  		.name = "amd_ps_sdw_dma",
> +		.pm = &acp63_pm_ops,
>  	},
>  };
>  
