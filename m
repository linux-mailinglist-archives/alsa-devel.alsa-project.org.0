Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8161501E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE55C191B;
	Mon,  6 May 2019 17:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE55C191B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557156397;
	bh=eTC3m4nS2xkTA3YvbwP/9Nn1E3tIWPJcxevK3nWboS8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCnSDppUqcagBiUS5Y0phX1asHUP285DthyB8kR+QynMk4KVmA+RhN2niRwsSU3VA
	 e6ASiLD84Ugr8pVydKFIXIt0WABGmUCEkVfMBOYYPJlOCT2zhQr1jsKtjB86tn8OQX
	 2z7xw9/sxQw8PthBGJPpBbJ8DQl7A9wb+LcbKobc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95777F80C07;
	Mon,  6 May 2019 17:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F07F89701; Mon,  6 May 2019 17:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1ED7F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1ED7F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="344011094"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2019 08:24:48 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 935FC58010A;
 Mon,  6 May 2019 08:24:48 -0700 (PDT)
To: Nariman <narimantos@gmail.com>, linux-kernel@vger.kernel.org
References: <20190504151652.5213-1-user@elitebook-localhost>
 <20190504151652.5213-4-user@elitebook-localhost>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ea3ac342-c3a2-6054-77f7-0f13d0e9d593@linux.intel.com>
Date: Mon, 6 May 2019 10:24:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504151652.5213-4-user@elitebook-localhost>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Jordy Ubink <jordyubink@hotmail.nl>,
 yang.jie@linux.intel.com, tiwai@suse.com, liam.r.girdwood@linux.intel.com,
 hdegoede@redhat.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5651.c: remove string
 buffers 'byt_rt5651_cpu_dai_name' and 'byt_rt5651_cpu_dai_name'
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 5/4/19 10:16 AM, Nariman wrote:
> From: Jordy Ubink <jordyubink@hotmail.nl>
> 
> The snprintf calls filling byt_rt5651_cpu_dai_name / byt_rt5651_cpu_dai_name always fill them with the same string (ssp0-port" resp "rt5651-aif2"). So instead of keeping these buffers around and making the cpu_dai_name / codec_dai_name point to this, simply update the foo_dai_name pointers to directly point to a string constant containing the desired string.
> 
> Signed-off-by: Jordy Ubink <jordyubink@hotmail.nl>
> ---
>   sound/soc/intel/boards/bytcr_rt5651.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index e528995668b7..2e1bf43820d8 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -730,8 +730,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
>   
>   /* SoC card */
>   static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
> -static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
> -static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
>   static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
>   
>   static int byt_rt5651_suspend(struct snd_soc_card *card)
> @@ -1009,26 +1007,12 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>   	log_quirks(&pdev->dev);
>   
>   	if ((byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) ||
> -	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
> -		/* fixup codec aif name */
> -		snprintf(byt_rt5651_codec_aif_name,
> -			sizeof(byt_rt5651_codec_aif_name),
> -			"%s", "rt5651-aif2");
> -
> -		byt_rt5651_dais[dai_index].codec_dai_name =
> -			byt_rt5651_codec_aif_name;
> -	}
> +	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
> +		byt_rt5651_dais[dai_index].codec_dai_name = "rt5651-aif2";
>   
>   	if ((byt_rt5651_quirk & BYT_RT5651_SSP0_AIF1) ||
> -	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
> -		/* fixup cpu dai name name */
> -		snprintf(byt_rt5651_cpu_dai_name,
> -			sizeof(byt_rt5651_cpu_dai_name),
> -			"%s", "ssp0-port");
> -
> -		byt_rt5651_dais[dai_index].cpu_dai_name =
> -			byt_rt5651_cpu_dai_name;
> -	}
> +	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
> +		byt_rt5651_dais[dai_index].cpu_dai_name = "ssp0-port";

same issues with Signed-off-by and missing quirks.

>   
>   	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
>   		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
