Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69D604F46
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 20:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95A04C58;
	Wed, 19 Oct 2022 20:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95A04C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666202606;
	bh=sWEjTKvHj9huJlwbKvKAxQYLwvkpWMLQJwn8Gn4jsLE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMBXx3UUHypR2dgd8BvNynCy/xcWziGaqutL6WeqDru8BYhl52BIhRyHY6lZtQGyW
	 Pa0iVmsiOw0YKBXDfadBmIJu6B+uq/mSD7pr+rWz40OUEtHVbbzmGMocgch0R68eZF
	 M3hY+P1YKHsdUUZlylhqK34vUEQ5gsQkOgVzaBIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A22F804CC;
	Wed, 19 Oct 2022 20:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E66F804CB; Wed, 19 Oct 2022 20:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E829F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 20:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E829F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bWBmtWtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666202548; x=1697738548;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sWEjTKvHj9huJlwbKvKAxQYLwvkpWMLQJwn8Gn4jsLE=;
 b=bWBmtWtnQwagOitms1Bw97pCoSIKAZRmkoz8ZoRiBMipdbFz/jJmEgaZ
 8Mtuk/06Mj/c9DGy7qEZlFcHYCL7Zos4BbdfeU/V9ND05N0xO8mFmSWu+
 fFT24h8dbS7owvnUng1EHTmVk4u99n4Odq+YpRIhlPmvThkHZ7dy7OS51
 4DbqcVRseb89XshGdT1Peh4EufEI2kAt6u5YiSkGDqq42g3ekRFM60CLD
 JDpjknkLFa8xjs9I1BneYez93pu8D1gyM6JVlbzctodrN1JeLX07Ac8V+
 fGNHhmtS1Awp6Gd8inZ54fiVIISUv+0Iv9Akd/5/P5gqc+Qz8SaePo32k Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="293885172"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="293885172"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 11:02:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="607215158"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="607215158"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO [10.212.16.185])
 ([10.212.16.185])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 11:02:13 -0700
Message-ID: <2f391106-a73f-fb11-075d-5621bf592633@linux.intel.com>
Date: Wed, 19 Oct 2022 13:02:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/8] ASoC: Intel: avs: Introduce PCM power management
 routines
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
 <20221019175317.1540919-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221019175317.1540919-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/19/22 12:53, Cezary Rojewski wrote:
> Implement suspend/resume() operations for component drivers. For most
> scenarios, the PM flow is similar to standard streaming one, except for
> the part where the position register are being saved and the lack of PCM
> pages freeing. To reduce code duplication, all avs_dai_suspend_XXX() and
> avs_dai_resume_XXX() functions reuse their non-PM equivalents.
> 
> Given that path binding/unbinding happens only in FE part of the stream,
> the order of suspend() goes:
> 
> 1. hw_free() all FE DAIs, paths are unbound here
> 2. hw_free() all BE DAIs
> 
> Consequently, for resume() its:
> 
> 1. hw_params() all BE DAIs
> 2. hw_params() all FE DAIs, paths are bound here
> 3. prepare() all BE DAIs
> 4. prepare() all FE DAIs
> 
> As component->suspend/resume() do not provide substream pointer, store
> it ourselves so that the PM flow has all the necessary information to
> proceed.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/hdaudio_ext.h |   5 +
>  sound/soc/intel/avs/pcm.c   | 227 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 228 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
> index 83aed26ab143..6598e238b9c5 100644
> --- a/include/sound/hdaudio_ext.h
> +++ b/include/sound/hdaudio_ext.h
> @@ -66,6 +66,11 @@ struct hdac_ext_stream {
>  
>  	u32 dpib;
>  	u32 lpib;
> +	u32 pphcllpl;
> +	u32 pphcllpu;
> +	u32 pphcldpl;
> +	u32 pphcldpu;

This is clearly going to conflict with my own rename/move changes in
"ALSA/ASoC: hda: move SPIB/DRMS functionality from ext layer"

The SPIB and DRMS handling are not DSP-specific and should be handled in
the 'generic' sound/hda layer. In theory the HDaudio legacy driver
should have used those capabilities.

It should be a simple rebase though for this patch.
