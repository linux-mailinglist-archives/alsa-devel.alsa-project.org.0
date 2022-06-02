Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFD53BAA1
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41FBE17AD;
	Thu,  2 Jun 2022 16:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41FBE17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654179856;
	bh=10tdVqNXMtoaGj37cG5xipixchrN/gTHN1SNied7ehI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXjc66lTZF2H1O8SkdOZbEjXYOx/Em1UeL0X3NeaV1X9bYDF7qEG5eyaIyETeNhCo
	 Zx7v85wdqa6Tqu9Tw9rFfqvVWA4upL89CJOW3HAKNzzrN1GAgbkFpxMr3QmiYBf2FS
	 rmzI5In4+P/GdPTZUxuFNj/Yy1fWyThaxXiAkdJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F388F80272;
	Thu,  2 Jun 2022 16:23:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D20CF8025E; Thu,  2 Jun 2022 16:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F35F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 16:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F35F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RgGbHEco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654179791; x=1685715791;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=10tdVqNXMtoaGj37cG5xipixchrN/gTHN1SNied7ehI=;
 b=RgGbHEcozHwAc1ustZRg1PrKqDG17JI64aEXHXpV0zUqTVYUC+2dRSnL
 5/+O0b1s2cTu1MtGJVwT45WMI66bfRX1Fpx7WvSIZvzba3+SrxzsaJ4kx
 rh5z/CvMJr9x1bV3SxXxOwXmeU8vZJOFu14ROjL8wLS4CNhDamlcZTRYl
 1yotVP/lNwYCZEKGOqBid7BnxkuuP8roMq954zcub55zNlrcyQ6eP3eD9
 7cwX1kaTiak5nddEiKhTEHGaMEo3q/+bc6QbHr4Vwy3AAPWQIfR0mZBQt
 Cr70+WqPnUSmceVu/qOjAni6JJdtNrJk7hQz3un7YW306umcB9wlYBLDz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="263599819"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="263599819"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 07:23:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="905008802"
Received: from dvnguye2-mobl.amr.corp.intel.com (HELO [10.251.7.96])
 ([10.251.7.96])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 07:23:05 -0700
Message-ID: <53e13af2-d279-372c-0b5b-fdf3277e0231@linux.intel.com>
Date: Thu, 2 Jun 2022 09:13:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ASoC: Intel: cirrus-common: fix incorrect channel
 mapping
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220602051922.1232457-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220602051922.1232457-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, xliu <xiang.liu@cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/2/22 00:19, Brent Lu wrote:
> From: xliu <xiang.liu@cirrus.com>
> 
> The default mapping of ASPRX1 (DAC source) is slot 0. Change the slot
> mapping of right amplifiers (WR and TR) to slot 1 to receive right
> channel data. Also update the ACPI instance ID mapping according to HW
> configuration.
> 
> Signed-off-by: xliu <xiang.liu@cirrus.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>

This v2 looks much better and self-explanatory. Thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_cirrus_common.c | 40 +++++++++++++++++++---
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
> index e71d74ec1b0b..f4192df962d6 100644
> --- a/sound/soc/intel/boards/sof_cirrus_common.c
> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
> @@ -54,22 +54,29 @@ static struct snd_soc_dai_link_component cs35l41_components[] = {
>  	},
>  };
>  
> +/*
> + * Mapping between ACPI instance id and speaker position.
> + *
> + * Four speakers:
> + *         0: Tweeter left, 1: Woofer left
> + *         2: Tweeter right, 3: Woofer right
> + */
>  static struct snd_soc_codec_conf cs35l41_codec_conf[] = {
>  	{
>  		.dlc = COMP_CODEC_CONF(CS35L41_DEV0_NAME),
> -		.name_prefix = "WL",
> +		.name_prefix = "TL",
>  	},
>  	{
>  		.dlc = COMP_CODEC_CONF(CS35L41_DEV1_NAME),
> -		.name_prefix = "WR",
> +		.name_prefix = "WL",
>  	},
>  	{
>  		.dlc = COMP_CODEC_CONF(CS35L41_DEV2_NAME),
> -		.name_prefix = "TL",
> +		.name_prefix = "TR",
>  	},
>  	{
>  		.dlc = COMP_CODEC_CONF(CS35L41_DEV3_NAME),
> -		.name_prefix = "TR",
> +		.name_prefix = "WR",
>  	},
>  };
>  
> @@ -101,6 +108,21 @@ static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
>  	return ret;
>  }
>  
> +/*
> + * Channel map:
> + *
> + * TL/WL: ASPRX1 on slot 0, ASPRX2 on slot 1 (default)
> + * TR/WR: ASPRX1 on slot 1, ASPRX2 on slot 0
> + */
> +static const struct {
> +	unsigned int rx[2];
> +} cs35l41_channel_map[] = {
> +	{.rx = {0, 1}}, /* TL */
> +	{.rx = {0, 1}}, /* WL */
> +	{.rx = {1, 0}}, /* TR */
> +	{.rx = {1, 0}}, /* WR */
> +};
> +
>  static int cs35l41_hw_params(struct snd_pcm_substream *substream,
>  			     struct snd_pcm_hw_params *params)
>  {
> @@ -134,6 +156,16 @@ static int cs35l41_hw_params(struct snd_pcm_substream *substream,
>  				ret);
>  			return ret;
>  		}
> +
> +		/* setup channel map */
> +		ret = snd_soc_dai_set_channel_map(codec_dai, 0, NULL,
> +						  ARRAY_SIZE(cs35l41_channel_map[i].rx),
> +						  (unsigned int *)cs35l41_channel_map[i].rx);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "fail to set channel map, ret %d\n",
> +				ret);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
