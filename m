Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD891F4CEC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 07:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77AE1166C;
	Wed, 10 Jun 2020 07:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77AE1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591767043;
	bh=1Ic34RK2N9+LOTumKg3gMZDmYISzeZp+gRqdkN/ZQkg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpthvFTFKm4yohA8fBtwSWnzp8gqiVB2iLQiCRVylWhTXaOVNzxmG4+P9d1Q59L+l
	 U8cVX1dXdexh36BjZCF5zTPeXjooPb1tCZuLhuiqe+LH042vjQu50O2M5YicZStxBt
	 ARuOYOqHhTFJ7hll2xBBJOyltjykg3Mwa2vt6Azs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A74F9F80088;
	Wed, 10 Jun 2020 07:29:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E99E9F80088; Wed, 10 Jun 2020 07:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E92F80088
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 07:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E92F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="MP3qU7v9"
Received: by mail-pj1-x1044.google.com with SMTP id k2so386305pjs.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 22:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=C73zglBEMDME+CuVXUOa9MjlW4GPGi1nqlramfoTPEc=;
 b=MP3qU7v9ubA5PsvIyBe22857HQx1uPmTikkmoVl/+DWB2/6bH8no5xBs8enWPSEGPs
 5VcdODk+KczV28hHqzEfvUZ9628Dm+p8XahYiutGXrES6XFxDJynneRvSg0F3rvb1+2M
 gpI/0BLnny7aU41jjv7OEEX9p58UtD4D83Vf1l1XrCzmlDCtj75XfbALQvo/gCWgww9P
 CfGxx2FBKrdVlzmTwj/IUl3nBYswJ8Ej/TXeB0vJVCOAq6r3UfmnCvB+jBoHg767wI1m
 V9taJ7Fq3JajMl2YoPwgyQ8Et5Nm8i/eKBEnmbU/mOyeTY/+lEnzknBEOecFVgDjCPlp
 VLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=C73zglBEMDME+CuVXUOa9MjlW4GPGi1nqlramfoTPEc=;
 b=mzvw/4saueW8T5NiY4+Ea0fHenRo80i1Liflw/nd0o7YQwggrlnJ/j7zf9tkQ49af/
 vG0fzGP246UEbBBBsYWNLwnLVSBrZh0uV/cZJsZqUpRlenKP3JH+t9IIYze72KzzmDAX
 i3CaW9L8Kds2IJ+24SRIYliIS96taNi7YYCIAn/nBQ8mdEahxNxRG+dBXBtXOdymx7NJ
 3wu4cwLpUCS06K5kKl/eoKWGIcau3EQds4AqIxBItrO7Gqq5HpXulXniqYRJlLNzL+Ta
 oWp9D3pUCqvSI55uL9x0no+A4B3pzooaZuL96ClVsQqDNV6tZSCFtGVj774x/X+yR/qm
 0s8g==
X-Gm-Message-State: AOAM532XdAUJrcoknN9MiDNZJded7dFBpwSnbIcTz+K7R4OACUKRul4f
 iJVQsZSfs9Hqke7ATsJsDLG1lw==
X-Google-Smtp-Source: ABdhPJzu5FJVYb5R0O5mf0gZObl8Y1JRKbIsp1Gc70W/r+j0vRWjar/v+mzNeEGFzkzPksaIYHxV6g==
X-Received: by 2002:a17:902:aa92:: with SMTP id
 d18mr1602231plr.127.1591766807153; 
 Tue, 09 Jun 2020 22:26:47 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id x2sm11477140pfj.142.2020.06.09.22.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 22:26:46 -0700 (PDT)
Date: Tue, 9 Jun 2020 22:26:45 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
In-Reply-To: <20200609054306.GA9606@lst.de>
Message-ID: <alpine.DEB.2.22.394.2006092213110.154443@chino.kir.corp.google.com>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200608061950.GA17476@lst.de> <1591624340.z01ejtod28.none@localhost>
 <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
 <20200609054306.GA9606@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 hpa@zytor.com, tglx@linutronix.de
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

On Tue, 9 Jun 2020, Christoph Hellwig wrote:

> > Working theory is that CONFIG_DMA_NONCOHERENT_MMAP getting set is causing 
> > the error_code in the page fault path.  Debugging with Alex off-thread we 
> > found that dma_{alloc,free}_from_pool() are not getting called from the 
> > new code in dma_direct_{alloc,free}_pages() and he has not enabled 
> > mem_encrypt.
> 
> While DMA_COHERENT_POOL absolutely should not select DMA_NONCOHERENT_MMAP
> (and you should send your patch either way), I don't think it is going
> to make a difference here, as DMA_NONCOHERENT_MMAP just means we
> allows mmaps even for non-coherent devices, and we do not support
> non-coherent devices on x86.
> 

We haven't heard yet whether the disabling of DMA_NONCOHERENT_MMAP fixes 
Aaron's BUG(), and the patch included some other debugging hints that will 
be printed out in case it didn't, but I'll share what we figured out:

In 5.7, his config didn't have DMA_DIRECT_REMAP or DMA_REMAP (it did have 
GENERIC_ALLOCATOR already).  AMD_MEM_ENCRYPT is set.  

In Linus HEAD, AMD_MEM_ENCRYPT now selects DMA_COHERENT_POOL so it sets 
the two aforementioned options.

We also figured out that dma_should_alloc_from_pool() is always false up 
until the BUG().  So what else changed?  Only the selection of DMA_REMAP 
and DMA_NONCOHERENT_MMAP.

The comment in the Kconfig about setting "an uncached bit in the 
pagetables" led me to believe it may be related to the splat he's seeing 
(reserved bit violation).  So I suggested dropping DMA_NONCOHERENT_MMAP 
from his Kconfig for testing purposes.



If this option should not implicitly be set for DMA_COHERENT_POOL, then I 
assume we need yet another Kconfig option since DMA_REMAP selected it 
before and DMA_COHERENT_POOL selects DMA_REMAP :)

So do we want a DMA_REMAP_BUT_NO_DMA_NONCOHERENT_MMAP?  Decouple DMA_REMAP 
from DMA_NONCOHERENT_MMAP and select the latter wherever the former was 
set (but not DMA_COHERENT_POOL)?  Something else?
