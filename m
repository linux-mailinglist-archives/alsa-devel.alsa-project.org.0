Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A0B7E2999
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 17:20:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89C3210;
	Mon,  6 Nov 2023 17:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89C3210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699287604;
	bh=5/JoVH/DpQVf1nsgfIy616JkRbU81JQs3Wfdt3CMyBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GVEx59GlptCWWrN6ltpnDH1iN06ZAJbcexUinWBBXkRaQ0EkZyFgM2XUOw/JzLWdJ
	 ljiiJGGcUkpt0ABvIglzj8WcO/+bzVNIRTRnJRgOe2t4gBt8yBDZYtDHN8kneF7JpA
	 dLOaBD0w/oaFJ1+7OtfPeULe6C9Ph/PYLVHdeRqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41794F80100; Mon,  6 Nov 2023 17:19:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8957F80169;
	Mon,  6 Nov 2023 17:19:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA1FF8016D; Mon,  6 Nov 2023 17:19:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24C35F80125
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 17:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C35F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FFkg3NDN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699287542; x=1730823542;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5/JoVH/DpQVf1nsgfIy616JkRbU81JQs3Wfdt3CMyBU=;
  b=FFkg3NDNwwBvPYWckzBR4YEIr9eDk+qSW6xXBT/kH2Dy8cNFzj21oCFK
   UsuZv2vBKzvBM6fmbC3Cu+dJmh1HddXnu6GuSkwF1nrbSARHxCsODrcvW
   hsrMZezVP6898FCZuHVdc5lm7juEt/oHoWKxs2doHpb70tFsB7tPasm4v
   9KqIDInY+nBlgaOCnh5u7B2ObRH5shLtCabC+9Fx9e7NFFu5lCfOfuWBY
   MQIs0pP9Z7WE6DPxkEvoknV3TnbqJgs/OLHV/6Cd9gC6J6XhtgOTn5qnP
   ZEewH1uVJke3zp9I95ReH/5FnFQYrNF2wXiX03wMNYovqCVvOZK9xpgEK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420420616"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200";
   d="scan'208";a="420420616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 08:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="832764280"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200";
   d="scan'208";a="832764280"
Received: from dpidwerb-mobl.amr.corp.intel.com (HELO [10.209.77.27])
 ([10.209.77.27])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 08:18:55 -0800
Message-ID: <8f3ba9d6-6530-48d7-85d7-88579406c57a@linux.intel.com>
Date: Mon, 6 Nov 2023 08:51:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: Intel: bytcht_es8316: Determine quirks/routing
 through ACPI DSM
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>, alsa-devel@alsa-project.org
References: <20231104142439.21983-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231104142439.21983-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F6KK5LACH456BQ4OPS62YXHYFE5L5FCL
X-Message-ID-Hash: F6KK5LACH456BQ4OPS62YXHYFE5L5FCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6KK5LACH456BQ4OPS62YXHYFE5L5FCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> This takes some of the work done to auto-configure quirks/routing for
> ESS83xx codecs by getting the info from ACPI from:
> https://github.com/thesofproject/linux/pull/4112
> 
> And then builds on top of this to add auto-configuration to
> the bytcht_es8316 board driver.

Sounds good, thanks for doing this Hans! I only have two minor
questions, see below.
> 
> Note compared to the pull-request, which deals with the ES8336, this
> series deals with the ES8316 (for which I have several devices to test
> on) and this moves all handling from the codec driver to the board
> driver where this IMHO belongs.

The ACPI stuff is in theory not Intel-specific, so not sure why it would
belong in sound/soc/intel/boards? I initially put the code in
sound/soc/codecs since the _DSM method is in the scope of the codec
device HID.

> After this series audio now works properly on a CHT Chuwi Hi12 tablet
> without needing to add an extra quirk for that model.
> 
> This has also been tested on the following devices, where things
> are unchanged from before (the ACPI autoconfiguration gives the
> same results as the old defaults) :
> 
> Onda V80 plus (CHT)
> GP-electronic T701 (BYT)
> 
> I also tested this on a Nanote UMPC-01, here the _DSM result
> for PLATFORM_SPK_TYPE_ARG wrongly returns 1 (mono) while
> the device actually has 2 speakers, so this model needs to keep
> its DMI quirk.

What about the two others?

/* Irbis NB41 */
/* Teclast X98 Plus II */

Are they part of your set of devices and could the quirks be removed?
