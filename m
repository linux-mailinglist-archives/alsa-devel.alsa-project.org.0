Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F9624296
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 13:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAD1165E;
	Thu, 10 Nov 2022 13:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAD1165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668084794;
	bh=8ZOGRqNIFGErlca3w4mZ7l56qKIw/b/3W8txHEpPIhU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJxQNOX306U9WvTVs2CZX4P2Xdeo8MpQycTzpRj8P2ZusIbXsE6lKiLRMtPNE9LbQ
	 zv+Na3lMQ62qDja5O+SC31FxuPVuUosJykJM/FFQ+H0cpr03h3BqWZjvQOsnIQbmHs
	 5pDl1yvLSx0TY1R/JyAvvznc8zGvkmTFEmPDwR2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A5EF802E8;
	Thu, 10 Nov 2022 13:52:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 608A9F8021D; Thu, 10 Nov 2022 13:52:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F671F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 13:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F671F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WRNqw+0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668084730; x=1699620730;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=8ZOGRqNIFGErlca3w4mZ7l56qKIw/b/3W8txHEpPIhU=;
 b=WRNqw+0GRwR5FUJWwkZO8bZ/ZMpP+V02GtC+qg6cAka1smB2nA5rj87T
 cD/XvH3PvA134lJRtTf68jmoUxkTVoC972c/7Tgvio8q3Ovh+cdTfS3q3
 ySmC2tgkct139BTgWW50OJtCcv9E3q/GPYAYZmZ3NWT+Toc+TCoCfinXC
 j2h+X7K2MdTT34KNT4s242xOMs06UAboK6OyB2YnYqDhqV0FcOHu7a9Ka
 WsHfRz/DxgGP6LaDN6xoCCSxdti+RXN3ETrYr82ztEVpbOU/1DRJEoLUC
 LW+2730bXTau8wzC0oKETBqSOXiCUvkhJ3KnCkxzQ+W20L9d+gyUx/qrV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="310013491"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="310013491"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 04:52:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="639605599"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="639605599"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 04:52:03 -0800
Date: Thu, 10 Nov 2022 14:52:08 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: regression with SG DMA buf allocations and IOMMU in low-mem
In-Reply-To: <alpine.DEB.2.22.394.2211041930270.3532114@eliteleevi.tm.intel.com>
Message-ID: <alpine.DEB.2.22.394.2211101451580.3532114@eliteleevi.tm.intel.com>
References: <alpine.DEB.2.22.394.2211041541090.3532114@eliteleevi.tm.intel.com>
 <87r0yiiw6s.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2211041741520.3532114@eliteleevi.tm.intel.com>
 <87k04aiuo1.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2211041930270.3532114@eliteleevi.tm.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, Alsa-devel <alsa-devel@alsa-project.org>
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

On Fri, 4 Nov 2022, Kai Vehmanen wrote:

> On Fri, 4 Nov 2022, Takashi Iwai wrote:
> 
> > On Fri, 04 Nov 2022 16:42:29 +0100, Kai Vehmanen wrote:
> > > I think an explicit error would be best. The problem now is that the 
> > > driver will think the allocation (and mapping to device) is fine and 
> > > proceeds to program the hardware to use the address. This will then create 
> > > an IOMMU fault down the line that is not so straighforward to recover from 
> > > (worst case is that a full device level reset needs to be done). And given 
> > > driver doesn't know it got a faulty mapping, it's hard to make the 
> > > decision why the fault happened.
> > 
> > OK, then what I posted in another mail (it went to nirvana) might
> > work.  Attached below again.
> 
> thanks! Let me put this through testing and get back to you next 
> week. We'll also debug a bit more what exactly goes on that leads to 
> dma_alloc_noncontiguous failing.

Takashi, the patch seems good. We've included it in multiple test runs and
seems to be working as intented, so:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

... for the patch. Rootcausing why dma_alloc_noncontiguous() fails is 
still ongoing (reproduction rate is very, very low). I've been looking at 
snd_dma_sg_fallback_alloc() and comparing to iommu dma allocator code, 
and it's curious how can we have a case where former succeeds but latter 
not. We e.g. now pass __GFP_RETRY_MAYFAIL to dma_alloc_noncontiguous(), 
but snd_dma_sg_fallback_alloc() does the alloc_pages_exact() call with 
__GFP_NORETRY. But of course it can fail when doing the mapping and 
there's more code involved. But alas this is a separate issue for 
us to track down.

Br, Kai
