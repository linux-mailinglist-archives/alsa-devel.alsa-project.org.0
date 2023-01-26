Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F367CB61
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 13:55:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBEFE79;
	Thu, 26 Jan 2023 13:54:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBEFE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674737718;
	bh=54bV+SCC7EhFNTt/DzgfOmlfe0MOnAjFtZzcj58LFsg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Of6LEI0ZWPIJ69MeoTINl28HRm+/WfwFuaQ4isuKre38hXK4GZfx4EAumNxxMjrK5
	 rCX0mtIRs9551Wgt0X9wYcYZVvB6yT23NArJu1ZaAI7rjp0MVtOpL1X5aTW4UEzrjH
	 +l1FkaayzVa2rOUyH1Q9GAj02HJLpR1yOnQqZt9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB71F8027D;
	Thu, 26 Jan 2023 13:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53E9CF802DF; Thu, 26 Jan 2023 13:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88D97F8027D
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 13:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D97F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=JlL7ZLAd; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=dSMrHfKe
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C829D3200A64;
 Thu, 26 Jan 2023 07:54:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 26 Jan 2023 07:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674737640; x=
 1674824040; bh=I6NePXLS/3EvOo3e4MuwOlvgg+bhGruHrCiCaXD+Wf4=; b=J
 lL7ZLAd1RRYtaofGduAZ8qbRZD04IQu59rY/HZVkq6TuB8c+uvTnvpt/F8rDlGmB
 dHeDtvsiQ4iW8HKyDI8YQmhHdX3OEEpQA2dNnJgHro4butuGsAi48e8qHMR/Ft5C
 YDyA0QxJ/V2mDlUUg5urpfJ3OcF+kcGeCa1gwRO/l25G4QAbK9ygeZLGoN2U9Xs8
 6gG3TSpeyLUOukdaeNuFwyGWiLAzPZCdPo60b+ph/64I4gZoL83lbLZ0d4xa6cb5
 v402qo7wE8tri2119NuYo+Vt+BzN1FIwU1u+xuUq8CJMp8wzW5ezq7/LNqADYgNy
 7DICfz3uRp16iWLM23TWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674737640; x=1674824040; bh=I6NePXLS/3EvOo3e4MuwOlvgg+bh
 GruHrCiCaXD+Wf4=; b=dSMrHfKexYEaAOJP027QsaWCtV86Z0vLW1WAo4vjzFZ5
 r9HF+6kQeCduQ7ZsJXsyzSOrToxUJb1PW+hP6I8yjh5HW6IR0RU/3hHVd5B9eWOW
 rFba+shq0EPCXgzh+hbypI2aeGG/Om/INC3NhJMnLEjx5US35LUQJ29Yp1DKSuVS
 ZeSMc8LD6TZc7dCnnOBOvalXBjx1tQXYvp++hMxS/jB7YxIJAzBJjtKc/lGPn4Lx
 n4Ws6qr5uFRvD9S1J8O4UHEaDXRKGeDd2l3dSwtIoOSkdzI8c8cPHT4S/HtWYUod
 f4v7yJVHExltDrcOCjCTIZWvMtzpH88Og4UVyJPpTQ==
X-ME-Sender: <xms:6HfSYxKQPO9oIhffkCtltXxV1NkvmKEPOfLpFdIuEmBvxacNzLyyfw>
 <xme:6HfSY9Kfx_o7pOdqdf2ayOhf4S6dc0fl1PwKXTUcV8eT-YL3Fr074Jd1B4RRvdEyP
 Mv72by1W9LiNw>
X-ME-Received: <xmr:6HfSY5sQjonGi5pv9xkqAHfz1SFrSGy6jAV4LjjN0j3h_IfR9M1VvYB9AmWXtHd9TT7JvX309EFP4JZ2jBUNrbGjmc9n6K4EK8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:6HfSYybALzITZ4LD6i66hHZYrNyvX_Fopj2CoTAcj1NGRM-5zYLkNg>
 <xmx:6HfSY4a4Qph0KOwG7WE5waWgjzfpFhpPX_HRzsdfx5GMjCVUPi0jTw>
 <xmx:6HfSY2CRn5brCskbr0PgOt61AfV94OEym0UjvDtlLA5Ljd29TKBS_Q>
 <xmx:6HfSY-06HUf8TuuhOPFXsjaoN1Q36APiHtdOhyyoxzNrt0sckXOVuQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 07:53:59 -0500 (EST)
Date: Thu, 26 Jan 2023 13:53:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: memalloc: Workaround for Xen PV
Message-ID: <Y9J35B6XDtPNmO3d@mail-itl>
References: <20230125153104.5527-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KrqZ8QIy3aQSt1g5"
Content-Disposition: inline
In-Reply-To: <20230125153104.5527-1-tiwai@suse.de>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--KrqZ8QIy3aQSt1g5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Jan 2023 13:53:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: memalloc: Workaround for Xen PV

