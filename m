Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BB50E0BF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF4D172C;
	Mon, 25 Apr 2022 14:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF4D172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650891067;
	bh=e1ixlH1x6MYbqXqqlpaqoSH3+9kjN6PbJ+v/IVbs95Y=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yl0UAeYcH/HvBJ3qFX0lqerUIr/y7Xq5zMImJ/RY4gIZDiQ/TXWAS3DLre4JXBxKh
	 APOddCXtgPnQlnEMEKtIWqaai8hmnVty4lx+/FWQGzOwiN98jbVFxuuNP8JcvqlXGm
	 vD6L4tUVVIblrVzF3rl6rH+8k27Vnhsu1dbt6vQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D711F800FA;
	Mon, 25 Apr 2022 14:49:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59FEDF8049C; Mon, 25 Apr 2022 14:49:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC0B5F8016A
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC0B5F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wg4S9rIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650890978; x=1682426978;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=e1ixlH1x6MYbqXqqlpaqoSH3+9kjN6PbJ+v/IVbs95Y=;
 b=Wg4S9rIBJXvCDYRukF9m5IyrxXD6/vHDIsAbCnetscmaz10iAoogyJuv
 LGoPHgBRvvj1VBIyvrYXcCUTH0XO/kPSBDynhzpfnnjv6o+OOu2jJmP3O
 AO2vuHy78PuFeJTbhne3dH567/48yPf9q9TS4GyeoeJM5lGkVy8hTJRdx
 S0r3kwSGlNmqs1DAzFgU16BqqQ9F5w7d9hxg5TplS1I7ZUxw74v51XCKT
 XN92qZuBLiCKwgnztwrXDnHkg1PXzpdw7PeA61nLI/wptsmiLC/QcFoAK
 TpbeTBlrMmyQSPmXymNAxdGu0feQiAE5SZ0urdyhsywqPaQ6vAJZz70Ax w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="264755036"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="264755036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:49:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="579270086"
Received: from mylinen-mobl1.ger.corp.intel.com (HELO [10.252.32.111])
 ([10.252.32.111])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:49:12 -0700
Message-ID: <f3a09ea6-5440-02a2-35b4-f95d0c9dfa98@linux.intel.com>
Date: Mon, 25 Apr 2022 15:49:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ALSA: memalloc: Add fallback SG-buffer free if fallback
 is used for noncontig
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.de
References: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
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



On 25/04/2022 15:28, Peter Ujfalusi wrote:
> From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
> If the dma_alloc_noncontiguous() fails in snd_dma_noncontig_alloc() we are
> taking a fallback path which should be taken into account on the free path
> since the way to free the two type of allocations are not the same.
> 
> Fixes: 925ca893b4a6 ("ALSA: memalloc: Add fallback SG-buffer allocations for x86")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
> Hi Takashi,
> 
> I'm not sure about thisa as I can not get my systems to use the fallback, but in
> theory this shiuld be done, no?

RIght, this is not needed as on the free path the callback is picked
based on the dmab->dev.type, so it should be picking the correct free
after all.

Please this patch.

> Since you have introduced the fallback, I believe there are cases when it is
> taken and it might be related to some strange memory allocation errors happening
> in SOF during firmware loading, like:
> https://github.com/thesofproject/linux/issues/3609
> https://github.com/thesofproject/linux/issues/3584
> https://github.com/thesofproject/linux/issues/3530

Still these reports are real and somehow they are pointing to dma
allocation issues.

Hrm, the fallback got backported to 5.17.4, so it might have been fixed
already?

> Regards,
> Peter
> 
>  sound/core/memalloc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 15dc7160ba34..475fd38a4a48 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -537,6 +537,13 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
>  
>  static void snd_dma_noncontig_free(struct snd_dma_buffer *dmab)
>  {
> +	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
> +	    dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
> +		/* The allocation is done with a fallback, use the matching free */
> +		snd_dma_sg_fallback_free(dmab);
> +		return;
> +	}
> +
>  	dma_vunmap_noncontiguous(dmab->dev.dev, dmab->area);
>  	dma_free_noncontiguous(dmab->dev.dev, dmab->bytes, dmab->private_data,
>  			       dmab->dev.dir);

-- 
Péter
