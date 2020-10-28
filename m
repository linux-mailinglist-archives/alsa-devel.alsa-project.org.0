Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1974429E4FF
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:50:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA2D165D;
	Thu, 29 Oct 2020 08:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA2D165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603957849;
	bh=QEXxMmSUj2Vd+E59vReAFx2mSILQlDhT0GF7L4nT79k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJ2052nhOFjdL4p7tn4LLMsvY0z3y//v0e6FAG8GgixmdetYDBd81ViwKV8DrdMCn
	 g1b3wfO+dWckaEGQThLYo+U7miTmPe6cWjxS5FsMDgSRjLsLjTgh9uhr0w2URKHd0y
	 np+6jvI/oFkZKIWWTI4muFEpo0E8a1pTxQyYzLSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4CFF8021D;
	Thu, 29 Oct 2020 08:49:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53A10F80212; Wed, 28 Oct 2020 09:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB51F800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 09:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB51F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qaRJrHsp"
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50EBD2465E;
 Wed, 28 Oct 2020 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603874836;
 bh=QEXxMmSUj2Vd+E59vReAFx2mSILQlDhT0GF7L4nT79k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qaRJrHspISAML2s3M6ow+As8fnofPQBijjHMbHMdR+I3658FQOTlnTwjnXNz0MlyX
 aAw8A460MACJ1IDHW1x+02Uv9Atn0b3fP/Jb97ArZSIbrkmzQ92h9/ls1ePhoOhjJH
 6jiwMskK6vWDnhTMrSRMXIc62N90Wg6wJ7a8TvRg=
Date: Wed, 28 Oct 2020 10:47:03 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/8] mm: slab: provide krealloc_array()
Message-ID: <20201028084703.GC1428094@kernel.org>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027121725.24660-2-brgl@bgdev.pl>
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
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

On Tue, Oct 27, 2020 at 01:17:18PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> When allocating an array of elements, users should check for
> multiplication overflow or preferably use one of the provided helpers
> like: kmalloc_array().
> 
> There's no krealloc_array() counterpart but there are many users who use
> regular krealloc() to reallocate arrays. Let's provide an actual
> krealloc_array() implementation.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/slab.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index dd6897f62010..0e6683affee7 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -592,6 +592,17 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
>  	return __kmalloc(bytes, flags);
>  }
>  

Can you please add kernel-doc here and a word or two about this function
to Documentation/core-api/memory-allocation.rst?

> +static __must_check inline void *
> +krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags)
> +{
> +	size_t bytes;
> +
> +	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
> +		return NULL;
> +
> +	return krealloc(p, bytes, flags);
> +}
> +
>  /**
>   * kcalloc - allocate memory for an array. The memory is set to zero.
>   * @n: number of elements.
> -- 
> 2.29.1
> 
> 

-- 
Sincerely yours,
Mike.
