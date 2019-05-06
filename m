Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 782051501B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B58190F;
	Mon,  6 May 2019 17:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B58190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557156359;
	bh=0olySPUdW9ocw0Ec6nOX8zVq6Vt9AecoEpTY4+E6ux8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCawJR3WoWjXTNvtLnXTgPQ1tCbyi4LMt+X78fjZiGLtQU6/8nsbVMfKP6SYmeEfx
	 CxKj7yz2vwTQ+lPIvXzqSVJrBOw6G0PVYBNnfnLVCjIuU5hM6+kbdJI2AaEVufMHCV
	 wZrPkG1sjhKH1dBxglWCvDw39x5It4ELS+eMR5vY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4299DF896E6;
	Mon,  6 May 2019 17:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE005F896F0; Mon,  6 May 2019 17:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD0D5F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0D5F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:24:06 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 06 May 2019 08:24:06 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 6B840580238;
 Mon,  6 May 2019 08:24:05 -0700 (PDT)
To: Nariman <narimantos@gmail.com>, linux-kernel@vger.kernel.org
References: <20190504151652.5213-1-user@elitebook-localhost>
 <20190504151652.5213-2-user@elitebook-localhost>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <92f39b95-aabe-0a92-714e-15d2ea123f49@linux.intel.com>
Date: Mon, 6 May 2019 10:24:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504151652.5213-2-user@elitebook-localhost>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, yang.jie@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 Damian van Soelen <dj.vsoelen@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: cht_bsw_rt5645.c: Remove
 buffer and snprintf calls
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
> From: Damian van Soelen <dj.vsoelen@gmail.com>
> 
> The snprintf calls filling cht_rt5645_cpu_dai_name / cht_rt5645_codec_aif_name
> always fill them with the same string ("ssp0-port" resp "rt5645-aif2") so
> instead of keeping these buffers around and making the cpu_dai_name /
> codec_aif_name point to this, simply update the foo_dai_name and foo_aif_name pointers to
> directly point to a string constant containing the desired string.
> 
> Signed-off-by: Damian van Soelen <dj.vsoelen@gmail.com>

Need Nariman's Signoff-of-by tag here.

> ---
>   sound/soc/intel/boards/cht_bsw_rt5645.c | 26 ++++---------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
> index cbc2d458483f..b15459e56665 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5645.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
> @@ -506,8 +506,6 @@ static struct cht_acpi_card snd_soc_cards[] = {
>   };
>   
>   static char cht_rt5645_codec_name[SND_ACPI_I2C_ID_LEN];
> -static char cht_rt5645_codec_aif_name[12]; /*  = "rt5645-aif[1|2]" */
> -static char cht_rt5645_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
>   
>   static bool is_valleyview(void)
>   {
> @@ -641,28 +639,12 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	log_quirks(&pdev->dev);
>   
>   	if ((cht_rt5645_quirk & CHT_RT5645_SSP2_AIF2) ||
> -		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
> -
> -		/* fixup codec aif name */
> -		snprintf(cht_rt5645_codec_aif_name,
> -			sizeof(cht_rt5645_codec_aif_name),
> -			"%s", "rt5645-aif2");
> -
> -		cht_dailink[dai_index].codec_dai_name =
> -			cht_rt5645_codec_aif_name;
> -	}
> +		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
> +			cht_dailink[dai_index].codec_dai_name = "rt5645-aif2";

same, not equivalent. SSP2_AIF2 is not handled.

>   
>   	if ((cht_rt5645_quirk & CHT_RT5645_SSP0_AIF1) ||
> -		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
> -
> -		/* fixup cpu dai name name */
> -		snprintf(cht_rt5645_cpu_dai_name,
> -			sizeof(cht_rt5645_cpu_dai_name),
> -			"%s", "ssp0-port");
> -
> -		cht_dailink[dai_index].cpu_dai_name =
> -			cht_rt5645_cpu_dai_name;
> -	}
> +		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
> +			cht_dailink[dai_index].cpu_dai_name = "ssp0-port";

and same here, SSP0_AIF1 will no longer work.

>   
>   	/* override plaform name, if required */
>   	platform_name = mach->mach_params.platform;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
