Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EE1C7BA5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A841917CD;
	Wed,  6 May 2020 22:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A841917CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588798710;
	bh=MLezbvUrYiyKI2x1iUBhUmzfrv5aNgrA0eu6pAusJlY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtEp+217frChkLj2YqkVIdUKs2KsBNsfnI2TiDUYOvpIj+RVL3WSkLw7sjsRnJ7qM
	 Dt7yv541JxU4kBoAuyIte9Pwl4W9npsnWrmcmw7WDJPoc/xOv1PzFeEJMo0UFlcMlk
	 2KE86XN/aXRdZGjimht9NepETbTbQhyKXclOOirQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C41FF80259;
	Wed,  6 May 2020 22:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D126AF80258; Wed,  6 May 2020 22:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D219F80234
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D219F80234
IronPort-SDR: zVdqxuihfxONEHjZBpS5iYTb44oTpqK/iN+TS3PsC2OftRgi44FZG0w79dvSr0+pDMseRq9Szu
 8xpWUaWp4sAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:57:09 -0700
IronPort-SDR: uty1ST4zNZQFaeuFnYMEOUO1DmhzEwcsWD3OTc6vihtXMjh/wabD1eDWP1LFoZ3Jh5yshb7S7g
 BbOAvBYbkdpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249878486"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 13:57:09 -0700
Subject: Re: [PATCH] ASoC: Intel: Skylake: Update description for HDaudio
 kconfig
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200506205224.7577-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <41c6fa62-d489-32ba-5575-6fc4548ebf18@linux.intel.com>
Date: Wed, 6 May 2020 15:57:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506205224.7577-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com
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



On 5/6/20 3:52 PM, Cezary Rojewski wrote:
> With 'ASoC: Intel: Skylake: Fix HDaudio and Dmic' series applied,
> warning is no longer true. Remove it and update the description.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/Kconfig | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index c8de0bb5bed9..4d11f4f3f7e2 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -209,12 +209,8 @@ config SND_SOC_INTEL_SKYLAKE_SSP_CLK
>   config SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
>   	bool "HDAudio codec support"
>   	help
> -	  This option broke audio on Linus' Skylake laptop in December 2018
> -	  and the race conditions during the probe were not fixed since.
> -	  This option is DEPRECATED, all HDaudio codec support needs
> -	  to be handled by the SOF driver.
> -	  Distributions should not enable this option and there are no known
> -	  users of this capability.
> +	  If you have Intel Skylake or Kabylake with HDaudio codec

I would have added HDaudio codec + dmic but that's good enough, the 
selection based on DMIC presence will be done by your other patch so

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Cezary.


> +	  then enable this option by saying Y or m.
>   
>   config SND_SOC_INTEL_SKYLAKE_COMMON
>   	tristate
> 