On Wed, Jan 25, 2023 at 04:31:04PM +0100, Takashi Iwai wrote:
> We change recently the memalloc helper to use
> dma_alloc_noncontiguous() and the fallback to get_pages().  Although
> lots of issues with IOMMU (or non-IOMMU) have been addressed, but
> there seems still a regression on Xen PV.  Interestingly, the only
> proper way to work is use dma_alloc_coherent().  The use of
> dma_alloc_coherent() for SG buffer was dropped as it's problematic on
> IOMMU systems.  OTOH, Xen PV has a different way, and it's fine to use
> the dma_alloc_coherent().
>=20
> This patch is a workaround for Xen PV.  It consists of the following
> changes:
> - For Xen PV, use only the fallback allocation without
>   dma_alloc_noncontiguous()
> - In the fallback allocation, use dma_alloc_coherent();
>   the DMA address from dma_alloc_coherent() is returned in get_addr
>   ops
> - The DMA addresses are stored in an array; the first entry stores the
>   number of allocated pages in lower bits, which are referred at
>   releasing pages again
>=20
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocat=
ions again")
> Fixes: 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer with =
IOMMU")
> Link: https://lore.kernel.org/r/87tu256lqs.wl-tiwai@suse.de
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Uptime ~20h and it still works, so
Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>=20
> Marek, this is another respin of the fix.
> Please check this one and report back.  Thanks!
>=20
>  sound/core/memalloc.c | 87 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 69 insertions(+), 18 deletions(-)
>=20
> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 81025f50a542..f901504b5afc 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -541,16 +541,15 @@ static void *snd_dma_noncontig_alloc(struct snd_dma=
_buffer *dmab, size_t size)
>  	struct sg_table *sgt;
>  	void *p;
> =20
> +#ifdef CONFIG_SND_DMA_SGBUF
> +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +		return snd_dma_sg_fallback_alloc(dmab, size);
> +#endif
>  	sgt =3D dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
>  				      DEFAULT_GFP, 0);
>  #ifdef CONFIG_SND_DMA_SGBUF
> -	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
> -		if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG)
> -			dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> -		else
> -			dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
> +	if (!sgt && !get_dma_ops(dmab->dev.dev))
>  		return snd_dma_sg_fallback_alloc(dmab, size);
> -	}
>  #endif
>  	if (!sgt)
>  		return NULL;
> @@ -717,19 +716,38 @@ static const struct snd_malloc_ops snd_dma_sg_wc_op=
s =3D {
> =20
>  /* Fallback SG-buffer allocations for x86 */
>  struct snd_dma_sg_fallback {
> +	bool use_dma_alloc_coherent;
>  	size_t count;
>  	struct page **pages;
> +	/* DMA address array; the first page contains #pages in ~PAGE_MASK */
> +	dma_addr_t *addrs;
>  };
> =20
>  static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
>  				       struct snd_dma_sg_fallback *sgbuf)
>  {
> -	bool wc =3D dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> -	size_t i;
> -
> -	for (i =3D 0; i < sgbuf->count && sgbuf->pages[i]; i++)
> -		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
> +	size_t i, size;
> +
> +	if (sgbuf->pages && sgbuf->addrs) {
> +		i =3D 0;
> +		while (i < sgbuf->count) {
> +			if (!sgbuf->pages[i] || !sgbuf->addrs[i])
> +				break;
> +			size =3D sgbuf->addrs[i] & ~PAGE_MASK;
> +			if (WARN_ON(!size))
> +				break;
> +			if (sgbuf->use_dma_alloc_coherent)
> +				dma_free_coherent(dmab->dev.dev, size << PAGE_SHIFT,
> +						  page_address(sgbuf->pages[i]),
> +						  sgbuf->addrs[i] & PAGE_MASK);
> +			else
> +				do_free_pages(page_address(sgbuf->pages[i]),
> +					      size << PAGE_SHIFT, false);
> +			i +=3D size;
> +		}
> +	}
>  	kvfree(sgbuf->pages);
> +	kvfree(sgbuf->addrs);
>  	kfree(sgbuf);
>  }
> =20
> @@ -738,24 +756,36 @@ static void *snd_dma_sg_fallback_alloc(struct snd_d=
ma_buffer *dmab, size_t size)
>  	struct snd_dma_sg_fallback *sgbuf;
>  	struct page **pagep, *curp;
>  	size_t chunk, npages;
> +	dma_addr_t *addrp;
>  	dma_addr_t addr;
>  	void *p;
> -	bool wc =3D dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> +
> +	/* correct the type */
> +	if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_SG)
> +		dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
> +	else if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG)
> +		dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> =20
>  	sgbuf =3D kzalloc(sizeof(*sgbuf), GFP_KERNEL);
>  	if (!sgbuf)
>  		return NULL;
> +	sgbuf->use_dma_alloc_coherent =3D cpu_feature_enabled(X86_FEATURE_XENPV=
);
>  	size =3D PAGE_ALIGN(size);
>  	sgbuf->count =3D size >> PAGE_SHIFT;
>  	sgbuf->pages =3D kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERN=
EL);
> -	if (!sgbuf->pages)
> +	sgbuf->addrs =3D kvcalloc(sgbuf->count, sizeof(*sgbuf->addrs), GFP_KERN=
EL);
> +	if (!sgbuf->pages || !sgbuf->addrs)
>  		goto error;
> =20
>  	pagep =3D sgbuf->pages;
> -	chunk =3D size;
> +	addrp =3D sgbuf->addrs;
> +	chunk =3D (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs=
 */
>  	while (size > 0) {
>  		chunk =3D min(size, chunk);
> -		p =3D do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
> +		if (sgbuf->use_dma_alloc_coherent)
> +			p =3D dma_alloc_coherent(dmab->dev.dev, chunk, &addr, DEFAULT_GFP);
> +		else
> +			p =3D do_alloc_pages(dmab->dev.dev, chunk, &addr, false);
>  		if (!p) {
>  			if (chunk <=3D PAGE_SIZE)
>  				goto error;
> @@ -767,17 +797,25 @@ static void *snd_dma_sg_fallback_alloc(struct snd_d=
ma_buffer *dmab, size_t size)
>  		size -=3D chunk;
>  		/* fill pages */
>  		npages =3D chunk >> PAGE_SHIFT;
> +		*addrp =3D npages; /* store in lower bits */
>  		curp =3D virt_to_page(p);
> -		while (npages--)
> +		while (npages--) {
>  			*pagep++ =3D curp++;
> +			*addrp++ |=3D addr;
> +			addr +=3D PAGE_SIZE;
> +		}
>  	}
> =20
>  	p =3D vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
>  	if (!p)
>  		goto error;
> +
> +	if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
> +		set_pages_array_wc(sgbuf->pages, sgbuf->count);
> +
>  	dmab->private_data =3D sgbuf;
>  	/* store the first page address for convenience */
> -	dmab->addr =3D snd_sgbuf_get_addr(dmab, 0);
> +	dmab->addr =3D sgbuf->addrs[0] & PAGE_MASK;
>  	return p;
> =20
>   error:
> @@ -787,10 +825,23 @@ static void *snd_dma_sg_fallback_alloc(struct snd_d=
ma_buffer *dmab, size_t size)
> =20
>  static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
>  {
> +	struct snd_dma_sg_fallback *sgbuf =3D dmab->private_data;
> +
> +	if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
> +		set_pages_array_wb(sgbuf->pages, sgbuf->count);
>  	vunmap(dmab->area);
>  	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
>  }
> =20
> +static dma_addr_t snd_dma_sg_fallback_get_addr(struct snd_dma_buffer *dm=
ab,
> +					       size_t offset)
> +{
> +	struct snd_dma_sg_fallback *sgbuf =3D dmab->private_data;
> +	size_t index =3D offset >> PAGE_SHIFT;
> +
> +	return (sgbuf->addrs[index] & PAGE_MASK) | (offset & ~PAGE_MASK);
> +}
> +
>  static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
>  				    struct vm_area_struct *area)
>  {
> @@ -805,8 +856,8 @@ static const struct snd_malloc_ops snd_dma_sg_fallbac=
k_ops =3D {
>  	.alloc =3D snd_dma_sg_fallback_alloc,
>  	.free =3D snd_dma_sg_fallback_free,
>  	.mmap =3D snd_dma_sg_fallback_mmap,
> +	.get_addr =3D snd_dma_sg_fallback_get_addr,
>  	/* reuse vmalloc helpers */
> -	.get_addr =3D snd_dma_vmalloc_get_addr,
>  	.get_page =3D snd_dma_vmalloc_get_page,
>  	.get_chunk_size =3D snd_dma_vmalloc_get_chunk_size,
>  };
> --=20
> 2.35.3
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KrqZ8QIy3aQSt1g5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPSd+UACgkQ24/THMrX
1ywOqwf+MDBzIkP8Tzm8LxTtDSlK+cF/g8WpTXO3vx8eMIuK6IfSJPEcBWqax3ZJ
XVgik9avrJDNRz7idG7Jy18knvoBsxW/N1oUcrewfJxKs2g9hbCrmvagdZpenQgj
W+s+Mb6OdA9j+0/q/UA86/k+KTQpkGi9FGzyHH91SzTsiRLLnKS136tgBIJjM0/l
DjIEftjXai21JaOeGyR35EkjXhmfXiZsVBHM3sIcQVhjAK/N5aYQiEJjdkaq3Yme
WE0MR5C1mbm8NwYuRIBM8JTvFqykaEOzyL7LG8tTNlKM7QoKFCuwz6u7ujKbz5WA
4ub2vCU4O264uba+hfSpJC6QQ0EmaQ==
=lakY
-----END PGP SIGNATURE-----

--KrqZ8QIy3aQSt1g5--
