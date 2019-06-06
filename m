Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEEC37DDB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 22:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF631607;
	Thu,  6 Jun 2019 22:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF631607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559851873;
	bh=3O7vo31XRpjSTOalhy/LdWbxsXj8DmZQ1kkIuYmvpfM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btS4yKjLETm61WzxJhkITu4RsLI20319ApFB99n6U3G/o9sUeWJMtPVfmA+UZ5jFG
	 wpZML/tDZ/pqqQsVZA3wB95nX6mI4oox90JhcLtsl2R2xWA4FdSbIROExYbF81csQz
	 vQVSTQh7VDI8OB/rJuTVSNUNAse8TFNzCDRCe0J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E523DF80768;
	Thu,  6 Jun 2019 22:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47408F896F7; Thu,  6 Jun 2019 22:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E06CEF80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 22:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E06CEF80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T+TVZGGQ"
Received: by mail-ed1-x543.google.com with SMTP id g13so5087886edu.5
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=24yjnYL7s987Wr60j8RAvSz9t8n51a5eyXvTdKBP2FI=;
 b=T+TVZGGQQa96vI+6EVP32cJl1tCHal/pZDVbtAIrkuyFS0zd9i8L+qEhJCLo1ayG6n
 4tNcAxwlQe+aGhP0B1VaMiTRVAzqCuAi2x5Fq4U+Be2KKsdH8VKpixdx/kC4vBMSR8ON
 CW3HRyVODO/dFOKOrrZShUvHnZpOGeyVt3/QP94UVsOqnzhgR3tHwOGYvY9TDrQ8Ereu
 NQcl7V6jLDdqdBIvE32ySfeLOEhRCxUgX0hEvPIw26Sg6osJp6Vgrt516zRguEOnjLIt
 R23XeOGVkJ6UaZt4Iwk5H1TNn10EjP3bInaqK/ZnBfU2kSMOJrmNRzNs+lyt3lctP5jB
 BfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=24yjnYL7s987Wr60j8RAvSz9t8n51a5eyXvTdKBP2FI=;
 b=s6wPWaa3uW+/HVjR2ADxxrI13kbq8tmMxtHA1i6t4yzZBrdOZFvTDtrcxew7epzkvG
 Wn85/OWc/6ZDwTSm7XgsQKqbSy6POTBGSGQi9ynsxS/fwW2P3aff4Yg8ZEHAFZndqtSI
 GM0OQURyFHPzh/CcrRQLONTNOUZVHARs+NBCcvjWRfYm1a0w0L8jUjDlxkt6obGxBgfA
 SRfH9OdNDmuKTlTQej+C5mfHuoMQ6UPbTbcVM+Yt7ih/+0Tl6GIE0FzKdt58ZgD7dt+8
 nM5StZwNYjtrOH5Ek+ZBj2yzdMinjJsquq8mG351FnTC+bs0H76ik+hbkoPwc0Ctjq4B
 CM6g==
X-Gm-Message-State: APjAAAWxMegJPe7nLjJb4aDj5nPPMy3MYO2J28n/wvgUcu96vTwHgb5h
 +nDT8mCuPO4QIIOcKcKVQzo=
X-Google-Smtp-Source: APXvYqzWlxmyZ/jtHCXySQJRlFAhkEFP/2YRxDB1KWJ4k66130Er8s8obknRMLzrvd7WFOq0+gRcLg==
X-Received: by 2002:a17:906:66c5:: with SMTP id
 k5mr43809059ejp.146.1559851761929; 
 Thu, 06 Jun 2019 13:09:21 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id p23sm682711edx.61.2019.06.06.13.09.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 13:09:21 -0700 (PDT)
Date: Thu, 6 Jun 2019 13:09:19 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20190606200919.GA12912@archlinux-epyc>
References: <20190606051227.90944-1-natechancellor@gmail.com>
 <CAKwvOdnswiifrvSrBcAnc4Br8nhxJRUAL0yNM6T6=4xScHXf5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnswiifrvSrBcAnc4Br8nhxJRUAL0yNM6T6=4xScHXf5g@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: Mark format integer literals
	as unsigned
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

On Thu, Jun 06, 2019 at 11:50:10AM -0700, Nick Desaulniers wrote:
> On Wed, Jun 5, 2019 at 10:13 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Clang warns:
> >
> > sound/soc/codecs/rt1011.c:1291:12: warning: integer literal is too large
> > to be represented in type 'long', interpreting as 'unsigned long' per
> > C89; this literal will have type 'long long' in C99 onwards
> > [-Wc99-compat]
> >                 format = 2147483648; /* 2^24 * 128 */
> 
> This number's bitpattern is a leading one followed by 31 zeros.
> `format` is declared as `unsigned int`, and literals in C are signed
> unless suffixed, so this patch LGTM.  Maybe a macro declaring such a
> bitpattern would improve readability over the existing magic constant
> and comment?

I thought about it but that is ultimately up to the maintainer I think.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> >                          ^
> > sound/soc/codecs/rt1011.c:2123:13: warning: integer literal is too large
> > to be represented in type 'long', interpreting as 'unsigned long' per
> > C89; this literal will have type 'long long' in C99 onwards
> > [-Wc99-compat]
> >                         format = 2147483648; /* 2^24 * 128 */
> >                                  ^
> > 2 warnings generated.
> >
> > Mark the integer literals as unsigned explicitly so that if the kernel
> > does ever bump the C standard it uses, the behavior is consitent.
> 
> s/consitent/consistent/
> 
> :set spell

Grr... I can send a v2 unless the maintainer wants to manually fix it
up. Thank you for the review as always.

Nathan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
