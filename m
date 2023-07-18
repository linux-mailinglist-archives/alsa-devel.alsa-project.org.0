Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F275833D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 19:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE571E9;
	Tue, 18 Jul 2023 19:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE571E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689700154;
	bh=LowChJyNpWySLgzTtjQDu+vchcaLd6zgP20alhFs/kY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hFaHvDAanwwZAVUn2UVEEtx0jqRe2gxVxP3Ra174ST2tK/xa3AWVGgqR06dDkGGYX
	 xG7IbTMQPxY0cW6J9pvr6au+1Y9yICLJvDR9GU1sjwMnquovqpoFfcKBc5h3yd5AO8
	 Y8fSYKWKOhAVF04cn17Fuly0zvApPqtZrkBMAJHY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 561F1F8032D; Tue, 18 Jul 2023 19:08:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B03DCF8027B;
	Tue, 18 Jul 2023 19:08:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F89F8032D; Tue, 18 Jul 2023 19:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 306F9F80153;
	Tue, 18 Jul 2023 19:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 306F9F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HWN8FBlv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689700094; x=1721236094;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LowChJyNpWySLgzTtjQDu+vchcaLd6zgP20alhFs/kY=;
  b=HWN8FBlv9qJoApVlrxCHy2cJOlTZGMrNdD5z2FEOj35MvEChPqm8t7Qk
   A0izz7358eVO/QbgGEiD46e/rhQyXo7162BDiVUCLW323HkH+AQq9ghHr
   kFxA4L/7XMFj56WP1qFRDfbR4maa/JplwaMe3/YyV3MBFevq3wTStmCMG
   6OSGcU6D/Wre+K/uqlAvJMuoL3q+YmyDN8t7xmZde2YaOocsjOZTDxL7B
   /PKZlVVmcayQW2wQT9qPGLzolvu+e9r/pZeYnPBrNQ7HJJHga8+zppYmN
   lCd7xAT0nXUjMZJ/Fbyv6DHep+ZCY/U21tWq3VmY34Cm1l2Vwk8Jic20t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430025056"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200";
   d="scan'208";a="430025056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 10:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717674959"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200";
   d="scan'208";a="717674959"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 10:08:00 -0700
Date: Tue, 18 Jul 2023 20:04:41 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
cc: Alsa-devel <alsa-devel@alsa-project.org>,
    sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
    Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
    Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 6/7] ASoC: SOF: Intel: Remove deferred probe for SOF
In-Reply-To: <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: J2BVU5GSVHLO5URZXC5TFRDFECAVXD6J
X-Message-ID-Hash: J2BVU5GSVHLO5URZXC5TFRDFECAVXD6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2BVU5GSVHLO5URZXC5TFRDFECAVXD6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

thank you Maarten for doing the series! I think a lot of people will be 
happy to get rid of the 60sec timeout. 

I kicked off a CI run SOF public infra for the whole series at
https://github.com/thesofproject/linux/pull/4478
Some results still in progress but so far so good.

Some concerns inline:

On Tue, 18 Jul 2023, Maarten Lankhorst wrote:

> This was only used to allow modprobing i915, by converting to the
> -EPROBE_DEFER mechanism, it can be completely removed, and is in
> fact counterproductive since -EPROBE_DEFER otherwise won't be
> handled correctly.

We actually have a request_module() for the regular HDA codec drivers as 
well (sof_probe_continue() -> snd_sof_probe() -> hda_dsp_probe() -> 
hda_init_caps() -> hda_codec_probe_bus(). But right, this is not 
necessarily a problem on its own, so it looks we indeed can drop the work 
queue. Nice!

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

My only bigger concern is corner cases where the display PCI device is on 
the bus and visible to kernel, but for some reason there is no working 
driver in the system or it is disabled.

With this patch, not having a workign display driver means that there is 
also no audio in the system as the SOF driver will never get probed.

In current mainline, one will get the 60sec timeout warning and then
audio driver will proceed to probe and you'll have audio support (minus 
HDMI/DP).

This is mostly an issue with very new hardware (e.g. hw is still 
behind force_probe flag in xe/i915 driver), but we've had some odd
cases with e.g. systems with both Intel IGFX and other vendors' DGPU. 
Audio drivers see the Intel VGA controller in system and will
call snd_hdac_i915_init(), but the audio component bind will never
succeed if the the Intel IGFX is not in actual use.

Will need a bit of time to think about possible scenarios. Possibly this 
is not an issue outside early development systems. In theory if IGFX is 
disabled in BIOS, and not visible to OS, we are good, and if it's visible, 
the i915/xe driver should be loaded, so we are good again.

Br, Kai
