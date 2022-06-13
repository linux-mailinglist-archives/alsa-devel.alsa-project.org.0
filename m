Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEAB54A8FA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09EDE18B1;
	Tue, 14 Jun 2022 07:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09EDE18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655186266;
	bh=C/g8Vo9lG8S58jPJAByQWzPHuAIvQE2vK+hViht9NqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fsvty3usmsvGV4hT1BJuLYHAGry1YfPPG8rG7FtpRkrLq8YClLhu51jUZGgD22370
	 bB3F/KphAR+Wv+vkHqZ24dgS6VAKxgoONPdvhIjepXU607q2srwuJDYDJSdfJP4TJZ
	 SzOQlBmGtAUNJev7UGQUXCUdDw2BQtUo6AR4EzYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6EA1F80553;
	Tue, 14 Jun 2022 07:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E78F804C1; Mon, 13 Jun 2022 20:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09AC9F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 20:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09AC9F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="psqvyg4b"
Received: by mail-lj1-x236.google.com with SMTP id s10so7147169ljh.12
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gnUSbe8CiTQ19HP1QRaMovzHPwVV5AH7oRueQxzbr2w=;
 b=psqvyg4bPOOObXvl93Zxro9XA/ODLoG6iBN8VzURq2kWrUR7F3BHDeeHNMu0CFKyIh
 Niks5hKvSuVELNC275GXW5lNVLONvG604XONrgXtzQCBbODYI+FiNC4UHOy01ziKEw6P
 PnJJ8X8mCYdNE116ke64zsX9sSqEcXHCfXLltO9UXIpqgB60u1m1gOJgKSvqZ2Vu7Rt3
 Fab5Mj4u35jsb3FBf1q2tLM98qhaB60LVo3lH+ODCh+pfDogtGE59OZmPCThjZAo5F3C
 uARnmPJ0E0/9jMWP5IEUMjK7PRjAVPO04tktB/Od36POLALwftkbezadySNHJrj1LtR7
 bRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gnUSbe8CiTQ19HP1QRaMovzHPwVV5AH7oRueQxzbr2w=;
 b=AcW3fZ5O2NDiJ3xCQT1eFm+11uT+L28Z6qcv/gVRXjMnEkL/IsQbCJX49qsItQCpSC
 7MOizGK6savlfsGNnhPUecv8CYeTq83qGuUL+1DWR8azaNtg/oUrcuRQwxr3sYH80s6R
 o+qJx0S7VD/DdXbu2EdQklW1ZYq7rYNFKyZ6/89eEL1GmktO1qdbQqdc5aVq2fsGWoni
 uTRO/qc6pOdVE4SRRkQrv11N2ANyLXBq5jrz0W1lpnvNaxoyMM4Z4R3c+ptVHqKs5Ic0
 EcpkazrY4ScOnL44s2NKVzrzwQEwCPWRWXebO/QvItzts63pAeKc0eCHTaosnvapfZv0
 WqQA==
X-Gm-Message-State: AJIora8dYZ3vWGGePeagZKDHVAUzxLwdbzjiBf3SeRUfIeiaErOrqRjK
 /qgqtzLtKXdcbpW+f9uzve8qvX4aEM5sJzvBl0w4
X-Google-Smtp-Source: AGRyM1uMA1RswQj/kRbYWxpa2gpbkIqW/H3Lhp9QgKWhkKjVKtC7uz71CWdrVgWOGoL64GzPA+QRw4qUugKbzHueGjo=
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id
 h1-20020a05651c158100b0025548d1fdaemr472476ljq.286.1655146049852; Mon, 13 Jun
 2022 11:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-9-morbo@google.com>
 <YqYTExy0IpVbunBL@equinox>
In-Reply-To: <YqYTExy0IpVbunBL@equinox>
From: Bill Wendling <morbo@google.com>
Date: Mon, 13 Jun 2022 11:47:18 -0700
Message-ID: <CAGG=3QVc4STHym0hszpr1SP=RYWag5=J-MB-zhz4JzNZnRnbvg@mail.gmail.com>
Subject: Re: [PATCH 08/12] cdrom: use correct format characters
To: Phillip Potter <phil@philpotter.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:54:10 +0200
Cc: alsa-devel@alsa-project.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
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

On Sun, Jun 12, 2022 at 9:23 AM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> On Thu, Jun 09, 2022 at 10:16:27PM +0000, Bill Wendling wrote:
> > From: Bill Wendling <isanbard@gmail.com>
> >
> > When compiling with -Wformat, clang emits the following warnings:
> >
> > drivers/cdrom/cdrom.c:3454:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
> >         ret = scnprintf(info + *pos, max_size - *pos, header);
> >                                                       ^~~~~~
> >
> > Use a string literal for the format string.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Bill Wendling <isanbard@gmail.com>
> > ---
> >  drivers/cdrom/cdrom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > index 416f723a2dbb..52b40120c76e 100644
> > --- a/drivers/cdrom/cdrom.c
> > +++ b/drivers/cdrom/cdrom.c
> > @@ -3451,7 +3451,7 @@ static int cdrom_print_info(const char *header, int val, char *info,
> >       struct cdrom_device_info *cdi;
> >       int ret;
> >
> > -     ret = scnprintf(info + *pos, max_size - *pos, header);
> > +     ret = scnprintf(info + *pos, max_size - *pos, "%s", header);
> >       if (!ret)
> >               return 1;
> >
> > --
> > 2.36.1.255.ge46751e96f-goog
> >
>
> Hi Bill,
>
> Thank you for the patch, much appreciated.
>
> Looking at this though, all callers of cdrom_print_info() provide 'header'
> as a string literal defined within the driver, when making the call.
> Therefore, I'm not convinced this change is necessary for cdrom.c -
> that said, in this particular use case I don't think it would hurt
> either.
>
> I've followed the other responses on parts of this series, so I
> understand that a different solution is potentially in the works.
> Thought I'd respond anyway though out of courtesy.
>
Thanks, Phillip.

I pointed out in a separate response that this specific warning is
disabled by default, but when I ran into while hacking stuff there
weren't a lot of places where the warning popped up (at least for x86
builds) and thought it would be a nice cleanup. I understand if you
don't think this patch is necessary for your code. There are some
places where visual inspection of the code is "good enough" to ensure
that nothing untoward will happen (Greg pointed out a similar thing in
an mm/ file).

Cheers!
-bw
