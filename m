Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2D742345
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 11:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97D927F8;
	Thu, 29 Jun 2023 11:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97D927F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688031010;
	bh=AZfC0g5llZa4NrEUlDxx41BmIYHtzoyZPpjBjZ+qS+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UggXnkpm4tC9YYC86B/9wOQZuW3PrhpGw7BcsoYrQonL/2tYq1pjsTSYd1R5c1kfT
	 beuN06+Bd6V8cLjCuapBa2aNZBb/V95uowbOWd+EmmbvBA9DN54/K7bPr91yUTD4xX
	 oSBALPWqtGdXhO+Jy3DzN2Q1L7XioCO+L4R65uXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A8BF80169; Thu, 29 Jun 2023 11:29:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28940F80212;
	Thu, 29 Jun 2023 11:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 726D6F80246; Thu, 29 Jun 2023 11:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB45CF800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 11:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB45CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UShSdgDZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688030946; x=1719566946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AZfC0g5llZa4NrEUlDxx41BmIYHtzoyZPpjBjZ+qS+Y=;
  b=UShSdgDZkJQpHbPlXF2LsCpcQfIiJRG0meUtGE74y+8xQ2uLZztoDatM
   4TUZhVdURLrHH/G0ddKlFIKuoe8l2a78XHr6BOGFDIS5Nlx+7qfPjiXbJ
   x4pQ53WypjW+RIq6rTI4bqscLRjFd/e38vZvWZiAdAxC46+Kh3jCukfzO
   p15ZM1BvQXRRsBAtAA0Epla4Wxo/ELD4pHeiSoon/ztEo0Ec0gjMmf/x1
   3DkNBJlw31yVCBai5CBZUZ0Mvj9JGIy+NgS5NtWbZTIAPFxenBpRWoDmG
   ZQql15dRx3m3ZN4uyHau0Qdyi7pE3F/GlnWORQxYZa2pb4vZ5sZ5mNN0y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360914150"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="360914150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 02:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="782623194"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="782623194"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jun 2023 02:28:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEnxO-000oTx-1B;
	Thu, 29 Jun 2023 12:28:54 +0300
Date: Thu, 29 Jun 2023 12:28:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 7/8] ASoC: Intel: Skylake: Update PCI ID list
Message-ID: <ZJ1O1glAVAhFysPk@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-8-amadeuszx.slawinski@linux.intel.com>
 <ZJxJMg0bldj/M7TY@smile.fi.intel.com>
 <ca1ede5f-0859-5eea-f59c-9377d5945b71@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca1ede5f-0859-5eea-f59c-9377d5945b71@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: G3UZ2R3HPCVCLFBIHXOFGAAHZPLJ7PTK
X-Message-ID-Hash: G3UZ2R3HPCVCLFBIHXOFGAAHZPLJ7PTK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3UZ2R3HPCVCLFBIHXOFGAAHZPLJ7PTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 29, 2023 at 10:19:06AM +0200, Amadeusz Sławiński wrote:
> On 6/28/2023 4:52 PM, Andy Shevchenko wrote:
> > On Wed, Jun 28, 2023 at 10:51:34PM +0200, Amadeusz Sławiński wrote:

...

> > > +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP,	&snd_soc_acpi_intel_skl_machines) },
> > 
> > Do you really need TAB(s) in the parameter list?
> 
> I did this to align entries, I know it is not that visible in this patch,
> but they are defined close to each other and I feel that it looks better if
> they are aligned, but can drop alignment if you prefer. Should I also drop
> them in other patches, as I don't see comment for that?

I think we may survive without TABs, but the maintainers may have the last
word on this.

-- 
With Best Regards,
Andy Shevchenko


