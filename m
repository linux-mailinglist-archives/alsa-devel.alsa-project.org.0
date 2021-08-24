Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2243F5FB8
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 16:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74C66167E;
	Tue, 24 Aug 2021 16:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74C66167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629813698;
	bh=MAaZRauasjhQT2j68YuJsQKA1RWRctiJzYyncO2ako0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AF2f9x0qbFpg/Mjt4NNQi7URCXkrkWS5JzxeT4GS6HsE/BECltoBb3BFExArmbOiF
	 VMlkOyuwcoKCD3f/xWhTGjbL/Inn53zyXgmOrJjfdyWNybyNjyV0WS1qz6P6Kyi4ps
	 3amiLIslP6F82bVT0II75Fzt4nVGBfp9WFx9w5kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D97CF80171;
	Tue, 24 Aug 2021 16:00:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 034CDF801D8; Tue, 24 Aug 2021 16:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A2A1F800AE
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 16:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2A1F800AE
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="239464197"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="239464197"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 06:59:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="535814629"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.4.79])
 ([10.213.4.79])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 06:59:48 -0700
Subject: Re: [PATCH] [v2] ASoC: Intel: sof_rt5682: Add support for max98390
 speaker amp
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20210824132109.1392-1-mark_hsieh@wistron.corp-partner.google.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a2cb1661-328f-81ac-813b-7629a28ed766@intel.com>
Date: Tue, 24 Aug 2021 15:59:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210824132109.1392-1-mark_hsieh@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lance.hou@intel.com, mark_hsieh@wistron.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, brent.lu@intel.com,
 bard.liao@intel.com
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

On 2021-08-24 3:21 PM, Mark Hsieh wrote:
> Configure adl_max98390_rt5682 to support the rt5682 headset codec and max98390 speaker
> 

Unsure if line-length for commit messages has been extended to 100 as it 
was the case for code parts but this line certainly exceeds default.

> BUG=b:191811888
> TEST=emerge-brya chromeos-kernel-5_10
> 

Are these two tags meaningful for upstream kernel?

> Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
> ---
>   sound/soc/intel/boards/Kconfig                |  1 +
>   sound/soc/intel/boards/sof_maxim_common.c     | 59 +++++++++++++++++++
>   sound/soc/intel/boards/sof_maxim_common.h     | 12 ++++
>   sound/soc/intel/boards/sof_rt5682.c           | 20 ++++++-
>   .../intel/common/soc-acpi-intel-adl-match.c   | 13 ++++
>   5 files changed, 104 insertions(+), 1 deletion(-)
> 

...

> +static int max_98390_hw_params(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai;
> +	int j;

We usually start from 'i' when it comes to choosing iteration-variable 
names.

> +
> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +		if (!strcmp(codec_dai->component->name, MAX_98390_DEV0_NAME)) {
> +			/* DEV0 tdm slot configuration */
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 2, 16);
> +		}

Suggesting to move comment one line up as you ideally want to explain 
the reasoning behind if-statement, not the actual execution statement.

Once that is done, both parenthesis can be dropped.

> +		if (!strcmp(codec_dai->component->name, MAX_98390_DEV1_NAME)) {
> +			/* DEV1 tdm slot configuration */
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 2, 16);
> +		}

Same applies here.

> +	}
> +	return 0;
> +}
> +

...

> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 39217223d50c..dc4966056b7d 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -49,6 +49,7 @@
>   #define SOF_RT1015P_SPEAKER_AMP_PRESENT		BIT(16)
>   #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(17)
>   #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(18)
> +#define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(23)
>   
>   /* BT audio offload: reserve 3 bits for future */
>   #define SOF_BT_OFFLOAD_SSP_SHIFT		19
> @@ -781,6 +782,13 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>   		} else if (sof_rt5682_quirk &
>   				SOF_RT1011_SPEAKER_AMP_PRESENT) {
>   			sof_rt1011_dai_link(&links[id]);
> +		} else if (sof_rt5682_quirk &
> +				SOF_MAX98390_SPEAKER_AMP_PRESENT) {

Pretty sure this two lines could be combined - does not exceed 
100character limit.

> +			links[id].codecs = max_98390_components;
> +			links[id].num_codecs = ARRAY_SIZE(max_98390_components);
> +			links[id].init = max_98373_spk_codec_init;
> +			links[id].ops = &max_98390_ops;
> +			links[id].dpcm_capture = 1;
>   		} else {
>   			max_98357a_dai_link(&links[id]);
>   		}
> @@ -917,7 +925,8 @@ static int sof_audio_probe(struct platform_device *pdev)
>   		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
>   	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
>   		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
> -
> +	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT)
> +		max_98390_set_codec_conf(&sof_audio_card_rt5682);
>   	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
>   		sof_audio_card_rt5682.num_links++;

Please keep the newline between these two conditional blocks. A new 
if-statement usually translates to new thought and it is good to 
separate those.

>   
> @@ -1043,6 +1052,15 @@ static const struct platform_device_id board_ids[] = {
>   					SOF_RT5682_SSP_AMP(2) |
>   					SOF_RT5682_NUM_HDMIDEV(4)),
>   	},
> +	{
> +		.name = "adl_max98390_rt5682",
> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98390_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(2) |
> +					SOF_RT5682_NUM_HDMIDEV(4)),
> +	},

This indentation seems off. Though it seems the same applies for the 
rest of the array..

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index a0f6a69c7038..2db152998e4a 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -280,6 +280,11 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
>   	.codecs = {"MX98357A"}
>   };
>   
> +static const struct snd_soc_acpi_codecs adl_max98390_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"MX98390"}

For 'forward compatibility' with possible changes to struct 
snd_soc_acpi_codecs, I'd advise appending comma at the end of the line.

> +};
> +

Regards,
Czarek
