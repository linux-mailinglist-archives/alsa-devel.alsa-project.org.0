Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F3552172
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD81D299B;
	Mon, 20 Jun 2022 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD81D299B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739865;
	bh=EMOuOEfCcU+Ho0tlWOZcXnemNUKrZe14CdFUL5FRGUo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XofYQUo7niBKkUw4rBC1k8zZ60SSlDzu9GZzapJK+WyXHlPNy49tWisIanbIn2qL6
	 vH15Iup0uMq472UJkNfftRKVHmYDIVlAv7qEUPevlfXYPL+wdbEDr8d1UXg/Dgzmo4
	 hiDRgbkkHacK2Fm6etBsUN4Q46J6O5oJ1MrKIq4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E633DF80552;
	Mon, 20 Jun 2022 17:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A769F8053A; Mon, 20 Jun 2022 17:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D477F804DA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 17:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D477F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NfgDjImp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655739710; x=1687275710;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=EMOuOEfCcU+Ho0tlWOZcXnemNUKrZe14CdFUL5FRGUo=;
 b=NfgDjImper5lPWyoYbYv1qx4N1N6T1+wneKWAUjrwlwuq7rNANONpHPk
 wkqRewvn80i91JeS/sQQeib4ZSAfC7PZ6MDv90QPbV4g7x/Z8SA+zJoyK
 XILfv37bV0kXzROpIr+P8ODBPC94qCbDreHQpjQhKlo+5eWAsZaAMxWCS
 UvWJoegrVcMAL0tWbIBBhpI2GMViTRgEwn88QPtJbTt45DFmKuFSiMegd
 W61AC3MPjx2C6oTYuBoderEOBLWVE82dKsu9l/GnfSLyMRREUuRpYyQCQ
 NCn1XTqqC750uRdpxGwPEW67l9wnjF8WNS1+i0DhnlfvtgWA/k+5FwheJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="341607998"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="341607998"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:41:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="676586072"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:41:45 -0700
Date: Mon, 20 Jun 2022 18:31:09 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HDMI probe regression on IVB (and older?)
In-Reply-To: <87r13jpec5.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2206201821290.1532214@eliteleevi.tm.intel.com>
References: <87bkunztec.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2206201141320.1532214@eliteleevi.tm.intel.com>
 <87r13jpec5.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Mon, 20 Jun 2022, Takashi Iwai wrote:

> So this looks like a bug due to the use of pci_get_class().
> Since there is no pci_get_base_class(), we likely need to open-code
> the search, e.g. something like below.

yes, this indeed seems to be the case.

> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 3f35972e1cf7..161a9711cd63 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -119,21 +119,18 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
[...]
> -	do {
> -		display_dev = pci_get_class(class, display_dev);
> -
> -		if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
> +	for_each_pci_dev(display_dev) {
> +		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
> +		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
>  		    connectivity_check(display_dev, hdac_pci)) {
>  			pci_dev_put(display_dev);
> -			match = true;
> +			return true;
>  		}
> -	} while (!match && display_dev);
> +	}

To open code a bit less, I was first thinking:

--cut--
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -124,9 +124,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
        bool match = false;
 
        do {
-               display_dev = pci_get_class(class, display_dev);
+               display_dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_ANY_ID, display_dev);
 
-               if (display_dev && display_dev->vendor == PCI_VENDOR_ID_INTEL &&
+               if (display_dev && (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
                    connectivity_check(display_dev, hdac_pci)) {
--cut--

But it's a marginal difference, so for your version:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
