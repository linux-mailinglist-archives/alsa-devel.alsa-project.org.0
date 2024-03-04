Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38522870AC9
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 20:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D79293A;
	Mon,  4 Mar 2024 20:34:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D79293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709580895;
	bh=7WE0+iAlu1u9SUqlD/cOnSeRnpt1WFGDjFhFu5ds4mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kq6QXYqjkiO9dEWsKIjcQvaP4+LKw9cVceS/B38Phlyipp8oDzkCwlfiBxCJxPNol
	 ygWYhm8eiE6ThoVodd0T1pbfKLSHu0QnOyNu/z/lNUm2ow4AtObjLGgODBQSzU0axz
	 2KbOMhqtAAl+DHkqBpZz4xqhyrMDjb6kW0eZqbaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A220F805A0; Mon,  4 Mar 2024 20:34:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91295F80496;
	Mon,  4 Mar 2024 20:34:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C293F802E8; Mon,  4 Mar 2024 20:34:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5C8FF8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 20:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C8FF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k23IsZI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709580851; x=1741116851;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7WE0+iAlu1u9SUqlD/cOnSeRnpt1WFGDjFhFu5ds4mo=;
  b=k23IsZI2KL3cjnZP/5fLwddfE+lyJ1av5zKLOwfl1DqJDaS6bVtuioMW
   +GEaAIM54iygohydLOdWoVJeAwAiBTtY6FhrkmdfjDtIkQEu5g5DNKbgJ
   66/jl4lceSPXOps2KfDgUt86PFi+GORbdPrlekI5pBTqLZ3n12kDBwE+7
   lUcRWygFB26kaZGyNufxMy+DzB0hy1XcFgiBELdKSmiTBbDPyhkUYdp+g
   4z8tuaMhmxBEI2FC8ANmBPmBGN+Vflgar13PLk5mFuzMhV3a64vCbvNp6
   XardqMOMyJS4dtL6kMzTTlvNO1anVazd5Nl0LRNkWtMkCq/x075DxBiZo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15500692"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="15500692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="13599728"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160])
 ([10.212.71.160])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:33:57 -0800
Message-ID: <ff674cfa-19d4-4de4-80ec-9be88f8cb4a4@linux.intel.com>
Date: Mon, 4 Mar 2024 13:28:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: Intel: Disable route checks for Skylake boards
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240304190536.1783332-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: E3MDFON5CK33DVCZSHCCSSSSATQS4XYO
X-Message-ID-Hash: E3MDFON5CK33DVCZSHCCSSSSATQS4XYO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3MDFON5CK33DVCZSHCCSSSSATQS4XYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/4/24 13:05, Cezary Rojewski wrote:
> Topology files that are propagated to the world and utilized by the
> skylake-driver carry shortcomings in their SectionGraphs.
> 
> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
> failures for Intel boards have been partially addressed by commit
> a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy devices")
> and its follow up but only skl_nau88l25_ssm4567.c is patched. Fix the
> problem for the rest of the boards.
> 
> Link: https://lore.kernel.org/all/20200309192744.18380-1-pierre-louis.bossart@linux.intel.com/
> Fixes: daa480bde6b3 ("ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/boards/bxt_da7219_max98357a.c       | 1 +
>  sound/soc/intel/boards/bxt_rt298.c                  | 1 +
>  sound/soc/intel/boards/glk_rt5682_max98357a.c       | 1 +
>  sound/soc/intel/boards/kbl_da7219_max98357a.c       | 1 +
>  sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++++
>  sound/soc/intel/boards/kbl_rt5660.c                 | 1 +
>  sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 ++
>  sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 1 +
>  sound/soc/intel/boards/skl_hda_dsp_generic.c        | 1 +

This HDAudio machine driver is shared with the SOF-based solutions and I
see no reason to change the route checking...

I don't agree with this change. Why can't you fix the broken topologies
instead, if indeed they 'carry shortcomings'?

Same for glk, this an SOF-based solution.

>  sound/soc/intel/boards/skl_nau88l25_max98357a.c     | 1 +
>  sound/soc/intel/boards/skl_rt286.c                  | 1 +
>  11 files changed, 15 insertions(+)

