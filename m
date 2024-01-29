Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98887841EED
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 10:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51939DEE;
	Tue, 30 Jan 2024 10:12:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51939DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706605942;
	bh=RvaoRqi6d2649HMPir89XZBkoGY4LvB2aJ08/fzLesM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dmgFJpRdab4JMSsnkXnQ+ZIxu4eziD4FMsvKyDRhZGPB/ifdQJlmqP/qB4ctJiRio
	 R0VSbgdc/P9xJcCYnytrrFqTBkoM8d2Nk9E4BXCwHBLtDpW+BPfPGQ75VVTJ58OaEh
	 YLxryl9Rky4cKcl5EA+J6ohCRfuiXuCLPve7p86s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D427BF80589; Tue, 30 Jan 2024 10:11:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF86F805A8;
	Tue, 30 Jan 2024 10:11:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11135F80563; Tue, 30 Jan 2024 10:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6F16F80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 10:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F16F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G7SDa72y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706605893; x=1738141893;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RvaoRqi6d2649HMPir89XZBkoGY4LvB2aJ08/fzLesM=;
  b=G7SDa72yN1ztcl3+aGHeKbhAXktFdG+N7Vh9HS+F3MISkNFiPU2fqM8Q
   XN3NjH/kgWcDEiOmf2nCkce6Sf7pdJayy1/RuprYXSm81zGUYFLQIlU/K
   aPax2lua0T+m52Stu1MJgxyFWdKBdnWoo51ZxIrxWJfFPddF15F6IVQI6
   4Pv8jO+yR0lZIR3Tt/rt11cfqgbyN71mKubU9WHeaHsY22FPnFHaAIBwF
   o4m4ODpJ88CLExwAmPOE9Ot5cPJGloDQ0fpJ91nHOe2YRZiFnkGbadrP3
   5bqX/j310ZQMkPj1/qNvA0WeJDKi37LVeHJB9gZp3aUToO4QDELjwvzQt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3055987"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="3055987"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:08:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931378461"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="931378461"
Received: from vkamysba-mobl1.amr.corp.intel.com (HELO [10.254.116.178])
 ([10.254.116.178])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:07:25 -0800
Message-ID: <4f54a12c-c8a3-414c-b4df-3f7b25e6d524@linux.intel.com>
Date: Mon, 29 Jan 2024 18:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/18] ASoC: cs35l56: Fix default SDW TX mixer registers
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20240129162737.497-1-rf@opensource.cirrus.com>
 <20240129162737.497-9-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240129162737.497-9-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TLR25BLMKYIPCRMTSCRHT2ZRABLKYPSL
X-Message-ID-Hash: TLR25BLMKYIPCRMTSCRHT2ZRABLKYPSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLR25BLMKYIPCRMTSCRHT2ZRABLKYPSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1/29/24 17:27, Richard Fitzgerald wrote:
> Patch the SDW TX mixer registers to silicon defaults.
> 
> CS35L56 is designed for SDCA and a generic SDCA driver would
> know nothing about these chip-specific registers. So the
> firmware sets up the SDW TX mixer registers to whatever audio
> is relevant on a specific system.
> 
> This means that the driver cannot assume the initial values
> of these registers. But Linux has ALSA controls to configure
> routing, so the registers can be patched to silicon default and
> the ALSA controls used to select what audio to feed back to the
> host capture path.

humm, which has the precedence then?
a) the values set by firmware
b) the default values set by the driver?

Also if the firmware touches those registers shouldn't they be marked as
'volatile'?


> Backport note:
> This won't apply to kernels older than v6.6.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> ---
>  sound/soc/codecs/cs35l56-shared.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index 35789ffc63af..a812abf90836 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -12,6 +12,15 @@
>  #include "cs35l56.h"
>  
>  static const struct reg_sequence cs35l56_patch[] = {
> +	/*
> +	 * Firmware can change these to non-defaults to satisfy SDCA.
> +	 * Ensure that they are at known defaults.
> +	 */
> +	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
> +	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
> +	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
> +	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
> +
>  	/* These are not reset by a soft-reset, so patch to defaults. */
>  	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
>  	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
