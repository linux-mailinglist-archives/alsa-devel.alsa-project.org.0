Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70F54FC15
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 19:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490AF1EE3;
	Fri, 17 Jun 2022 19:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490AF1EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655486406;
	bh=PIou0DnlbBXu21XPNS3Ea1V4LIE+vfdJaLmOJWWvK/s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+wTA3WjkjL6Wepozk7q10hcZYmMkiTrHeVxve5l6NxOLFd0Dh/xexLw8m1R5Ybly
	 baLGxg2VTLwWDZssZjyX6pQudrEfoP2NRceMjQozN2mta6hQxaKzZXnZtCfFv/e1xf
	 Kh6wbWaBkETkTxyNKRaCutUjlcXi3XAYCkacpO7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BB4F80529;
	Fri, 17 Jun 2022 19:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82539F80528; Fri, 17 Jun 2022 19:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECA9EF804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 19:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA9EF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SudYYjdv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655486341; x=1687022341;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PIou0DnlbBXu21XPNS3Ea1V4LIE+vfdJaLmOJWWvK/s=;
 b=SudYYjdvDKdZVgY7SU0PGMiROBd3PoGLrJeXiv2e0xd1hItAW9C3eq0R
 ngJaToGHeruAsKfP0N6TrF3q66+/Dd8sZ6igif9F3ovvcSnPyCZkEB2Il
 sxdK8qivj3g6B31SV39ydch+5gKL5eZDA2OqGDaeSpdng2d0d9ntx8t+x
 2qbN85wOPf7tqUsug/O4BvYIcTSbIuCIdRR0FMcgRaJ19W2nQWQCD8OBa
 dG0JWaaS9u7SDGMp1elfEgWbkyMCkRz0L1dV6dKN9BI2GyshVd2HmaAkT
 c3Yw2w1XYsK69SS3rZG19ZgMo/lXFFG9vxNrW9ZVND6SFJG1CvMhz0la8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259330304"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259330304"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 05:39:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="619251348"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 05:39:27 -0700
Message-ID: <5f787bbb-9855-91d7-75cc-bd8c4117bce5@linux.intel.com>
Date: Fri, 17 Jun 2022 15:40:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: Can anyone test with AMD onboard or HDMI/DP?
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <87bkur1nil.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87bkur1nil.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 17/06/2022 15:29, Takashi Iwai wrote:
> Hi,
> 
> can anyone have an AMD onboard audio device and/or AMD HDMI/DP output
> for testing a patch below with 5.18.x or 5.19-rc kernels?  It's a
> pending fix (for 5.18+), but currently it can't be verified whether it
> causes a regression on the actual audio I/O (while it fixes the kernel
> crash).
> 
> If the generic allocator still doesn't work as expected here, it
> should show some audio stuttering or such effect.

But the fallback was needed for some machines using SOF to be able to
load the firmware...
like this:
https://github.com/thesofproject/linux/issues/3609

> 
> Thanks!
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: memalloc: Drop x86-specific hack for WC allocations
> 
> The recent report for a crash on Haswell machines implied that the
> x86-specific (rather hackish) implementation for write-cache memory
> buffer allocation in ALSA core is buggy with the recent kernel in some
> corner cases.  This patch drops the x86-specific implementation and
> uses the standard dma_alloc_wc() & co generically for avoiding the bug
> and also for simplification.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216112
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/memalloc.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 15dc7160ba34..8cfdaee77905 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -431,33 +431,17 @@ static const struct snd_malloc_ops snd_dma_iram_ops = {
>   */
>  static void *snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
>  {
> -	void *p;
> -
> -	p = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
> -#ifdef CONFIG_X86
> -	if (p && dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
> -		set_memory_wc((unsigned long)p, PAGE_ALIGN(size) >> PAGE_SHIFT);
> -#endif
> -	return p;
> +	return dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
>  }
>  
>  static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
>  {
> -#ifdef CONFIG_X86
> -	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
> -		set_memory_wb((unsigned long)dmab->area,
> -			      PAGE_ALIGN(dmab->bytes) >> PAGE_SHIFT);
> -#endif
>  	dma_free_coherent(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
>  }
>  
>  static int snd_dma_dev_mmap(struct snd_dma_buffer *dmab,
>  			    struct vm_area_struct *area)
>  {
> -#ifdef CONFIG_X86
> -	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
> -		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
> -#endif
>  	return dma_mmap_coherent(dmab->dev.dev, area,
>  				 dmab->area, dmab->addr, dmab->bytes);
>  }
> @@ -471,10 +455,6 @@ static const struct snd_malloc_ops snd_dma_dev_ops = {
>  /*
>   * Write-combined pages
>   */
> -#ifdef CONFIG_X86
> -/* On x86, share the same ops as the standard dev ops */
> -#define snd_dma_wc_ops	snd_dma_dev_ops
> -#else /* CONFIG_X86 */
>  static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
>  {
>  	return dma_alloc_wc(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
> @@ -497,7 +477,6 @@ static const struct snd_malloc_ops snd_dma_wc_ops = {
>  	.free = snd_dma_wc_free,
>  	.mmap = snd_dma_wc_mmap,
>  };
> -#endif /* CONFIG_X86 */
>  
>  #ifdef CONFIG_SND_DMA_SGBUF
>  static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size);

-- 
Péter
