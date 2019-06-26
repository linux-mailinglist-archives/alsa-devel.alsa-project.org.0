Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61A57349
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 23:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8418A16BB;
	Wed, 26 Jun 2019 23:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8418A16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561583113;
	bh=YiZCIKZg1fLP6liHVNXk3+kePbCvgnhfgy5+t1KDvBU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZeS7eJX8RrMUQ7DHgNYYnPjbp8sxeIwLtmeuNttKwrmTzXlFrAS4izX2++zpHcpA
	 YjTiJqsLRaPrXXQCwBnGEcJ8qtYSE3uKAHvgSRqC5myBDEyMY1yoHl1cRlot0FZaUr
	 5Wyk+Ebll/TM/lJ3BaifCJCvHe55VNaJHX2peT8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E903F896B9;
	Wed, 26 Jun 2019 23:03:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBE8F896B9; Wed, 26 Jun 2019 23:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AE45F8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 23:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE45F8070C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 14:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="183260291"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.194])
 ([10.252.15.194])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2019 14:03:15 -0700
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20190626202229.16312-1-ranjani.sridharan@linux.intel.com>
 <20190626202229.16312-3-ranjani.sridharan@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <388c2dce-a235-c592-b88e-0f6deca76220@intel.com>
Date: Wed, 26 Jun 2019 23:03:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626202229.16312-3-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: hda: Enable jack
 detection in sof hda driver
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

