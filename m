Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B115D10440D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 20:15:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F321754;
	Wed, 20 Nov 2019 20:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F321754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574277322;
	bh=rk2kO1kgGk2XS86CNseV0PVTlv34/PCyP1E2b5cqllw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aiqDLDRXjY7puEa0kYP0U/f6vNuniDtejy8akXWMAvT04k8H7jXvFAXnLRcX2kzGh
	 EhOzs3xr4TpkjYstUgQeBDmWFydOPoh7GfTPQO79P+2fxQNxQpWCxvYT6kDZZY9X1N
	 SuFQTk99MZVBWZUnRaYFrLaa0vHiZMZoZpzFsI0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59849F80140;
	Wed, 20 Nov 2019 20:13:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA61F8014A; Wed, 20 Nov 2019 20:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70771F8013F
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 20:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70771F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kKwBSFSe"
Received: by mail-oi1-x244.google.com with SMTP id 14so760711oir.12
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 11:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HIQEKd6TofbIVkSXkyhR8UBPl3/YBPiFJvSOLX+5OT0=;
 b=kKwBSFSercUrdZ/ptBH1K7dKEGVw7zs2UQ3hnuN3kLn3KcsLiMuA4JC/2GRlGfh2XC
 I0TJHX1mY+h6Xdec9WWUpISzCayK5Tj07a+ggLU/zNbEYjHewIQDcXSWh5PhgIf4qitK
 qks2Gjdhmyb8V9I07ZFrAlsIPtXzIWNkWskmpxMnRkoYvkRJm0Qah+yOrIuyduEvNhsy
 aFJW77PEiu16b7x11VgPikti+0mecMZOBEtC8rqRy33r64k/27W5hfLqlCMHNV6ggQoK
 IthJ2uIWBQ/H3iw1c278EcBY8DZd4zx0z+mkX4tqdTZUcZ+0TxOYRJlUvBY6Xmom5wTV
 bFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HIQEKd6TofbIVkSXkyhR8UBPl3/YBPiFJvSOLX+5OT0=;
 b=pSgaze9PmHqq36fUErKbCAAkbEnqLN+PpbP/9wwkcyYBGFhbVkTzJNQVaBuNdTcJ1M
 1fLVli2hKbD0ufP/5R7iI3ueIpUDAWEaKescnHxHy+pYv3xv1kvJ7AqR1T/NmHANnHQ2
 MJR65OfxkHLKdj+oWFaBbnpTpD3RTJfJvwyYLno0YpgXas6GbunEDfsJVkyLY/ZiqEY8
 OrI8BDjtXC9XSHKxXHnZ3UM2Iw5/lDUwfWzHt3ViQtSWhMW0NdAbZ2247LrTuj0V0xRF
 EbMHNXHZv+U0mZizVXp31Xm15poVZkPow+xvyXeV4Jr28IRSBkpzV+gPUloZskZXNAmj
 qA9g==
X-Gm-Message-State: APjAAAWi+WoE3wTa+ec5UOBZYTuBFRIvKDHJ5+9FPOVFAaBKK3H5eQIk
 RfFhTLeqZkVn7Mpl26eJg9+LzM39cR8FhlGpqeE=
X-Google-Smtp-Source: APXvYqyuWTvhbco2f9hNngg/g+iDQi1n+goAYTjbpPmQDFOcvm4pZKUyTIzU4mXgOfgAVTV0G/Lj/E78gI6EXeqE2OA=
X-Received: by 2002:aca:1c12:: with SMTP id c18mr4200383oic.113.1574277176070; 
 Wed, 20 Nov 2019 11:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20191120042856.415854-1-rosenp@gmail.com>
 <20191120042856.415854-4-rosenp@gmail.com>
 <s5hlfsbvzb9.wl-tiwai@suse.de>
 <CAKxU2N_2yLB3g9UqXzkRQ1NNNyfXPKXRLP6A3pMHV+Vkpz5QSw@mail.gmail.com>
 <s5hh82zvy9f.wl-tiwai@suse.de>
 <CAKxU2N9e=gab5axaZZVswOB_ihB=RU-xg08WNZA+LBfBMprL8A@mail.gmail.com>
 <s5hk17uv1lm.wl-tiwai@suse.de>
In-Reply-To: <s5hk17uv1lm.wl-tiwai@suse.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 20 Nov 2019 11:12:45 -0800
Message-ID: <CAKxU2N97ie0nN-H4enKALmcW7spG0K4znqHwLP+-HaXvDb5sWA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 4/4] aplay: Limit VUMeter progress bar to
 100 for negative as well
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

On Wed, Nov 20, 2019 at 10:34 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 20 Nov 2019 18:55:43 +0100,
> Rosen Penev wrote:
> >
> > On Tue, Nov 19, 2019 at 10:48 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Wed, 20 Nov 2019 07:36:19 +0100,
> > > Rosen Penev wrote:
> > > >
> > > > On Tue, Nov 19, 2019 at 10:26 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > > >
> > > > > On Wed, 20 Nov 2019 05:28:56 +0100,
> > > > > Rosen Penev wrote:
> > > > > >
> > > > > > If the progress bar somehow becomes negative, it ends up overwritting
> > > > > > tmp. Fixes this GCC warning:
> > > > > >
> > > > > > aplay.c:1747:18: warning: '%02d' directive writing between 2 and 11 bytes
> > > > > >  into a region of size 4 [-Wformat-overflow=]
> > > > > >  1747 |    sprintf(tmp, "%02d%%", maxperc[c]);
> > > > >
> > > > > This is false-positive.  The value passed there is guaranteed to be a
> > > > > positive integer at the calculation time.
> > > > Sure. But best to silence GCC. It probably optimizes better this way.
> > >
> > > I guess this adds more code in binary.  Comparing with 99U would work?
> > I tried that. Here are some results:
> >
> > 134348 for this patch
> > 134832 if changed to U. Also tried casting lhs to unnsigned int, same size.
> > 135125 originally
> >
> > I understand this is an exercise in micro-optimization, but still.
> >
> > Sizes are in bytes. It's the size of a compressed OpenWrt archive.
>
> Thanks for the analysis.  It's surprising, though, the original code
> became bigger.
I've learned not to question the compiler. If it complains, it means
it generates suboptimal code.
>
> The cast of lhs is basically superfluous since C performs the cast
> implicitly at comparison, BTW.
>
> In anyway, the number tells.  Could you respin this patch?
I can resend. Not sure what you really want.
> Meanwhile I'll apply the rest patches.
>
>
> thanks,
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
