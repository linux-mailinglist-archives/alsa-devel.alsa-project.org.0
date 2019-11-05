Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB79DF049F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 19:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 525BF16E2;
	Tue,  5 Nov 2019 18:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 525BF16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572976843;
	bh=WqKALuj7Atnm+wTkPvcdtXrtMxGiBpzYbaYE3rrh5+s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AUyw5pSGmD9aIvsbSNtcc6JkmyiSO7Rf7XZmD2jmCFXp5/LTjj/E1u/jYxWOqnO2i
	 +T3dFACRgfEqPIm6jBWWMFeWtPBiZnw2MVgCQanGozPXFq4XAOGcwR5Y2TTg55soCj
	 VLUXmpeg9WRazh4MPTWd9OnPmLHZhi7VqjEOXSFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9541F80535;
	Tue,  5 Nov 2019 18:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E87F80446; Tue,  5 Nov 2019 18:58:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332E0F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 18:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 332E0F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 09:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="192178727"
Received: from njdenler-mobl1.amr.corp.intel.com ([10.254.94.55])
 by orsmga007.jf.intel.com with ESMTP; 05 Nov 2019 09:58:48 -0800
Message-ID: <5d05a1419c6acee8adc8184751e42616898ea28c.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Date: Tue, 05 Nov 2019 09:58:53 -0800
In-Reply-To: <20191105080138.1260-2-tiwai@suse.de>
References: <20191105080138.1260-1-tiwai@suse.de>
 <20191105080138.1260-2-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [alsa-devel] [PATCH 1/4] ALSA: memalloc: Allow NULL device for
 SNDRV_DMA_TYPE_CONTINOUS type
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 2019-11-05 at 09:01 +0100, Takashi Iwai wrote:
> Currently we pass the artificial device pointer to the allocation
> helper in the case of SNDRV_DMA_TYPE_CONTINUOUS for passing the GFP
> flags.  But all common cases are the allocations with GFP_KERNEL, and
> it's messy to put this in each place.
> 
> In this patch, the memalloc core helper is changed to accept the NULL
> device pointer and it treats as the default mode, GFP_KERNEL, so that
> all callers can omit the complex argument but just leave NULL.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 14
> ++++++++------
>  sound/core/memalloc.c                                     |  9
> ++++++++-
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/sound/kernel-api/writing-an-alsa-
> driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-
> driver.rst
> index 132f5eb9b530..5385618fd881 100644
> --- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> +++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> @@ -3523,12 +3523,14 @@ The second argument (type) and the third
> argument (device pointer) are
>  dependent on the bus. For normal devices, pass the device pointer
>  (typically identical as ``card->dev``) to the third argument with
>  ``SNDRV_DMA_TYPE_DEV`` type. For the continuous buffer unrelated to
> 
Hi Takashi,

I have a question about the usage of snd_dma_alloc_pages() with the
SNDRV_DMA_TYPE_DEV type. I am working on adding a platform-device for
audio which is a child device of the top-level PCI device in SOF.
When I use the handle for the platform-device as the "dev" argument for
snd_dma_alloc_pages(), the dma alloc fails on some platforms (ex: Ice
Lake). But it works fine if I use the top-level PCI device instead.
Why would that be? Are there any restrictions to what devices can be
used for dma alloc?

Thanks,
Ranjani

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
