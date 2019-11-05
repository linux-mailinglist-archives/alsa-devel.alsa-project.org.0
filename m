Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6ACF0514
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 19:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEEC16DF;
	Tue,  5 Nov 2019 19:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEEC16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572978627;
	bh=tPIVT0q4a9DhWEdvyesW4f011dU6reURpSJA3CnJGqk=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Prv6wApz15y5W24IQZHac+HaI0U4P1flQD8AL/AwFT4CE2laACCQpcoFuq9UUzd0b
	 8uN7M0Q7vyChLuL0u0vJs2syBcEmYSNeb59q+c3m8enyceqqiFq6OrRzmVUpppoeYm
	 1b38XtZT9CBff8xX5UggupJRRkNoS0eWEa1Ea0sA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A02E1F8049B;
	Tue,  5 Nov 2019 19:28:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A572AF8049B; Tue,  5 Nov 2019 19:28:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from srv2.anyservers.com (srv2.anyservers.com [77.79.239.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF02F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 19:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF02F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net
 header.b="OimEghsr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asmblr.net; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dOxTsRxIAEId56Ksa5W7idoQ5THQHu02KUhHbwU6HOA=; b=OimEghsrf9CM8gJhQ2oLHeru50
 8KZA8oQRp3MUde6GOZ05U5xfeRXq6jjcdMItwaANDyVZeNiVQIsxqjJ6VCEa7qoGokWQciXFacNPQ
 3eoLeZ+bBsPIod6IJx5Ou5L6ah++MPgCRizyl8PeMqhZ9qboCQUpiOZJGfP1a7rbOBrZ+ANRK2ZaI
 uRKihNCpb5WMXfh7aZaKswU3cdlfIvbL5zXpbLGz1sFhOg6sCDU9ZBR1HyIYdos2NfJ+b81sCX3Hn
 zAVXFg+mx6ovQca/kJ93hAiZQwbgHOraRW7HdqZWDaECwhEqWNI6XX86vGXgfcut8x5EqLFuj/KBc
 HO7Eiwnw==;
Received: from apn-95-40-136-91.dynamic.gprs.plus.pl ([95.40.136.91]:38616
 helo=milkyway.galaxy)
 by srv2.anyservers.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.91) (envelope-from <amade@asmblr.net>)
 id 1iS3ZD-00ACt8-Bw; Tue, 05 Nov 2019 19:28:35 +0100
Date: Tue, 5 Nov 2019 19:28:44 +0100
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191105192844.43473f66@milkyway.galaxy>
In-Reply-To: <20191105080138.1260-2-tiwai@suse.de>
References: <20191105080138.1260-1-tiwai@suse.de>
 <20191105080138.1260-2-tiwai@suse.de>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv2.anyservers.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - asmblr.net
X-Get-Message-Sender-Via: srv2.anyservers.com: authenticated_id:
 amade@asmblr.net
X-Authenticated-Sender: srv2.anyservers.com: amade@asmblr.net
Cc: alsa-devel@alsa-project.org
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

On Tue,  5 Nov 2019 09:01:35 +0100
Takashi Iwai <tiwai@suse.de> wrote:

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
>  Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 14 ++++++++------
>  sound/core/memalloc.c                                     |  9 ++++++++-
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> index 132f5eb9b530..5385618fd881 100644
> --- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> +++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
> @@ -3523,12 +3523,14 @@ The second argument (type) and the third argument (device pointer) are
>  dependent on the bus. For normal devices, pass the device pointer
>  (typically identical as ``card->dev``) to the third argument with
>  ``SNDRV_DMA_TYPE_DEV`` type. For the continuous buffer unrelated to the
> -bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type and the
> -``snd_dma_continuous_data(GFP_KERNEL)`` device pointer, where
> -``GFP_KERNEL`` is the kernel allocation flag to use. For the
> -scatter-gather buffers, use ``SNDRV_DMA_TYPE_DEV_SG`` with the device
> -pointer (see the `Non-Contiguous Buffers`_
> -section).
> +bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type.
> +You can pass NULL to the device pointer in that case, which is the
> +default mode implying to allocate with ``GFP_KRENEL`` flag.
> +If you need a different GFP flag, you can pass it by encoding the flag
> +into the device pointer via a special macro
> +:c:func:`snd_dma_continuous_data()`.
> +For the scatter-gather buffers, use ``SNDRV_DMA_TYPE_DEV_SG`` with the
> +device pointer (see the `Non-Contiguous Buffers`_ section).
>  
>  Once the buffer is pre-allocated, you can use the allocator in the
>  ``hw_params`` callback:
> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 6850d13aa98c..e56f84fbd659 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -99,6 +99,13 @@ static void snd_free_dev_iram(struct snd_dma_buffer *dmab)
>   *
>   */
>  
> +static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev)
> +{
> +	if (!dev)
> +		return GFP_KRENEL;

There is a typo, you remove it in next patch, but it may cause problem
with bisects.


> +	else
> +		return (__force gfp_t)(unsigned long)dev;
> +}
>  
>  /**
>   * snd_dma_alloc_pages - allocate the buffer area according to the given type
> @@ -129,7 +136,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
>  	switch (type) {
>  	case SNDRV_DMA_TYPE_CONTINUOUS:
>  		dmab->area = alloc_pages_exact(size,
> -					       (__force gfp_t)(unsigned long)device);
> +					       snd_mem_get_gfp_flags(device));
>  		dmab->addr = 0;
>  		break;
>  #ifdef CONFIG_HAS_DMA

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
