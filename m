Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7C34333C
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B7701657;
	Sun, 21 Mar 2021 16:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B7701657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616341329;
	bh=PVr99AIgL+0CXrNW727DBxdzYYLgBmp9/Zi6U96Tr0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vrszi7P502p+FdnoEyuoZI8UrLNRjlCAoLHXyULXG/HuC9dumQEkHgSISh5hDuhi8
	 ELiW0SNrpovVFnXiy/h41BacBDfAvUfTsFKQuYMQvOjICO0wB6Pukg8ZP9OTkPr/Zb
	 xwt6cFn3dQ1KZHoxMLXUqeBWyvahGtmXoZtjRz7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9357AF8026D;
	Sun, 21 Mar 2021 16:40:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CC69F80257; Sun, 21 Mar 2021 16:40:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D9DFF80257
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D9DFF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iwAvu2rH"
Received: by mail-io1-xd31.google.com with SMTP id n198so11338031iod.0
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xFEl7zRd1y3+Yjl6YpSAci6EecEvaghk0CRZeU1EYug=;
 b=iwAvu2rH2NjnO6TRux4mQwSWkzaQ4bB6mc4ycyeLkNw8QB03szvHYT/JO1FvM/sLIV
 ZJ8ZptUPACF/qtJFVQIf2IlRKGmNmDUhtbu3Sjh4DZBvVKMBviIS9LVGZhcVPZnAmfsf
 ozPBsGvZA9z+swXBKk1rqdzrOfqQ+gysyHJn8g5J5jjQhsoJdw54KFUJwD94ZF9z9gSb
 ombiis1gU8zNwIt5vMwBj9jev1OWzXmyad6ZPSsrI/Q0qrXkjfBeVBiljs+Gg74Kf5zg
 XKduTsMFv52c1+fftEbqOkDgR+jDXBzGKLK6WIW8Gfhkc0GFsZQYQTqef+T0lJdSmy4c
 GFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFEl7zRd1y3+Yjl6YpSAci6EecEvaghk0CRZeU1EYug=;
 b=COq/p+rD26hP0/bepmaay6/0L09IeYbVLNVYBdAVzo9qyFTBJW5+8nSex9we+q2DmB
 432K+UawkuKCHwujuy8c6zFI0icuNz0H53zdN1GkX6DdDKFGEffRZ8XeJohXUfy//2C6
 l3PaHZuuFUwnu3YxSJmvyW2mvon4OWlIlswvX08PfjNl8u0G0LLoLjhTAqhqPUE4H3rH
 EveG/HFTH5wjLvu8CSynghJxXoW3uyqT2MBbX8l6OVDy7B4UMB4eaIwGOdvXju1S3YRF
 4EUxH7gAxbF9hkvvFJQFTvbO+VJOZHPYF/0dtcfycv5/o+UtZsxrAfKgXZHwWV7diAVX
 rkaw==
X-Gm-Message-State: AOAM531RJZyDoyUdyZdcqSxDLAiK1+genTmK1PLMlfVpzHoDWyakPgzg
 JMsMPR/pCyr+2Id+xsGKLoFp3VqGwLt9cVPpQrM=
X-Google-Smtp-Source: ABdhPJxfezZGN6S4kSlRC4d9WhjUyi4Cow0vVF3nxcd2+q7qH4p7tHEO6zD4Xw2kRMyi5eZwojtKgLAX75USekNds84=
X-Received: by 2002:a02:3085:: with SMTP id q127mr7954477jaq.137.1616341233776; 
 Sun, 21 Mar 2021 08:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210320222337.243368-1-ztong0001@gmail.com>
 <s5htup4exbl.wl-tiwai@suse.de>
In-Reply-To: <s5htup4exbl.wl-tiwai@suse.de>
From: Tong Zhang <ztong0001@gmail.com>
Date: Sun, 21 Mar 2021 11:40:23 -0400
Message-ID: <CAA5qM4CTdeLN894V9RTsx5kUdYC5g_OsHeyBWqpCwZcQoUZi5w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ALSA: hdsp and hdspm,
 don't disable device if not enabled
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Tom Rix <trix@redhat.com>,
 Allen Pais <allen.lkml@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
 Romain Perier <romain.perier@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Jasmin Fazlic <superfassl@gmail.com>
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

On Sun, Mar 21, 2021 at 4:16 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 20 Mar 2021 23:23:33 +0100,
> Tong Zhang wrote:
> >
> > This series fixes issues in hdsp and hdspm. The drivers in question want
> > to disable a device that is not enabled on error path.
> >
> > v2: add fix to rme9652
> >
> > Tong Zhang (3):
> >   ALSA: hdsp: don't disable if not enabled
> >   ALSA: hdspm: don't disable if not enabled
> >   ALSA: rme9652: don't disable if not enabled
>
> Thanks for the patches.
>
> IMO, a safer way for this is to add pci_is_enabled() check in *_free()
> functions around the call of pci_disable_device().  The point is that
> *_free() is the sole destructor function that manages all stuff, hence
> it's better to do all there.  And, of course, it'll be less changes.
>
> Care to resend v3 patches with that?
>
>
> thanks,
>
> Takashi

Thanks Takashi.
I made some changes and sent them as v3.
- Tong
