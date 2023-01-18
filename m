Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4F67273A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 19:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4804E7899;
	Wed, 18 Jan 2023 19:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4804E7899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674067193;
	bh=owfFCOcMWokMVQlRyhN3ellpSL+gLwNfYoAZb2lVBYw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PXVr+qWekzciqF4zAi8Wp+yGlP4G2gvJcOWsYUkAI23PCN3yAEkz1C2DTZKSjiwGv
	 MkEhM0HZTE6RUi5dvoOx9viiknlSP0vrCIP1LIsoO7q6EYhj8K0xA9htl0gNde90Oz
	 lQTc+CbXYMX30/EItwTi0bNGaT3SkRByb5fdcxmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5765FF8053C;
	Wed, 18 Jan 2023 19:38:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FBA3F8053D; Wed, 18 Jan 2023 19:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1832F8026D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 19:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1832F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eTWzRTlP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674067101; x=1705603101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=owfFCOcMWokMVQlRyhN3ellpSL+gLwNfYoAZb2lVBYw=;
 b=eTWzRTlPRtmFy4Kn3YjkskDGKM3IF7l2FI0f/nDT9utiwh9V4/y2lDF5
 zPMvV4VNdIEJEg319Vcmh8PU8rwffA/5WtyCRlqe6GKV/+PuRfDdtPsNa
 9U+65n1sa1AWnBy9t642KywR6UXODV8f59hKbo/l4NDL7WeCMogg5tDv7
 21a0HM8rE0/eNsXYFt4bSjXQH93A5F+613S2Ggh0M8eZfmi6KBejW6SkP
 PZxuUkymKFfH1ROdd6NbImYDNq4PynoCxVPjlZ5j6caGCCYgVLzc7gvRF
 yljo1j7RPZ6h32cWnNpO5kTF1z3bScN8uaeVLQ0kbl3xW7iTYDMm6dL8w Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327138523"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327138523"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783777262"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="783777262"
Received: from jaibarra-mobl.amr.corp.intel.com (HELO [10.209.131.1])
 ([10.209.131.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:57 -0800
Message-ID: <6fa372b6-f8e7-aaf8-dee4-bc0dde2cb931@linux.intel.com>
Date: Wed, 18 Jan 2023 10:46:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] ASoC: cs42l42: Ensure MCLKint is a multiple of the
 sample rate
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-4-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230118160452.2385494-4-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/18/23 10:04, Stefan Binding wrote:
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> The chosen clocking configuration must give an internal MCLK (MCLKint)
> that is an integer multiple of the sample rate.
> 
> On I2S each of the supported bit clock frequencies can only be generated
> from one sample rate group (either the 44100 or the 48000) so the code
> could use only the bitclock to look up a PLL config.
> 
> The relationship between sample rate and bitclock frequency is more
> complex on Soundwire and so it is possible to set a frame shape to
> generate a bitclock from the "wrong" group. For example 2*147 with a
> 48000 sample rate would give a bitclock of 14112000 which on I2S
> could only be derived from a 44100 sample rate.

The explanation is a bit convoluted, clearly the 147-row configuration
was only meant to be used with 44100 kHz. I don't think 48kHz can be
supported without using the source- or sink-controlled async modes.

This is still a valid change so:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>



> ---
>  sound/soc/codecs/cs42l42.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 82aa11d6937be..939f8bcc222c0 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -653,7 +653,8 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
>  	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
>  };
>  
> -static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk)
> +static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk,
> +			      unsigned int sample_rate)
>  {
>  	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
>  	int i;
> @@ -668,6 +669,10 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(pll_ratio_table); i++) {
> +		/* MCLKint must be a multiple of the sample rate */
> +		if (pll_ratio_table[i].mclk_int % sample_rate)
> +			continue;
> +
>  		if (pll_ratio_table[i].sclk == clk) {
>  			cs42l42->pll_config = i;
>  
> @@ -893,6 +898,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
>  	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
>  	unsigned int channels = params_channels(params);
>  	unsigned int width = (params_width(params) / 8) - 1;
> +	unsigned int sample_rate = params_rate(params);
>  	unsigned int slot_width = 0;
>  	unsigned int val = 0;
>  	unsigned int bclk;
> @@ -956,11 +962,11 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
>  		break;
>  	}
>  
> -	ret = cs42l42_pll_config(component, bclk);
> +	ret = cs42l42_pll_config(component, bclk, sample_rate);
>  	if (ret)
>  		return ret;
>  
> -	cs42l42_src_config(component, params_rate(params));
> +	cs42l42_src_config(component, sample_rate);
>  
>  	return 0;
>  }
