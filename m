Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5F3BF856
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7B01705;
	Thu,  8 Jul 2021 12:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7B01705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625739727;
	bh=xIL2ZKjBXvMFhT33ntmUNbSg76qteHFRqM7ydRc4E4k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LoJJ5eL6kMIv2wPE94dkweWZ1KUMALYmGQZfoJMifBqDuCxHjDqimImqPdX9Hm4kV
	 6V46GQpfUnOitypacsXFsHPQpsFX93AdxUMQyXueaYMrLWOMad9oCYLzlCZcZHrT3K
	 SpC965gVw1bPrb/fWA7QnFD9VUvYiIaRgHSGi/do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56685F8028D;
	Thu,  8 Jul 2021 12:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACD20F80249; Thu,  8 Jul 2021 12:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36D00F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 12:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D00F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="G92dwu3s"
Received: by mail-pg1-x536.google.com with SMTP id s18so5425997pgg.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jE27VuYVlOpCcGE27gQsr7n24gIzFqBsKr/EtxzjirM=;
 b=G92dwu3sSHn0hpFfWmwVWhaEJSJl1fZGJKtLaF8K9SCsn9B+SxyuB+cdrHAa41EEoe
 bOPKELTY0ujAr1/uUjjxq+xIFE6F987CKLcGzuKYHjUYMp+UfKO1c/i/DWXP0ShUbMXu
 4eR9xAhqbcZUDGPmwY3PddJMgIsWU3LoVHfiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jE27VuYVlOpCcGE27gQsr7n24gIzFqBsKr/EtxzjirM=;
 b=TCrLvkhZIH7P+oEhtliPRd2tyUxx/H9MWhVuB9CO1uVIw4ph7oALzbXeVkdndwRAC4
 MnLgZTzIq9/tXVyDyvqHsYFrfcgyMqOVMo4vL/IpowClLkVIHZpOa05H/JUsByuNBozC
 1jYcx1MpEHyGYNwnTry9xTpXkzac9J/lVyA0+OhQOTem2QykSYqxawnxdwGZ+afGA6tL
 Qn8hKOV1kVC0M+YCTvHZdubssgO0N5e5vuAwQViSmZpEcIwfqegZDFQNXL9nBN/mNJDv
 ivL22OLHU6AkmUVovzqEmDUl7UVoH8qZEedI0ur9+pBSnsXNv8X6Ns3DaYwbHOQUaOW3
 QpBg==
X-Gm-Message-State: AOAM531n8wj6lXqtGDuETSWI7Ks0CltDrBe7T/c6aZ7njIcNFfgdDKEq
 h6YHMLyoRUJXspPCw1z+ixHFXQ==
X-Google-Smtp-Source: ABdhPJw7HnJbMSz3SImDF0XLYGQVXOiCHGIGnPFgK7xXG1hDpDv9iYrxuVajKmvbZrTOqqKljUkzgA==
X-Received: by 2002:a65:4903:: with SMTP id p3mr31418968pgs.402.1625739142574; 
 Thu, 08 Jul 2021 03:12:22 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:9350:6a13:c03e:920f])
 by smtp.gmail.com with ESMTPSA id y7sm2026578pfi.204.2021.07.08.03.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:12:21 -0700 (PDT)
Date: Thu, 8 Jul 2021 19:12:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YObPgQd9208Qmp2M@google.com>
References: <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
 <CAMo8BfKKMQkcsbOQaeEjq_FsJhdK=fn598dvh7YOcZshUSOH=g@mail.gmail.com>
 <s5ho8be8v3z.wl-tiwai@suse.de>
 <CAMo8Bf+FF8Ofq=FwoZZXp9vKiMaUZNAm+W=OJmu2j2XN6kLb-Q@mail.gmail.com>
 <s5hk0m26lfu.wl-tiwai@suse.de>
 <CAMo8BfLj+VLUbfUmHUSHOfc3PwbWd2w_xnaTZa9HyrcmvJCAkQ@mail.gmail.com>
 <s5hfswp6zx8.wl-tiwai@suse.de>
 <CAMo8Bf+bGujLN7H5yBqy-AkPCN7LgfmGSiWEGdjW6ZWeFoXs9A@mail.gmail.com>
 <s5h5yxl6uzo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h5yxl6uzo.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Leon Romanovsky <leon@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Max Filippov <jcmvbkbc@gmail.com>
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

On (21/07/08 11:00), Takashi Iwai wrote:
> > > --- a/sound/pci/intel8x0.c
> > > +++ b/sound/pci/intel8x0.c
> > > @@ -694,7 +694,7 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
> > >         int status, civ, i, step;
> > >         int ack = 0;
> > >
> > > -       if (!ichdev->prepared || ichdev->suspended)
> > > +       if (!(ichdev->prepared || ichdev->in_measurement) || ichdev->suspended)
> > 
> > There's no ichdev::in_measurement, but if replaced with
> > chip->in_measurement it indeed fixes my issue.
> 
> One must compile the code before sending out :-<
> 
> > So with this change:
> > Tested-by: Max Filippov <jcmvbkbc@gmail.com>
> 
> Great, thanks for quick testing, I'll prepare the fix patch now.

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
