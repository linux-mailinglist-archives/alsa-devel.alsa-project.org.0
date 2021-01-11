Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2752F20D8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:32:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8427173A;
	Mon, 11 Jan 2021 21:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8427173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610397130;
	bh=yUBDPZgG+83XJCnnD+Ki1qNNqO4qMuu0w71F0ub6+G4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqKDAo/dmhCxreOps0znzgQanRPFVVHJDy2OgnGhNJ3D63tdS/viw/HQLM31HmQS/
	 QJYkdtMalvplxXaki1yZl4dKe9HSMrdTNjj6hGpK6b2gcWBT7W9P6/odawQn9/XZpP
	 AVZzAnjL2o9hqz1Phyq7lw2iC8y5w6z3jJlyto+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB24F804E0;
	Mon, 11 Jan 2021 21:29:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98603F800BE; Mon, 11 Jan 2021 21:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E0A2F8025F
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 21:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E0A2F8025F
IronPort-SDR: 4fJ6c6ypgnusJNbWRHo9zM8ek+19C+zOp2EFxsNftt7rsJIGgXXD0gbya35517+PEnBoRDnYrG
 noEZTlY9hd3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="262712522"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="262712522"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:40 -0800
IronPort-SDR: CiAqIOJvPwhvEMolZABCL391Ct/ClHcuSvCpJ4weDME7mqfOn3UqLNfM0bGKKeJYFRXEzvAQWw
 wwVH3sduSreQ==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="344995388"
Received: from gkbech1x-mobl.amr.corp.intel.com (HELO [10.212.87.85])
 ([10.212.87.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:39 -0800
Subject: Re: [PATCH] ASoC: Intel: cht_bsw_nau8824: Move
 snd_soc_dai_set_tdm_slot call to cht_codec_fixup
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210107115324.11602-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2cb39c02-af97-f097-83bc-93f08f900c2c@linux.intel.com>
Date: Mon, 11 Jan 2021 12:09:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107115324.11602-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 1/7/21 5:53 AM, Hans de Goede wrote:
> Move the snd_soc_dai_set_tdm_slot() call from cht_codec_init() to
> cht_codec_fixup(). There are 2 reasons for doing this:
> 
> 1. This aligns the cht_bsw_nau8824 with all the other BYT/CHT machine
> drivers which also do this from their codec_fixup function.
> 
> 2. When using the SOF driver, things like the TDM info is set from the
> topology file. Moving the call to the codec_fixup function, which gets
> skipped when using the SOF driver avoids the call interfering with the
> settings when using the SOF driver.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Yep, this is a required change.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/cht_bsw_nau8824.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
> index fd5e25ca05f7..da5a5cbc8759 100644
> --- a/sound/soc/intel/boards/cht_bsw_nau8824.c
> +++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
> @@ -100,13 +100,6 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
>   	struct snd_soc_component *component = codec_dai->component;
>   	int ret, jack_type;
>   
> -	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
> -	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xf, 0x1, 4, 24);
> -	if (ret < 0) {
> -		dev_err(runtime->dev, "can't set codec TDM slot %d\n", ret);
> -		return ret;
> -	}
> -
>   	/* NAU88L24 supports 4 butons headset detection
>   	 * KEY_PLAYPAUSE
>   	 * KEY_VOICECOMMAND
> @@ -141,6 +134,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
>   		SNDRV_PCM_HW_PARAM_CHANNELS);
>   	struct snd_mask *fmt =
>   		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +	int ret;
>   
>   	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
>   	rate->min = rate->max = 48000;
> @@ -150,6 +144,13 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
>   	snd_mask_none(fmt);
>   	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
>   
> +	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
> +	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xf, 0x1, 4, 24);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
> 
