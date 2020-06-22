Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5F20336F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 11:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B911682;
	Mon, 22 Jun 2020 11:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B911682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592818400;
	bh=7Dhy0JQgwXcSWHQUb9FJSbsPMarPaVEYA6xhHmOKXbU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBjmQMbSFyrxxLWyOqX+6CF/X5je3pZjpv2EaO8ebQxfhFnMJjq6MVZGJcyE8ONtQ
	 owjMddC0LB8oMvyylcM3WmH0J1zmbAXsOaQE+/rgX3ILl5Xph6zrmGvzSmQ5liyQG1
	 gM4Dh6yfarefG1zRhr8XQQXoFZ/p11QRfO0KLXL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3395BF8015A;
	Mon, 22 Jun 2020 11:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01A3BF8015B; Mon, 22 Jun 2020 11:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2519DF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 11:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2519DF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="G/0ARAy9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z2QbnKN1IcwRwU2mrJFCcrxOgkC4ABplTPRbcuohkCg=; b=G/0ARAy9vjiYm3HhnWO0O3ex37
 cggjWG21pHJp8+Zeehi/am9kXRMHB3dRcz1XLB4KvNd69xlgpLM0AzghGBTdOKEnNY+CuaYOPYw/J
 VKwbjDpcN10vO3/l/TPNrG4XoEGi2VkUg52WpTBJivlXbIqkzPkUVPjtAhGwU09MMtucXOiwmHfM4
 2uukORpP+HaHBlgLhDZ6xTCWP55USPg/94KKKDF2z3i4DhwkHTGXf/unk7/CCr6P6nBMso8WblbJ/
 cKf2HSUStD/uVv4OWUEyEv7X9XeAUO7nJI1rEPhSZGtZ6EKDwZEAeo2dxrERoImb74VoH1h1wx8e6
 UEF2/z+Q==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnInU-000B9g-6R; Mon, 22 Jun 2020 10:31:24 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jnInT-00032r-PM; Mon, 22 Jun 2020 10:31:23 +0100
Date: Mon, 22 Jun 2020 10:31:23 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH alsa-lib 2/2] pcm: dmix: make lockless operation optional
In-Reply-To: <20200619172404.26826-2-tiwai@suse.de>
Message-ID: <2006220850250.15802@stax.localdomain>
References: <20200619172404.26826-1-tiwai@suse.de>
 <20200619172404.26826-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Maarten Baert <maarten-baert@hotmail.com>, alsa-devel@alsa-project.org
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

On Fri, 19 Jun 2020, Takashi Iwai wrote:

> The recent overlooked bug about the unconditional semaphore usage in
> the dmix implies that basically we've had no problem with the locking
> in the practical usages over years.  Although the lockless operation
> has a clear merit, it's a much higher CPU usage (especially on some
> uncached pages), and it might lead to a potential deadlock in theory
> (which is hard to reproduce at will, though).
> 
> This patch introduces a new configure option "--enable-lockless-dmix"
> or "--disable-lockless-dmix" to let user choose the default dmix
> operation mode, then the default value for the dmix
> "direct_memory_access" option is set based on it.
> 
> A big question is which operation mode should be default: it's hard to
> decide, but in this patch, I bet for disabling the lockless in the
> end as the performance loss is significant.
> 
> But the user can enable the lockless operation at any time; at build
> time, with the configure option above, and at run time, by specifying
> the dmix "direct_memory_access" option, too.

I would like to express some caution here.

Seems it must be essential (not just choice) that the semaphore 
implementation is the default. As per Maarten's information, there are 
libasound embedded in applications and containers. Differing defaults 
results in broken audio between applications.

Sadly there is, in effect, an ABI here; a practical risk that users 
suffering the consequences eventually.

Because of the history of sepahores, an application would need to signal 
its intent to use atomics, which is not a good thing as that is complex.

Instead I think it is smart here to consider the opportunity which Maarten 
has come here with.

Patches here are just the beginning to bring alive a lot of dormant 
functionality. It assumes hand-written assembly code will run concurrently 
that appears to not yet have been tested in that way. It is a joy to see 
hand written assembly, but my worry is that is influencing the decision 
making.

I am only recently looking at dmix/snoop code, so I do not aim to stand in 
the way. But I think it would be prudent to consider that bringing alive 
dormant functionality (vs. opportunity to remove code) as if it were 
adding the code explicitly. Would ALSA developers review and accept a 
1000+ line patch adding architecture-specific assembly, changes to the 
ABI, based on the benchmarks which Maarten has presented?

Where I am more certain is: if options are to be provided to users then it 
should be because a user is in the best position to decide. In this case I 
think ALSA developers must equip users in understanding the pros/cons. 
That's why ideally there's no option and code just does the right thing. 
If not, at very least documentation must explain the tradeoff (and I think 
a better name should be chosen.)

I can certainly see interesting positives for mixing based on atomics. But 
there are many years without it, and this feels hasty and there are risks.

And Maarten has presented and benchmarked an excellent opportunity to 
simplify, which could be missed. It is one thing to leave the code dormant 
until a decision or clearer picture. But these patches risk meeting that 
opportunity and transforming it into complexity for developers and users.

> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de> ---
>  configure.ac         | 13 +++++++++++++
>  src/pcm/pcm_direct.c |  4 ++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/configure.ac b/configure.ac
> index 4577c417037a..75d037d5509a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -629,6 +629,19 @@ if test "$build_pcm_mmap_emul" = "yes"; then
>    AC_DEFINE([BUILD_PCM_PLUGIN_MMAP_EMUL], "1", [Build PCM mmap-emul plugin])
>  fi
>  
> +if test "$build_pcm_dmix" = "yes"; then
> +AC_MSG_CHECKING(for default lockless dmix)
> +AC_ARG_ENABLE(lockless-dmix,
> +  AS_HELP_STRING([--enable-lockless-dmix],
> +    [use lockless dmix as default on x86]),
> +  lockless_dmix="$enableval", lockless_dmix="no")
> +if test "$lockless_dmix" = "yes"; then
> +  AC_MSG_RESULT(yes)
> +  AC_DEFINE([LOCKLESS_DMIX_DEFAULT], "1", [Lockless dmix as default])
> +else
> +  AC_MSG_RESULT(no)
> +fi
> +fi
>  
>  dnl Create PCM plugin symbol list for static library
>  rm -f "$srcdir"/src/pcm/pcm_symbols_list.c
> diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
> index 665340954cf3..c38ba3190f1a 100644
> --- a/src/pcm/pcm_direct.c
> +++ b/src/pcm/pcm_direct.c
> @@ -1892,7 +1892,11 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
>  	rec->slowptr = 1;
>  	rec->max_periods = 0;
>  	rec->var_periodsize = 0;
> +#ifdef LOCKLESS_DMIX_DEFAULT
>  	rec->direct_memory_access = 1;
> +#else
> +	rec->direct_memory_access = 0;
> +#endif
>  	rec->hw_ptr_alignment = SND_PCM_HW_PTR_ALIGNMENT_AUTO;
>  	rec->tstamp_type = -1;
>  
> 

-- 
Mark
