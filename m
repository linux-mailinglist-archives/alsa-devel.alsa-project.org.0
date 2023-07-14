Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48D0753B3A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BED6BBC0;
	Fri, 14 Jul 2023 14:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BED6BBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689338521;
	bh=kOKU0Oxxh2EfZONWCEwEiRbt3oUTbJJvsq5FBiKlLUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEgrmkbPD4gpfAKGg3cD8NDVQAiFnGzkmFs92Y1eUC85/43C1c/FYzYR0ydsd7ox0
	 I861qKI9xW4+2mbhvrn9i5DxFZcuCgbfc9HaxiM9GFme9oEU+cZZuHtpwgOj+0gM4C
	 aPujcjjya0dRCZxzsZWnIpNJq+Y71CJAUWh9DpgU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00A28F80236; Fri, 14 Jul 2023 14:41:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECAEF80153;
	Fri, 14 Jul 2023 14:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ABFFF80236; Fri, 14 Jul 2023 14:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0E0DF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E0DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bxCrzJAP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689338465; x=1720874465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kOKU0Oxxh2EfZONWCEwEiRbt3oUTbJJvsq5FBiKlLUE=;
  b=bxCrzJAPHPttHh5sG7jYaYCym0Ua/QROAXuvb2ew6qoFrExWMTq2ECg4
   jKvolG9897kIprtjvEJhoGKhLhXBaceNHPN6RFNQtab3fJ8U2nmfIfvxL
   wSBZyZA5rhKIz8IyWSV9QQqpeMzzDJVB5gS6rycheVSU0Ahs5EOfoDvN7
   Ou2IMKE6uci7qwWNLZP3adyrTA5+6e5NJYBCD3YPIptb/dvdaFWB44kVm
   XTsvfe8ONUqBudiGypmYcDSPuUdfROhruLULcyhr8y4pjDjhU9f+OgkBl
   BuWR4QhjbU2yAWeGyONx6dlhGb7329o9R1i/FUYVQvfbvbL7RdZxFoIGs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368103723"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="368103723"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812421841"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="812421841"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2023 05:40:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKI6S-002f1l-2H;
	Fri, 14 Jul 2023 15:40:56 +0300
Date: Fri, 14 Jul 2023 15:40:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 15/15] ASoC: Intel: sst: Convert to PCI device IDs
 defines
Message-ID: <ZLFCWKqiaJZhx6ci@smile.fi.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
 <20230714202457.423866-16-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714202457.423866-16-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: NJ5YPMMKYAAMPUES2QZ7BA6DT6GT5G2G
X-Message-ID-Hash: NJ5YPMMKYAAMPUES2QZ7BA6DT6GT5G2G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJ5YPMMKYAAMPUES2QZ7BA6DT6GT5G2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 10:24:57PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header. BSW replaces CHV, as 0x22a8
> was added in PCI header as BSW ID for consistency, as they are same
> (similar) platforms. The ACPI IDs are used only internally and lower
> 16 bits uniquely define the device as vendor ID for Intel is 8086 for
> all of them. Use PCI_DEVICE_DATA() to match PCI device to be consistent
> with other Intel audio drivers.

One nit-pick below, otherwise
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -	unsigned int		dev_id;
> +	unsigned short		dev_id;

Thinking more about this change I would probably add a comment on top of
sst_alloc_drv_context() call in sst_acpi.c to tell that in this case the
driver handles PCI IDs in ACPI and we are using only device ID part.
(If real ACPI ID appears, the kstrtouint() returns error, so we are fine
 with the change)

So, summarize above and add a comment.

-- 
With Best Regards,
Andy Shevchenko


