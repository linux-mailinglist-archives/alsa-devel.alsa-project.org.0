Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763A2A4B66
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E33C416B5;
	Tue,  3 Nov 2020 17:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E33C416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420875;
	bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+PWTydInD+DwhSZO/ltqvc0hbhWpmXOtY1OFNHJ8d6ka8kgEQg0soviH6VALx0Eg
	 cgHkdAtKatBRUKvofVVpztKG6Ir4Fj8sC11DvQzPog/ijAOVcMVoaWi8UKHy19kP/G
	 cl9RsXLanSglqgrQx1/gNrXd7Yp0dKN8EPbz9r+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7818F80279;
	Tue,  3 Nov 2020 17:26:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00602F80171; Tue,  3 Nov 2020 11:12:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46ABBF80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 11:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46ABBF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="0kZJ8Rb9"
Received: by mail-il1-x142.google.com with SMTP id e16so1273162ile.0
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 02:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
 b=0kZJ8Rb9+0/H3MVDUevyCTWAc1pKYDKmZzYacQKCMmC/UQ66qmBgifq30qeC2iVztI
 ATPY1knKGSXDzJ6+Nm3tm3Ffn81WkUy/sBCmPfD94FibScrq8/Ui+9TUYldHJ7pcnk1t
 gx+nhhl2zwwSRNNGE6X3g+mK8ICIfWN15TzWFBAm2Ac+Fnp/Nc7mvMvQxol3TgeHLuHe
 fB2HlcDfVoQUKXEDUTDlyUi1MwQ1IJbHWYhRPhxFdctoJ/ps1THqNVawMwUkgd/uHgQv
 AYOBJizY9XV1L84dWspkXE7W+jTkhJPV/Ws9WaUAfWMNJujPYu+ExPkpZXByTNBy8wKU
 VaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
 b=rtnAnh5nijhWt12Sjkl9SbY6MutZB+ohMiv4y5Hx3ve3pb9+i2PJlwMxcitCyEbwBs
 /4vBhZ8m8JkYnhuQziqkJ7XkdEo7nkyElmSAtxaV72WVJybiM9cgktb85PfkmyyeBr6B
 ZmC3wwSEI0cXU8uNqs/3kQGuelrne+333vpMM0NBoONrUubKIoa4reaQT3BxFY8GLSVS
 rmTu0SWfIoKNPQsSR5mAhvpaTRgGC8k56Y5BkFkZtA+9Ln+9PFtHK1ftXlqe5BcnTLRl
 RPzwggkr5Cn1mvoX1tZQloFuGIM79Km9zIcf46H6JwI/GW+6fRLixPaUa08KDOZKoOf+
 YLRQ==
X-Gm-Message-State: AOAM531XFXUNvjF6wHRTFbV0hi+R5Cz2Qmo7bqsSX2Tuier3CFx9l/+Q
 i3pO1B3hh+HD6sAVq1iPNCOf9wkXjaFrwGLfJ1C6Fw==
X-Google-Smtp-Source: ABdhPJxXaKRnidyqbx6iUG254lVJzvxaSAJ3Y8t7tBOtYCNJcNKDXTe4r/tIo6bcU8qIdoqImm6tntmYdwdU1LT5yRY=
X-Received: by 2002:a05:6e02:926:: with SMTP id
 o6mr14285653ilt.287.1604398333472; 
 Tue, 03 Nov 2020 02:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl>
 <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
In-Reply-To: <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Nov 2020 11:12:02 +0100
Message-ID: <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] slab: provide and use krealloc_array()
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 03 Nov 2020 17:26:07 +0100
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mm@kvack.org, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Tue, Nov 3, 2020 at 5:14 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-02 at 16:20 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Andy brought to my attention the fact that users allocating an array of
> > equally sized elements should check if the size multiplication doesn't
> > overflow. This is why we have helpers like kmalloc_array().
> >
> > However we don't have krealloc_array() equivalent and there are many
> > users who do their own multiplication when calling krealloc() for arrays.
> >
> > This series provides krealloc_array() and uses it in a couple places.
>
> My concern about this is a possible assumption that __GFP_ZERO will
> work, and as far as I know, it will not.
>

Yeah so I had this concern for devm_krealloc() and even sent a patch
that extended it to honor __GFP_ZERO before I noticed that regular
krealloc() silently ignores __GFP_ZERO. I'm not sure if this is on
purpose. Maybe we should either make krealloc() honor __GFP_ZERO or
explicitly state in its documentation that it ignores it?

This concern isn't really related to this patch as such - it's more of
a general krealloc() inconsistency.

Bartosz
