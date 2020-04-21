Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E891B1E9B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 08:10:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EF0F168A;
	Tue, 21 Apr 2020 08:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EF0F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587449417;
	bh=6FEPDM4+qE+1+hPvKAms28q8OeRQczUw9wgSaRsmMBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhDvmoVFhg4b1s/y/UO3We7mmyKkgmtN3WNxEhqbmjl/GDCOksvM6UIChavo8xSDP
	 4LPb/vJLpLfptHlfJ+fX0Ityuel4stmphS05ui+OlIEW04DDLktTxrB/i0O6Sp7VUU
	 XSVQ7ypZzhtE4Rle7EfDw1QR2tw9+Z5RN2plamK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFDFF802BE;
	Tue, 21 Apr 2020 08:05:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44777F801D9; Tue, 21 Apr 2020 03:12:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0F5CF8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 03:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0F5CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.b="jBHIXMMq"
Received: by mail-ej1-x644.google.com with SMTP id gr25so9592119ejb.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 18:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wp/4OUZ+t6DtrNUNi8QED2tYXGNcm7p7HQx9y7jVsyE=;
 b=jBHIXMMqmv7Aus032CJ29TCsVbNmCcWvBL1qZYR+MTvz1Np/UQLslt3cjqrBpRQ7A+
 HVoyGy2PNpEomcWwRjHmW8Ak2N/EoxZMA1MCSPmiEBAije7BXceQJc3pWuaMlFYjZCGw
 +dbOr9lgbJ1NksYu03hyjp/+zZGgTDNZTrbIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wp/4OUZ+t6DtrNUNi8QED2tYXGNcm7p7HQx9y7jVsyE=;
 b=aTle6IGCPR4s3F9YPBTAzkqRtlO6V9503zSX7LmvY9hXNKvjI1oin5B0+9sx7eDlME
 +IPDyco4IHJRGZWdGzLBhJIUUAGOPVJMxgpvPJik8wh9que3bi4/ntxpTKm/zCHGPRpJ
 cXbh8lfgV3KPwG1vsZ7VyPdrHX+7lI0IYdsw3MdF3ej+K6Q3LEQkklP3zpAFduKaXUI1
 +OoMqv4pr7obR+kgW0NVP2w/ZNPXbStFCgSG6O/Gstg9tbDKoG96RFDBxjkTidNOpou7
 2fYGHIVgJQ6+kl4WX9EahUQuMMmMKVj1sTjZtd/58kC3EEoCJAZnOdIO9ppgfN7Rasiq
 xccw==
X-Gm-Message-State: AGi0PuYHpY6elGCwTnw7zwgA6wkJSDcFnenKZEtAS74CR1ezK+ZtVVWg
 GT8KsdUmNDC1LW70IV+zXuNV2yTl4B6C/TkBfTU=
X-Google-Smtp-Source: APiQypIwX6LNiArHUl2jR5jEUHw3irQha6rujNUKiFvGPogUg6tL4fPWSZU+QH9PJrbsYVIAn12O5Owrj2LpHTm1d+Q=
X-Received: by 2002:a17:906:a857:: with SMTP id
 dx23mr18970317ejb.52.1587431523767; 
 Mon, 20 Apr 2020 18:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <4006d9c8e69f8eaccee954899f6b5fb76240d00b.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <4006d9c8e69f8eaccee954899f6b5fb76240d00b.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 01:11:51 +0000
Message-ID: <CACPK8XfCS0X_YsuL8Bq-a3gNgEBoTb8=cK6yBvK4qVwvATZ68A@mail.gmail.com>
Subject: Re: [PATCH 4/5] powerpc: Replace _ALIGN() by ALIGN()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 21 Apr 2020 08:04:35 +0200
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
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

