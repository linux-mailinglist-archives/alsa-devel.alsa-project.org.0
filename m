Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85662896F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 20:34:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BBF850;
	Mon, 14 Nov 2022 20:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BBF850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668454452;
	bh=Y2gAHTxEpbcG3AhoI+9OypJzuNN7CM9a83UGsRZdbAw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqcZtyAfTeBIMbVuoIGQlQpwk7ZiKQT46Dr7coSG3n6MF6907QyMb5yjJwfDks98q
	 irlSqsdVbB0y9CzryaSAbyt6jF2pHM/Smz+QIYxSwG1pk7Ly4UoCpfDKYCCQWfJWQj
	 VMg6lT9p1E1QFCvtUU9U+5Kp9U4T7ptpd0DdgkJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91474F80431;
	Mon, 14 Nov 2022 20:33:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65EE5F80431; Mon, 14 Nov 2022 20:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CACE0F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 20:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACE0F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YNUoZN4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668454390; x=1699990390;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Y2gAHTxEpbcG3AhoI+9OypJzuNN7CM9a83UGsRZdbAw=;
 b=YNUoZN4Jo8wgpxDGRBO1rozMhTSIbfA4dKvdmlUwokXIUDTpNIdn7jU5
 yxwMcHiS2EK4QxcZOEmFDu8ZPOPEdtXmY8DrNm1xR63AkrgXl4CtOrCBc
 3CteAda4AauD2MZrstG7GUbvDfktlVpeuIZN8J9gylTHTGT8zjgzN8XA9
 aHGOO6H5zGzwolXZabUjOKuId8K7jTMlZPBwvQgugO2uXa9+QiM7R+9XX
 GW07+rYF9IAkgKmec0GdaSiiHax4drs6kvJrFJrJG/T4ObAWbKKp4K7+9
 FAkgdSjBYeFTU3R5IemZyO3N6bA0cBXmZutB6U/ZgpGIuce3cYARqqK79 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="338853422"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="338853422"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 11:33:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="744275973"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="744275973"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 11:33:00 -0800
Date: Mon, 14 Nov 2022 21:33:02 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: regression with SG DMA buf allocations and IOMMU in low-mem
In-Reply-To: <87r0yiiw6s.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2211142121000.3532114@eliteleevi.tm.intel.com>
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

On Fri, 4 Nov 2022, Takashi Iwai wrote:

> On Fri, 04 Nov 2022 15:56:50 +0100, Kai Vehmanen wrote:
> > Looking at 5.15 code, the fallback looks very different, but 
> > in fallback we still use the DMA mapping API via snd_dma_dev_alloc()
> > so even if we go to fallback path, mapping is still ok.
> > 
> > Any ideas which way this should be fixed? Given the many changes
> > I thought it's better to ask early on the list about this.
> 
> Hrm, that's a tough issue.  Basically if dma_alloc_noncontiguous()
> fails, it's really out of memory -- at least under the situation where
> IOMMU is enabled.  The fallback path was introduced for the case where
> there is no IOMMU and noncontiguous allocation fails from the
> beginning.

follow-up to this problem. It turns out there was additional problem
with dma_alloc_noncontiguous that led to ENOMEM much more frequently
than in the past. This required following:
  - your rework in 5.16 to sound/core/memalloc.c for x86 DMA SG
  - IOMMU/DMAR enabled for the device  
  - CONFIG_DMA_REMAP=n (default 'n' on most/all x86 systems before 5.18)

... with above combination, iommu_dma_ops in drivers/iommu/dma-iommu.c 
were not defined for noncontiguous alloc/free, so the 
dma_alloc_noncontiguous() in the end went back to plain 
dma_common_alloc_pages() (single contiguous alloc), which would fail very 
easily when system was in low-mem condition.

In 5.18, this patch was added

  commit f5ff79fddf0efecca538046b5cc20fb3ded2ec4f
  Author: Christoph Hellwig <hch@lst.de>
  Date:   Sat Feb 26 16:40:21 2022 +0100

      dma-mapping: remove CONFIG_DMA_REMAP

... and this basicly fixes the issue again, even when IOMMU is enabled.

Br, Kai
