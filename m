Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 199DE619AE1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 16:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F6F81657;
	Fri,  4 Nov 2022 16:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F6F81657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667574213;
	bh=NOmQAkybGnry5YOm/QmZIPwGIu3cjj4p/Y9BhZ0EntA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agABltqK33gGtbt8QkDctbjZxj4uqJIuCKKqADVkI7QbC6JIO7omq7+ueMPdy97yg
	 HNXR9J5TZ6QrzMPNtGk9qHpViy4Z1TLYhnN68TsQD8atOQz1g47TJVE/0xJGCfQp5e
	 VUZOyfbyXhNljznZmvikvt02bxuRZp57qR49dHSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A26F8047D;
	Fri,  4 Nov 2022 16:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42ADFF80155; Fri,  4 Nov 2022 16:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9866F80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 16:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9866F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Bp0rctJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667574153; x=1699110153;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=NOmQAkybGnry5YOm/QmZIPwGIu3cjj4p/Y9BhZ0EntA=;
 b=Bp0rctJI3VZyIubq1cYCdEwLP6Q9uNqRiHkvanwNSo6iM5UgFGchwP6i
 n0bRwSX/B8tjPSPxtyjrUVgdoXjNI7UyUBt63ZYOZXAAL08da2rbrlhPZ
 Gi9j+a5/PgRsLr9Dk++cjT6AFeETwklA4M1j4KoIPMeg+5tXZzEqPbZmm
 ocLeChYYu8fwXUoyNOzdIA024difN5LyaCxjZlaZ8asnf2AVZmaCA3wqO
 Vx4TXjrXClvymldaacJJm5QONq5cGpMPR/pPz7PI1C8EaH2YKxAZtLu8+
 +A97ICxwLtSD0S8ozYZLtDRDmV8nxk9zHjtLNwZI3XulwXtZXVhjAam+e w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="309974478"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="309974478"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:02:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="613089017"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="613089017"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:02:03 -0700
Date: Fri, 4 Nov 2022 17:02:13 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: regression with SG DMA buf allocations and IOMMU in low-mem
In-Reply-To: <alpine.DEB.2.22.394.2211041541090.3532114@eliteleevi.tm.intel.com>
Message-ID: <alpine.DEB.2.22.394.2211041701130.3532114@eliteleevi.tm.intel.com>
References: <alpine.DEB.2.22.394.2211041541090.3532114@eliteleevi.tm.intel.com>
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

Hi Takashi and list,

I've been debugging a SOF DSP load fail on VT-D/IOMMU systems [1] and 
that brought me to these two commits from you:

"ALSA: memalloc: Add fallback SG-buffer allocations for x86"
and

"ALSA: memalloc: Revive x86-specific WC page allocations again"

We have an allocation with:
snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, &pci->dev, size, dmab);

.. but in rare low-memory cases, the dma_alloc_noncontiguous()
call will fail in core/memalloc.c and we go to the fallback path.

So we go to snd_dma_sg_fallback_alloc(), but here it seems something is 
missing. The pages are not allocated with DMA mapping API anymore, so 
IOMMU won't know about the memory and in our case the DSP load will fail 
to a IOMMU fault. 

Looking at 5.15 code, the fallback looks very different, but 
in fallback we still use the DMA mapping API via snd_dma_dev_alloc()
so even if we go to fallback path, mapping is still ok.

Any ideas which way this should be fixed? Given the many changes
I thought it's better to ask early on the list about this.

[1] https://github.com/thesofproject/linux/issues/3915

Br, Kai
