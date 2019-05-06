Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C587715008
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58AA01908;
	Mon,  6 May 2019 17:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58AA01908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557156231;
	bh=H4DdPsw2Y/4aNi6G5V0fN8TJ6yPbnn08/Ra2WuQWQyI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdBZdig/7oToUYN8JifjaVCVWFaVSNftP3jwttx1DUj+pcwNLc/kAuy1W2w82KCG8
	 Y+kxzHMmIWw4+yoNS9J5E1RNORdexb7eJGx1pqT4FR77ag9gjsZSTob2HIfPWC/b4i
	 OxIOLrVmm1gFSapANFtVzzGCLPCV3ZoH1F+rBWbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 425EAF896FD;
	Mon,  6 May 2019 17:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 077DCF896F0; Mon,  6 May 2019 17:22:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7C2F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7C2F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="322010986"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2019 08:21:58 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 8B00058010A;
 Mon,  6 May 2019 08:21:57 -0700 (PDT)
To: Nariman <narimantos@gmail.com>, linux-kernel@vger.kernel.org
References: <20190504151652.5213-1-user@elitebook-localhost>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <423c7b83-abd6-4f75-ad3a-7c650b76e8bb@linux.intel.com>
Date: Mon, 6 May 2019 10:21:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504151652.5213-1-user@elitebook-localhost>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, yang.jie@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_5640.c:Refactored if
 statement and removed buffer
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


>   static int byt_rt5640_suspend(struct snd_soc_card *card)
> @@ -1268,28 +1266,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>   	log_quirks(&pdev->dev);
>   
>   	if ((byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) ||
> -	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
> -
> -		/* fixup codec aif name */
> -		snprintf(byt_rt5640_codec_aif_name,
> -			sizeof(byt_rt5640_codec_aif_name),
> -			"%s", "rt5640-aif2");
> -
> -		byt_rt5640_dais[dai_index].codec_dai_name =
> -			byt_rt5640_codec_aif_name;
> -	}
> +	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
> +		byt_rt5640_dais[dai_index].codec_dai_name = "rt5640-aif2";

This is not equivalent, you don't deal with the (byt_rt5640_quirk & 
BYT_RT5640_SSP2_AIF2) case. The default is SSP_AIF1

>   
>   	if ((byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) ||
> -	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
> -
> -		/* fixup cpu dai name name */
> -		snprintf(byt_rt5640_cpu_dai_name,
> -			sizeof(byt_rt5640_cpu_dai_name),
> -			"%s", "ssp0-port");
> -
> -		byt_rt5640_dais[dai_index].cpu_dai_name =
> -			byt_rt5640_cpu_dai_name;
> -	}
> +	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
> +		byt_rt5640_dais[dai_index].cpu_dai_name = "ssp0-port";

Same here, this is not equivalent. the SSP0_AIF1 case is not handled.
it's fine to remove the intermediate buffers, but you can't remove 
support for 2 out of the 4 combinations supported.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
