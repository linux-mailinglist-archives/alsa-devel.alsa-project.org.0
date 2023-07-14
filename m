Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5075395E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:18:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B188DF5;
	Fri, 14 Jul 2023 13:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B188DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689333502;
	bh=IKXCbwiGbkt0tpSDPHxGA7mz3W/yZMiNm2D21Ue2YYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ORI75r2xHzRM13SdEiLscoyibonz997Gfr/dgTI+dMacvlHnSkpmf/M+BT8n+m8v0
	 5VqHJYbgWuAdNEXHjdkRtspnOM+i1rCHHrWabH1IDASaWlBra/kuTZLXM5wRNCxpb6
	 1Acan3VNYH2nf/2g7GeTaSKdWGj3KWLYcTP9OOL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17D11F80236; Fri, 14 Jul 2023 13:17:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C97AFF80236;
	Fri, 14 Jul 2023 13:17:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AAFCF8047D; Fri, 14 Jul 2023 13:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ED03F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ED03F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vb3u9T17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689333447; x=1720869447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IKXCbwiGbkt0tpSDPHxGA7mz3W/yZMiNm2D21Ue2YYk=;
  b=Vb3u9T17Kqdt+0WTxby24XLPrMfuEaXPqFKwOUPLdvCRVM5UIAbMlXEN
   4RaHeoLIpkGvVAagra5fcPjCDaHL8aprSOCgedOzsm5kDRPrq+4y1GRuA
   8IMMSD0R36Ga5N9MXG+NSsjDnIhtTJx8JHsigR4h04JfO3K1gbM52NsHv
   MvN4iHGjW9NMtQbbF+ntrDmIhYumaapIJFtmtYmz2dAQHBOIgcnvGE23l
   S1PwmXIGCMwYM+iscRadjbhe/jbshiwtzEisy/QF1GTQ+0KTsYX1g31Ah
   8DoZrryM3DegDxohLVi4Sbe1YTwEVpocx4O0vkTy6Z8UpN+okAF5HzcIZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431621766"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="431621766"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="896387104"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="896387104"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 04:17:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qKGnV-002duT-0n;
	Fri, 14 Jul 2023 14:17:17 +0300
Date: Fri, 14 Jul 2023 14:17:17 +0300
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
Subject: Re: [PATCH v2 03/15] ASoC: SOF: Remove unused Broxton PCI ID
Message-ID: <ZLEuvc11jUlx5Ge0@smile.fi.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-4-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714185615.370597-4-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: GIEQKMSBXWBHHNZQH6GWSMQ7ABO7XTWV
X-Message-ID-Hash: GIEQKMSBXWBHHNZQH6GWSMQ7ABO7XTWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIEQKMSBXWBHHNZQH6GWSMQ7ABO7XTWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 08:56:03PM +0200, Amadeusz Sławiński wrote:
> Current code references 0x1a98 which is BXT-M (not -T as it is
> commented) and it's an RVP, BXT-M B0 to be specific. From what we know
> no BXT is available on market.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


