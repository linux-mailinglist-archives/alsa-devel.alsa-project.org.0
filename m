Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB07D107C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9AA93A;
	Fri, 20 Oct 2023 15:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9AA93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697808376;
	bh=k6ndI6jcwy64xNeCRwxhVgSos4puSIbLOL6kbeJBH7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrrIyQ+jrH2J5eGMBvSvfqFBaTQB6A4QoZxL+fc8rtty1H50yvxiIaa1MjcN9+YeI
	 qzYqSwiCjgtd16cobGFVxrVTo3ciiJYQ4eqbavRUQzMs2EzIhfteYcgQicHGan/EyJ
	 cRdERKYjIUysh3La3U0EgJHUWu4vKSf+w6s5Pjfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8C8EF8055C; Fri, 20 Oct 2023 15:24:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C4CF8055B;
	Fri, 20 Oct 2023 15:24:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48EB9F8025F; Fri, 20 Oct 2023 15:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 443B6F800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 15:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 443B6F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=exzgnlMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808285; x=1729344285;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k6ndI6jcwy64xNeCRwxhVgSos4puSIbLOL6kbeJBH7s=;
  b=exzgnlMADIYwnge2UtLT92BVYl2TFeiVgqcIaGuhPI/AfYaeDlVZWTcG
   wAulfMynY/JeZwE1Ago0vqBBsSyUOz7kA7y5tKsmWMolUI/OrZ5vphMCo
   ePxbeBshMu9CwEQiRBHIejHRJNhNuokekK5/uV0E2UU95+QVqv6Zt7tjU
   7NzEuCeLmgtfNc6h/I60Cutt3FVYQKCfr3dkTCrKw6Xwhbck4WMgNDQiS
   51agPOoLRAAwRrGxfRHh6hL58Wi62gWIrBpDMCYVVkQzs24kI8zIFzBnK
   hMQCgr+W0Uo2e7P/w04ygngftFVY1pXaAKV7Ob1XaRQOImyCZox93D/dC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="385372624"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="385372624"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 06:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881083826"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="881083826"
Received: from mtadesse-mobl.amr.corp.intel.com (HELO [10.209.140.77])
 ([10.209.140.77])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 06:24:36 -0700
Message-ID: <5bc82aca-04f2-463b-ba52-34bcae6724d5@linux.intel.com>
Date: Thu, 19 Oct 2023 12:00:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
Content-Language: en-US
To: Mark Hasemeyer <markhas@chromium.org>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brady Norander <bradynorander@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
References: <20231018235944.1860717-1-markhas@chromium.org>
 <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WFMX2GW3JVKJRZD6P3HKGOHLP6W5RNC6
X-Message-ID-Hash: WFMX2GW3JVKJRZD6P3HKGOHLP6W5RNC6
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFMX2GW3JVKJRZD6P3HKGOHLP6W5RNC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/19/23 11:43, Mark Hasemeyer wrote:
>> I would assume that platform that has DMI_SYS_VENDOR set to "Google",
>> also has DMI_BIOS_VERSION set to "Google", so perhaps just replace
>> DMI_SYS_VENDOR match with DMI_BIOS_VERSION, to keep table small? Or is
>> that not a case?
> 
> That is the case. But I'm inclined to keep it for two reasons:
> 1. There is precedent in the kernel to use DMI_SYS_VENDOR=="Google"
> for Chromebook detection.
> 2. If the coreboot version schema for Chromebooks were to change, this
> check would fail for all JSL Chromebooks instead of just a few models.

I also prefer a low-risk addition to a higher-risk change. It's not like
we really care about the size of the table at this point.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

FWIW we use this other quirk:
DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),

How many engineers does it take to identify a Chromebook, eh?
