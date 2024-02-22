Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D985FF44
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 18:25:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 459D5832;
	Thu, 22 Feb 2024 18:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 459D5832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708622701;
	bh=O3uHuGWYyUwgjvH7biobNF6h6KtGzRh7j+XvF7DazPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HUINOHo5bZAyiwdgja2gkz0RYBWJgQ1bLWXVpV9bbIcgBvfYz6GnU6aW4cn5rWby3
	 lpzBVqPPTVg8MrWxyDZLCCEBxT8RZ4a00/OoFJ2I4tgYG4x7j04Uwz2NdRzB2Ylhrg
	 6Citlww4sFCWcR+btaQenCdJ8q1LgN68EYbVo1VE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F466F805A1; Thu, 22 Feb 2024 18:24:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73150F805A0;
	Thu, 22 Feb 2024 18:24:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0B07F80496; Thu, 22 Feb 2024 18:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 883E7F8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 18:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 883E7F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KR25VoXh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708622657; x=1740158657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O3uHuGWYyUwgjvH7biobNF6h6KtGzRh7j+XvF7DazPI=;
  b=KR25VoXhyfrTHBit1UZ+y0DzpITjOmOzF6XHWFbpXcWjbOZxldoOklv5
   ZcGz1asaWQprukAOp5Dxo+GcCaQN6CNfApXGFPvf0SUUl+xwua/ANZ2aE
   dUy8JyoshFAczFjpOjSqa/ea94rWDOCtrK5wIWHaNejy1IyEspNqjy1Ly
   lJDIDMMKdIHQPqqO7UUGOJqaPr3ADhkX6TK6YGpy0OJsNG1DoArRfS7Zy
   LG6k/UPqbqf6piBQ5V+ii7M7561fkpElLcw/6FO2JBdqeiMINOB+A064z
   e+zkxSRtkXjyMAKqo+l4kPasILLVz3oZ04Hxp1aemmQpc6dJv5zQ/uFAV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14286949"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="14286949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827577568"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="827577568"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 22 Feb 2024 09:24:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Feb 2024 19:24:05 +0200
Date: Thu, 22 Feb 2024 19:24:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based
 platforms
Message-ID: <ZdeDNT5jCgXAP16Z@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
 <20240222170614.884413-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222170614.884413-2-cezary.rojewski@intel.com>
X-Patchwork-Hint: comment
Message-ID-Hash: S5DYFYNZM5UH7K65GHZJT4LOPFG5RPBO
X-Message-ID-Hash: S5DYFYNZM5UH7K65GHZJT4LOPFG5RPBO
X-MailFrom: ville.syrjala@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5DYFYNZM5UH7K65GHZJT4LOPFG5RPBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 22, 2024 at 06:06:11PM +0100, Cezary Rojewski wrote:
> Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
> removed support for i915 for all CNL-based platforms. HDAudio library,
> however, still treats such platforms as valid candidates for i915
> binding. Update query mechanism to reflect changes made in drm tree.
> 
> At the same time, i915 support for LKF-based platforms has not been
> provided so remove them from valid binding candidates.
> 
> Link: https://lore.kernel.org/all/20210728215946.1573015-1-lucas.demarchi@intel.com/
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/drm/i915_pciids.h |  4 ++++
>  sound/hda/hdac_i915.c     | 18 +++++++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index fcf1849aa47c..04172b541ee7 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -582,6 +582,10 @@
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info)
>  
> +/* LKF */
> +#define INTEL_LKF_IDS(info) \
> +	INTEL_VGA_DEVICE(0x9840, info)
> +
>  /* EHL */
>  #define INTEL_EHL_IDS(info) \
>  	INTEL_VGA_DEVICE(0x4541, info), \
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 365c36fdf205..07861f9fc491 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -6,6 +6,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <drm/i915_pciids.h>
>  #include <sound/core.h>
>  #include <sound/hdaudio.h>
>  #include <sound/hda_i915.h>
> @@ -127,15 +128,26 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>  /* check whether Intel graphics is present and reachable */
>  static int i915_gfx_present(struct pci_dev *hdac_pci)
>  {
> +	/* List of known platforms with no i915 support. */
> +	static struct pci_device_id denylist[] = {
> +		INTEL_CNL_IDS(NULL),
> +		INTEL_LKF_IDS(NULL),
> +		{ 0 }
> +	};

I thought these don't actually exist in the wild?

>  	struct pci_dev *display_dev = NULL;
>  
>  	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
>  		return false;
>  
>  	for_each_pci_dev(display_dev) {
> -		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
> -		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
> -		    connectivity_check(display_dev, hdac_pci)) {
> +		if (display_dev->vendor != PCI_VENDOR_ID_INTEL ||
> +		    (display_dev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
> +			continue;
> +
> +		if (pci_match_id(denylist, display_dev))
> +			continue;
> +
> +		if (connectivity_check(display_dev, hdac_pci)) {
>  			pci_dev_put(display_dev);
>  			return true;
>  		}
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
