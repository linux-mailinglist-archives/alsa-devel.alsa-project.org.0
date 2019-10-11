Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A62D422D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 16:05:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBB7F1680;
	Fri, 11 Oct 2019 16:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBB7F1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570802754;
	bh=up6NjcOVVwA52QdH4GX8QzQ3ZmWJo7Huu88jr2LRH1w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnyTGrWIQEgxHH4gP4mwdwRpnvY/U+KYmKvNIGUySY+yKCWy6tHsm8mG7BXBKCSSA
	 r9bOQSc+IL1f9PndsOx2FQhFxHVxOQZ9dlIG9AhV7/+E4VnDz7Q0ih1DVygP+raXf/
	 EyqFlQ7B8AVE3+mJrF3AoJLp6IGys5FDkEqxWvFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BDFF8060F;
	Fri, 11 Oct 2019 16:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51DDFF80539; Fri, 11 Oct 2019 16:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E162FF80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 16:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E162FF80113
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 07:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="188326742"
Received: from hmmanuel-mobl.amr.corp.intel.com (HELO [10.254.42.220])
 ([10.254.42.220])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2019 07:02:16 -0700
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
 <20191011112745.25800-6-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cf6a8edb-689d-e068-a9c4-d728b7741fec@linux.intel.com>
Date: Fri, 11 Oct 2019 09:00:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011112745.25800-6-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Cc: libin.yang@intel.com
Subject: Re: [alsa-devel] [PATCH v6 5/9] ASoC: SOF: Intel: add support for
 snd-hda-codec-hdmi
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



On 10/11/19 6:27 AM, Kai Vehmanen wrote:
> Add support to implement HDMI/DP audio by using the common
> snd-hda-codec-hdmi driver.
> 
> Change of codec driver affects user-space as the two
> drivers expose different mixer controls. A new kernel
> module option "use_common_hdmi" is added to user-space
> to indicate which interface should be used. The default
> driver can be selected via a Kconfig option.
> 
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/soc/sof/intel/Kconfig     | 10 ++++++++++
>   sound/soc/sof/intel/hda-codec.c | 22 ++++++++++++++++++----
>   sound/soc/sof/intel/hda.c       |  6 ++++++
>   sound/soc/sof/intel/hda.h       |  6 ++++--
>   4 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 18c41fdc47c8..31d9222e45aa 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -273,6 +273,16 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
>   	  Say Y if you want to enable HDAudio codecs with SOF.
>   	  If unsure select "N".
>   
> +config SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
> +	bool "SOF common HDA HDMI codec driver"
> +	depends on SND_SOC_SOF_HDA_LINK
> +	depends on SND_HDA_CODEC_HDMI
> +	help
> +	  This adds support for HDMI audio by using the common HDA
> +	  HDMI/DisplayPort codec driver.
> +	  Say Y if you want to use the common codec driver with SOF.
> +	  If unsure select "Y".
> +
>   endif ## SND_SOC_SOF_HDA_COMMON

Kai, I get a conflict when I try to apply these patches on Mark's tree? 
You probably want to rebase?
Or was the intent to go through Takashi's tree?

diff --cc sound/soc/sof/intel/Kconfig
index d62f51d33be1,31d9222e45aa..000000000000
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@@ -273,15 -273,15 +273,27 @@@ config SND_SOC_SOF_HDA_AUDIO_CODE
           Say Y if you want to enable HDAudio codecs with SOF.
           If unsure select "N".

++<<<<<<< HEAD
  +config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
  +      bool "SOF enable DMI Link L1"
  +      help
  +        This option enables DMI L1 for both playback and capture
  +        and disables known workarounds for specific HDaudio platforms.
  +        Only use to look into power optimizations on platforms not
  +        affected by DMI L1 issues. This option is not recommended.
  +        Say Y if you want to enable DMI Link L1
  +        If unsure, select "N".
