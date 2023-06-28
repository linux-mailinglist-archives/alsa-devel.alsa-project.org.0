Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB1741412
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 16:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1362822;
	Wed, 28 Jun 2023 16:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1362822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687963708;
	bh=rtGlV6TiHru15yGIIxQm3Jfi0dIBkNUCTwGVyxrpVgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HH9BiDXKV5HnxzRXjcqs8Oa9LRIkk2XpvTxnc0OOqjN8wY6TcfrK/jdeEXW310XB+
	 wbfz/h7oZlHhWOA7iTuv4LU/GrUHeqMac2C0vlIH51oNf8mlUviau4Qs84rBrv/g48
	 Ghu5xUzEDXu5/CoiFkW0ZhhoCoV+Enzle1BltAa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67AD4F8053B; Wed, 28 Jun 2023 16:47:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C604F80212;
	Wed, 28 Jun 2023 16:47:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459ACF80246; Wed, 28 Jun 2023 16:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABF3BF80212
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 16:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABF3BF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=As2m7GP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687963643; x=1719499643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rtGlV6TiHru15yGIIxQm3Jfi0dIBkNUCTwGVyxrpVgY=;
  b=As2m7GP3N1NPM07PJSJqpqtxg0zo7kx22TsWYm+eOq76w+JhsEiPrIqo
   3TRbpQ93hN9ua+8zFYh2+Ubn6h6Ax2NF3QnZE59yYpg9cHyOIREVdUoYU
   ZjzH+GsCVCiE/H3ErXnflT+WIRJXzCTORKuoSe/5Pjhj32nWj54mLWajE
   tiemwQRsYpyIsxbeYV7IK3cu1ZltKsBC7yMlBNyufqmSgNkfMSE5Yt+06
   NqD/2kOUtOiNJaUDQJArEBha4KPjDpyn50BOBRAXAsIl9SRuoaclsj0zb
   H/zc6kx9KvzMt8AWu029/k667MZqaznK48VtjAGNAaTt8DfpCW7oVilSq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="361906359"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="361906359"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830148071"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="830148071"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2023 07:47:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWRq-000cs2-1A;
	Wed, 28 Jun 2023 17:47:10 +0300
Date: Wed, 28 Jun 2023 17:47:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 3/8] ALSA: hda: Update PCI ID list
Message-ID: <ZJxH7lcU4tSzCjb1@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-4-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-4-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 7LXN4XENWOMHZEWOIERFKRSSYDPHI7IF
X-Message-ID-Hash: 7LXN4XENWOMHZEWOIERFKRSSYDPHI7IF
X-MailFrom: andriy.shevchenko@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LXN4XENWOMHZEWOIERFKRSSYDPHI7IF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:30PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_VDEVICE macro, to simplify declarations. This allows to change magic
> number PCI vendor IDs to macro ones for all vendors. For Intel devices
> use device IDs macros where defined.

...

>  					((pci)->device == 0x490d) || \
>  					((pci)->device == 0x4f90) || \
>  					((pci)->device == 0x4f91) || \
>  					((pci)->device == 0x4f92)))

Why are not these be added in the header as well for the sake of consistency?

...

>  	/* CPT */
> -	{ PCI_DEVICE(0x8086, 0x1c20),
> +	{ PCI_VDEVICE(INTEL, 0x1c20),
>  	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },

With the first patch seems all of these (x86) can be converted
to use PCI_DEVICE_DATA().

-- 
With Best Regards,
Andy Shevchenko


