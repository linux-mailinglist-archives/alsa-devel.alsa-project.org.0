Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F386718D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 11:41:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EF02836;
	Mon, 26 Feb 2024 11:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EF02836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708944092;
	bh=DaawKgzre8sRBX+LnD3mVhbEc25B3Gz5fzha4m6cLRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jNwFaiISakmIeDFL/HlV0aoG4oqDIhGPzCj4rZCmQdZNWHvbXQp8x/0haaahBW5YM
	 7zz8QcvJ/DIRcur8qzpAbWuhOSEIV9PxgA0PkulfytzMW3PZmKmCS8XVczsoHkScVN
	 YdYC4jZTbU1q+0M5crMDXjYNdDoW7chWj+wdJNZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FA7CF80588; Mon, 26 Feb 2024 11:40:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3CFF80580;
	Mon, 26 Feb 2024 11:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A5F0F80246; Mon, 26 Feb 2024 11:40:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 071D2F80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 11:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 071D2F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GooAhO/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708944046; x=1740480046;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=DaawKgzre8sRBX+LnD3mVhbEc25B3Gz5fzha4m6cLRg=;
  b=GooAhO/dKI2lnF5Brjml0Lv7+h3c66z5QApdVmF0DM4QD7g+FHGlr/kU
   c/0d5+GPeAavXsHouwLRsrd3Y9wwTwMZn99WbJPRafOlYAggsUUujw6fz
   2TjbzLOxLdRjkaU7zsnWYycJ5q4QV7HLMeDELAfsMchcWkTtrMP+hCB5P
   Tt0q5gdUOlfS3SX4UaLr6VCNT3Q2A/dRDAwPkfBnc1a/0e2c5ZQM5cuk4
   Xg/5wUvPSlXwGwewnU5PiN72sdpI7Iwed97eZBOtlAkzUsoQ+UhViBGsz
   AK7QmD1tOgDkrRmtqTZQxD8BGd7oy8ukSJ+IxvwK859WRQAJvrq+hZBjH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13772067"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="13772067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="11398714"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:40:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 intel-gfx@lists.freedesktop.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, Cezary Rojewski
 <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 1/4] ALSA: hda: Skip i915 initialization on
 CNL/LKF-based platforms
In-Reply-To: <20240223114626.1052784-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
 <20240223114626.1052784-2-cezary.rojewski@intel.com>
Date: Mon, 26 Feb 2024 12:40:34 +0200
Message-ID: <87plwjo6e5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: YOM74ZR7OKVQIDIVXIPZF57QQSS5HFFZ
X-Message-ID-Hash: YOM74ZR7OKVQIDIVXIPZF57QQSS5HFFZ
X-MailFrom: jani.nikula@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOM74ZR7OKVQIDIVXIPZF57QQSS5HFFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024, Cezary Rojewski <cezary.rojewski@intel.com> wrote:
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
>  sound/hda/hdac_i915.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 365c36fdf205..afee87bd0f2e 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -127,15 +127,41 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>  /* check whether Intel graphics is present and reachable */
>  static int i915_gfx_present(struct pci_dev *hdac_pci)
>  {
> +	/* List of known platforms with no i915 support. */
> +	static struct pci_device_id denylist[] = {

This should be const to place it in rodata, it doesn't need to be
mutable.

> +		/* CNL */
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), 0x030000, 0xff0000 },
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), 0x030000, 0xff0000 },
> +		/* LKF */
> +		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), 0x030000, 0xff0000 },
> +		{ 0 }

Nitpick, prefer {} over { 0 }.

BR,
Jani.

> +	};
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

-- 
Jani Nikula, Intel
