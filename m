Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3F48DDCC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:40:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55212033;
	Thu, 13 Jan 2022 19:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55212033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642099238;
	bh=5g26MQKibx5sVbKGA7CFhTcEXcX6VmlkTwTbFUe7AUw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IuKLPRMg+Kci8N8qlSjtRnCdrjQeS3hMb6TCIKMURw7GVoIw/OMVQmZcbYY7vkH3K
	 N9WTmtshHzB1ZgFc4ul5zWfMLpMnLKrCMa4XbmuG8fMH2329S/Y4gjy3MhmEDtLuMf
	 wjBzliWkpm8FK1/CYaq4G/3G7KcGWPm9Eq5blsQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF66F804F2;
	Thu, 13 Jan 2022 19:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42A72F8019B; Thu, 13 Jan 2022 19:38:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218D5F8028D
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218D5F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Sx/dNDGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099135; x=1673635135;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5g26MQKibx5sVbKGA7CFhTcEXcX6VmlkTwTbFUe7AUw=;
 b=Sx/dNDGIgxK1KqmD2uDqlK8sb6v5boGGx2Rr7B9lWiRJ2PM2Dnn3k/pi
 U9x4VUzDNEBg2b8F09ZaDVZKTcXo6qkX8Tq9qZwnufMHS3MBDl/qR4xAm
 BmGDU2QKsfeiz8MXM7rqzUg1sfElo8SmK+hb7DMg676bGXXnMX9U1yzRj
 ubLHCIgAwgB5OkZbKs7RSYHEDbtLxN7DkMdb+mdw8nAILh+iD76wh7AzG
 JXI48clcgXpECLwj2fT2e3qf218Cwj9/KD7hl6X032VV+OlufeuOqRFbZ
 wv6+0E308ZcjDixc6Qi6cXnfn1+iLMZgPZ9DblYXdCS/3FvFTPjyjsz63 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="307431369"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="307431369"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:38:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620699925"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:38:47 -0800
Subject: Re: [PATCH v2 5/6] ASoC: amd: acp: acp-legacy: Add DMIC dai link
 support for Renoir
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
 <20220113163348.434108-6-AjitKumar.Pandey@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <090e073f-01d8-e0b1-646d-5ae1eceed7d9@linux.intel.com>
Date: Thu, 13 Jan 2022 12:38:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113163348.434108-6-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Alexander.Deucher@amd.com,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
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




> diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
> index 0ad1cf41b308..91140d15691b 100644
> --- a/sound/soc/amd/acp/acp-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-legacy-mach.c
> @@ -23,10 +23,10 @@
>  static struct acp_card_drvdata rt5682_rt1019_data = {
>  	.hs_cpu_id = I2S_SP,
>  	.amp_cpu_id = I2S_SP,
> -	.dmic_cpu_id = NONE,
> +	.dmic_cpu_id = DMIC,
>  	.hs_codec_id = RT5682,
>  	.amp_codec_id = RT1019,
> -	.dmic_codec_id = NONE,
> +	.dmic_codec_id = DMIC,

this definition is not used?

>  	.gpio_spkr_en = EN_SPKR_GPIO_GB,
>  };
>  
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index c9caade5cb74..b163e3a68166 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -438,6 +438,8 @@ SND_SOC_DAILINK_DEF(sof_sp,
>  	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-sp")));
>  SND_SOC_DAILINK_DEF(sof_dmic,
>  	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-dmic")));
> +SND_SOC_DAILINK_DEF(pdm_dmic,
> +	DAILINK_COMP_ARRAY(COMP_CPU("acp-pdm-dmic")));
>  
>  int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>  {
> @@ -613,6 +615,19 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
>  			links[i].ops = &acp_card_maxim_ops;
>  			links[i].init = acp_card_maxim_init;
>  		}
> +		i++;
> +	}
> +
> +	if (drv_data->dmic_cpu_id == DMIC) {
> +		links[i].name = "acp-dmic-codec";
> +		links[i].id = DMIC_BE_ID;
> +		links[i].codecs = dmic_codec;
> +		links[i].num_codecs = ARRAY_SIZE(dmic_codec);
> +		links[i].cpus = pdm_dmic;
> +		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
> +		links[i].platforms = platform_component;
> +		links[i].num_platforms = ARRAY_SIZE(platform_component);
> +		links[i].dpcm_capture = 1;
>  	}
>  
>  	card->dai_link = links;
> 
