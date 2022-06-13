Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A749054A8F9
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4743A18B4;
	Tue, 14 Jun 2022 07:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4743A18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655186254;
	bh=01Y4ZZ1vwN/sC+NStBvCVmIsHr21hcbsebT6hk3QuN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4vYaolYw2TxjKa9OMVfcAMPhlxjubKFksnMP4BK0saKfXtcgeW8/fTfszdFoNcxZ
	 pgAJQ0Q3lPn6h00y6kKPP6YuDgVCCt6qLRqBGl9BunO1gKH54NMWZo+gdS4VMBD7/6
	 LafwRS5H2CBhLS0iR5nLXMHfsl9UA02501e4QqUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1174F80552;
	Tue, 14 Jun 2022 07:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F9D0F804C1; Mon, 13 Jun 2022 20:40:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02481F80107
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 20:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02481F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="YcOMN9J8"
Received: by mail-lj1-x22a.google.com with SMTP id l18so7127731lje.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SW1J4TxrbvE0J+NvABWMWUwXUDHi8O6WM5U0kmdXuvs=;
 b=YcOMN9J8NO13M1lsQJ09hM7cCxE8MS8M7Gv1MrIUfDqyrowxYIz0M4kq/4DzZS1VvJ
 X+WwlBoGf6CzRGJ8G1EjU7INISE4kKU0Z/BuQnIyh3+0qLr9mDdeVrnpP8AHGXywflLI
 gn4vt4eUHsaKF6mpPhECp6pZ2U/kiDWVsOWPKlO9R4E2oApQGpBRq/kLZZK9nbrMH8Vs
 rXrYvlBgBc2y9ISFPMRSym0HBSe8rRlM0D6NK0Ddpva36u6S2KIqGMmwmrN+Mz2tgqDy
 Zm5vDhOTpucmZ8RQFhCIrZBcGzE3vnnOhB0faQ7Lbps3yLPlEQLVSwLrlcC8TPCjgrM+
 10Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SW1J4TxrbvE0J+NvABWMWUwXUDHi8O6WM5U0kmdXuvs=;
 b=ThmfN7S01Fgs1Dxy/VMtkd45ahqJ02LrZPWts7BZOSpFAA16revJFmFiOofgvKahHa
 B+LRa+UPKsHX5ZlWjcNnzX6esuaysRQ2fgl8UFqm41aVeRalfUtXUOvZs2ovpO52XGjG
 VP8h8Z+w2nrYzGK0bb0rCiUAjIM145ko+IsNEzZz86vLdMJ+hgIeWBbAQbx7ccZGFA0k
 ZDqFlgQpX4Px1p60jVMqf/lI+avXgc6FbRy08bBJAfNvFJ/ehepUJgFQEOt7RnYiOIxU
 q5+cbhsK/G115rv7JLBw9dBBFW8Dvw2J6IDogOhQBXJLzaYf5S6tJMOwD5as14qPbVao
 v9eg==
X-Gm-Message-State: AJIora9MrjHI5fZ3kPoGoTj9iCdyTaYb2SexIPx1aq9JZ2NsaS8IuSPI
 lomcP20X1ZXOchqnK25Lt24on7d/eoEgG+elLywH
X-Google-Smtp-Source: AGRyM1sc5PXhrpO/NALvqllDtgfvAmsGr0nMSO+nh757PXQ+6BPBVtmdCaZdkhadYmRsZLgDd/bC0jYF0EiuvoWxC2E=
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id
 h1-20020a05651c158100b0025548d1fdaemr459115ljq.286.1655145619959; Mon, 13 Jun
 2022 11:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-8-morbo@google.com>
 <YqLUORmZQgG1D6lc@kroah.com>
In-Reply-To: <YqLUORmZQgG1D6lc@kroah.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 13 Jun 2022 11:40:08 -0700
Message-ID: <CAGG=3QV1DqiufpBRmUcYMEuH55OizMGLCcCiLhxaZ8FEwbn7gA@mail.gmail.com>
Subject: Re: [PATCH 07/12] driver/char: use correct format characters
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:54:10 +0200
Cc: alsa-devel@alsa-project.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Bill Wendling <isanbard@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
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
 Tony Luck <tony.luck@intel.com>, Networking <netdev@vger.kernel.org>,
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

On Thu, Jun 9, 2022 at 10:18 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 09, 2022 at 10:16:26PM +0000, Bill Wendling wrote:
> > From: Bill Wendling <isanbard@gmail.com>
>
> Why isn't that matching your From: line in the email?
>
There must be something wrong with my .gitconfig file. I"ll check into it.

> >
> > When compiling with -Wformat, clang emits the following warnings:
>
> Is that ever a default build option for the kernel?
>
We want to enable -Wformat for clang. I believe that these specific
warnings have been disabled, but I'm confused as to why, because
they're valid warnings. When I compiled with the warning enabled,
there were only a few (12) places that needed changes, so thought that
patches would be a nice cleanup, even though the warning itself is
disabled.

> > drivers/char/mem.c:775:16: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
> >                               NULL, devlist[minor].name);
> >                                     ^~~~~~~~~~~~~~~~~~~
> >
> > Use a string literal for the format string.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Bill Wendling <isanbard@gmail.com>
> > ---
> >  drivers/char/mem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> > index 84ca98ed1dad..32d821ba9e4d 100644
> > --- a/drivers/char/mem.c
> > +++ b/drivers/char/mem.c
> > @@ -772,7 +772,7 @@ static int __init chr_dev_init(void)
> >                       continue;
> >
> >               device_create(mem_class, NULL, MKDEV(MEM_MAJOR, minor),
> > -                           NULL, devlist[minor].name);
> > +                           NULL, "%s", devlist[minor].name);
>
> Please explain how this static string can ever be user controlled.
>
All someone would need to do is accidentally insert an errant '%' in
one of the strings for this function call to perform unexpected
actions---at the very least reading memory that's not allocated and
may contain garbage, thereby decreasing performance and possibly
overrunning some buffer. Perhaps in this specific scenario it's
unlikely, but "device_create()" is used in a lot more places than
here. This patch is a general code cleanup.

-bw
