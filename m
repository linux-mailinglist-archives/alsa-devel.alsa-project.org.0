Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DD69AC2E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 14:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CE2BF16;
	Fri, 17 Feb 2023 14:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CE2BF16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676639443;
	bh=EipxcAyNbRifMzOG9QwPzSpk0i0NDRf5+rYrpaSO3p8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dNlKyy6M48pFrsYEyBYhMI4d0HFatECbDhrzju8GQkt2+Vm/VOJCockjlPV3q7426
	 gHAzQJvygmcG5hUCWe/ivTc3CowjeVUdndbkeaUSXjmxlDXnHLHC5GqIOyADUlVox0
	 OkkOr2BolAM3hgMc0LmJinXOfVUb/jPgIFu3SHEQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2B5F800E4;
	Fri, 17 Feb 2023 14:09:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA55F80171; Fri, 17 Feb 2023 14:09:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 882A3F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 14:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 882A3F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DAGII+5W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676639385; x=1708175385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EipxcAyNbRifMzOG9QwPzSpk0i0NDRf5+rYrpaSO3p8=;
  b=DAGII+5WuYZEqgYc8ES9JpxR0PV0P+l/llK7ne2RyEzh5Awb99fpgxjW
   VEvsw9ScorPXj1ySROaGMUq2u2lnmXe0xbR54W25F7X48A0ppqZ52bRVk
   VB2bLMza3tGwgDyaRIEdLQ9ecjQSd8BnkaZpJ2/Z+0TnMMqtuUHv4SwbA
   hL3wEJk4tavWxlwO5UkPKujutpJFPTjBKQ2DKYtsQ9rTI6qHZT55Z3loH
   B5uHko+qXynCP2BrKy33TVy7zHL6hVuoLam1i4idvjlWrwyxCZI2bF0ma
   6aj+gHI4czHimM9rQZXg541JzmpqUmYp0pwa4O63lb6BeR9UE1RIj2fd9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329702793"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000";
   d="scan'208";a="329702793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 05:09:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="648077433"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000";
   d="scan'208";a="648077433"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 05:09:25 -0800
Message-ID: <bd634d42-ebab-f713-365d-6936fdb5d77f@linux.intel.com>
Date: Fri, 17 Feb 2023 14:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/3] ASoC: soc-pcm: add option to start DMA after DAI
To: Claudiu Beznea <claudiu.beznea@microchip.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
References: <20230217124151.236216-1-claudiu.beznea@microchip.com>
 <20230217124151.236216-2-claudiu.beznea@microchip.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230217124151.236216-2-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XDMV4UC7CDJ6JHLLSF2X3YIPWV6AO3D4
X-Message-ID-Hash: XDMV4UC7CDJ6JHLLSF2X3YIPWV6AO3D4
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDMV4UC7CDJ6JHLLSF2X3YIPWV6AO3D4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/17/2023 1:41 PM, Claudiu Beznea wrote:
> Add option to start DMA component after DAI trigger. This is done
> by filling the new struct snd_soc_component_driver::start_dma_last.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>   include/sound/soc-component.h |  2 ++
>   sound/soc/soc-pcm.c           | 27 ++++++++++++++++++++++-----
>   2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 3203d35bc8c1..0814ed143864 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -190,6 +190,8 @@ struct snd_soc_component_driver {
>   	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
>   	int be_pcm_base;	/* base device ID for all BE PCMs */
>   
> +	unsigned int start_dma_last;
> +
>   #ifdef CONFIG_DEBUG_FS
>   	const char *debugfs_prefix;
>   #endif
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 005b179a770a..5eb056b942ce 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1088,22 +1088,39 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
>   static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   {
>   	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> -	int ret = -EINVAL, _ret = 0;
> +	struct snd_soc_component *component;
> +	int ret = -EINVAL, _ret = 0, start_dma_last = 0, i;
>   	int rollback = 0;
>   
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		/* Do we need to start dma last? */
> +		for_each_rtd_components(rtd, i, component) {
> +			if (component->driver->start_dma_last) {
> +				start_dma_last = 1;
> +				break;
> +			}
> +		}
> +
>   		ret = snd_soc_link_trigger(substream, cmd, 0);
>   		if (ret < 0)
>   			goto start_err;
>   
> -		ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
> -		if (ret < 0)
> -			goto start_err;
> +		if (start_dma_last) {
> +			ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
> +			if (ret < 0)
> +				goto start_err;
> +
> +			ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
> +		} else {
> +			ret = snd_soc_pcm_component_trigger(substream, cmd, 0);
> +			if (ret < 0)
> +				goto start_err;
>   
> -		ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
> +			ret = snd_soc_pcm_dai_trigger(substream, cmd, 0);
> +		}
>   start_err:
>   		if (ret < 0)
>   			rollback = 1;

Can all of the above be implemented similarly to already present 
stop_dma_first? It looks similar and I don't see reason to have one flag 
in snd_soc_component_driver and other in snd_soc_dai_link.