On Mon, 20 Apr 2020 at 18:39, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> _ALIGN() is specific to powerpc
> ALIGN() is generic and does the same
>
> Replace _ALIGN() by ALIGN()
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
>  arch/powerpc/include/asm/nohash/32/pgtable.h | 2 +-
>  arch/powerpc/kernel/prom_init.c              | 8 ++++----
>  arch/powerpc/platforms/powermac/bootx_init.c | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 53b5c93eaf5d..0d4bccb4b9f2 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -188,7 +188,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
>   * memory shall not share segments.
>   */
>  #if defined(CONFIG_STRICT_KERNEL_RWX) && defined(CONFIG_MODULES)
> -#define VMALLOC_START ((_ALIGN((long)high_memory, 256L << 20) + VMALLOC_OFFSET) & \
> +#define VMALLOC_START ((ALIGN((long)high_memory, 256L << 20) + VMALLOC_OFFSET) & \
>                        ~(VMALLOC_OFFSET - 1))
>  #else
>  #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index 5b4d4c4297e1..4315d40906a0 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -110,7 +110,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
>   */
>  #define VMALLOC_OFFSET (0x1000000) /* 16M */
>  #ifdef PPC_PIN_SIZE
> -#define VMALLOC_START (((_ALIGN((long)high_memory, PPC_PIN_SIZE) + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
> +#define VMALLOC_START (((ALIGN((long)high_memory, PPC_PIN_SIZE) + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))

Perhaps this once needed to be more flexiable, but now it always
aligns to 256M and then to 16MB.

>  #else
>  #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))

This is an open coded align to VMALLOC_OFFSET.

>  #endif
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 3a5a7db4564f..e3a9fde51c4f 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2426,7 +2426,7 @@ static void __init *make_room(unsigned long *mem_start, unsigned long *mem_end,
>  {
>         void *ret;
>
> -       *mem_start = _ALIGN(*mem_start, align);
> +       *mem_start = ALIGN(*mem_start, align);
>         while ((*mem_start + needed) > *mem_end) {
>                 unsigned long room, chunk;
>
> @@ -2562,7 +2562,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
>                                 *lp++ = *p;
>                 }
>                 *lp = 0;
> -               *mem_start = _ALIGN((unsigned long)lp + 1, 4);
> +               *mem_start = ALIGN((unsigned long)lp + 1, 4);
>         }
>
>         /* get it again for debugging */
> @@ -2608,7 +2608,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
>                 /* push property content */
>                 valp = make_room(mem_start, mem_end, l, 4);
>                 call_prom("getprop", 4, 1, node, pname, valp, l);
> -               *mem_start = _ALIGN(*mem_start, 4);
> +               *mem_start = ALIGN(*mem_start, 4);
>
>                 if (!prom_strcmp(pname, "phandle"))
>                         has_phandle = 1;
> @@ -2667,7 +2667,7 @@ static void __init flatten_device_tree(void)
>                 prom_panic ("couldn't get device tree root\n");
>
>         /* Build header and make room for mem rsv map */
> -       mem_start = _ALIGN(mem_start, 4);
> +       mem_start = ALIGN(mem_start, 4);
>         hdr = make_room(&mem_start, &mem_end,
>                         sizeof(struct boot_param_header), 4);
>         dt_header_start = (unsigned long)hdr;
> diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
> index c3374a90952f..9d4ecd292255 100644
> --- a/arch/powerpc/platforms/powermac/bootx_init.c
> +++ b/arch/powerpc/platforms/powermac/bootx_init.c
> @@ -386,7 +386,7 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
>         hdr->dt_strings_size = bootx_dt_strend - bootx_dt_strbase;
>
>         /* Build structure */
> -       mem_end = _ALIGN(mem_end, 16);
> +       mem_end = ALIGN(mem_end, 16);
>         DBG("Building device tree structure at: %x\n", mem_end);
>         hdr->off_dt_struct = mem_end - mem_start;
>         bootx_scan_dt_build_struct(base, 4, &mem_end);
> @@ -404,7 +404,7 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
>          * also bump mem_reserve_cnt to cause further reservations to
>          * fail since it's too late.
>          */
> -       mem_end = _ALIGN(mem_end, PAGE_SIZE);
> +       mem_end = ALIGN(mem_end, PAGE_SIZE);
>         DBG("End of boot params: %x\n", mem_end);
>         rsvmap[0] = mem_start;
>         rsvmap[1] = mem_end;
> --
> 2.25.0
>
