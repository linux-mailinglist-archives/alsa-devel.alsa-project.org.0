Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C041C619BF1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 16:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5099C1650;
	Fri,  4 Nov 2022 16:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5099C1650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667576613;
	bh=TA56oW0IDpz4XWEmrkZvn08w2UPvghCRx0l8EOHXZIo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YzlopLqcddQmJAUATgIS9B8ySqfJUBLADGstp9PZGpoPDTX6lOV6AnEeq9B65pav8
	 6Oic0Xx/UnptwRe21oHJDNQ6HEqbvXDRzYu3Cdj145Q6XlAD3lQvTjrecTD3ccsqHd
	 hIR3dlXrtc6+uo6NImQaUFzlSEyidXvFuDcrgRpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3AF2F80155;
	Fri,  4 Nov 2022 16:42:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBF48F80448; Fri,  4 Nov 2022 16:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B192F80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 16:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B192F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hQ0mVXp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667576553; x=1699112553;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=TA56oW0IDpz4XWEmrkZvn08w2UPvghCRx0l8EOHXZIo=;
 b=hQ0mVXp+1+VEnlTZT+9hQFdKgaRDPYX7jBvFn+eGX6Qx4HXPCQEiSjgK
 aTPuCI3CRjCot69Ub02v9wH7soi3xEak3dHZWZc0XbBjD4A83R1eOOamk
 PzqpQB4Juf55XhlBuJFBLM0EGkf2D7c03peMaF8QyC3PIvSbomNk7sQqD
 GxF1D46QIqHe/iThQzpX0aIiQkxcb8ZVjIqJLn1KwNEa+7NkumFjaMb4Z
 U88lPDIzVFYVl2IG3Aria4qGhT/BrEckWTgWub5i/ceti5zQQKgDET1yf
 ItiU/dO0e/8Lxx3Urs0zkJy4ZqChorkCQgVCYFp42KwsdpIpXZ61+SGxC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="374236043"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="374236043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:42:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="760364975"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="760364975"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:42:22 -0700
Date: Fri, 4 Nov 2022 17:42:29 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: regression with SG DMA buf allocations and IOMMU in low-mem
In-Reply-To: <87r0yiiw6s.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2211041741520.3532114@eliteleevi.tm.intel.com>
References: <alpine.DEB.2.22.394.2211041541090.3532114@eliteleevi.tm.intel.com>
 <87r0yiiw6s.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

[ and sorry, I had the bounces address in cc originally, routing
  reply to list as well ]

On Fri, 4 Nov 2022, Takashi Iwai wrote:

> On Fri, 04 Nov 2022 15:56:50 +0100, Kai Vehmanen wrote:
> > I've been debugging a SOF DSP load fail on VT-D/IOMMU systems [1] and 
> > that brought me to these two commits from you:
> > .. but in rare low-memory cases, the dma_alloc_noncontiguous()
> > call will fail in core/memalloc.c and we go to the fallback path.
> > 
> > So we go to snd_dma_sg_fallback_alloc(), but here it seems something is 
> > missing. The pages are not allocated with DMA mapping API anymore, so 
> > IOMMU won't know about the memory and in our case the DSP load will fail 
> > to a IOMMU fault. 
[...]
> 
> Hrm, that's a tough issue.  Basically if dma_alloc_noncontiguous()
> fails, it's really out of memory -- at least under the situation where
> IOMMU is enabled.  The fallback path was introduced for the case where
> there is no IOMMU and noncontiguous allocation fails from the
> beginning.

ack. This matches with the bug reports. These happen rarely and on systems 
with a lot of memory pressure. We have recently submitted a few 
features&fixes that will further reduce these allocs, so it probably is 
better outcome to have a plain out of memory error.

> And, what makes things more complicated is that snd_dma_dev_alloc()
> cannot be used for SG pages when IOMMU is involved.  We can't get the
> proper pages for mapping SG from the DMA address in that case; some
> systems may work with virt_to_page() but it's not guranteed to work.

Aa, ok, so we need to use dma_alloc_noncontiguous() to do this properly 
and if it returns ENOMEM, that's what it is then, right.

> So, I believe there are two issues:
> 1. The firmware allocation fails with dma_alloc_noncontiguous() with
>   IOMMU enabled
> 
> 2. The helper goes to the fallback path and occasionally it worked,
>   although the pages can't be used with IOMMU.
> 
> Basically when 1 happens, we should just return an error without going
> to fallback path.  But it won't "fix" your case?

I think an explicit error would be best. The problem now is that the 
driver will think the allocation (and mapping to device) is fine and 
proceeds to program the hardware to use the address. This will then create 
an IOMMU fault down the line that is not so straighforward to recover from 
(worst case is that a full device level reset needs to be done). And given 
driver doesn't know it got a faulty mapping, it's hard to make the 
decision why the fault happened.

Br, Kai
