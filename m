Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA9851761
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 15:55:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01091B60;
	Mon, 12 Feb 2024 15:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01091B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707749705;
	bh=Eo2dIe2IA2KhPD2VRZXtgftgPPIjqL80jVWQFfnEBSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W09AC4nHy+6crvX9A8FmkNznTlNKvPoxtdmnTF6Ehcf/v98ghw8ECWMCu7JlGZ6lM
	 W/gXqKhwcFJ23CdxCmXi329SWcGqt/0T+w9lG6VIoS3cgqyKoUEpeW8iujNBKrgKGB
	 Mem3apnARb0UFGBBNK/ZIdbFBocfaGZX9D+wotPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E364BF805D5; Mon, 12 Feb 2024 15:54:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC913F805C9;
	Mon, 12 Feb 2024 15:54:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD833F80238; Mon, 12 Feb 2024 15:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 614BEF800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 15:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 614BEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bG+Sfvaq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707749646; x=1739285646;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Eo2dIe2IA2KhPD2VRZXtgftgPPIjqL80jVWQFfnEBSQ=;
  b=bG+Sfvaq/qL7Vp4U9Tefyh1gNRTuSGcjmoAWl3ekup3GtJ2/Y+cMOdUn
   i/icNgnxwq2bbCvRs4B+Hd1ymv8JGOp3gH1yR+FBrCPgsIeBjUD3UWsil
   B03KIF6JA4clkUs9xmUnGNWf5m+8WumFkZ/WiV4r+ivIaHi0j7G5Jateu
   mH+FfUQr9WVt8IaXLeoUrrl8lucPEVsezk9ZUsN7nwKHGq3H3JRrlC5VS
   XgHvx67fzvsiFiKiZDA2PHvZb3SPYCubokKLaU98N9XGDQ2uQOd9CgH26
   ynP2ck8BxDv+Dv1tI2VnRwoNZBg1Hw2psgkuv+xIUH1uOxTq2yWDTu8T1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1850456"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000";
   d="scan'208";a="1850456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000";
   d="scan'208";a="2582274"
Received: from rvarada-mobl.amr.corp.intel.com (HELO [10.212.76.202])
 ([10.212.76.202])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:54:01 -0800
Message-ID: <2f2d814f-61fe-490c-83ae-e397eddfdc17@linux.intel.com>
Date: Mon, 12 Feb 2024 08:51:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: rt5645: Make LattePanda board DMI match more
 precise
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org
References: <20240211212736.179605-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240211212736.179605-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MXZF7GNVDKQP3SHFIIPRBNLGT5MYCA5X
X-Message-ID-Hash: MXZF7GNVDKQP3SHFIIPRBNLGT5MYCA5X
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXZF7GNVDKQP3SHFIIPRBNLGT5MYCA5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/11/24 15:27, Hans de Goede wrote:
> The DMI strings used for the LattePanda board DMI quirks are very generic.
> 
> Using the dmidecode database from https://linux-hardware.org/ shows
> that the chosen DMI strings also match the following 2 laptops
> which also have a rt5645 codec:
> 
> Insignia NS-P11W7100 https://linux-hardware.org/?computer=E092FFF8BA04
> Insignia NS-P10W8100 https://linux-hardware.org/?computer=AFB6C0BF7934
> 
> All 4 hw revisions of the LattePanda board have "S70CR" in their BIOS
> version DMI strings:
> 
> DF-BI-7-S70CR100-*
> DF-BI-7-S70CR110-*
> DF-BI-7-S70CR200-*
> LP-BS-7-S70CR700-*
> 
> See e.g. https://linux-hardware.org/?computer=D98250A817C0
> 
> Add a partial (non exact) DMI match on this string to make the LattePanda
> board DMI match more precise to avoid false-positive matches.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For patch1 and 2

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

