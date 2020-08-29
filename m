Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B902566EF
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 12:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5956C18E1;
	Sat, 29 Aug 2020 12:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5956C18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598698599;
	bh=DLqti9ch5If++qMOcOuLlL7LNaRXBwlF2HDa+P7t668=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lxdq6X273FoiL+JJhNf00OrycYoCjCDvmP9YOnhnS8vzQGzp19i0Ft5rHaZ7Xa1si
	 bCBM0WqEuTa+vjjCKxNVKqFjMhgPotYMvqh2nhUkYAJwAlfrujKRAHLz/0DJYjQvGv
	 8nRZnSRk0yLKkgoMnfu/hWsXk2vb2jRnnw8rACmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A79C2F80245;
	Sat, 29 Aug 2020 12:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2693F8025A; Sat, 29 Aug 2020 12:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1145AF8014E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 12:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1145AF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RYibzmJ6"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2AFC20791;
 Sat, 29 Aug 2020 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598698487;
 bh=DLqti9ch5If++qMOcOuLlL7LNaRXBwlF2HDa+P7t668=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RYibzmJ6wu/kBV7l0Wak/T2FvS4I4MTFUWZaWPF3AAIbU7IUU3I23iAFc5V7+8bBU
 O7uxI5kd1UdZla03WgGCJ30TimDgWODz72mVak/4GvOt7tgvVwyO0SK2c4QitLKHn4
 xEFBByAsMYWVk4dzFWdr7aOi+6JTgnheRS+iWH/g=
Date: Sat, 29 Aug 2020 16:24:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/9] soundwire: define and use addr bit masks
Message-ID: <20200829105443.GA2639@vkoul-mobl>
References: <20200828072101.3781956-1-vkoul@kernel.org>
 <20200828072101.3781956-2-vkoul@kernel.org>
 <9ae0f448-afb8-bcd6-b494-a7014ed88c11@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae0f448-afb8-bcd6-b494-a7014ed88c11@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On 28-08-20, 11:03, Pierre-Louis Bossart wrote:
> Hi Vinod,
> This change to use FIELD_PREP/GET looks good, the code is indeed a lot
> clearer, but ...
> 
> > +#define SDW_DISCO_LINK_ID(adr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, addr)
> > +#define SDW_VERSION(adr)	FIELD_GET(SDW_VERSION_MASK, addr)
> > +#define SDW_UNIQUE_ID(adr)	FIELD_GET(SDW_UNIQUE_ID_MASK, addr)
> > +#define SDW_MFG_ID(adr)		FIELD_GET(SDW_MFG_ID_MASK, addr)
> > +#define SDW_PART_ID(adr)	FIELD_GET(SDW_PART_ID_MASK, addr)
> > +#define SDW_CLASS_ID(adr)	FIELD_GET(SDW_CLASS_ID_MASK, addr)
> 
> ...our CI stopped on a compilation error with these macros. You will need
> the patch1 attached.

Aha, that looks wrong indeed, somehow my test & build for aarch64 and
build for x86 didnt flag this, neither this kbuild-bot!

Have fixed it up now
> 
> Patch 9 also introduces conflicts with the multi-link code (fix in patch2),
> so would you mind if we go first with the multi-link code, or defer patch9
> for now?

We can fix the series required while applying..

> 
> Our validation for CML w/ RT700 is at:
> https://github.com/thesofproject/linux/pull/2404
> 
> We will also test on machines that are not in the CI farm and provide
> feedback.
> 
> Thanks
> -Pierre
> 

> >From 3aba5a7229c904664dacf1843f2e925585d4bd3e Mon Sep 17 00:00:00 2001
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Date: Fri, 28 Aug 2020 10:45:22 -0500
> Subject: [PATCH 1/2] fixup! soundwire: define and use addr bit masks
> 
> s/addr/adr
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 892bf4718bc3..ebfabab63ec9 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -472,12 +472,12 @@ struct sdw_slave_id {
>  #define SDW_PART_ID_MASK	GENMASK(23, 8)
>  #define SDW_CLASS_ID_MASK	GENMASK(7, 0)
>  
> -#define SDW_DISCO_LINK_ID(adr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, addr)
> -#define SDW_VERSION(adr)	FIELD_GET(SDW_VERSION_MASK, addr)
> -#define SDW_UNIQUE_ID(adr)	FIELD_GET(SDW_UNIQUE_ID_MASK, addr)
> -#define SDW_MFG_ID(adr)		FIELD_GET(SDW_MFG_ID_MASK, addr)
> -#define SDW_PART_ID(adr)	FIELD_GET(SDW_PART_ID_MASK, addr)
> -#define SDW_CLASS_ID(adr)	FIELD_GET(SDW_CLASS_ID_MASK, addr)
> +#define SDW_DISCO_LINK_ID(adr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, adr)
> +#define SDW_VERSION(adr)	FIELD_GET(SDW_VERSION_MASK, adr)
> +#define SDW_UNIQUE_ID(adr)	FIELD_GET(SDW_UNIQUE_ID_MASK, adr)
> +#define SDW_MFG_ID(adr)		FIELD_GET(SDW_MFG_ID_MASK, adr)
> +#define SDW_PART_ID(adr)	FIELD_GET(SDW_PART_ID_MASK, adr)
> +#define SDW_CLASS_ID(adr)	FIELD_GET(SDW_CLASS_ID_MASK, adr)
>  
>  /**
>   * struct sdw_slave_intr_status - Slave interrupt status
> -- 
> 2.25.1
> 

> >From f0280ed5dbe284df628e58c5afa1e61452cd5cb8 Mon Sep 17 00:00:00 2001
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Date: Fri, 28 Aug 2020 10:51:52 -0500
> Subject: [PATCH 2/2] soundwire: intel: use FIELD_PREP macro
> 
> Follow upstream changes.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 566c7a99a5c1..20f111ce8a7a 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -381,10 +381,11 @@ static int intel_link_power_up(struct sdw_intel *sdw)
>  		link_control = intel_readl(shim, SDW_SHIM_LCTL);
>  
>  		/* only power-up enabled links */
> -		spa_mask = sdw->link_res->link_mask <<
> -			SDW_REG_SHIFT(SDW_SHIM_LCTL_SPA_MASK);
> -		cpa_mask = sdw->link_res->link_mask <<
> -			SDW_REG_SHIFT(SDW_SHIM_LCTL_CPA_MASK);
> +		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK,
> +				      sdw->link_res->link_mask);
> +		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK,
> +				      sdw->link_res->link_mask);
> +
>  
>  		link_control |=  spa_mask;
>  
> @@ -555,10 +556,11 @@ static int intel_link_power_down(struct sdw_intel *sdw)
>  		link_control = intel_readl(shim, SDW_SHIM_LCTL);
>  
>  		/* only power-down enabled links */
> -		spa_mask = (~sdw->link_res->link_mask) <<
> -			SDW_REG_SHIFT(SDW_SHIM_LCTL_SPA_MASK);
> -		cpa_mask = sdw->link_res->link_mask <<
> -			SDW_REG_SHIFT(SDW_SHIM_LCTL_CPA_MASK);
> +		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK,
> +				      ~sdw->link_res->link_mask);
> +
> +		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK,
> +				      sdw->link_res->link_mask);
>  
>  		link_control &=  spa_mask;
>  
> -- 
> 2.25.1
> 


-- 
~Vinod
