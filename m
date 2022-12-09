Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161776485F9
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 16:53:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A8419A0;
	Fri,  9 Dec 2022 16:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A8419A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670601220;
	bh=LaYjN6d7ULt99N+hp7NlDcDCUD1oPX2+XJgA2FoWXVc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uHbU6lbxooXcYBuCp/918Z77dHjKZWwdTLzCf8OSmMdansyoMT59Y5WsshKb3CZQ+
	 BrkGSZx06V3fonF4Pl6I+dkFQZAN7gVMl83Um1fkitBJIHVv2cvRcC6Ml6VApnkQQ3
	 FDZs+TWmYSS/f3RfL161MFB06q2psAcQdwHe8BZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 473B6F800F8;
	Fri,  9 Dec 2022 16:52:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7584F8022D; Fri,  9 Dec 2022 16:52:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF4B1F800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 16:52:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF4B1F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ABDGUwUu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670601160; x=1702137160;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LaYjN6d7ULt99N+hp7NlDcDCUD1oPX2+XJgA2FoWXVc=;
 b=ABDGUwUuTtzBWOXBMw92Il8hXHGBkr9mTmHkrbyoTQ95Ba7SPis0pqNs
 dI1Lrgcn6qOr42Lg0sDOJE0ivyps6MRIRNtRPcgZkLtC0bzUPxtRzVphA
 PH4H5E1dyzT6KsJmCEZGL/iqfyT9k2+5Ta4fkSeBBqt29P5I05tSrjNUz
 oJemE6fn8rzImCRSe9iOOahp/KHIwg4l+FyArKV01AzXrhPa5oCjIJNRD
 188ebOggzzwMCC192pIesVpHxqDIZstu2SqOdQlEBj+A68voe2WurGrhR
 vfL9XMlnXM6uwmSuw0RYFy/rdY/81ez3oWAzie6tcw4glhx3tDiUpjv0f w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="297837823"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="297837823"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:52:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="754072080"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="754072080"
Received: from bdmeredi-mobl2.amr.corp.intel.com (HELO [10.212.15.195])
 ([10.212.15.195])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:52:32 -0800
Message-ID: <eca17001-93ff-d379-1ab2-2927f1831e78@linux.intel.com>
Date: Fri, 9 Dec 2022 09:52:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1] ASoC: Intel: sof_nau8825: add support for nau8825 with
 amp nau8318
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221209150503.11875-1-ajye_huang@compal.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221209150503.11875-1-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/9/22 09:05, Ajye Huang wrote:
> This patch adds the driver data for two nau8318 speaker amplifiers on
> SSP1 and nau8825 on SSP0 for ADL platform.
> And reusing max98360's topology since DAI setting could be leveraged.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  sound/soc/intel/boards/Kconfig                |  1 +
>  sound/soc/intel/boards/sof_nau8825.c          | 23 +++++++++++++++++++
>  .../intel/common/soc-acpi-intel-adl-match.c   | 12 ++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index a472de1909f4..3f68e9edd853 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -554,6 +554,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
>  	select SND_SOC_RT1015P
>  	select SND_SOC_MAX98373_I2C
>  	select SND_SOC_MAX98357A
> +	select SND_SOC_NAU8315

This looks inconsistent with the commit message. There are separate
Kconfigs for different codecs.

SND_SOC_NAU8315
SND_SOC_NAU8825

Which is it?

>  	select SND_SOC_DMIC
>  	select SND_SOC_HDAC_HDMI
>  	select SND_SOC_INTEL_HDA_DSP_COMMON
> diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
> index 27880224359d..0936450be153 100644
> --- a/sound/soc/intel/boards/sof_nau8825.c
> +++ b/sound/soc/intel/boards/sof_nau8825.c
> @@ -48,6 +48,7 @@
>  #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
>  #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
>  #define SOF_RT1015P_SPEAKER_AMP_PRESENT	BIT(17)
> +#define SOF_NAU8318_SPEAKER_AMP_PRESENT	BIT(18)
>  
>  static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
>  
> @@ -338,6 +339,13 @@ static struct snd_soc_dai_link_component rt1019p_component[] = {
>  	}
>  };
>  
> +static struct snd_soc_dai_link_component nau8318_components[] = {
> +	{
> +		.name = "NVTN2012:00",

Deep sigh...

This ACPI HID is already used to match with the 8815, so this is not
going to work if we confuse two independent drivers...

sound/soc/codecs/nau8315.c:

#ifdef CONFIG_ACPI
static const struct acpi_device_id nau8315_acpi_match[] = {
	{ "NVTN2010", 0 },
	{ "NVTN2012", 0},
	{},
};
MODULE_DEVICE_TABLE(acpi, nau8315_acpi_match);
#endif

How does this identify a NAU8825?


> +		.dai_name = "nau8315-hifi",

and again this makes a reference to 8815.

I will stop the review here.

NAK for this v1. Please clarify which codec you are using and make sure
all references are consistent.


> +	}
> +};
> +
>  static struct snd_soc_dai_link_component dummy_component[] = {
>  	{
>  		.name = "snd-soc-dummy",
> @@ -486,6 +494,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  			max_98360a_dai_link(&links[id]);
>  		} else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
>  			sof_rt1015p_dai_link(&links[id]);
> +		} else if (sof_nau8825_quirk &
> +				SOF_NAU8318_SPEAKER_AMP_PRESENT) {
> +			links[id].codecs = nau8318_components;
> +			links[id].num_codecs = ARRAY_SIZE(nau8318_components);
> +			links[id].init = speaker_codec_init;
>  		} else {
>  			goto devm_err;
>  		}
> @@ -657,6 +670,16 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_BT_OFFLOAD_SSP(2) |
>  					SOF_SSP_BT_OFFLOAD_PRESENT),
>  	},
> +	{
> +		.name = "adl_nau8318_nau8825",
> +		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_NAU8318_SPEAKER_AMP_PRESENT |
> +					SOF_NAU8825_SSP_AMP(1) |
> +					SOF_NAU8825_NUM_HDMIDEV(4) |
> +					SOF_BT_OFFLOAD_SSP(2) |
> +					SOF_SSP_BT_OFFLOAD_PRESENT),
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index 60aee56f94bd..282b9c966ce6 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -450,6 +450,11 @@ static const struct snd_soc_acpi_codecs adl_lt6911_hdmi = {
>  	.codecs = {"INTC10B0"}
>  };
>  
> +static const struct snd_soc_acpi_codecs adl_nau8318_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"NVTN2012"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	{
>  		.comp_ids = &adl_rt5682_rt5682s_hp,
> @@ -507,6 +512,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  		.quirk_data = &adl_rt1015p_amp,
>  		.sof_tplg_filename = "sof-adl-rt1015-nau8825.tplg",
>  	},
> +	{
> +		.id = "10508825",
> +		.drv_name = "adl_nau8318_nau8825",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_nau8318_amp,
> +		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
> +	},
>  	{
>  		.id = "10508825",
>  		.drv_name = "sof_nau8825",
