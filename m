Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A441C7B4D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 894FA17B4;
	Wed,  6 May 2020 22:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 894FA17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588797160;
	bh=Jf9BzoKcc9ZbNmBeSisNBaoNFxCNsS6TltttqRpL32Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APtQ1KCAw1k+rMap4LLBN0YX/0TlnjWMxkgFaKEdDnGXQj785eIm8RWd0hZGZjCX5
	 voZZnp0dJ4QKghoElkajbaJZ3+D/tDobDbZiSo7N4O0hjMkZbECXxIJfh9qhUcCaU6
	 uwwk99YoiTrgq7szmLHNLeYsJTqjNnvvKbzqfn6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9892EF800AD;
	Wed,  6 May 2020 22:30:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEE6EF80249; Wed,  6 May 2020 22:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ED7CF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ED7CF800DF
IronPort-SDR: Z6Eth5wy3gUEC/kOkAVEijNEyxjpPj7Uu8H2TCBY9IbL4QTH0gbIuraFiCwZ+2GOGlRYu1edLu
 kthUpdJaqRlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:30:25 -0700
IronPort-SDR: 6x/2fODcDBWMbUUvv1H5JPzcMNBbGbmu6R9SKAHDExhbbdilf6lxnBTBFqj1gzr/yb5ocRpiqN
 r6NtTzAYhxmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249868632"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 13:30:24 -0700
Subject: Re: [PATCH] Revert "ASoC: Intel: Skylake: mark HDAudio codec support
 as deprecated."
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200506195509.22307-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3fe9ac1d-177c-8b99-a44a-1b6ccb1e2325@linux.intel.com>
Date: Wed, 6 May 2020 15:30:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506195509.22307-1-cezary.rojewski@intel.com>
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



On 5/6/20 2:55 PM, Cezary Rojewski wrote:
> This reverts commit 02701b909c2fab4b49f9c9545ab921c9b2c7a768.
> 
> With 'ASoC: Intel: Skylake: Fix HDaudio and Dmic' series applied,
> warning is no longer true. Remove it.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/Kconfig | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index c8de0bb5bed9..d6c5c68b7499 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -209,12 +209,9 @@ config SND_SOC_INTEL_SKYLAKE_SSP_CLK
>   config SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
>   	bool "HDAudio codec support"
>   	help
> -	  This option broke audio on Linus' Skylake laptop in December 2018
> -	  and the race conditions during the probe were not fixed since.
> -	  This option is DEPRECATED, all HDaudio codec support needs
> -	  to be handled by the SOF driver.
> -	  Distributions should not enable this option and there are no known
> -	  users of this capability.
> +	  If you have a Intel Skylake/Broxton/ApolloLake/KabyLake/
> +	  GeminiLake or CannonLake platform with an HDaudio codec
> +	  then enable this option by saying Y

Yes we need to change the help text now that the issues were fixed and 
UCM/topology are available, but I would be more comfortable if the text 
was aligned with your patch "[PATCH] ALSA: hda: Allow SST driver on SKL 
and KBL platforms with DMIC"

e.g. If you have a Intel Skylake or KabyLake plaforms with an HDaudio 
codec+DMIC configuration then enable this option by saying Y
