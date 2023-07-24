Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC075F56B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 13:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 011FB868;
	Mon, 24 Jul 2023 13:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 011FB868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690199292;
	bh=VOs3zQoPAAHTESws9SXZpe783/xBPR/wE76kHJu8Rmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uMgdNgwxEk35t3eKDaTaB8jrj1YEj5eAlQVKpZJXtjJAwxQkRW9xngSGG9J1+DTkh
	 DoQLSRtPZoOzRQtbCvVr7Jz+zo9jhOz356c0c/1v3I/sGYFxkwdVjaDDWvJwa27kcg
	 yBEHjlDrYn/ZVDoR7rXWVvhovWRSPDnPROe7iR/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11F34F80567; Mon, 24 Jul 2023 13:46:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F670F80570;
	Mon, 24 Jul 2023 13:46:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FEFBF80552; Mon, 24 Jul 2023 13:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C7F8F800C7;
	Mon, 24 Jul 2023 13:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C7F8F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dl9wb98U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690199186; x=1721735186;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VOs3zQoPAAHTESws9SXZpe783/xBPR/wE76kHJu8Rmg=;
  b=dl9wb98UXnMNrwKAPM8jqaXw1qY7CZ5coua2WYRxFb01f6rwhvsp+GR8
   /M6Xrt9cShXoWMH6zpCZZ/3/41+NGytvejEC78+2mXUi0ee0nukPHpcWX
   wa0RZK88FISJZrOCkSYnWaaFIqfKyFEv6s2HvQcAaNm1lg+N8O4REg3Wc
   CEEL6B9GmZ9BqLpNpIO1/pjqOnW99M6c/9lTw+hZBuGavQKnp6siD0jRn
   hFPSS1/ItZ4+AKDpPD/18tAbcpQ32GJTi2ed4VdwbZN7j+r9uFs6SmSsc
   RxeH87n1+B+mhr7A5la0qfd3lb1I16EGaWzGPBb0sFqf2Sslcap1o0Y+L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398322231"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="398322231"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="760761962"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="760761962"
Received: from sosterlu-mobl.ger.corp.intel.com (HELO [10.249.37.56])
 ([10.249.37.56])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:46:20 -0700
Message-ID: <a895de13-5320-953b-3d1c-34cee259d1d2@linux.intel.com>
Date: Mon, 24 Jul 2023 12:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 7/9] ALSA: hda/intel: Move snd_hdac_i915_init to before
 probe_work.
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
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-8-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230719164141.228073-8-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: US7OW6IGTCA2QMHVMHV2NQCXLZ43OM3N
X-Message-ID-Hash: US7OW6IGTCA2QMHVMHV2NQCXLZ43OM3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/US7OW6IGTCA2QMHVMHV2NQCXLZ43OM3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/19/23 18:41, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue.
> 
> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> probe function.
> 
> Changes since v1:
> - Use dev_err_probe()
> - Don't move probed_devs bitmap unnecessarily. (tiwai)
> - Move snd_hdac_i915_init slightly upward, to ensure
>   it's always initialised before vga-switcheroo is called.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c | 59 ++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 29 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 11cf9907f039f..e3128d7d742e7 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2147,6 +2147,36 @@ static int azx_probe(struct pci_dev *pci,
>  
>  	pci_set_drvdata(pci, card);
>  
> +#ifdef CONFIG_SND_HDA_I915
> +	/* bind with i915 if needed */
> +	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
> +		err = snd_hdac_i915_init(azx_bus(chip), false);
> +		if (err < 0) {
> +			/* if the controller is bound only with HDMI/DP
> +			 * (for HSW and BDW), we need to abort the probe;
> +			 * for other chips, still continue probing as other
> +			 * codecs can be on the same link.
> +			 */
> +			if (CONTROLLER_IN_GPU(pci)) {
> +				dev_err_probe(card->dev, err,
> +					     "HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
> +
> +				goto out_free;
> +			} else {
> +				/* don't bother any longer */
> +				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
> +			}
> +		}
> +
> +		/* HSW/BDW controllers need this power */
> +		if (CONTROLLER_IN_GPU(pci))
> +			hda->need_i915_power = true;
> +	}
> +#else
> +	if (CONTROLLER_IN_GPU(pci))
> +		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
> +#endif

Is it intentional that the display_power() is left in the probe workqueue?

this piece of code follows the stuff above in the existing code?

/* Request display power well for the HDA controller or codec. For
 * Haswell/Broadwell, both the display HDA controller and codec need
 * this power. For other platforms, like Baytrail/Braswell, only the
 * display codec needs the power and it can be released after probe.
 */
display_power(chip, true);



> +
>  	err = register_vga_switcheroo(chip);
>  	if (err < 0) {
>  		dev_err(card->dev, "Error registering vga_switcheroo client\n");
> @@ -2174,11 +2204,6 @@ static int azx_probe(struct pci_dev *pci,
>  	}
>  #endif /* CONFIG_SND_HDA_PATCH_LOADER */
>  
> -#ifndef CONFIG_SND_HDA_I915
> -	if (CONTROLLER_IN_GPU(pci))
> -		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
> -#endif
> -
>  	if (schedule_probe)
>  		schedule_delayed_work(&hda->probe_work, 0);
>  
> @@ -2275,30 +2300,6 @@ static int azx_probe_continue(struct azx *chip)
>  	to_hda_bus(bus)->bus_probing = 1;
>  	hda->probe_continued = 1;
>  
> -	/* bind with i915 if needed */
> -	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
> -		err = snd_hdac_i915_init(bus, true);
> -		if (err < 0) {
> -			/* if the controller is bound only with HDMI/DP
> -			 * (for HSW and BDW), we need to abort the probe;
> -			 * for other chips, still continue probing as other
> -			 * codecs can be on the same link.
> -			 */
> -			if (CONTROLLER_IN_GPU(pci)) {
> -				dev_err(chip->card->dev,
> -					"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
> -				goto out_free;
> -			} else {
> -				/* don't bother any longer */
> -				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
> -			}
> -		}
> -
> -		/* HSW/BDW controllers need this power */
> -		if (CONTROLLER_IN_GPU(pci))
> -			hda->need_i915_power = true;
> -	}
> -
>  	/* Request display power well for the HDA controller or codec. For
>  	 * Haswell/Broadwell, both the display HDA controller and codec need
>  	 * this power. For other platforms, like Baytrail/Braswell, only the
