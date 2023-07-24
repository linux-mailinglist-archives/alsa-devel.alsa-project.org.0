Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FF75F56E
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 13:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5322E204;
	Mon, 24 Jul 2023 13:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5322E204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690199333;
	bh=PxaN+6W271Cyw9sPYyy9VqsWusr4rxCuxxEhtCzeMqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aihJc1RkGDd7GD26s5xhTs7lNEVm1QTC6cvfBeQ1N2MUP40p92YKRYNjD293R5ORm
	 Tz9LOp1sYzaKJVMBAVsalekzHHXRL4RBEiOLuIAxU/T0JtCiep8Tpa2cIjO5u3/n1I
	 cw4Fe1XqkkfyZDYeLU9LH2ocEh8nbc77W4d5iDYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2EFFF805C1; Mon, 24 Jul 2023 13:46:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A44F805B5;
	Mon, 24 Jul 2023 13:46:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E8B6F805BB; Mon, 24 Jul 2023 13:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4192DF80544;
	Mon, 24 Jul 2023 13:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4192DF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kaoO14+i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690199192; x=1721735192;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PxaN+6W271Cyw9sPYyy9VqsWusr4rxCuxxEhtCzeMqo=;
  b=kaoO14+ib6pcMltBCsYPhsghdmBn45X2v9yE9pH3UqBY7/HC3Hjhouw0
   jJZk6x0MvxWEiLKW2AQxADbAzjMdFIA482A2KOE1nTnTMBi6/CxmC49F0
   EQHaYsZemQoLcpE3hW2ZquIXogYtKSMlkCksxs0m70Zfp6lOZ/zm4lV3u
   d4bNqryRvtbujPHWWH+VVsJPIZks1xpFkF1LJTVpV/YJAjyQGx2t5zHGt
   DnEMVwiHdtFskB3smhevr61RKs+ZBl5aGgMHW+Bm/86TWc5kqh/gQHGuR
   b0yvArob8k0jQ5xlzJV3t1wC2e2KcCwK8G1vIXPyPLdvpYpoXWsgmkgId
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398322253"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="398322253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="760761966"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="760761966"
Received: from sosterlu-mobl.ger.corp.intel.com (HELO [10.249.37.56])
 ([10.249.37.56])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:46:25 -0700
Message-ID: <03d5abcd-53a6-bf61-227e-d608c5fbfe70@linux.intel.com>
Date: Mon, 24 Jul 2023 13:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 8/9] ASoC: SOF: Intel: Remove deferred probe for SOF
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-9-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230719164141.228073-9-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y4R7E3KEQIPAF2TJDRNQLXQ45BYWQ4Q2
X-Message-ID-Hash: Y4R7E3KEQIPAF2TJDRNQLXQ45BYWQ4Q2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4R7E3KEQIPAF2TJDRNQLXQ45BYWQ4Q2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/19/23 18:41, Maarten Lankhorst wrote:
> This was only used to allow modprobing i915, by converting to the
> -EPROBE_DEFER mechanism, it can be completely removed, and is in
> fact counterproductive since -EPROBE_DEFER otherwise won't be
> handled correctly.

I personally remember only that the request_module("i915") was the main
motivation for the use of the workqueue, but when it comes to the
HDaudio codec management we don't even know what we don't know.

I am a bit worried that the snd-hda-intel driver keeps the workqueue for
HDaudio codec initialization, and this patch removes the workqueue
completely for SOF. That doesn't seem right. Either both drivers need a
workqueue or none need a workqueue.

Maybe what we need is to move the i915/xe initialization out of the
workqueue, and see in a second pass if that workqueue can be safely
removed from the SOF driver?


> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/sof/Kconfig           | 19 -----------------
>  sound/soc/sof/core.c            | 38 ++-------------------------------
>  sound/soc/sof/intel/Kconfig     |  1 -
>  sound/soc/sof/intel/hda-codec.c |  2 +-
>  sound/soc/sof/intel/hda.c       | 32 ++++++++++++++++-----------
>  sound/soc/sof/sof-pci-dev.c     |  3 +--
>  sound/soc/sof/sof-priv.h        |  5 -----
>  7 files changed, 23 insertions(+), 77 deletions(-)
> 
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 80361139a49ad..8ee39e5558062 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -82,17 +82,6 @@ config SND_SOC_SOF_DEVELOPER_SUPPORT
>  
>  if SND_SOC_SOF_DEVELOPER_SUPPORT
>  
> -config SND_SOC_SOF_FORCE_PROBE_WORKQUEUE
> -	bool "SOF force probe workqueue"
> -	select SND_SOC_SOF_PROBE_WORK_QUEUE
> -	help
> -	  This option forces the use of a probe workqueue, which is only used
> -	  when HDaudio is enabled due to module dependencies. Forcing this
> -	  option is intended for debug only, but this should not add any
> -	  functional issues in nominal cases.
> -	  Say Y if you are involved in SOF development and need this option.
> -	  If not, select N.
> -
>  config SND_SOC_SOF_NOCODEC
>  	tristate
>  
> @@ -271,14 +260,6 @@ config SND_SOC_SOF
>  	  module dependencies but since the module or built-in type is decided
>  	  at the top level it doesn't matter.
>  
> -config SND_SOC_SOF_PROBE_WORK_QUEUE
> -	bool
> -	help
> -	  This option is not user-selectable but automagically handled by
> -	  'select' statements at a higher level.
> -	  When selected, the probe is handled in two steps, for example to
> -	  avoid lockdeps if request_module is used in the probe.
> -
>  # Supported IPC versions
>  config SND_SOC_SOF_IPC3
>  	bool
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 30db685cc5f4b..cdf86dc4a8a87 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -191,7 +191,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>  	/* probe the DSP hardware */
>  	ret = snd_sof_probe(sdev);
>  	if (ret < 0) {
> -		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
>  		goto probe_err;
>  	}
>  
> @@ -309,8 +310,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>  	if (plat_data->sof_probe_complete)
>  		plat_data->sof_probe_complete(sdev->dev);
>  
> -	sdev->probe_completed = true;
> -
>  	return 0;
>  
>  sof_machine_err:
> @@ -336,19 +335,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>  	return ret;
>  }
>  
> -static void sof_probe_work(struct work_struct *work)
> -{
> -	struct snd_sof_dev *sdev =
> -		container_of(work, struct snd_sof_dev, probe_work);
> -	int ret;
> -
> -	ret = sof_probe_continue(sdev);
> -	if (ret < 0) {
> -		/* errors cannot be propagated, log */
> -		dev_err(sdev->dev, "error: %s failed err: %d\n", __func__, ret);
> -	}
> -}
> -
>  int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
>  {
>  	struct snd_sof_dev *sdev;
> @@ -436,33 +422,16 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
>  
>  	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
>  
> -	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
> -		INIT_WORK(&sdev->probe_work, sof_probe_work);
> -		schedule_work(&sdev->probe_work);
> -		return 0;
> -	}
> -
>  	return sof_probe_continue(sdev);
>  }
>  EXPORT_SYMBOL(snd_sof_device_probe);
>  
> -bool snd_sof_device_probe_completed(struct device *dev)
> -{
> -	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> -
> -	return sdev->probe_completed;
> -}
> -EXPORT_SYMBOL(snd_sof_device_probe_completed);
> -
>  int snd_sof_device_remove(struct device *dev)
>  {
>  	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
>  	struct snd_sof_pdata *pdata = sdev->pdata;
>  	int ret;
>  
> -	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
> -		cancel_work_sync(&sdev->probe_work);
> -
>  	/*
>  	 * Unregister any registered client device first before IPC and debugfs
>  	 * to allow client drivers to be removed cleanly
> @@ -501,9 +470,6 @@ int snd_sof_device_shutdown(struct device *dev)
>  {
>  	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
>  
> -	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
> -		cancel_work_sync(&sdev->probe_work);
> -
>  	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
>  		sof_fw_trace_free(sdev);
>  		return snd_sof_shutdown(sdev);
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 69c1a370d3b61..d9e87a91670a3 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -293,7 +293,6 @@ config SND_SOC_SOF_HDA_LINK
>  config SND_SOC_SOF_HDA_AUDIO_CODEC
>  	bool "SOF support for HDAudio codecs"
>  	depends on SND_SOC_SOF_HDA_LINK
> -	select SND_SOC_SOF_PROBE_WORK_QUEUE
>  	help
>  	  This adds support for HDAudio codecs with Sound Open Firmware
>  	  for Intel(R) platforms.
> diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> index f1fd5b44aaac9..344b61576c0e3 100644
> --- a/sound/soc/sof/intel/hda-codec.c
> +++ b/sound/soc/sof/intel/hda-codec.c
> @@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
>  		return 0;
>  
>  	/* i915 exposes a HDA codec for HDMI audio */
> -	ret = snd_hdac_i915_init(bus, true);
> +	ret = snd_hdac_i915_init(bus, false);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 64bebe1a72bbc..a8b7a68142c05 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -801,8 +801,11 @@ static int hda_init(struct snd_sof_dev *sdev)
>  
>  	/* init i915 and HDMI codecs */
>  	ret = hda_codec_i915_init(sdev);
> -	if (ret < 0)
> -		dev_warn(sdev->dev, "init of i915 and HDMI codec failed\n");
> +	if (ret < 0) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_warn(sdev->dev, "init of i915 and HDMI codec failed: %i\n", ret);
> +		return ret;
> +	}
>  
>  	/* get controller capabilities */
>  	ret = hda_dsp_ctrl_get_caps(sdev);
> @@ -1115,14 +1118,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  	sdev->pdata->hw_pdata = hdev;
>  	hdev->desc = chip;
>  
> -	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
> -						       PLATFORM_DEVID_NONE,
> -						       NULL, 0);
> -	if (IS_ERR(hdev->dmic_dev)) {
> -		dev_err(sdev->dev, "error: failed to create DMIC device\n");
> -		return PTR_ERR(hdev->dmic_dev);
> -	}
> -
>  	/*
>  	 * use position update IPC if either it is forced
>  	 * or we don't have other choice
> @@ -1142,6 +1137,15 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  	if (ret < 0)
>  		goto hdac_bus_unmap;
>  
> +	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
> +						       PLATFORM_DEVID_NONE,
> +						       NULL, 0);
> +	if (IS_ERR(hdev->dmic_dev)) {
> +		dev_err(sdev->dev, "error: failed to create DMIC device\n");
> +		ret = PTR_ERR(hdev->dmic_dev);
> +		goto hdac_exit;
> +	}
> +

I am not following why we have to move dmic-related code, can we try to
move this in a separate patch?

>  	if (sdev->dspless_mode_selected)
>  		goto skip_dsp_setup;
>  
> @@ -1150,7 +1154,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  	if (!sdev->bar[HDA_DSP_BAR]) {
>  		dev_err(sdev->dev, "error: ioremap error\n");
>  		ret = -ENXIO;
> -		goto hdac_bus_unmap;
> +		goto platform_unreg;
>  	}
>  
>  	sdev->mmio_bar = HDA_DSP_BAR;
> @@ -1248,10 +1252,12 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  /* dsp_unmap: not currently used */
>  	if (!sdev->dspless_mode_selected)
>  		iounmap(sdev->bar[HDA_DSP_BAR]);
> -hdac_bus_unmap:
> +platform_unreg:
>  	platform_device_unregister(hdev->dmic_dev);
> -	iounmap(bus->remap_addr);
> +hdac_exit:
>  	hda_codec_i915_exit(sdev);
> +hdac_bus_unmap:
> +	iounmap(bus->remap_addr);
>  err:
>  	return ret;
>  }
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index f5ece43d0ec24..0fa424613082e 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -339,8 +339,7 @@ void sof_pci_remove(struct pci_dev *pci)
>  	snd_sof_device_remove(&pci->dev);
>  
>  	/* follow recommendation in pci-driver.c to increment usage counter */
> -	if (snd_sof_device_probe_completed(&pci->dev) &&
> -	    !(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
> +	if (!(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
>  		pm_runtime_get_noresume(&pci->dev);
>  
>  	/* release pci regions and disable device */
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index d4f6702e93dcb..71db636cfdccc 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -564,10 +564,6 @@ struct snd_sof_dev {
>  	enum sof_fw_state fw_state;
>  	bool first_boot;
>  
> -	/* work queue in case the probe is implemented in two steps */
> -	struct work_struct probe_work;
> -	bool probe_completed;
> -
>  	/* DSP HW differentiation */
>  	struct snd_sof_pdata *pdata;
>  
> @@ -675,7 +671,6 @@ struct snd_sof_dev {
>  int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data);
>  int snd_sof_device_remove(struct device *dev);
>  int snd_sof_device_shutdown(struct device *dev);
> -bool snd_sof_device_probe_completed(struct device *dev);
>  
>  int snd_sof_runtime_suspend(struct device *dev);
>  int snd_sof_runtime_resume(struct device *dev);
