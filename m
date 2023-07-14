Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2975396C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2736FA4C;
	Fri, 14 Jul 2023 13:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2736FA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689333689;
	bh=TWbTERSN9sck8s9p2NkrzXtIVeCq+h7as7v69ZZ4WlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A5rDB+m/HDqmCazSqwjObHEugJxLamwu/YHNMPNwUHt/PW5wDLL6jOIwAgfV4pHuJ
	 wk2d6KxHyZbQbg85xGSeNVFjd58RI4bhIjkqgRY+WAFyaFqRW2hY82fNDhcMR3aRR0
	 CUueT/Fdj1v+WtC8dQNyXp4fv4Ju63OYUz/hV31U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E060AF80535; Fri, 14 Jul 2023 13:20:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74510F80236;
	Fri, 14 Jul 2023 13:20:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C26F80249; Fri, 14 Jul 2023 13:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 685C9F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 685C9F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QnP1NwZx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689333633; x=1720869633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TWbTERSN9sck8s9p2NkrzXtIVeCq+h7as7v69ZZ4WlY=;
  b=QnP1NwZxL7XPihVhn/vHGN3/54tYxt37wLUHLjz+VT+Y8Ow/0vVdkbZc
   dh/8jWSjC0Z/s8T3SEmO08ZqwDnMUDMaepJLABrEIceL/rDlgzZdZ9Q/6
   jINIEZv8Ou8dq3aWRFaha2kxh7ZVxPMHlSXs4eJftv3kc3dzaq/Z7EnM6
   P1wLRfNS5e5VvhgPn0cYTNpH2jbZPOBulx+W9nl33URHlWGmqXLXx6nvp
   Za7ZE438K/10V7K5N44K5W6YNE7vL2MSBmmeTvP/FVK6LeHTG6vu/Krhd
   OF/TKfKfVa8D5trIN2p/x2Nr1VzK6rZyTyt3PzoUMQlPBue7/p0Kd9JWm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431622434"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="431622434"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="896388420"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="896388420"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 04:20:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKGqF-002dxf-0y;
	Fri, 14 Jul 2023 14:20:07 +0300
Date: Fri, 14 Jul 2023 14:20:07 +0300
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
Subject: Re: [PATCH v2 07/15] ALSA: hda/i915:  Use global PCI match macro
Message-ID: <ZLEvZ3Ss05A+x1ty@smile.fi.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-8-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714185615.370597-8-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: UNLKIACGKRBY34XRL5LUQKTT7TF4PB65
X-Message-ID-Hash: UNLKIACGKRBY34XRL5LUQKTT7TF4PB65
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNLKIACGKRBY34XRL5LUQKTT7TF4PB65/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 08:56:07PM +0200, Amadeusz Sławiński wrote:
> Instead of using local macro to match PCI device, use global one.

...

> @@ -2718,7 +2718,6 @@
>  #define PCI_DEVICE_ID_INTEL_82840_HB	0x1a21
>  #define PCI_DEVICE_ID_INTEL_82845_HB	0x1a30
>  #define PCI_DEVICE_ID_INTEL_IOAT	0x1a38
> -#define PCI_DEVICE_ID_INTEL_HDA_APL_T	0x1a98
>  #define PCI_DEVICE_ID_INTEL_HDA_CPT	0x1c20
>  #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MIN	0x1c41
>  #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MAX	0x1c5f

Looks like it should be a separate change.

-- 
With Best Regards,
Andy Shevchenko


