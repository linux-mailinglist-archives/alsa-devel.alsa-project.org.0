Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A829CEDF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:12:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCDBA168B;
	Wed, 28 Oct 2020 09:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCDBA168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872765;
	bh=3WYM9aeRCNIwFuSErVshcpp2GYy7Jr//SybcoG5jqHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbHQu/ToILo620rIdQAPNaDCU/lNI/p4qtDvBiXfZdxQswbbXNx9lHbb8Wcc+ximw
	 uMg1lWkoIAjsnzB2vefKig2h7DQyZqmx04AdGELk4yAsSi9VrFXYqUebV/PhjiZE2L
	 QjdB8RvYYrMQvi5Q8RzG5IHauRntN5pjku1LRcrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677D5F80524;
	Wed, 28 Oct 2020 09:06:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D59BFF80227; Tue, 27 Oct 2020 19:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45E94F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45E94F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="UoiZn2ej"
Received: by mail-io1-xd44.google.com with SMTP id z5so2536828iob.1
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ed3AIF7qFllVghkuMSpgY+e4IbkAvQfdceeKpQaUdxk=;
 b=UoiZn2ejgC7wXGBMzC5P1HZYY0nl6Wa3KE0/4S9Ciuieo7WYMXpDS0Iaqpc4XiAPdO
 qMSPbldaS4qotDJxt10RTbnG9MLtwWkVWivTQZrOtp1ibfKEiirPfM/hcYKscWcE5G9+
 hdA0OqGIyHCG+6wpH2Tcj5TcpWPTkljgGKnbGOzRrgHXz7X+jipA9gLH6g8zN/Jx0l4s
 /OKkLzKstGxFD2CYIuU1B33wI1K0Ml8+qKW5x8c0LoZzpt+1zSKoX87G79JYtOSZ/rG6
 gJ+d5QJ1DFf7m/UdqRG6MK7XEwKpEIVQ7cBBbC41y7jJlAMtCPK8jhzSkqrf6tO37h92
 JCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ed3AIF7qFllVghkuMSpgY+e4IbkAvQfdceeKpQaUdxk=;
 b=lJ5I2O9+xIZmUphnp/dfVrwawyxChVdZ0JGRWNOJAWnW1oyJC9McGZxyHUvm0R3dYB
 IrhIRlu1crYkwhXnpjhKMpD87T+eikL2S3zUnWTR+IPkKbCK0aYieggWkiKcuOQLOeBK
 +nJUdzep8jgNeqTpPv0PB0EPF+LXiAci9knEjfiBeyxDNKhcT2IWXVtoqPrWTlqpqFbW
 5fdsOOweoNeK8qAzWAUIN+ecUVBp998W00Y7MY948+qhCIrfopBvK1QjTgLFZNfsInDr
 pS40Se26dRnRKi+09+ijasstJVOVHf/fYzoqDRHyptOXIHsIUOdQb4SH5cv/b3lJA2HD
 rQ9Q==
X-Gm-Message-State: AOAM532F/yPFyEZOYS5f/TdQ9k/y+SHoxShNp735VLCrrxu4YNzfGVUi
 4ECGG9ipbxn8c7iZ/dUog8/+yHzAHiR4Wqp+ZwVnKw==
X-Google-Smtp-Source: ABdhPJwN08N0ZyzhoITVdnvB4ryeaKood+3vq0iIUYgCE2JJfuXumCj2bIDB2qD60OdiaWwDhRbGH3iAIo+DCc+ziro=
X-Received: by 2002:a6b:f401:: with SMTP id i1mr3323522iog.130.1603821657825; 
 Tue, 27 Oct 2020 11:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-4-brgl@bgdev.pl>
 <20201027112607-mutt-send-email-mst@kernel.org>
 <685d850347a1191bba8ba7766fc409b140d18f03.camel@perches.com>
 <CAMpxmJU0C84DjPmqmWvPgv0zwgGLhkpKLRDuKkZHAa=wi+LvBA@mail.gmail.com>
 <2767969b94fd66db1fb0fc13b5783ae65b7deb2f.camel@perches.com>
In-Reply-To: <2767969b94fd66db1fb0fc13b5783ae65b7deb2f.camel@perches.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Oct 2020 19:00:46 +0100
Message-ID: <CAMRc=McvW_E0aE2Ep=3aZvb=kNDMz6=ZH-EQzARAD-tyJG5Rrg@mail.gmail.com>
Subject: Re: [PATCH 3/8] vhost: vringh: use krealloc_array()
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:30 +0100
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-drm <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media <linux-media@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>,
 James Morse <james.morse@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Tue, Oct 27, 2020 at 6:08 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-10-27 at 17:58 +0100, Bartosz Golaszewski wrote:
> > On Tue, Oct 27, 2020 at 5:50 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Tue, 2020-10-27 at 11:28 -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Oct 27, 2020 at 01:17:20PM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > Use the helper that checks for overflows internally instead of manually
> > > > > calculating the size of the new array.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > No problem with the patch, it does introduce some symmetry in the code.
> > >
> > > Perhaps more symmetry by using kmemdup
> > > ---
> > >  drivers/vhost/vringh.c | 23 ++++++++++-------------
> > >  1 file changed, 10 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > > index 8bd8b403f087..99222a3651cd 100644
> > > --- a/drivers/vhost/vringh.c
> > > +++ b/drivers/vhost/vringh.c
> > > @@ -191,26 +191,23 @@ static int move_to_indirect(const struct vringh *vrh,
> > >  static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
> > >  {
> > >         struct kvec *new;
> > > -       unsigned int flag, new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> > > +       size_t new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> > > +       size_t size;
> > >
> > >         if (new_num < 8)
> > >                 new_num = 8;
> > >
> > > -       flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
> > > -       if (flag)
> > > -               new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
> > > -       else {
> > > -               new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
> > > -               if (new) {
> > > -                       memcpy(new, iov->iov,
> > > -                              iov->max_num * sizeof(struct iovec));
> > > -                       flag = VRINGH_IOV_ALLOCATED;
> > > -               }
> > > -       }
> > > +       if (unlikely(check_mul_overflow(new_num, sizeof(struct iovec), &size)))
> > > +               return -ENOMEM;
> > > +
> >
> > The whole point of using helpers such as kmalloc_array() is not doing
> > these checks manually.
>
> Tradeoffs for in readability for overflow and not mistyping or doing
> the multiplication of iov->max_num * sizeof(struct iovec) twice.
>

It's out of scope for this series - I want to add users for
krealloc_array(), not refactor code I don't really know. If the
maintainer of this bit objects, it can be dropped.

> Just fyi:
>
> the realloc doesn't do a multiplication overflow test as written so the
> suggestion is slightly more resistant to defect.
>

I'm not sure what your point is. I used krealloc_array() exactly for
this reason - to add the overflow test.

BTW I suppose kmalloc_array() here can be replaced with
krealloc_array() if the original pointer is NULL the first time it's
called.

Bartosz
