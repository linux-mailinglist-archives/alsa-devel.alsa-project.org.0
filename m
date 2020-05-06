Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BFD1C7B3D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F26017B3;
	Wed,  6 May 2020 22:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F26017B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588796909;
	bh=RLtNWl9rGxpS6fNk7D8O5ehYBtsLCZiH95D9sftnr+s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WS2l5vEJhZB5s5Bf4dOv2sVLcjog++fLTm1QXIzyU1IKhy+ZBKaepDvEA4fyNb5hm
	 lg5qrYtZu0OM7/XKc8AIn1XPWXy8+H0wxv4X8t3Wqo6VlQMaGH/ihjQo8DpbU44ulN
	 o3e3RD/bt2QHVLiwBiV+YaqozvRXzlSaU2z3U2yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D8DF800DF;
	Wed,  6 May 2020 22:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEF6F80249; Wed,  6 May 2020 22:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F28D4F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F28D4F800AD
IronPort-SDR: 0vG9CXKER3K1vs+P3DRxXWfASNzAPEB2eEkkxb8sPl8xkfReSGkiwNR3gYT6z1NR926Z8T7e4T
 67wFjSepy4Cg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:26:25 -0700
IronPort-SDR: DFJdsV8G1lbHY5MZ6DK9eh5lrDZurqKd089p4/KQoRQCDFc02mX72h8Otc7v3u7qkp1BuOv1o8
 4ZiYcblfWq3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249867371"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 13:26:24 -0700
Subject: Re: [PATCH] ALSA: hda: Allow SST driver on SKL and KBL platforms with
 DMIC
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200506201656.18299-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <697b0a05-1827-c62d-bf41-0bf02f93a405@linux.intel.com>
Date: Wed, 6 May 2020 15:26:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506201656.18299-1-cezary.rojewski@intel.com>
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



On 5/6/20 3:16 PM, Cezary Rojewski wrote:
> Update intel-dspcfg with FLAG_SST_ONLY_IF_DMIC option and use it for
> Skylake and Kabylake platforms when DMIC is present.

Sounds good Cezary but your changes will not apply on Takashi's for-5.8 
tree, they will have a minor conflict with my SoundWire changes 
submitted in early April.

++<<<<<<< HEAD
  +#define FLAG_SST                      BIT(0)
  +#define FLAG_SOF                      BIT(1)
  +#define FLAG_SOF_ONLY_IF_DMIC         BIT(16)
  +#define FLAG_SOF_ONLY_IF_SOUNDWIRE    BIT(17)
  +
  +#define FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE (FLAG_SOF_ONLY_IF_DMIC | \
  +                                          FLAG_SOF_ONLY_IF_SOUNDWIRE)
++=======
+ #define FLAG_SST              BIT(0)
+ #define FLAG_SOF              BIT(1)
+ #define FLAG_SST_ONLY_IF_DMIC BIT(15)
+ #define FLAG_SOF_ONLY_IF_DMIC BIT(16)
++>>>>>>> ALSA: hda: Allow SST driver on SKL and KBL platforms with DMIC


> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/hda/intel-dsp-config.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index be1df80ed013..41c271d646bf 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -16,6 +16,7 @@ MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=lega
>   
>   #define FLAG_SST		BIT(0)
>   #define FLAG_SOF		BIT(1)
> +#define FLAG_SST_ONLY_IF_DMIC	BIT(15)
>   #define FLAG_SOF_ONLY_IF_DMIC	BIT(16)
>   
>   struct config_entry {
> @@ -100,6 +101,10 @@ static const struct config_entry config_table[] = {
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
> @@ -116,6 +121,10 @@ static const struct config_entry config_table[] = {
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
> @@ -346,8 +355,17 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>   		}
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
