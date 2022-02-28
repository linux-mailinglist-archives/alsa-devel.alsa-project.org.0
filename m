Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3DC4C9FC9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:49:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D031F05;
	Wed,  2 Mar 2022 09:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D031F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210957;
	bh=aJu3pzAGqwBcM5uGpphz6KK1dUgnQBtzTRMiVYJ4NT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Ut48tdP0thIFLrtt+1mbcME+Z7s4UgrIU4jx0t+P3WSHWc/Bq233lMNsxwq6zx8Ue
	 cxz0OC4uw4V/SCJnq+0HsrYR/qNQXj94UKm0fcPnPSYskz/vducoMT4m5ghfiIVhCB
	 vsonPpTcUGys+BCTAqPwQV/x33yeESznk6jboEYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D31F8065D;
	Wed,  2 Mar 2022 09:34:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C56EF800F8; Mon, 28 Feb 2022 22:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D815FF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 22:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D815FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JpEWCU5s"
Received: by mail-pl1-x62b.google.com with SMTP id s1so11789145plg.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
 b=JpEWCU5sl0Tb/FD34RSH61Ey9dRKreZqOQa3CJ02luf0uqIT78+8GWNevF0TXmNO1k
 V82hjNGseb3oWLNgnnFwXHAFmfIF+pTCtPsXm95pt2iCzBmJFwg04njU2K1WfIC8K4PQ
 JYTCrkA4ACMCh2biL4u47uoOFfhnbmO/1jCCSOx3OESfK5+oDGNitg9s7NqsmIU5fVsE
 xsR4ABTTJUTksMDshckaPyVLHegSArBm3erCaRT01IEJkH2S1g98XNdRHKV6JZW5AanM
 gI9+nSzlxhKCRaqGLAQjGqwME5o9/K6faQyfblLD265MKP0MWlgdnuFxCRxjUTwlasET
 Zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
 b=HPnHQHCW7J52NqQKizLBRxeML/3AiYU4luu/YIqbaM1phQCM2Ago+WTJZd17EslFie
 TCTsklJXGFUuPtfDgW8uBOwdek8bnvwmFDK7NjK3TxkLCXXBj0zJNUNnpybCvFohGG7l
 McYzqyEpq5Z2Cv9WuVIxhKr3ch9CsnDHpdtbXiDqGK6rreqMD4V7mH9/hS/MP2Pfqbj3
 Tuy6f44iwQxodaz5i6grj+Ww6RRi5YO1kpLSEFZ0hq+BkmVGRWSnBxDg1Yw78aEKBvDe
 3zMum1fJSreT9z9mWQPB9WV+mEoqHjy5jfz5NPDIMf9eOnuTMac9T34sYPkdXGeH3xZu
 mrMQ==
X-Gm-Message-State: AOAM530Tk1X7LmH3IggEBP3kGagSOaHe9XORs1XGLaxQkJdWLNu8xiIO
 xTq2jxc3oMSrtCmCbBEQ1toicdHIQEM4DmQMWbg=
X-Google-Smtp-Source: ABdhPJxYQDaw0FFWrTXZCk3OvnKpy6mSdQ8Z9qbCWYQ2FvSetamSp4Rz90y2uoGU7tjomvOtre1MYsL9s+rZuYttBVs=
X-Received: by 2002:a17:902:ce8a:b0:14f:fd0e:e4a4 with SMTP id
 f10-20020a170902ce8a00b0014ffd0ee4a4mr22765912plg.47.1646083147399; Mon, 28
 Feb 2022 13:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 28 Feb 2022 16:18:56 -0500
Message-ID: <CAH8yC8nwp8f3rANhCiiP_Oiw2cjfqCwAgZdTXY9OxtN9Tmm7HA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
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
Reply-To: noloader@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 28, 2022 at 3:45 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> ...
> > Just from skimming over the patches to change this and experience
> > with the drivers/subsystems I help to maintain I think the primary
> > pattern looks something like this:
> >
> > list_for_each_entry(entry, head, member) {
> >      if (some_condition_checking(entry))
> >          break;
> > }
> > do_something_with(entry);
>
>
> Actually, we usually have a check to see if the loop found anything,
> but in that case it should something like
>
> if (list_entry_is_head(entry, head, member)) {
>     return with error;
> }
> do_somethin_with(entry);

Borrowing from c++, perhaps an explicit end should be used:

  if (list_entry_not_end(entry))
    do_somethin_with(entry)

It is modelled after c++ and the 'while(begin != end) {}' pattern.

Jeff
