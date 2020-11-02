Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F52A3E07
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086101774;
	Tue,  3 Nov 2020 08:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086101774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389878;
	bh=h2jxAMuk7kvrVYkKCjwHUS2g/tF/U56UI4VY0a18gQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3V2aNs0Od1+AtJ1Bidzj2l/+Sv2ONgMwgeFe0w7tGE4qW19HxNKhZdfyeTwDb3tM
	 1ZCJLw5F9QbNgmFKfWG0pskYXHP3PIWzOX4FDw1ntr3ZHF+MlKHr0HXMrz7KpTi+Pi
	 Wu4cZM1SnjimbVMvptWp+Gt8BG59JwLoclcW0qJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14A1FF80516;
	Tue,  3 Nov 2020 08:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA81FF80232; Mon,  2 Nov 2020 16:43:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F7FF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F7FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="GeZOTcEL"
Received: by mail-ej1-x642.google.com with SMTP id dk16so18913165ejb.12
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nS8GcWnRvgAze9eGONKgTm54dvXOecWjyagLlZce7Is=;
 b=GeZOTcELL0wHCC2LsYMp4AHDK/U4F0TpiMBx0TLSL9ySl4L4C8XcHcbUz5fZNLjniM
 TuvyR4acGxkL9PjF4zrWBiY258C6IcsF0J9LR6SowCpPKmCKno9m8GSu4pQU9/WnDZH7
 7UkFNkQaU4R7nVWteNdPvBIJxPPgU8WHblr0zM6zQdwUqyKaEmqLaDFu3SLFEdkz8070
 +tw2ItP8FRhBWa/R+2tqWgkisP8VzJCQvEhMDs6cgObDq+FQOIe0RTsRoPUGJizua2af
 DerEr/5gFY6bKe9hU6ejx4bsKfOsV8bd9SlGakYbkn/eCz8qeemmHfgRz2JwvgXFT4AO
 tsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nS8GcWnRvgAze9eGONKgTm54dvXOecWjyagLlZce7Is=;
 b=IoyI3v92uGGUa4hH08vAMed5Fvy5wNtaF3xhCDOD4+XYuJwsWP/FBm17W06EahEs40
 L1EQ6p/6uxcDSUPOY+lW3mfFNQlgyixwLUl2/9HLrHoV5WFFczrudGcXVX8rLdSMG2Xh
 YhILJimPdCa7om4KWpVSzJ9scKC/SeS2HZzf0iKiYhpMzCjWH6d2QWqXjfeH7q4Yzv37
 hwpjEtVNJTIVy0uDM3kKngo0RACSLEcYkx4viZ6X2J3SJc90cm5npID925pRko4KAvIC
 vMhG6UYufDPG+DLBaLLAum+Dzd3OeDz13yOhHlFjuccZHtiWQvX9uyPCozE9H+Zfapfh
 +grw==
X-Gm-Message-State: AOAM532IvXCmOX+ULomi1pf8TwSDM2I3/baoCgkwPWqZHzeckvA6YMyZ
 RAgIg1rrZcrjlJ5uaWlM0ZNpt9vRx26jUT/odaPXSg==
X-Google-Smtp-Source: ABdhPJyfQCPRUI5fZkO4PkZURO7NzoV9R0m8AUPk0K6Fot5LT+TZuLggUEPGTEcOXrVbpzMXVwNY7147yllEhTQsoPY=
X-Received: by 2002:a17:906:1c84:: with SMTP id
 g4mr2189231ejh.155.1604331814011; 
 Mon, 02 Nov 2020 07:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl>
 <20201102152037.963-2-brgl@bgdev.pl>
 <20201102154101.GO27442@casper.infradead.org>
In-Reply-To: <20201102154101.GO27442@casper.infradead.org>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 2 Nov 2020 16:43:22 +0100
Message-ID: <CAMpxmJUOb+tR25_h0R1kq7K0d=4DpmutW_V6UggL-+u8u3271g@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] mm: slab: provide krealloc_array()
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
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
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

On Mon, Nov 2, 2020 at 4:41 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Nov 02, 2020 at 04:20:30PM +0100, Bartosz Golaszewski wrote:
> > +Chunks allocated with `kmalloc` can be resized with `krealloc`. Similarly
> > +to `kmalloc_array`: a helper for resising arrays is provided in the form of
> > +`krealloc_array`.
>
> Is there any reason you chose to `do_this` instead of do_this()?  The
> automarkup script turns do_this() into a nice link to the documentation
> which you're adding below.
>

No, I just didn't know better. Thanks for bringing this to my attention.

> Typo 'resising' resizing.

Will fix in the next iteration.

Bartosz
