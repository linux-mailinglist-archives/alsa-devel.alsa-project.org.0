Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBDF545C7E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EF2D20E5;
	Fri, 10 Jun 2022 08:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EF2D20E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843497;
	bh=CHBVlkrbUTWRPMgE9Ch7znZcilfjNfPcDuXJ0J4QL6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/ZXLkFfHJKQek0ju/1dG9IobMD5CcM74nV32NtYuBRU8gB0mCxtZTW2UtLjL496Z
	 AwoST/jsqkoCmJxPc3ajXQ4Ln3iHrb08E7xUgbHvI0ujkEMVVEqC+abo39bkT5kgsw
	 GC5/FOA4VlXiOTwGRTHFtH5frDJjhftmoe+66UBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 716E1F805D7;
	Fri, 10 Jun 2022 08:37:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D89F801F5; Fri, 10 Jun 2022 02:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 T_TVD_FUZZY_SECURITIES,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EE1EF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 02:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EE1EF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GzLaviOq"
Received: by mail-lf1-x134.google.com with SMTP id y32so40442669lfa.6
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 17:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1G6Hf9v6f6xyLP2a6Gh7yfuFJ+6ipgBJHHWwU80v1c=;
 b=GzLaviOqRCp4B7LqsBfA2qFyX6V1uMUAbIpS5ZG+ymr/9aN/hsQn1QW3PtN+GmgInQ
 He0Q1Uquu8aHzwNdzglLiDyax/ofVj35MhNvH0zBU7U/FgsC8lV4WZcV1MRSavA6givw
 MwwoH6cUS805gA1B/kna/OiRrljxuadDNbWQe2uk3jqSGIPZTj1Nggn2aFmaJOxpn0ee
 keyXmIa2x54GZzES+MYP7V0JK7Y0RzKUk9jyYpIawwn1bBhBPn8bT+rMBalAXRhKRGqN
 ws66+mukc8/rRLkWY5c5tACdnnEguXj7+LFVYthISMqK0wDGsAxLLnOu3EGgFefxrZxd
 +Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1G6Hf9v6f6xyLP2a6Gh7yfuFJ+6ipgBJHHWwU80v1c=;
 b=s0QOtbPAY9tN/4ZcW7fmoT8Ow44wHrMYw0Arquqr2sAZbK5x7tX2ReV7oeUQvVwqY6
 O9dTcxor/nQsUXbYoZERLIhSKr+yL2tNcnyf9yTRRaouVrgjMb6EBZheaHfwymnRALuu
 nja/GnhZXai9yCsO7VW0LRjSW2WGDfiOHA9YwG09HMtkYc/iBoOiTBLR5nGuVd4kGbaq
 JJ0OBMK2SmzbSs1z0Nk1AoPL8tb3X7FLDtqUOZQzFrEWWoqyJuPnU/vOpb9wdPTzoJOw
 g/HhpVBDumS55WtkRzKbJjBKZ7BIMJhxs3Sg4RGSwVIskNsU4b7DYxJ/z/cuAdG4ULnK
 8egw==
X-Gm-Message-State: AOAM530LpdGoKAFmjdYDkzvXQm+NZV5FK7mKCrhCExhbJ+VAhxsjjRpm
 IacCCdPytpxb+xcvoTtGh4Iqhf+KPC9YpMHQ1uLPaA==
X-Google-Smtp-Source: ABdhPJwmAai5PXOj7tGhLdM9ZQqNV5Wv1qkbCkukxf252/r1aHu4spL4q3u9asT4a5t/dEsKFtmgLChgmJAimWPi9do=
X-Received: by 2002:a05:6512:ad6:b0:479:5599:d834 with SMTP id
 n22-20020a0565120ad600b004795599d834mr11951775lfu.103.1654821178297; Thu, 09
 Jun 2022 17:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
In-Reply-To: <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 Jun 2022 17:32:46 -0700
Message-ID: <CAKwvOdmfC3kgGuimbtG8n74f8qJ5+vd3GeHg14oOxkKOfuQfBg@mail.gmail.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
To: Andrew Morton <akpm@linux-foundation.org>, Bill Wendling <morbo@google.com>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Eric Dumazet <edumazet@google.com>,
 Network Development <netdev@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Bill Wendling <isanbard@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>, coreteam@netfilter.org,
 Arnd Bergmann <arnd@arndb.de>, Justin Stitt <jstitt007@gmail.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Justin Stitt <justinstitt@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
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

It looks like this series fixes -Wformat-security, which while being a
member of the -Wformat group, is intentionally disabled in the kernel
and somewhat orthogonal to enabling -Wformat with Clang.

-Wformat is a group flag (like -Wall) that enables multiple other
flags implicitly.  Reading through
clang/include/clang/Basic/DiagnosticGroups.td in clang's sources, it
looks like:

1. -Wformat is a group flag.
2. -Wformat-security is a member of the -Wformat group; enabling
-Wformat will enable -Wformat-security.
3. -Wformat itself is a member of -Wmost (never heard of -Wmost, but
w/e). So -Wmost will enable -Wformat will enable -Wformat-security.
4. -Wmost is itself a member of -Wall. -Wall enables -Wmost enables
-Wformat enables -Wformat security.

Looking now at Kbuild:
1. Makefile:523 adds -Wall to KBUILD_CFLAGS.
2. The same assignment expression but on line 526 immediately disables
-Wformat-security via -Wno-format-security.
3. scripts/Makefile.extrawarn disables -Wformat via -Wno-format only
for clang (via guard of CONFIG_CC_IS_CLANG).

We _want_ -Wformat enabled for clang so that developers aren't sending
patches that trigger -Wformat with GCC (if they didn't happen to test
their code with both).  It's disabled for clang until we can build the
kernel cleanly with it enabled, which we'd like to do.

I don't think that we need to enable -Wformat-security to build with
-Wformat for clang.

I suspect based on Randy's comment on patch 1/12 that perhaps -Wformat
was _added_ to KBUILD_CFLAGS in scripts/Makefile.extrawarn rather than
-Wno-format being _removed_.  The former would re-enable
-Wformat-security due to the grouping logic described above.  The
latter is probably closer to our ultimate goal of enabling -Wformat
coverage for clang (or rather not disabling the coverage via
-Wno-format; a double negative).

I'm pretty sure the kernel doesn't support %n in format strings...see
the comment above vsnprintf in lib/vsprintf.c.  Are there other
attacks other than %n that -Wformat-security guards against? Maybe
there's some context on the commit that added -Wno-format-security to
the kernel?  Regardless, I don't think enabling -Wformat-security is a
blocker for enabling -Wformat (or...disabling -Wno-format...two sides
of the same coin) for clang.

> >
>
> tldr:
>
> -       printk(msg);
> +       printk("%s", msg);
>
> the only reason to make this change is where `msg' could contain a `%'.
> Generally, it came from userspace.  Otherwise these changes are a
> useless consumer of runtime resources.
>
> I think it would be better to quieten clang in some fashion.



-- 
Thanks,
~Nick Desaulniers
