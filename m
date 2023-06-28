Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76674144A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 16:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A05AB6C1;
	Wed, 28 Jun 2023 16:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A05AB6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687964016;
	bh=uHOo6pxeJDOU50rDEZZ8nkN2xnoOZoCUvC36LEG0P48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPXs/SUV7GxvaIiH2UZ47idkJfyuqa1+EYfCpS/kY8bxDnkuyqrEfgWBkF6zNkV+D
	 NZ7fHv/UDYO8aXi9Bcp5I9jGB1RU7eMi2ip3KsalMq+FJpudu9yXW10rxSjY0jQgL4
	 Q81oZW/MGIoSsU+IHcTW8sbbcPoIB71L1xOyLbpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6787AF80246; Wed, 28 Jun 2023 16:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FEDF80246;
	Wed, 28 Jun 2023 16:52:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B88F8027B; Wed, 28 Jun 2023 16:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43AFBF80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 16:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43AFBF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cw0Iw2fj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687963962; x=1719499962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uHOo6pxeJDOU50rDEZZ8nkN2xnoOZoCUvC36LEG0P48=;
  b=Cw0Iw2fjtZScGnUIOsYQwrOXWl011blhs+4Y0qqF5PIGbca/9YaemkAH
   gah2yUQQO/aMnsd1d5u9CvqsBcgEwFpRtyhIfGZJ0MVicIt2DwnJT7fhs
   7BnXmBtU5/zjZqSAdRmIPCg6wiG+IYcvLpQ6pL471EShkW75Wa6OadUQm
   iLxboh7Mfd9xlBd9u3O/dxlqMJhlyDaJM4G6ajUAqUFL8bUcQUhHmzxmf
   7MBeLVRDBis0VOKfqMwyelAghmJIM4ZVLmWzixJC/wdgoX113RLjvor/c
   Eiom40i0Vt+VZ/HIfLIW5D1hTnNab3RzT1YkpCCmunNY7Aighi02qAkbA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="342201919"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="342201919"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="720261514"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="720261514"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2023 07:52:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWX4-000cxD-1u;
	Wed, 28 Jun 2023 17:52:34 +0300
Date: Wed, 28 Jun 2023 17:52:34 +0300
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
Message-ID: <ZJxJMg0bldj/M7TY@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-8-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-8-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: HX6Y5MQCGV3U52UPKFXYT32KY6KNGDDX
X-Message-ID-Hash: HX6Y5MQCGV3U52UPKFXYT32KY6KNGDDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HX6Y5MQCGV3U52UPKFXYT32KY6KNGDDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:34PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA macro, to simplify declarations.

PCI_DEVICE_DATA()

...

> +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP,	&snd_soc_acpi_intel_skl_machines) },

Do you really need TAB(s) in the parameter list?

-- 
With Best Regards,
Andy Shevchenko


