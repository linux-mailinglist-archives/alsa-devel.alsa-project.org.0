Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3B29CEE8
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:14:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099771676;
	Wed, 28 Oct 2020 09:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099771676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872899;
	bh=VyBXreZc2jxPyVqjNIRkn30RY7r5mKlonfprheF/eOY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRDEk+LBDtqBj23PK39MkJKuFVhjxHDf5Ua2zD6n+ZzigKJF5e6Jd4ZAsa01xO+kQ
	 LpX2zomNb17x9zCxqDkxIv6rsw//N3cvjCNzCG8rVHOdvuTKrayrBOLIC97/vet48R
	 Qb2XLafJT2uEWXwRlD5cEm0+KN4qDv9xEUYZGUzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A6C3F80553;
	Wed, 28 Oct 2020 09:07:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D99AF8020D; Tue, 27 Oct 2020 17:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BDF9F8019D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 17:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BDF9F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="jVifv3wc"
Received: by mail-ej1-x642.google.com with SMTP id ce10so3264797ejc.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jbe/1MUIOazjJNoYCLbZSaF/EYC3tySch0SP+bPnG10=;
 b=jVifv3wcHJtbLJO22cQhSQScaHCOkHk0uy60SV24XvvF7WpqIaa807hmufMDVKqnPF
 3xm47weUtJacIjSqbcrwXivMAtenN13kZafFSMO2m8dHHXFLXYX56OUdOoMTcRWlbgDG
 Thpj0UzfAOOdteCoRx63Xv7ZHZnjkyReDZ1Swoq+LyDarWGF0Mhj1KXWH3CO+MSgLHKb
 ZCBeQPWb0noZpqy+qKiKznJoq/vsPZZzkzwPD8DcAe8kPG1EHjLxd45J8Yu892ID37T7
 4/FpLOCqsI/vnQoRJn422RcKliIdkwc27vyhzCgMqyr6Vk10qaJ+O1CUPcx0OY5r8WIV
 v25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jbe/1MUIOazjJNoYCLbZSaF/EYC3tySch0SP+bPnG10=;
 b=r9Riszv98ZyIVZek7xrgLpFfZ/zFyuArJOVFA9RB4cuDrdAMsJh/OXnir44+yRLkHS
 2IKXY5N29BP69IhyMvahIkzjU2h8lUGo4NqEI6ZX0lLmWtwyIAWDaiwr1WiZrq+tA3N6
 cqYSi44xFdvDl3IU0wrFdOg2F02y0gbsVq6ZDfy82CyYByn4G6jV+oeqLsPRRKYaSI13
 0hZ3vRw3MfrOlF1+09uanKzM64lLPox5O4QV3rriJWC9oZGRJGIqvA/bsnSPoS4Mb6+I
 W4t+g7hUfWy5QajHhlOXzIV8tVsbY9N/johZXNfjrpLljp7RpgPA3TkifJDIyt+i4RR0
 rN9A==
X-Gm-Message-State: AOAM531hJNDeQQuMdWBkh6rFFVQmxpu1RAo0aZ1Wu4xbbe69SQaU4wGN
 CsDHI/cHAdMiyDt0S+7hHy6hqw2NuZEFF1omVv/PVg==
X-Google-Smtp-Source: ABdhPJzA1XzwQDZrf0aO0vJ0GFK7TlKkhiOIHp72TDLrdQ3tpl8EeLXanxCM3mEYAMp7LHDhMqHnk4D8XhUXPqwrAS0=
X-Received: by 2002:a17:906:d159:: with SMTP id
 br25mr3508153ejb.155.1603817934690; 
 Tue, 27 Oct 2020 09:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-4-brgl@bgdev.pl>
 <20201027112607-mutt-send-email-mst@kernel.org>
 <685d850347a1191bba8ba7766fc409b140d18f03.camel@perches.com>
In-Reply-To: <685d850347a1191bba8ba7766fc409b140d18f03.camel@perches.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 27 Oct 2020 17:58:43 +0100
Message-ID: <CAMpxmJU0C84DjPmqmWvPgv0zwgGLhkpKLRDuKkZHAa=wi+LvBA@mail.gmail.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
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

On Tue, Oct 27, 2020 at 5:50 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-10-27 at 11:28 -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 27, 2020 at 01:17:20PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Use the helper that checks for overflows internally instead of manually
> > > calculating the size of the new array.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > No problem with the patch, it does introduce some symmetry in the code.
>
> Perhaps more symmetry by using kmemdup
> ---
>  drivers/vhost/vringh.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> index 8bd8b403f087..99222a3651cd 100644
> --- a/drivers/vhost/vringh.c
> +++ b/drivers/vhost/vringh.c
> @@ -191,26 +191,23 @@ static int move_to_indirect(const struct vringh *vrh,
>  static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
>  {
>         struct kvec *new;
> -       unsigned int flag, new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> +       size_t new_num = (iov->max_num & ~VRINGH_IOV_ALLOCATED) * 2;
> +       size_t size;
>
>         if (new_num < 8)
>                 new_num = 8;
>
> -       flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
> -       if (flag)
> -               new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
> -       else {
> -               new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
> -               if (new) {
> -                       memcpy(new, iov->iov,
> -                              iov->max_num * sizeof(struct iovec));
> -                       flag = VRINGH_IOV_ALLOCATED;
> -               }
> -       }
> +       if (unlikely(check_mul_overflow(new_num, sizeof(struct iovec), &size)))
> +               return -ENOMEM;
> +

The whole point of using helpers such as kmalloc_array() is not doing
these checks manually.

Bartosz

> +       if (iov->max_num & VRINGH_IOV_ALLOCATED)
> +               new = krealloc(iov->iov, size, gfp);
> +       else
> +               new = kmemdup(iov->iov, size, gfp);
>         if (!new)
>                 return -ENOMEM;
>         iov->iov = new;
> -       iov->max_num = (new_num | flag);
> +       iov->max_num = new_num | VRINGH_IOV_ALLOCATED;
>         return 0;
>  }
>
>
>