On 2019-06-26 22:22, Ranjani Sridharan wrote:
> From: Rander Wang <rander.wang@linux.intel.com>
> 
> In commit 7d4f606c50ff ("ALSA: hda - WAKEEN feature enabling for
> runtime pm"), legacy HD-A driver sets hda controller in reset mode after
> entering runtime-suspend. And when resuming from suspend mode, it checks
> hda controller & codec status to detect headphone hotplug event. Now
> this patch does the same job in SOF runtime pm functions.
> 
> And we need to check all the non-hdmi codecs for some cases like playback
> with HDMI or capture with DMIC connected to dsp. In these cases, only
> controller is active and codecs are suspended, so codecs can't send
> unsolicited event to controller. The jack polling operation will activate
> codecs and unsolicited event can work even codecs become suspended later.
> 
> Tested on whiskylake with hda codecs.
> 
> Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>   sound/soc/sof/intel/hda-codec.c | 45 +++++++++++++++++++++++++++++++--
>   sound/soc/sof/intel/hda-dsp.c   | 29 ++++++++++++++++-----
>   sound/soc/sof/intel/hda.h       |  4 +++
>   3 files changed, 70 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> index b8b37f082309..c711792534da 100644
> --- a/sound/soc/sof/intel/hda-codec.c
> +++ b/sound/soc/sof/intel/hda-codec.c
> @@ -10,6 +10,7 @@
>   
>   #include <linux/module.h>
>   #include <sound/hdaudio_ext.h>
> +#include <sound/hda_register.h>
>   #include <sound/hda_codec.h>
>   #include <sound/hda_i915.h>
>   #include <sound/sof.h>
> @@ -37,16 +38,55 @@ static void hda_codec_load_module(struct hda_codec *codec)
>   static void hda_codec_load_module(struct hda_codec *codec) {}
>   #endif
>   
> +/* check jack status after resuming from suspend mode */
> +void hda_codec_jack_check(struct snd_sof_dev *sdev, int status)
> +{
> +	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
> +	struct hda_bus *hbus = sof_to_hbus(sdev);
> +	struct hdac_bus *bus = sof_to_bus(sdev);
> +	struct hda_codec *codec;
> +	int mask;
> +
> +	/*
> +	 * there are two reasons for runtime resume
> +	 * (1) waken up by interrupt triggered by WAKEEN feature
> +	 * (2) waken up by pm get functions for some audio operations
> +	 * For case (1), the bits in status mean which codec triggers
> +	 * the interrupt and jacks will be checked on these codecs.
> +	 * For case (2), we need to check all the non-hdmi codecs for some
> +	 * cases like playback with HDMI or capture with DMIC. In these
> +	 * cases, only controller is active and codecs are suspended, so
> +	 * codecs can't send unsolicited event to controller. The jack polling
> +	 * operation will activate codecs and unsolicited event can work
> +	 * even codecs become suspended later.
> +	 */

This block is huge. I'd suggest entering some whitespaces to make it 
more readable.

On the second thought, I bet this stuff is not SOF specific and if so, 
being more strict may prove more informative than being so explicit - 
reference to HDA spec/ kernel HDA documentation etc.

> +	mask = status ? status : hda->hda_codec_mask;
> +
> +	list_for_each_codec(codec, hbus)
> +		if (mask & BIT(codec->core.addr))
> +			schedule_delayed_work(&codec->jackpoll_work,
> +					      codec->jackpoll_interval);
> +
> +	/* disable controller Wake Up event*/
> +	snd_hdac_chip_writew(bus, WAKEEN,
> +			     snd_hdac_chip_readw(bus, WAKEEN) &
> +			     ~hda->hda_codec_mask);

Any reason for not using snd_hdac_chip_updatew?

> +}
> +#else
> +void hda_codec_jack_check(struct snd_sof_dev *sdev, int status) {}
>   #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
> +EXPORT_SYMBOL(hda_codec_jack_check);
>   
>   /* probe individual codec */
>   static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
>   {
> -	struct hda_bus *hbus = sof_to_hbus(sdev);
> -	struct hdac_device *hdev;
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
> +	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
>   	struct hdac_hda_priv *hda_priv;
>   #endif
> +	struct hda_bus *hbus = sof_to_hbus(sdev);
> +	struct hdac_device *hdev;
> +
>   	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
>   		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
>   	u32 resp = -1;
> @@ -77,6 +117,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
>   	/* use legacy bus only for HDA codecs, idisp uses ext bus */
>   	if ((resp & 0xFFFF0000) != IDISP_VID_INTEL) {
>   		hdev->type = HDA_DEV_LEGACY;
> +		hda->hda_codec_mask |= BIT(address);
>   		hda_codec_load_module(&hda_priv->codec);
>   	}
>   
> diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
> index 481cfa0b225e..f8ed8a4a60b7 100644
> --- a/sound/soc/sof/intel/hda-dsp.c
> +++ b/sound/soc/sof/intel/hda-dsp.c
> @@ -282,7 +282,8 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
>   			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
>   }
>   
> -static int hda_suspend(struct snd_sof_dev *sdev, int state)
> +static int hda_suspend(struct snd_sof_dev *sdev, int state,
> +		       bool runtime_suspend)
>   {
>   	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
>   	const struct sof_intel_dsp_desc *chip = hda->desc;
> @@ -295,6 +296,12 @@ static int hda_suspend(struct snd_sof_dev *sdev, int state)
>   	hda_dsp_ipc_int_disable(sdev);
>   
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> +	if (IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && runtime_suspend)
> +		/* enable controller wake up event */
> +		snd_hdac_chip_writew(bus, WAKEEN,
> +				     snd_hdac_chip_readw(bus, WAKEEN) |
> +				     hda->hda_codec_mask);

Same here.

> +
>   	/* power down all hda link */
>   	snd_hdac_ext_bus_link_power_down_all(bus);
>   #endif
> @@ -329,11 +336,12 @@ static int hda_suspend(struct snd_sof_dev *sdev, int state)
>   	return 0;
>   }
>   
> -static int hda_resume(struct snd_sof_dev *sdev)
> +static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
>   {
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>   	struct hdac_bus *bus = sof_to_bus(sdev);
>   	struct hdac_ext_link *hlink = NULL;
> +	int status;
>   #endif
>   	int ret;
>   
> @@ -344,6 +352,11 @@ static int hda_resume(struct snd_sof_dev *sdev)
>   	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
>   
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> +	if (runtime_resume) {
> +		/* read STATESTS before controller reset */
> +		status = snd_hdac_chip_readw(bus, STATESTS);
> +	}
> +
>   	/* reset and start hda controller */
>   	ret = hda_dsp_ctrl_init_chip(sdev, true);
>   	if (ret < 0) {
> @@ -360,6 +373,10 @@ static int hda_resume(struct snd_sof_dev *sdev)
>   
>   	hda_dsp_ctrl_misc_clock_gating(sdev, true);
>   
> +	/* check jack status based on controller status */
> +	if (runtime_resume)
> +		hda_codec_jack_check(sdev, status);
> +
>   	/* turn off the links that were off before suspend */
>   	list_for_each_entry(hlink, &bus->hlink_list, list) {
>   		if (!hlink->ref_count)
> @@ -407,19 +424,19 @@ static int hda_resume(struct snd_sof_dev *sdev)
>   int hda_dsp_resume(struct snd_sof_dev *sdev)
>   {
>   	/* init hda controller. DSP cores will be powered up during fw boot */
> -	return hda_resume(sdev);
> +	return hda_resume(sdev, false);
>   }
>   
>   int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
>   {
>   	/* init hda controller. DSP cores will be powered up during fw boot */
> -	return hda_resume(sdev);
> +	return hda_resume(sdev, true);
>   }
>   
>   int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state)
>   {
>   	/* stop hda controller and power dsp off */
> -	return hda_suspend(sdev, state);
> +	return hda_suspend(sdev, state, true);
>   }
>   
>   int hda_dsp_suspend(struct snd_sof_dev *sdev, int state)
> @@ -428,7 +445,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, int state)
>   	int ret;
>   
>   	/* stop hda controller and power dsp off */
> -	ret = hda_suspend(sdev, state);
> +	ret = hda_suspend(sdev, state, false);
>   	if (ret < 0) {
>   		dev_err(bus->dev, "error: suspending dsp\n");
>   		return ret;
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 73d7cc08afc2..dd476d3a745d 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -398,6 +398,9 @@ struct sof_intel_hda_dev {
>   
>   	/* DMIC device */
>   	struct platform_device *dmic_dev;
> +
> +	/* hda codec mask excluding hdmi */
> +	u32 hda_codec_mask;
>   };
>   
>   static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
> @@ -556,6 +559,7 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
>    * HDA Codec operations.
>    */
>   int hda_codec_probe_bus(struct snd_sof_dev *sdev);
> +void hda_codec_jack_check(struct snd_sof_dev *sdev, int status);
>   
>   #endif /* CONFIG_SND_SOC_SOF_HDA */
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
