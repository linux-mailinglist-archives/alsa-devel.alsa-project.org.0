Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB5652346
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 15:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5025618C3;
	Tue, 20 Dec 2022 15:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5025618C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671548349;
	bh=vwUKN1/weYQ7e+JpH0fGZo7ZcRb7Zd8KPmAQp/z+Z+0=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aGPuJb/3cmpnVeM2o+t2GYz28KqAGbWbStAYn/+bUJLg2a7kRc9uA3G6lRXqx0rgv
	 NwgmRRL+V1vU4Ydt2rdqrgKJF6utu8wE4fqjwFakn7ALG5/3xiQiF2ZapuIqp4lLci
	 AIwyb3/Fa6PxwY3W5KCcKFPR57Ggy6kAob/GW7kA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D4EF80027;
	Tue, 20 Dec 2022 15:58:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 535D8F8025E; Tue, 20 Dec 2022 15:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE1A0F80027
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 15:58:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1A0F80027
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SkKmjirl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671548288; x=1703084288;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=vwUKN1/weYQ7e+JpH0fGZo7ZcRb7Zd8KPmAQp/z+Z+0=;
 b=SkKmjirlifYSrsDLRSXnspm4kXpyUaZ5GDJjUPIV2A2udcCkiGjla28x
 k1cwZ153W0GQ7lCk1o0rTf5UILcnxUENP4RtG7R0A7Vnv2WAj42uD9BqZ
 OnQeGlh/PFUdmJqVfYl9Fel2Mc777DDR6lwbXOheZUhjZt/aOpWw0YCTH
 CyiVoWcbYTcKaqQkZKN/oWrcWvbmDQx2RvP1gCN+G/5OE0GDzWu+hPET1
 JqFArvG6V9TzAt/JeFgdPg58coUMhCPwdcR9W2e9Affr+XLPaj4DljPXo
 JlCw583w/loKf5FK2PeNCfVoZjpEksr6hivkZl0cPEqytF+wPcGd/FmKS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299972194"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="299972194"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 06:57:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="601122249"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="601122249"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 06:57:53 -0800
Date: Tue, 20 Dec 2022 16:57:25 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] dma-mapping: reject GFP_COMP for noncohernt allocaions
In-Reply-To: <20221220082009.569785-3-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2212201653520.3532114@eliteleevi.tm.intel.com>
References: <20221220082009.569785-1-hch@lst.de>
 <20221220082009.569785-3-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, iommu@lists.linux.dev,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hey,

On Tue, 20 Dec 2022, Christoph Hellwig wrote:

> While not quite as bogus as for the dma-coherent allocations that were
> fixed earlier, GFP_COMP for these allocations has no benefits for
> the dma-direct case, and can't be supported at all by dma dma-iommu

tested the series and this fixes the issue:
Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Minor nit, typo "noncohernt allocaions" in subject of this second patch.

Br, Kai
