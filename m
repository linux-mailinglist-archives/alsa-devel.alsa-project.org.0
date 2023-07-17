Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB77565A5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 15:59:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5348CDE5;
	Mon, 17 Jul 2023 15:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5348CDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689602375;
	bh=ZegC5DPpSUub8UmMq/EVEnANqCgyQJ+7uEfWodtWc/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HcWpucZ4Oj9gQvHtK14HeX5N1CRRFNoQG3gHHy1ODtFA+Rwj7q5JMoNrbFarY5sAG
	 f+iAxAq6IlINirDRQn1d7Uq8r9jByebnt5gpzSUN88GsBvxOJYcs12ynHC6Wb7ZSkc
	 r6D/ggSNcuUUlUp2OU5F/tjujPrwIPd/niORhPN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 571C7F80535; Mon, 17 Jul 2023 15:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8548F8032D;
	Mon, 17 Jul 2023 15:58:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 388ABF8047D; Mon, 17 Jul 2023 15:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 917A9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 917A9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ajcViKh/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689602298; x=1721138298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZegC5DPpSUub8UmMq/EVEnANqCgyQJ+7uEfWodtWc/M=;
  b=ajcViKh/huXtHkNA1YO8njpOPoVZlQk5aVMKdlNzMx8jxmd7OufaL0eS
   KweC/D71op18/sV8Keryqn5o6lO28e2M4PmBSCdZFC92j0C8hbdZrReKu
   u6Hu/+hsoZljnkvia+0+zvMtse1TJqeweIX92CawsaddzY1DXe6XlhrCo
   hNSkVERKm+4I3Y4R5ReSqD/az1wdxfv375TLzPFL0z9s2CpCJYhKX3Tot
   S7sarKnCuK3ikawM+HuV+Ie3uaVi0rKNGdeS5hwPqqBs2thPMx6Pfb0e1
   pe0i1tTU9VzmLEfZvB0tvOIep8Q+DGlZ2uYXNh37NJ3yOQ4bSzFwYWHf0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396763923"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="396763923"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726554750"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="726554750"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2023 06:58:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qLOjo-00HBxz-1p;
	Mon, 17 Jul 2023 16:58:08 +0300
Date: Mon, 17 Jul 2023 16:58:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 01/15] PCI: Sort Intel PCI IDs by number
Message-ID: <ZLVI8NuiIZZrhjRg@smile.fi.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
 <20230717114511.484999-2-amadeuszx.slawinski@linux.intel.com>
 <ZLVIGlpoNsr0RRGE@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLVIGlpoNsr0RRGE@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: A6NIY6QPSPMT3ZNYW5H7Q5247Y5IOK36
X-Message-ID-Hash: A6NIY6QPSPMT3ZNYW5H7Q5247Y5IOK36
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6NIY6QPSPMT3ZNYW5H7Q5247Y5IOK36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 04:54:34PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 17, 2023 at 01:44:57PM +0200, Amadeusz Sławiński wrote:
> > Some of the PCI IDs are not sorted correctly, reorder them by growing ID
> > number.
> 
> Hmm... I don't see a cover letter...

Okay, `b4` fetches it. It seems I asked you (or my memory is doing a trick?)
to avoid using my @intel.com for LKML archives...

-- 
With Best Regards,
Andy Shevchenko


