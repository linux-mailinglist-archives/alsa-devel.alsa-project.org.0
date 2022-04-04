Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F24F3689
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 16:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC9A186E;
	Tue,  5 Apr 2022 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC9A186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649167606;
	bh=RykHeuHfrYKWlYaQCFedGFkCWMVDu/x+vCVK9n5m7R8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aoyZSKURxyV9Co2KaXq7F4A3BFVh0ZiNaaLMgeAlEjp/BRbbJ5C/7sjWw1KsXFrvI
	 s3tiY4LrPk4AVtOH7QyweJH3qKi2cRrg3Zc/HffsWOYOlqO5AD68BQTEK/JGLKEeuD
	 DBu8pnpkTClhpHr3Hqgraj09jbXvujCcrfecMSyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF3A6F8014B;
	Tue,  5 Apr 2022 16:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9B3FF8016B; Tue,  5 Apr 2022 16:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7FADF800D2;
 Tue,  5 Apr 2022 16:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7FADF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mR9/Teoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649167542; x=1680703542;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RykHeuHfrYKWlYaQCFedGFkCWMVDu/x+vCVK9n5m7R8=;
 b=mR9/TeoodxZ0DDr1KsHycGl7Yv+7uvc/bmHrF8bsOQrF+VA9NYhLM9zN
 P3ezNTXDm+ZXIQY2TjcSOfZj7HRv1y4Nd3VmhPFH/0nZM1BBJfuPv27oG
 b7e4xxsGro7gXcnXAF1pqsju9R+4Xa2Z5QXQIUN6A9BNwkVC38dpJsyN0
 a0kWlbc8uI+ilqREUvuUCAlaAl3wZ/PWc399vEAVDpuqDDFnNL1Pmz1/q
 ADBxaCK70RP1GIKZS9L2xMegE/cJ3rSp3eXSZQVDZgetsF+suG/qL3t3R
 NmfGJGNdEQUeD4hVakJ9VPWUiNOrOon4zCTVnZNEb8p/Qfv14D+1uLc3Y g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="347196771"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="347196771"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:05:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="651903446"
Received: from ctveazey-mobl2.amr.corp.intel.com (HELO [10.255.230.126])
 ([10.255.230.126])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:05:32 -0700
Message-ID: <a312c7ea-9ae3-689d-5a23-4d16400bbbf1@linux.intel.com>
Date: Mon, 4 Apr 2022 10:58:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp on SSP2
Content-Language: en-US
To: Ajye Huang <ajye.huang@gmail.com>, linux-kernel@vger.kernel.org
References: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 sound-open-firmware@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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



On 3/24/22 03:47, Ajye Huang wrote:
> Follow Intel's design to replace max98360a amp SSP2 reather than SSP1
> by judging DMI_OEM_STRING in sof_rt5682_quirk_table struct.
> And reusing max98357's topology since DAI setting could be leveraged.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/sof_rt5682.c | 13 +++++++++++++
>   sound/soc/sof/sof-pci-dev.c         |  9 ++++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index ebec4d15edaa..7126fcb63d90 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -212,6 +212,19 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
>   					SOF_SSP_BT_OFFLOAD_PRESENT),
>   
>   	},
> +	{
> +		.callback = sof_rt5682_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> +			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S_AMP_SSP2"),
> +		},
> +		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(2) |
> +					SOF_RT5682_NUM_HDMIDEV(4)),
> +	},
>   	{}
>   };
>   
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index 4c9596742844..12f5cff22448 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -83,7 +83,14 @@ static const struct dmi_system_id sof_tplg_table[] = {
>   		},
>   		.driver_data = "sof-adl-max98357a-rt5682-2way.tplg",
>   	},
> -
> +	{
> +		.callback = sof_tplg_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> +			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S_AMP_SSP2"),
> +		},
> +		.driver_data = "sof-adl-max98357a-rt5682.tplg",
> +	},
>   	{}
>   };
>   
