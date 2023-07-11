Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02674F100
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC41D207;
	Tue, 11 Jul 2023 16:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC41D207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084209;
	bh=akEEbdgIackI+bwcJjUC7oCu6EgQWkViNrk7VaPnBp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=APJZ++YX8a3OyhZu2ydUnVpM+0eC03TjzveTItFaN7en1RKSOXaB542wz3WoIKgfO
	 CESK3oYSGdGGI22ko1V7nCd+/njcOJVwiZH7le89EQg8YvPWYKAvJ7n+ijKEEkJSdR
	 z+7tylp4ztBXsfBKnPRLBiTXRTEOdqFsVGYFWYhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F1E2F80557; Tue, 11 Jul 2023 16:02:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 518C9F80290;
	Tue, 11 Jul 2023 16:02:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F34F80535; Tue, 11 Jul 2023 16:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5822F8024E
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5822F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ALnljULS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084154; x=1720620154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=akEEbdgIackI+bwcJjUC7oCu6EgQWkViNrk7VaPnBp4=;
  b=ALnljULSFLNJTpupXAlbVB90Avyv7sLZdQ0NaeIezvPkzHn/8SE4+FeW
   TJsW4oNcQ1WB6mBMPuIW4+Z+LVb+QOmhpAeJr5jqetrXLvxXKTLucf7NN
   CVXjIdxjsH1RcgI7xXm9hdKrm268Yh7FA/NglXkAJQnWzMTyWIA+7R3a0
   ja0AZi9bNwzmGYyiRX4TIifO4oEQf86SFOaXRAgnM3gstKywMSA0y8i+2
   H0nOG37rv+Qljh5uihmNXICx+oAjrddUBFni6gepZO/+jSKV5aKeJa1Jj
   EBYt7iBVaNK50mKbTXD5ZRP3ezOV6u8b4PuFrpZCy7JsvHQ+M1fDnusO8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344223043"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="344223043"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="671381929"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="671381929"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 11 Jul 2023 07:02:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDwf-001rsM-2M;
	Tue, 11 Jul 2023 17:02:25 +0300
Date: Tue, 11 Jul 2023 17:02:25 +0300
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
Subject: Re: [PATCH 09/13] ASoC: Intel: avs: Convert to PCI device IDs defines
Message-ID: <ZK1g8VgO8PHwbWy4@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-10-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-10-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: WAQ5IFPUJ7TL6VWBTVMO7VMBBBS2GIFY
X-Message-ID-Hash: WAQ5IFPUJ7TL6VWBTVMO7VMBBBS2GIFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAQ5IFPUJ7TL6VWBTVMO7VMBBBS2GIFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:22PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA() macro, to simplify declarations.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/intel/avs/core.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 637501850728..859b217fc761 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -745,14 +745,14 @@ static const struct avs_spec apl_desc = {
>  };
>  
>  static const struct pci_device_id avs_ids[] = {
> -	{ PCI_VDEVICE(INTEL, 0x9d70), (unsigned long)&skl_desc }, /* SKL */
> -	{ PCI_VDEVICE(INTEL, 0xa170), (unsigned long)&skl_desc }, /* SKL-H */
> -	{ PCI_VDEVICE(INTEL, 0x9d71), (unsigned long)&skl_desc }, /* KBL */
> -	{ PCI_VDEVICE(INTEL, 0xa171), (unsigned long)&skl_desc }, /* KBL-H */
> -	{ PCI_VDEVICE(INTEL, 0xa2f0), (unsigned long)&skl_desc }, /* KBL-S */
> -	{ PCI_VDEVICE(INTEL, 0xa3f0), (unsigned long)&skl_desc }, /* CML-V */
> -	{ PCI_VDEVICE(INTEL, 0x5a98), (unsigned long)&apl_desc }, /* APL */
> -	{ PCI_VDEVICE(INTEL, 0x3198), (unsigned long)&apl_desc }, /* GML */
> +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_KBL, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_H, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &apl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_GML, &apl_desc) },
>  	{ 0 }
>  };
>  MODULE_DEVICE_TABLE(pci, avs_ids);
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


