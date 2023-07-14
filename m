Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A939B753969
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE5EA4C;
	Fri, 14 Jul 2023 13:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE5EA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689333587;
	bh=0ubeB2ewfY7fKKoRvOlcQcyx4Sk1yqmWwpc7WYBL0gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iq2kqN6irX2/yU7k2mECNGE/hPgKed/oyDUP4VnQDPaeJ2qcPGeUerFU2wokdhWm/
	 7BJGlffsDCYRFQ9/PLJglHt4c2wRPaDaNGlrsl9KIGQ8ilSlfAnzZVtwl3j//6T1+Q
	 8SIR8/n18/114wKjU9bt/8IQLuwgRLDQECXOnEeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E835F80236; Fri, 14 Jul 2023 13:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABEE2F80236;
	Fri, 14 Jul 2023 13:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECD07F80249; Fri, 14 Jul 2023 13:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49E6AF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E6AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kanXUbIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689333531; x=1720869531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0ubeB2ewfY7fKKoRvOlcQcyx4Sk1yqmWwpc7WYBL0gY=;
  b=kanXUbIseAcH5ZoyF/dKAsdz7LPnu/hrHFr5mQeWnZq4CXcx6WAv1Zy6
   KfYwnThGz3Dn2USVu90ya1uuD9z1nm1MRhEnWF7gpQliAG3VttohJifO9
   WSt9+QVA/y1fN+c04zN8tD4cE4T0oNA25Vg9yzgwRcB0Xn3FE7FsppF8G
   E92atUXiEVKC7CeLAt+eaZxQRzUiJiCAgolTouvl5Bxv2ND3xnjL73ska
   3LKvUdNL3fDd60RiTpn+A6uCx91ICwy9BJBSODjCPzNCNgu1gh0qyz/uW
   MXEEFKAUr5VQ+BbptQ8wB8ntrjzAObtlP4GXDNhwF+/aNi4efq6d6U8Jm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396261231"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="396261231"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="835997944"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="835997944"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 04:18:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qKGoe-002dwB-1k;
	Fri, 14 Jul 2023 14:18:28 +0300
Date: Fri, 14 Jul 2023 14:18:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 04/15] ALSA: Remove unused Broxton PCI ID
Message-ID: <ZLEvBIFM9p/1u9Pv@smile.fi.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-5-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714185615.370597-5-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: AQEOBQEW2VVU3TOIGWGITZZ4IPVRIAVW
X-Message-ID-Hash: AQEOBQEW2VVU3TOIGWGITZZ4IPVRIAVW
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQEOBQEW2VVU3TOIGWGITZZ4IPVRIAVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 08:56:04PM +0200, Amadeusz Sławiński wrote:
> Current code references 0x1a98 which is BXT-M (not -T as it is
> commented) and it's an RVP, BXT-M B0 to be specific. From what we know
> no BXT is available on market.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index ef831770ca7d..8f0cebb83302 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2564,9 +2564,6 @@ static const struct pci_device_id azx_ids[] = {
>  	/* Broxton-P(Apollolake) */
>  	{ PCI_DEVICE(0x8086, 0x5a98),
>  	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
> -	/* Broxton-T */
> -	{ PCI_DEVICE(0x8086, 0x1a98),
> -	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
>  	/* Gemini-Lake */
>  	{ PCI_DEVICE(0x8086, 0x3198),
>  	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