++=======
+ config SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
+       bool "SOF common HDA HDMI codec driver"
+       depends on SND_SOC_SOF_HDA_LINK
+       depends on SND_HDA_CODEC_HDMI
+       help
+         This adds support for HDMI audio by using the common HDA
+         HDMI/DisplayPort codec driver.
+         Say Y if you want to use the common codec driver with SOF.
+         If unsure select "Y".
++>>>>>>> ASoC: SOF: Intel: add support for snd-hda-codec-hdmi

   endif ## SND_SOC_SOF_HDA_COMMON
>   
>   config SND_SOC_SOF_HDA_LINK_BASELINE
> diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> index 3ca6795a89ba..9ad36e14072c 100644
> --- a/sound/soc/sof/intel/hda-codec.c
> +++ b/sound/soc/sof/intel/hda-codec.c
> @@ -84,6 +84,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
>   {
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>   	struct hdac_hda_priv *hda_priv;
> +	struct snd_soc_acpi_mach_params *mach_params = 0;
> +	struct snd_sof_pdata *pdata = sdev->pdata;
>   #endif
>   	struct hda_bus *hbus = sof_to_hbus(sdev);
>   	struct hdac_device *hdev;
> @@ -113,8 +115,19 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
>   	if (ret < 0)
>   		return ret;
>   
> -	/* use legacy bus only for HDA codecs, idisp uses ext bus */
> -	if ((resp & 0xFFFF0000) != IDISP_VID_INTEL) {
> +	if (pdata->machine)
> +		mach_params = (struct snd_soc_acpi_mach_params *)
> +			&pdata->machine->mach_params;
> +
> +	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL)
> +		hda_priv->need_display_power = true;
> +
> +	/*
> +	 * if common HDMI codec driver is not used, codec load
> +	 * is skipped here and hdac_hdmi is used instead
> +	 */
> +	if ((mach_params && mach_params->common_hdmi_codec_drv) ||
> +	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
>   		hdev->type = HDA_DEV_LEGACY;
>   		hda_codec_load_module(&hda_priv->codec);
>   	}
> @@ -155,7 +168,8 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev)
>   }
>   EXPORT_SYMBOL(hda_codec_probe_bus);
>   
> -#if IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
> +#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
> +	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
>   
>   void hda_codec_i915_get(struct snd_sof_dev *sdev)
>   {
> @@ -204,6 +218,6 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
>   }
>   EXPORT_SYMBOL(hda_codec_i915_exit);
>   
> -#endif /* CONFIG_SND_SOC_HDAC_HDMI */
> +#endif
>   
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index c72e9a09eee1..ee742157516e 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -54,6 +54,11 @@ MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
>   static int hda_dmic_num = -1;
>   module_param_named(dmic_num, hda_dmic_num, int, 0444);
>   MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
> +
> +static bool hda_codec_use_common_hdmi =
> +	IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_COMMON_HDMI_CODEC);
> +module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
> +MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
>   #endif
>   
>   static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
> @@ -458,6 +463,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
>   			&pdata->machine->mach_params;
>   		mach_params->codec_mask = bus->codec_mask;
>   		mach_params->platform = dev_name(sdev->dev);
> +		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
>   	}
>   
>   	/* create codec instances */
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 5591841a1b6f..28640a29e1b6 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -562,7 +562,9 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev);
>   
>   #endif /* CONFIG_SND_SOC_SOF_HDA */
>   
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && \
> +	(IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
> +	 IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
>   
>   void hda_codec_i915_get(struct snd_sof_dev *sdev);
>   void hda_codec_i915_put(struct snd_sof_dev *sdev);
> @@ -576,7 +578,7 @@ static inline void hda_codec_i915_put(struct snd_sof_dev *sdev)  { }
>   static inline int hda_codec_i915_init(struct snd_sof_dev *sdev) { return 0; }
>   static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
>   
> -#endif /* CONFIG_SND_SOC_SOF_HDA && CONFIG_SND_SOC_HDAC_HDMI */
> +#endif
>   
>   /*
>    * Trace Control.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
