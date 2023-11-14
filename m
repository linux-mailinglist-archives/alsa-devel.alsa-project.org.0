Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F77EAE96
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 12:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4A10209;
	Tue, 14 Nov 2023 12:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4A10209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699960077;
	bh=ED4qeN413K5mMaalFzUaQpnRJCyeAIpYZxUrfnwAsNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PGYgx7f7lV+UA4tRMT7iYINwhjFXQjDcjKikTqOPl3e6uW/nyVllyQWtjwvnULz9V
	 O4NseSxAoXs67Ln/9WjAbGzZIvmoUaQprjdiR9kqiBn0jnHTMj47VtO8VixCn993Rx
	 UCetsdl7IBY3FJoFNvtbk5Y0i/Iwzv5qi4yHebNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 581EEF80093; Tue, 14 Nov 2023 12:07:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE67BF8016E;
	Tue, 14 Nov 2023 12:07:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C98F801D5; Tue, 14 Nov 2023 12:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2C11F80152
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 12:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C11F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ODIDyf+E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699960014; x=1731496014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ED4qeN413K5mMaalFzUaQpnRJCyeAIpYZxUrfnwAsNY=;
  b=ODIDyf+EmFgmAS1ZygFC04bUF/pL5olPJpZTSzxjg7MNPpwrwhjuwp2U
   kfzMwUNOqQbJV8H3b+GpUCwMvDSYZRNJG8HpAfmEyLvWBUgVJSnILEFzp
   BEf+K8DqeXRL5pIadsbwOIfvycNKlAzxBzkhDDBvWdpixJCSMBvdTCT2L
   IxZOQtjUWNuKIbSVya+T1/e8HzPJvGsrPX5P90k2di0TBOQsN9ZutRArk
   IbJO3deNoEBLstIgdaPW2eDToUYYvScjiESrgV6oRhCBMYbQGiOkcCFRg
   nZxwVnUonWTqDLqeVYfeKtIGnZ4bxWG1Y24S2g7Wusiht50H5otxjW4Hh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387796032"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200";
   d="scan'208";a="387796032"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:06:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="758142091"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200";
   d="scan'208";a="758142091"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga007.jf.intel.com with SMTP; 14 Nov 2023 03:06:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Nov 2023 13:06:45 +0200
Date: Tue, 14 Nov 2023 13:06:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: maarten.lankhorst@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move
 snd_hdac_i915_init to before probe_work.
Message-ID: <ZVNUxZzCGcxQzqJX@intel.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
X-Patchwork-Hint: comment
Message-ID-Hash: IBRZVW4HHC5VZXHVL2QSONEPICTY5H2T
X-Message-ID-Hash: IBRZVW4HHC5VZXHVL2QSONEPICTY5H2T
X-MailFrom: ville.syrjala@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBRZVW4HHC5VZXHVL2QSONEPICTY5H2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 02, 2023 at 09:38:44PM +0200, maarten.lankhorst@linux.intel.com wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue.
> 
> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> probe function.

This completely broke i915 audio!

I also can't see any trace of this stuff ever being posted to 
intel-gfx so it never went through the CI.

Please fix or revert ASAP.

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  sound/pci/hda/hda_intel.c | 54 +++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index e42ad0e816e1..9dad3607596a 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2135,6 +2135,33 @@ static int azx_probe(struct pci_dev *pci,
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
> +			if (HDA_CONTROLLER_IN_GPU(pci)) {
> +				goto out_free;
> +			} else {
> +				/* don't bother any longer */
> +				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
> +			}
> +		}
> +
> +		/* HSW/BDW controllers need this power */
> +		if (HDA_CONTROLLER_IN_GPU(pci))
> +			hda->need_i915_power = true;
> +	}
> +#else
> +	if (HDA_CONTROLLER_IN_GPU(pci))
> +		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
> +#endif
> +
>  	err = register_vga_switcheroo(chip);
>  	if (err < 0) {
>  		dev_err(card->dev, "Error registering vga_switcheroo client\n");
> @@ -2162,11 +2189,6 @@ static int azx_probe(struct pci_dev *pci,
>  	}
>  #endif /* CONFIG_SND_HDA_PATCH_LOADER */
>  
> -#ifndef CONFIG_SND_HDA_I915
> -	if (HDA_CONTROLLER_IN_GPU(pci))
> -		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
> -#endif
> -
>  	if (schedule_probe)
>  		schedule_delayed_work(&hda->probe_work, 0);
>  
> @@ -2264,28 +2286,6 @@ static int azx_probe_continue(struct azx *chip)
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
> -			if (HDA_CONTROLLER_IN_GPU(pci)) {
> -				goto out_free;
> -			} else {
> -				/* don't bother any longer */
> -				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
> -			}
> -		}
> -
> -		/* HSW/BDW controllers need this power */
> -		if (HDA_CONTROLLER_IN_GPU(pci))
> -			hda->need_i915_power = true;
> -	}
> -
>  	/* Request display power well for the HDA controller or codec. For
>  	 * Haswell/Broadwell, both the display HDA controller and codec need
>  	 * this power. For other platforms, like Baytrail/Braswell, only the
> -- 
> 2.40.1

-- 
Ville Syrjälä
Intel
