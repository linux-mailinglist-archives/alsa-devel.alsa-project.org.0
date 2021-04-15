Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF816360825
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 13:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6A01675;
	Thu, 15 Apr 2021 13:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6A01675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618485666;
	bh=Ai3M7cRTgPTnp0kjXlVexMdWPGBgT2LW1FwKAXLq7Nc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhAJvzMiJGxcQHO2Yz03GsUzd3C/y8QagHMBad9NWH9Rasy4jtxAojs26+hhU++CI
	 mZ9+vqArLHvW0H6rt3qVbilInnU2RIZiwFP581EBudLr4VG/en7W+frWJ9EymtBsL/
	 KH7msZs4UwQ7NC5cpHTEPzfphyr3cIboieFDaUEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1608F8022D;
	Thu, 15 Apr 2021 13:19:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C18BF8022B; Thu, 15 Apr 2021 13:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21909F800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 13:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21909F800ED
IronPort-SDR: 4JWvf4W+tTr9ORq24ENKyQfRJ1lr5AJFogNmd7oYsrGrQwuATpQhdL4Yu/nY2sl4SUCbkoUoh9
 KJctjrJt7qgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194861989"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="194861989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 04:19:14 -0700
IronPort-SDR: EZ4Ch7iADIV/pJtrDaeT+9RPvvm7G/fWhuAjttyyYiOwqSes5aUCPESMsRrG5Owmh76kUmF+eV
 8MYcWjeY8TmQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="452873744"
Received: from allanagx-mobl.amr.corp.intel.com (HELO [10.213.172.37])
 ([10.213.172.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 04:19:14 -0700
Subject: Re: [PATCH] ASoC: Intel: Boards: cml_da7219_max98390: set TDM format
 configuration
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1618469967-16623-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d52464d2-80de-3363-6ebf-87280fcc9473@linux.intel.com>
Date: Thu, 15 Apr 2021 06:19:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618469967-16623-1-git-send-email-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Harsha Priya <harshapriya.n@intel.com>, broonie@kernel.org,
 SteveS.Lee@maximintegrated.com
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



On 4/15/21 1:59 AM, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> add tx/rx 2 channels, 32bits support

If this is on CML, how would the 32 bits work?

you would be trying to generate a 48000*32*2=3072000Hz bit clock.

The base clock is 24 MHz, that's not an integer division.

I see you've used the same 32-bit value in the topology but I really 
don't get how this might work. Please tell me you are not using the M/N 
dividers, or if you do that you understand the impact the non-regular 
duty cycle will have on audio quality.


> Signed-off-by: Steve Lee <SteveS.Lee@maximintegrated.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index 9ffef39..515379cd 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -253,6 +253,30 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
>   	return ret;
>   }
>   
> +static int max98390_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai;
> +	int j;
> +
> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +		if (!strcmp(codec_dai->component->name, MAX98390_DEV0_NAME)) {
> +			/* DEV0 tdm slot configuration */
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x1, 3, 2, 32);
> +		}
> +		if (!strcmp(codec_dai->component->name, MAX98390_DEV1_NAME)) {
> +			/* DEV1 tdm slot configuration */
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x2, 3, 2, 32);
> +		}
> +	}
> +	return 0;
> +}
> +
> +struct snd_soc_ops max_98390_ops = {
> +	.hw_params = max98390_hw_params,
> +};
> +
>   static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> @@ -813,6 +837,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
>   				if (ctx->spkamp == SPKAMP_MAX98390) {
>   					broxton_dais[i].codecs = max98390_codec;
>   					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
> +					broxton_dais[i].ops = &max_98390_ops;
>   					broxton_dais[i].dpcm_capture = 1;
>   				}
>   			}
> 
