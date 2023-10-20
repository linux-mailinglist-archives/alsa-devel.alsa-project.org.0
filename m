Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E2E7D1479
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 19:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116D7832;
	Fri, 20 Oct 2023 19:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116D7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697821264;
	bh=DFuYk/iZFo38XXz5QEJHG+rb8/gZLVBaR1l70X7qLgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rxZG2wl0dV97hMFUTUD7iybbWTvTdYsS1vdg5GD6PIrt/OeF0xmmAbB7DXUbLv8jI
	 GaK8hnwTr8LxZEBZGh9vO9WMuGzh93k0eJu9moQ3X2ZkPi+4oR+l3KJVGtDfnK1gdo
	 Nkbr3dwTlHdlNFtlTaC5k4Sd89aKOgguXLyxEAMM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80FFEF8032D; Fri, 20 Oct 2023 19:00:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EDBF8024E;
	Fri, 20 Oct 2023 19:00:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84D67F8025F; Fri, 20 Oct 2023 19:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42AF2F800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 19:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42AF2F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lqLUN1XY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697821203; x=1729357203;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DFuYk/iZFo38XXz5QEJHG+rb8/gZLVBaR1l70X7qLgQ=;
  b=lqLUN1XY//OLyLF4Jr0+BeqW+jJVkKutThSzGnJ1hK5Hy6/CDqVhvvAx
   z59fwE/To8Kl0x2pzeAtMcUzPvyukGBpYFPhIkpSezxrY1NPpULbRtj/P
   AyC+E+/zDDwtfdNbm2w5yVyze/GumoYEYFWA5F7I1QWOk3BjI2+tCGSxZ
   CJOnP2kEWfO6quYmhfy8+xD1n+g7QUcwzTJ1SBjyqbHlL8iNvg976dYRV
   UYGE3yFj4/KLiC1mneiZ/DIvie79W7h01JI+syVw79KpZzhfnzhw7FWTI
   uFaXWcMCmMPIjjsogE9Lzq+dZ4xpztiCRnvUvUgPJqZ0ikd/OR0Dq4Xv0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="5144941"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="5144941"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 09:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="901189445"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="901189445"
Received: from mtadesse-mobl.amr.corp.intel.com (HELO [10.209.140.77])
 ([10.209.140.77])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 09:57:46 -0700
Message-ID: <80f8a742-4a60-4c75-9093-dcd63de70b66@linux.intel.com>
Date: Fri, 20 Oct 2023 11:59:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
Content-Language: en-US
To: Mark Hasemeyer <markhas@chromium.org>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brady Norander <bradynorander@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>
References: <20231018235944.1860717-1-markhas@chromium.org>
 <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
 <5bc82aca-04f2-463b-ba52-34bcae6724d5@linux.intel.com>
 <CANg-bXCaUOxSTfR1oXKrdnDozA9Hn-NL7mqg+zvLASLQyouChA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CANg-bXCaUOxSTfR1oXKrdnDozA9Hn-NL7mqg+zvLASLQyouChA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EPG4CM4FD7TKLXZZ5PXCDQXJZRYLIBHK
X-Message-ID-Hash: EPG4CM4FD7TKLXZZ5PXCDQXJZRYLIBHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPG4CM4FD7TKLXZZ5PXCDQXJZRYLIBHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/20/23 10:36, Mark Hasemeyer wrote:
>> FWIW we use this other quirk:
>> DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),
> 
> Unfortunately DMI_PRODUCT_FAMILY is empty on these particular devices.
> The coreboot version field is the only entry that has "Google" in it.

well then you have additional issues with the DMI quirk for the firmware
selection in sound/soc/sof/sof-pci-dev.c,

      {
		.ident = "Google Chromebooks",
		.callback = chromebook_use_community_key,
		.matches = {
			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),
		}
	},

which means you need additional kernel parameters to provide the
location of the firmware....

>> How many engineers does it take to identify a Chromebook, eh?
> 
> Ha! There has been some discussion about this: to come up with a
> canonical way for Chromebook identification throughout the kernel. But
> nothing has been settled on AFAIK.

There's been multiple rounds of discussions with Curtis, we introduced
DMI_OEM_STRING but it's still not good enough, and now the previous
conventions are not being followed on what is a relatively old platform
already...
