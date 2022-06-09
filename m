Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0299545C73
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743A51FE2;
	Fri, 10 Jun 2022 08:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743A51FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843372;
	bh=vaD1tsM8gOQSarLK5UH/NlerAopOvn5SLBojh+0trMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YazTTf4e8lw4NBZt3jkOKv7c5OmBrXmYylkUDcFbCeRgRPpbkomA0eMu4elDt1Hkt
	 lhN6mjrr+OkAce9p5TTYz5dfkQ2wj7tiG3SQYOJg8jd6pYsX0RzEj+OozSkfx+ilD4
	 pyY4H/7e3Viz6tOM6jmVltgJCUmo4unM4Uv9dvhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 779BAF805A1;
	Fri, 10 Jun 2022 08:37:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 296BCF800C7; Fri, 10 Jun 2022 00:49:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D24BEF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24BEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="h+XSjN/W"
Received: by mail-lf1-x136.google.com with SMTP id c2so20765689lfk.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAj7kkMIiekJ9rTKt4JAtAfIGa2quITOg+UqYlGq1Vc=;
 b=h+XSjN/WVesJqDJFOPBbUOjCsElze90l5AUaZpaMfQE4BCHJP6262qTzyHWJva9Bl7
 Ylea2b1VMRtuu3W6K04USb5N4DyE9/FJG1TJX23DJAAyMpmTkNe0IhcujfXyw2tL6Yzm
 5AoAwHI63jQHxPEb7KgmYY7AsIWc/AhRsgnJ71aDa/ZsS0NcL3wur4vFJaN8UMyAklRE
 aEGCgipKXq1q5OQuT+b1/Z3ZAjDVwg+cOz821DhKZdc3CbTWkxewf2eBhHZ6cA8kCpl2
 vQoxv4lOBXpPPrGtb7sLkscBoEWxzlYML194UCnlDBfFSziOT58BYv12MhyX6zYq7k9Z
 Vkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAj7kkMIiekJ9rTKt4JAtAfIGa2quITOg+UqYlGq1Vc=;
 b=eblkZZiRuuIz9sYlztyGCPk3Hxw1/BwBfzYsyasb2t+uWWAw4Ug5Xr9VqQpk/xycnd
 DjGiYsFcJFQdDfyvXU1TA4sk1Dp+esZpcw9bnO1BIsmvOeRr8Gmjw4MvNYYcz5Owfvz5
 kqAZCQY2ngT3WgEIKYmv1KKjV5Ju51ih4SOEmGOJ2WBogeDeVIykrky8X6CkP/3eHA+f
 rHw9J23gLT6eEOc3gEUodBNWstN8+Chmvqwc0fq8bOen8RFL5cItIy0PLWesOlA47H4N
 SAwkCUOrrhNBFXit8wRKAXOhL9J2IOSh/eXJ+sQpp5n+LteLen/pCIPeaAH3j8SUFFfn
 k+eQ==
X-Gm-Message-State: AOAM531i1QmjSBJUtY7LenSLOQCUdFEyutTFWSLW/HI9NZ3ZtyCAApFU
 sofmn7SBV0rbUcErDM9aXUhNp1YQyg0qehfgKPb6
X-Google-Smtp-Source: ABdhPJxZXTnzcCwuX2K8dXo0GsWxPjCKHZ8xLR+ukHeOsc32GB8PW2KE6FFGhS4Nls3KDQ2FUv5nfKYIhCIQyfCKYvU=
X-Received: by 2002:a05:6512:114e:b0:479:1e02:9318 with SMTP id
 m14-20020a056512114e00b004791e029318mr20896704lfg.156.1654814973186; Thu, 09
 Jun 2022 15:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
In-Reply-To: <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
From: Bill Wendling <morbo@google.com>
Date: Thu, 9 Jun 2022 15:49:21 -0700
Message-ID: <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Networking <netdev@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <isanbard@gmail.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>, coreteam@netfilter.org,
 Arnd Bergmann <arnd@arndb.de>, Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org,
 Jan Kara <jack@suse.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu, Jun 9, 2022 at 3:25 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu,  9 Jun 2022 22:16:19 +0000 Bill Wendling <morbo@google.com> wrote:
>
> > This patch set fixes some clang warnings when -Wformat is enabled.
> >
>
> tldr:
>
> -       printk(msg);
> +       printk("%s", msg);
>
> the only reason to make this change is where `msg' could contain a `%'.
> Generally, it came from userspace.

It helps kernel developers not accidentally to insert an unescaped '%'
in their messages, potentially exposing their code to an attack
vector.

> Otherwise these changes are a
> useless consumer of runtime resources.

Calling a "printf" style function is already insanely expensive. :-) I
understand that it's not okay blithely to increase runtime resources
simply because it's already slow, but in this case it's worthwhile.

> I think it would be better to quieten clang in some fashion.

The "printk" and similar functions all have the "__printf" attribute.
I don't know of a modification to that attribute which can turn off
this type of check.

-bw
