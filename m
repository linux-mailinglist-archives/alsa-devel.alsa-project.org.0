Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E8545C7D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8BF920CA;
	Fri, 10 Jun 2022 08:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8BF920CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843482;
	bh=FzjMUMNJro7aLtA5JDb6o9RZ8s5VOEmKWDmXx3maUFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7RCxz0w3XwErMOpLhw8W9Lzemo0mZkBYcNiIuFeoZcjcK4FD1ninqHvnFAZGSUba
	 /3oL4ygXQJ7LjzkCsKnzFQ2g99PEjsFfIGZVLwNedwDm2VIFBCUTSWa3ipVPU54YgQ
	 ECcr0B0No6wCXOSGPjx7CQeD5tQa06wU05M2lvg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDB57F805C7;
	Fri, 10 Jun 2022 08:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6118EF801F5; Fri, 10 Jun 2022 01:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 173AAF80116
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 01:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173AAF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qsw/gp8R"
Received: by mail-lj1-x22c.google.com with SMTP id c30so11215796ljr.9
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 16:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=af6354Q+PYtjAeTE1fHxbOWk4spb0xe2rddSt4jQNw0=;
 b=qsw/gp8RDQr7TxcFAw67QADvplw4M8CuLpbXwYePEvTc9gyloRoNkLA0/65LPS2PHG
 lwvUx0Vk5tnQau+/eN+yj4vNNvEwrbFYrLKwsm69bjXQ0R4nOllOmIVjbhrvEDyLI/wP
 oUAGxwYePVYRcuzvMPpwS/H20SN6RBqtDq3M/sIFmsPVSQfFBqjqsQ4YrUJFt60H+vrG
 /vbIkayBKj2NafmzkfPK5WFIV3Pwo6mzHcJ+8+5Fy+N2x3QXFf68sSVrj/uvcZRdIojW
 qhr4netPBQEp3dEnvthXme6ipHwfVm1f0OwUWXWzeGYvw+rVPOiGjeTn1JUKCz0o06hy
 xlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=af6354Q+PYtjAeTE1fHxbOWk4spb0xe2rddSt4jQNw0=;
 b=sYuN5khO5r0uf3w5xtwZGMxiKWdUkzMMr9jTPcpI5RxSH87IZdPC0QLUY6yO7Kw9GL
 05hiZ6ENnNptymljlECRJ1Kl6uHAV+A+P0NLOWdItpStD6TemxcGCSBZNFKz8YQHl3oE
 A4/AeYnwKg54DZAt8Pl23+mTkSDfT2KWWQ5jz0Po+Io97gKSwy27Db72tMuo0sYhq9SX
 YGCAeAnphHQCxhzCkQdOoBCiu9YGrwBVsEAYswUydIwS35OVF7WD/EK+rcmHYSp4/HJu
 eJJpIjsRuWQUTYYkW9KHvnA5rG8zBjVH3dyCs40CtSO3TX2WhxVhy4KBgBpE3z+tQRtx
 8A2Q==
X-Gm-Message-State: AOAM530uNnVt1fAGky8v/cDj3CV/fdMWICZoeMrokNFlG70VTJTPwJae
 qhzLyRe68OoutXzOz7vK1TSQ8JShJR36UIPDuBvB
X-Google-Smtp-Source: ABdhPJzslpbBTkBZ3coZd7t5JavMPBitkHrctHqYQ1MeTY4oO+M4rEae62HvWxHeD6/VvLbJ6ql3Pgg1eI26i3ys1SY=
X-Received: by 2002:a2e:bc0e:0:b0:255:9fa0:ed4 with SMTP id
 b14-20020a2ebc0e000000b002559fa00ed4mr10953078ljf.390.1654816723853; Thu, 09
 Jun 2022 16:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-2-morbo@google.com>
 <3a773edf-f850-e83d-828d-19f91a373384@infradead.org>
In-Reply-To: <3a773edf-f850-e83d-828d-19f91a373384@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Thu, 9 Jun 2022 16:18:31 -0700
Message-ID: <CAGG=3QVkvvc+25zvrfigo5Ohx85+1FCka_VMC4pm0dWUFMOqkA@mail.gmail.com>
Subject: Re: [PATCH 01/12] x86/mce: use correct format characters
To: Randy Dunlap <rdunlap@infradead.org>
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
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Jun 9, 2022 at 4:15 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 6/9/22 15:16, Bill Wendling wrote:
> > From: Bill Wendling <isanbard@gmail.com>
> >
> > When compiling with -Wformat, clang emits the following warnings:
> >
> > arch/x86/kernel/cpu/mce/core.c:295:9: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
> >                 panic(msg);
> >                       ^~~
> >
> > Use a string literal for the format string.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Bill Wendling <isanbard@gmail.com>
> > ---
> >  arch/x86/kernel/cpu/mce/core.c | 2 +-
> >  scripts/Makefile.extrawarn     | 4 ++--
>
> Where is the scripts/ change?
>
I'm sorry about this. The change in that file was a mistake that I
reverted, but I forgot to change this part.

-bw

> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> > index 2c8ec5c71712..3d411b7c85ad 100644
> > --- a/arch/x86/kernel/cpu/mce/core.c
> > +++ b/arch/x86/kernel/cpu/mce/core.c
> > @@ -292,7 +292,7 @@ static noinstr void mce_panic(const char *msg, struct mce *final, char *exp)
> >       if (!fake_panic) {
> >               if (panic_timeout == 0)
> >                       panic_timeout = mca_cfg.panic_timeout;
> > -             panic(msg);
> > +             panic("%s", msg);
> >       } else
> >               pr_emerg(HW_ERR "Fake kernel panic: %s\n", msg);
> >
>
> --
> ~Randy
