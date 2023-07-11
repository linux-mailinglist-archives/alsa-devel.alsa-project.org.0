Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3F74F03D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EBAA4A;
	Tue, 11 Jul 2023 15:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EBAA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689082468;
	bh=B+x4/4XGBz1sNldLcW0eBR/Fzl6BmzT3wyLCN2HDSSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gf4Kj5ZItiSWawuLZKK8n7ryXxgEIjW/br6vI1d2I3z0kxG1IVXBciIlPhTv2Wg1c
	 TmBl7iw7s+0gLE+Fy/7cI2RYAdJR4+kHP0veeFB9QbKPYu8fz2yx9sMGn30UGrC5E3
	 5+ex+i4gSX6q4C7+jjezcKt/GLBbmSqyAfOhGEWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1557DF8047D; Tue, 11 Jul 2023 15:33:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBCC6F80236;
	Tue, 11 Jul 2023 15:33:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56DACF80153; Tue, 11 Jul 2023 15:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5EA3F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EA3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YTOGpGkR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689082413; x=1720618413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3mWlwfyj0TpsA85OQqIB9DgXGmiMWUXRVcYEkhHKRnM=;
  b=YTOGpGkRxU+Zr4kswg9AjZ5ldB3DLOmQkvzevY5vsYi14PpVWdGOaZLI
   HFbNhiaNUhF1Zr++boHw+xKIg7ELzB0kmIJzxKvfipgpCdEsnCvuGtHm7
   AOfubvCCoz1kCS8rG+MROm/oX7DX/0QOaMkP6dLGqelWpjpNZHMP+kfvA
   HjPKWH3Qjx+e5qnYF2yZzy2iPYeXOR1RkSgTzz8kBwRSRALVh6o81SLjj
   g9zxzwfHlpvu8BuTQyGICP6GmUYEBF7bE6ioYq7/3KHhrDAzUzE0ZFS6H
   cfTaV1rCbHYKQ6HbYFhGQKF6FfzpysMUiiX9XljmMY4czH3l/TLiarz/2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368117449"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="368117449"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 06:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="895172613"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="895172613"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 06:33:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDUD-001rRp-0b;
	Tue, 11 Jul 2023 16:33:01 +0300
Date: Tue, 11 Jul 2023 16:33:00 +0300
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
Subject: Re: [PATCH 02/13] PCI: Add Intel Audio DSP devices to pci_ids.h
Message-ID: <ZK1aDMZg+I/Dheo6@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-3-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-3-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: UK4FVX54H4BNIHDUU3BPMKONDMM4Y2I7
X-Message-ID-Hash: UK4FVX54H4BNIHDUU3BPMKONDMM4Y2I7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UK4FVX54H4BNIHDUU3BPMKONDMM4Y2I7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:15PM +0200, Amadeusz Sławiński wrote:
> Those IDs are mostly sprinkled between HDA, Skylake, SOF and avs drivers.
> Almost every use contains additional comments to identify to which
> platform those IDs refer to. Add those IDs to pci_ids.h header, so that
> there is one place which defines those names.

>From style looks good to me, but I think somebody from ASoC/sound needs to
carefully check HDA/non-HDA/etc.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # for the Intel Tangier ID

> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


