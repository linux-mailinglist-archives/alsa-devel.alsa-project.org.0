Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48643E2EB
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 16:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96AD169B;
	Thu, 28 Oct 2021 15:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96AD169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635429626;
	bh=dmMqZ0NxgQtojcBmR5U4JUSKaqzqwng3igS5XfIhf54=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxPtTr5q7ewYpXQDz1tGWO8stpXAAMsO37FlvaxCzyiDcT0a4+FtvjRahLY1ZI72h
	 cuv8C7NXbTqpjIESNmecRamELFCKs0zH4/Dk2PJriYd7V0upAT09Vva/BsMR7LEKze
	 szGleINdnNiCYpeSP1RnC7eSvVr/wWWOTse4brkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F51EF804EC;
	Thu, 28 Oct 2021 15:58:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C5BCF804EB; Thu, 28 Oct 2021 15:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69361F804E6
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 15:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69361F804E6
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230262903"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="230262903"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:58:05 -0700
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="573755634"
Received: from sjsanghv-mobl.amr.corp.intel.com (HELO [10.212.61.51])
 ([10.212.61.51])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:58:03 -0700
Subject: Re: [PATCH] ASoc: Intel: glk_rt5682_max98357a: support ALC5682I-VS
 codec
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20211028060203.446093-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ca92247-70c6-a092-8fe2-cfca9d6f18e6@linux.intel.com>
Date: Thu, 28 Oct 2021 08:58:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028060203.446093-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Julian Braha <julianbraha@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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




> @@ -592,12 +610,29 @@ static int geminilake_audio_probe(struct platform_device *pdev)
>  	struct snd_soc_acpi_mach *mach;
>  	const char *platform_name;
>  	struct snd_soc_card *card;
> -	int ret;
> +	int ret, i;
>  
>  	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
>  
> +	/* Detect the headset codec variant */
> +	if (acpi_dev_present("RTL5682", NULL, -1)) {
> +		/* ALC5682I-VS is detected */
> +		ctx->is_rt5682s = 1;
> +
> +		for (i = 0; i < glk_audio_card_rt5682_m98357a.num_links; i++) {
> +			if (strcmp(geminilake_dais[i].name, "SSP2-Codec"))
> +				continue;
> +
> +			/* update the dai link to use rt5682s codec */
> +			geminilake_dais[i].codecs = ssp2_codec_5682s;
> +			geminilake_dais[i].num_codecs = ARRAY_SIZE(ssp2_codec_5682s);
> +			break;
> +		}
> +	} else
> +		ctx->is_rt5682s = 0;
> +

nit-pick: this branch is not required, the field is already reset with
kzalloc().

>  	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
>  
>  	card = &glk_audio_card_rt5682_m98357a;
> diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
> index 32fff9389eb3..4de4add74443 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
> @@ -40,6 +40,15 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
>  		.sof_fw_filename = "sof-glk.ri",
>  		.sof_tplg_filename = "sof-glk-rt5682.tplg",
>  	},
> +	{
> +		.id = "RTL5682",
> +		.drv_name = "glk_rt5682_max98357a",
> +		.fw_filename = "intel/dsp_fw_glk.bin",

Have you actually tested with this firmware? if not, it's probably
better not to list it as an option.

> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &glk_codecs,
> +		.sof_fw_filename = "sof-glk.ri",
> +		.sof_tplg_filename = "sof-glk-rt5682.tplg",
> +	},
>  	{
>  		.id = "10134242",
>  		.drv_name = "glk_cs4242_mx98357a",
> 
