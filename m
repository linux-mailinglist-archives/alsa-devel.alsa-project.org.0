Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D060C84366
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Nov 2025 10:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04DB601F6;
	Tue, 25 Nov 2025 10:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04DB601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764062780;
	bh=BRYCfMuko/R34zT/a9L2atMQs+A1s5joIFdIQ6YLQwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EHtxv7IL0e8kAOM4eu4F1D5X94+90cINbLYo5HEeLBKhiP5GoOzPr0ThcYdOGI0pU
	 6pFpAUbZEITugrrR5q9675glRrjcRZupyOZjs83awgScD+ke42YLnziHUX+KrJ/2sc
	 8OECkczdCJ1AGAnjLa0GIm3F5p685Mq7CRhTQBfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE05EF805C2; Tue, 25 Nov 2025 10:25:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79802F805CA;
	Tue, 25 Nov 2025 10:25:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C142DF8026A; Tue, 25 Nov 2025 10:25:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C39C6F80107
	for <alsa-devel@alsa-project.org>; Tue, 25 Nov 2025 10:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39C6F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QQ23VYJF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764062731; x=1795598731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BRYCfMuko/R34zT/a9L2atMQs+A1s5joIFdIQ6YLQwc=;
  b=QQ23VYJFe4OcaUV4L/RZTZI2bqnaA92AYobMmhgpoJziPL5hJmskaha+
   C2/A/GJByy7kioF9kD/WNw89/WsjdtZFQEfLcuwLmmG68COgN6ClCG4Cd
   N/sqT00bsNB2hUopfgFmS7rNh6Agyx3fzzSASQ12GkmsfLPELxGPttCxy
   jqgIz+peciDZ04/eBJ7bWQUuiWmCf/G4iY/X64vFdaG9/fyZNXsf+6leE
   XYIn5G8X27Z7bPbMAiniZldC3qd+jnhcRWUsQCfTi/am0w9KrDKhGKcmc
   JmjSLP/4B1rAm7YJgPI9ua9Ar1oOtX1+Ag7KvIGEF2WQE60Iqk+PQSrwx
   g==;
X-CSE-ConnectionGUID: esuqw5AgTnqtcKZctBRGAQ==
X-CSE-MsgGUID: 4ToOKqCRSGu7gliSiI2oeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76399915"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800";
   d="scan'208";a="76399915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:25:17 -0800
X-CSE-ConnectionGUID: 0M4z7QX/S/eKdeyMedQYNw==
X-CSE-MsgGUID: SEBCABU9RLmMdowxH6fdGg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:25:14 -0800
Date: Tue, 25 Nov 2025 11:25:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, letitia.tsai@hp.com
Subject: Re: [PATCH v2] platform/x86: serial-multi-instantiate:
 IRQ_RESOURCE_AUTO should be compatible with IRQ_RESOURCE_NONE
Message-ID: <aSV190mwCKZ6WOoA@smile.fi.intel.com>
References: <20251125084436.8381-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125084436.8381-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: ALBMMRJB6EYJXJXTMWSPHHJTYDXDLUE7
X-Message-ID-Hash: ALBMMRJB6EYJXJXTMWSPHHJTYDXDLUE7
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALBMMRJB6EYJXJXTMWSPHHJTYDXDLUE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 25, 2025 at 04:44:36PM +0800, Baojun Xu wrote:
> The tas2781-hda supports multi-projects, in some projects,
> no irq is required, so the IRQ_RESOURCE_AUTO should be compatible
> with IRQ_RESOURCE_NONE.

TL;DR: NAK.

It will relax the conditions for the devices where IRQ is required.
Probably you need to consider DMI quirks or so.

Also you failed to provide the ACPI DSDT excerpts to show the real use case.
And what the board is that that uses polling mode?

You can also consider this approach (as a compromise between two:

#define IRQ_RESOURCE_OPTIONAL	BIT(2)
...
	switch (inst->flags & IRQ_RESOURCE_TYPE) {
	case IRQ_RESOURCE_AUTO:
		...
		if (inst->flags & IRQ_RESOURCE_OPTIONAL)
			ret = 0;
	break;
	...
	}
...
		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPTIONAL, 0 },


-- 
With Best Regards,
Andy Shevchenko


