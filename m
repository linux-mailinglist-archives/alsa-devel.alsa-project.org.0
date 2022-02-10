Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5330B4B1680
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 20:44:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BA01A42;
	Thu, 10 Feb 2022 20:43:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BA01A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644522254;
	bh=IgqIVUUl3uKvybKq1cbFOOuSdgfk8V/aX9Hq3xShYWc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIbNMHiiZ9/FchVblr+1+PLbP3nwXm8TgpFvPRLUu2F3QQTX0Y58zFUOrg/1WnARD
	 P2jON8Gs1iGUc98LcUHJQBz2v8rWGpJBAcb+3txmo6tc2a713gfs7OovGv0wje9nIq
	 UFWQlDjcJ9eU1eLD/vyF8TBelpqhcgtf+Euobb88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45F06F80302;
	Thu, 10 Feb 2022 20:43:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 617DCF8028B; Thu, 10 Feb 2022 20:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DFD3F8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 20:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DFD3F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b7gPAW2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644522179; x=1676058179;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IgqIVUUl3uKvybKq1cbFOOuSdgfk8V/aX9Hq3xShYWc=;
 b=b7gPAW2aM3OW2LluU+T7OyYMEjNviYzMHMcfPiuVpPl6HZ5iv5E5kfpO
 +3jYycwyqL/pLrac8QzwUVm8qNg+FArD7i0cwEJDyHAx2LeR/zygZT6/9
 sd3K4evVuCwnKEsH5E6EzjwIjuH9Ch0BEuyhE0i58263HWjU7zrMW7tG8
 gsC3LIVgipVpD0/7OzTHBDxe98XHY2iZKwcKYh/KaxljD1WmvsohDNJh4
 JQ4y7NIFgFRnPJ/BuqTEZpsT0zkAMP+djwngqMe6iRL6MKkN+AuP02psc
 K1uA9vstlwqtiQu/noAH6UeH2yKI1DEf7m8BfFlRKindTRlrlO+p7iiht Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="236980628"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="236980628"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 11:42:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="773988509"
Received: from wlincolx-mobl.amr.corp.intel.com (HELO [10.212.86.106])
 ([10.212.86.106])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 11:42:53 -0800
Message-ID: <d08ca581-94fc-e98f-5829-48e560b65c9f@linux.intel.com>
Date: Thu, 10 Feb 2022 13:42:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ALSA: hda: Add PCI and HDMI IDs for Intel Raptor Lake
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20220210185423.3671603-1-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220210185423.3671603-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 2/10/22 12:54, Kai Vehmanen wrote:
> Add a set of HD Audio PCI IDs, and the HDMI codec VID, for
> Intel Raptor Lake.
> 
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

I independently verified the PCI IDs below, LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/pci/hda/hda_intel.c  | 11 +++++++++++
>  sound/pci/hda/patch_hdmi.c |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index a2922233e85f..a3c4d6e293e1 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2510,6 +2510,17 @@ static const struct pci_device_id azx_ids[] = {
>  	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
>  	{ PCI_DEVICE(0x8086, 0x4b58),
>  	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
> +	/* Raptor Lake */
> +	{ PCI_DEVICE(0x8086, 0x7a50),
> +	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
> +	{ PCI_DEVICE(0x8086, 0x51ca),
> +	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
> +	{ PCI_DEVICE(0x8086, 0x51cb),
> +	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
> +	{ PCI_DEVICE(0x8086, 0x51ce),
> +	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
> +	{ PCI_DEVICE(0x8086, 0x51cf),
> +	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
>  	/* Broxton-P(Apollolake) */
>  	{ PCI_DEVICE(0x8086, 0x5a98),
>  	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 92df4f243ec6..64fe025fda86 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -4390,6 +4390,7 @@ HDA_CODEC_ENTRY(0x80862812, "Tigerlake HDMI",	patch_i915_tgl_hdmi),
>  HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
>  HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
>  HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
> +HDA_CODEC_ENTRY(0x80862818, "Raptorlake HDMI",	patch_i915_tgl_hdmi),
>  HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_tgl_hdmi),
>  HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
>  HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
> 
> base-commit: 44cb545b0c2afe21b38044b3595a2579f3a8d7b2
