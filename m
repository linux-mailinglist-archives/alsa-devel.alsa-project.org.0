Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41E753977
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F2BBC0;
	Fri, 14 Jul 2023 13:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F2BBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689333902;
	bh=Dm1Lkb1BqeH3aTuLA6KKqD+HaGLC4eQ3seZpRsghqj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tga2YSZZXVNlupq6UpClMAUjj+ve/BzhgOtbpwcx+NmEJDZS/1s0fN9aw/pgdAJTF
	 Rw3z1P0jOhrlcsvQiVm1oTQ0JEehBXxtuR+F60E8S/U0KHa4XoNevP0xkVldfUHyys
	 1AAHsrccIWAtUS0yun2zqu3VAIsyNbVd1BFH15qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8277FF80558; Fri, 14 Jul 2023 13:23:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 028BBF800D2;
	Fri, 14 Jul 2023 13:23:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 391A0F80249; Fri, 14 Jul 2023 13:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E785BF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E785BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iM5WOVFY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689333797; x=1720869797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Dm1Lkb1BqeH3aTuLA6KKqD+HaGLC4eQ3seZpRsghqj0=;
  b=iM5WOVFYWiDYaUngzWjS9JHE0Xi/mVOnQ/upnxIqqFZp7ppGEwieM7Dv
   DhtAPo05VtoS885iHLWL4k1T5/jU+hh8nwKcMuffk3YigABUaurvhqszy
   TrcgEiZipOtTi52IYzZPTb+SKJVgZzwWVmTGMTnuPt+x1c55g6OPWaeyP
   99jRIZqISkJLEhtILioKnJv2LP4vkhuBd4/HdgzCdOuA9rFkvsh2k6RkZ
   2ORmBpOChdQTaaMqayWzYI8ux568p8Sf6PambvGaL3cNotHdRypBbSqhB
   d9yXtS1g/Ti/hXukeU9Baww9/2ieaJcW+oIWGvqCRivOWFq54b4XPKlp1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364325837"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="364325837"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725677390"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="725677390"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 04:23:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qKGt9-002e0C-3C;
	Fri, 14 Jul 2023 14:23:07 +0300
Date: Fri, 14 Jul 2023 14:23:07 +0300
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
Subject: Re: [PATCH v2 14/15] ASoC: SOF: Intel: Convert to PCI device IDs
 defines
Message-ID: <ZLEwG1gLRSkyooKe@smile.fi.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-15-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714185615.370597-15-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 3G26HAIMAW5HINFM4P7KS3PXIFJJ6HWN
X-Message-ID-Hash: 3G26HAIMAW5HINFM4P7KS3PXIFJJ6HWN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3G26HAIMAW5HINFM4P7KS3PXIFJJ6HWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 08:56:14PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA() macro, to simplify declarations.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


