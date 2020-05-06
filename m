Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A871C7B7B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A7017BB;
	Wed,  6 May 2020 22:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A7017BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588798084;
	bh=qOB0Ij/iVc1zrPHZyN2aLlxctzzydmTCdxbv0yd5rbY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d3g5kgdHCyFrHC+fCNdXsnuSeFkEDjcgCflir9nv/nOy1m8axhVd+bGNlV/YToufz
	 tsZspUAp02rCFHThVC99eIioSnJXCdBT7JDW1MDGtAIr1HcpZ54wYIE8tuUmgTk6UE
	 hot9dEIbjZmlp2VufLSpBIjtXxE1JQdVFIyV+nKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03845F80253;
	Wed,  6 May 2020 22:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE41F80249; Wed,  6 May 2020 22:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5567EF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5567EF800DF
IronPort-SDR: 1EH/H2MaLrboiGxCoKU6a6gwrHWddDUDtGYOziJp4E089R2qRM7uSjioFM8d6L9fNkXiYfLSu8
 NFYVIvobCYBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:45:59 -0700
IronPort-SDR: tl2uY1Xb9rkKQRK01A+6yR9OWpUeoj0TmjGAM3KiGAYec/16ShnkePZN0aQVw7xda9UswoHTRL
 vni1tFlh1YRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249872347"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 13:45:58 -0700
Subject: Re: [PATCH v2] ALSA: hda: Allow SST driver on SKL and KBL platforms
 with DMIC
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200506203951.6369-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6e6bdf3d-f058-50ae-c6fa-d0d0144312aa@linux.intel.com>
Date: Wed, 6 May 2020 15:45:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506203951.6369-1-cezary.rojewski@intel.com>
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



On 5/6/20 3:39 PM, Cezary Rojewski wrote:
> Update intel-dspcfg with FLAG_SST_ONLY_IF_DMIC option and use it for
> Skylake and Kabylake platforms when DMIC is present.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Cezary.

> ---
> 
> Changes in v2:
> - no functional changes, just rebased to fix conflicts
> 
>   sound/hda/intel-dsp-config.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 1c1fdab2a55f..20b8f6cb3ff8 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -19,6 +19,7 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
>   
>   #define FLAG_SST			BIT(0)
>   #define FLAG_SOF			BIT(1)
> +#define FLAG_SST_ONLY_IF_DMIC		BIT(15)
>   #define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
>   #define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
>   
> @@ -107,6 +108,10 @@ static const struct config_entry config_table[] = {
>   			{}
>   		}
>   	},
> +	{
> +		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
> +		.device = 0x9d70,
> +	},
>   #endif
>   /* Kabylake-LP */
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
> @@ -123,6 +128,10 @@ static const struct config_entry config_table[] = {
>   			{}
>   		}
>   	},
> +	{
> +		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
> +		.device = 0x9d71,
> +	},
>   #endif
>   
>   /*
> @@ -410,8 +419,17 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>   			return SND_INTEL_DSP_DRIVER_SOF;
>   	}
>   
> -	if (cfg->flags & FLAG_SST)
> -		return SND_INTEL_DSP_DRIVER_SST;
> +
> +	if (cfg->flags & FLAG_SST) {
> +		if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
> +			if (snd_intel_dsp_check_dmic(pci)) {
> +				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SST driver\n");
> +				return SND_INTEL_DSP_DRIVER_SST;
> +			}
> +		} else {
> +			return SND_INTEL_DSP_DRIVER_SST;
> +		}
> +	}
>   
>   	return SND_INTEL_DSP_DRIVER_LEGACY;
>   }
> 
