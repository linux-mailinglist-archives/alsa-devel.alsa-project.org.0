Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4678FD61
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 14:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93AA1DF3;
	Fri,  1 Sep 2023 14:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93AA1DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693571923;
	bh=MbSejPpVcn39K0suwGrMS6r7UtjeFPJhMP61frqFDgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZUyiFwJaqsVq5BIcW9n0BnzV3Z2HV+LLbWrEJlbdADacsCzXAJ4opNN3ZiaW/k/Bh
	 DLDDT6eX0Zl4g9/4hgW6y3oDddanDO9AzN9mY0Or4zsvfN10yIcoKkLRDccpntoRP0
	 Jqroy4t1DbV7mq2MarqqFoDDyWl5XCUnRusHyxHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23A82F80074; Fri,  1 Sep 2023 14:37:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23117F80074;
	Fri,  1 Sep 2023 14:37:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA85F80158; Fri,  1 Sep 2023 14:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0032EF80074;
	Fri,  1 Sep 2023 14:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0032EF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JdmiYksO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693571844; x=1725107844;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MbSejPpVcn39K0suwGrMS6r7UtjeFPJhMP61frqFDgI=;
  b=JdmiYksOT9a/UqXkDgjzKdbkFoyqqxy12Q5mubu9YZVZAtHNj9G+x2ru
   Z23KIjsueDFFhTx3PjaGd7Wg1PFWihF/5tWLMlxsd66xXTHrKhVwuynpj
   8ujAtGHWPOf0JKQ9Am01koBN4uBgPGln1Ktr4hcXJF4cXh7ET51uYA5a9
   a8Qtj7lFvC/KyGasQhGpHbrCKDfcTphLOAdp9rpC2+E5FMbjaN+VV/sUL
   xB3Zfa+RVOfGyn9ZaKZ7NDkVGUBSKmbrnjrJFyOuw2hTURGAG+WaM8U04
   MTBwOgsdOUUKi1rJMTVCAlpD+RAIaPUGxu7q/uZ0uvGIUAqPYA3KoU0ig
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375111163"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="375111163"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689752177"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="689752177"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:37:14 -0700
Date: Fri, 1 Sep 2023 15:33:19 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v4 10/11] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
In-Reply-To: <20230830153652.217855-11-maarten.lankhorst@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2309011526300.3390143@eliteleevi.tm.intel.com>
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-11-maarten.lankhorst@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4TFXD5JEXZH7CETRLBWQ2574IIFBDZ2J
X-Message-ID-Hash: 4TFXD5JEXZH7CETRLBWQ2574IIFBDZ2J
X-MailFrom: kai.vehmanen@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TFXD5JEXZH7CETRLBWQ2574IIFBDZ2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On Wed, 30 Aug 2023, Maarten Lankhorst wrote:

> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue.
> 
> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> probe function.
> 
> The previously added probe_no_wq can be used for this,
> and we also use the newly added remove_no_wq for unbinding afterwards.
[...]
> @@ -1317,7 +1313,6 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
>  {
>  	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
>  	const struct sof_intel_dsp_desc *chip = hda->desc;
> -	struct hdac_bus *bus = sof_to_bus(sdev);
>  	struct pci_dev *pci = to_pci_dev(sdev->dev);
>  	struct nhlt_acpi_table *nhlt = hda->nhlt;
>  
> @@ -1368,10 +1363,12 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
>  	if (!sdev->dspless_mode_selected)
>  		iounmap(sdev->bar[HDA_DSP_BAR]);
>  
> -	iounmap(bus->remap_addr);
> -
> -	sof_hda_bus_exit(sdev);
> +	return 0;
> +}
>  
> +int hda_dsp_remove_no_wq(struct snd_sof_dev *sdev)
> +{
> +	iounmap(sof_to_bus(sdev)->remap_addr);
>  	hda_codec_i915_exit(sdev);

I think here we drop the call to sof_hda_bus_exit() which should be done 
in hda_dsp_remove_no_wq() to counter hda_init().

Rest looks good to me, the "no_wq" variants do symmetric ops,
so we can handle both wq an non-wq cases.

Br, Kai
