Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C810AEEDC
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 17:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E7D169C;
	Tue, 10 Sep 2019 17:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E7D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568130468;
	bh=X/pDrCq0DB/nakKPvvCUoQwB4qrh7m/DPBos7zLD8yA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXapWqt474mMbYgJ/uAJtQ5afZWkQkb5m5PUAl4l2itSgKPpwGgX9yVismuZlK6nb
	 HGUsYvD9XEpBurgGA3+t7SbiWlrJe0CzLWsdnVtsL/T6uQXOWo/vYC1pvdrTRzfOY7
	 mQQaFkfGuHb8vYR3fINV6YUAhZhX+OR2dwiPsAcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D33F80368;
	Tue, 10 Sep 2019 17:46:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2605F80368; Tue, 10 Sep 2019 17:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A247F800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 17:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A247F800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Liamxhbc"
Received: by mail-yw1-xc42.google.com with SMTP id n126so6600929ywf.1
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aZs7RtY4mLlTRHMd5Ag21djmJkTBfNqX7Z+Sw4I8/1k=;
 b=Liamxhbc/5XYbec+xaV+KTgbne5Ij/M+E0o8ipIoLEK8OmH8saTBQ2KdRs3xSZm6aB
 bu6UxcfkeTG8PMEPnXZyfAuwTNH8C9+H+QAXQ+zO4XcYKxhheNq2YxzkK2n+wYqP7Hkh
 giWeQpyeVDj8b2LvAmfITAAGVpa7gkkxdfPLN36BL4TWTliTbUOcwB1yr8D96Qwu4E84
 SWwqkw+WEUgJ2zK8yogc51YWyMK1XbPKlM5xg8lG/qxaFVq+wK+jznYFVuCCHKbJYde6
 uulPOr1nKn3aryetjlmVGuPyoQnDmfbdXBG6VCdNkcvZTxpOOg+QeDqTmNZW6X+f5KPN
 sFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aZs7RtY4mLlTRHMd5Ag21djmJkTBfNqX7Z+Sw4I8/1k=;
 b=HGkeicMjqbFioPDpnN5QYwcC5l5P/EwgozEWKeHh1IUS1xaNQaE444nsedKzzzWYDy
 tnXv2M/Bguw62S9SddTYLdP29bzBiFP8TGeMfpRTR9DuCJclmfJyid6sDeIgnEv+Xz4i
 6RvEzlKhnR5ZjuZYNNND7IUumkTkJ0BK9LN+Jygyql6OdSZYNEWpbbRDUzv/5UbcLfek
 eoWenhrdGeoNNh3bbWxQnfIpYNEJxhxPESvPqxon7tJrmU7hNTo1QM/F9shMXakmjZ6o
 5buIwI/AbyiUf5Cg/GfPZDG1K9vhMxij1+0ZpVJJatqsaxKMJiG7BYAbwq3hy1y+nAnh
 NAhw==
X-Gm-Message-State: APjAAAU/myTn7RQ8/AKEnW4Dn0Vy8soycONIbO7fCbp4npFhj6kmlX5P
 jAPBnsrJDklGw/3NcowHVQLKceQ2yrGdlVBfISK87FUK
X-Google-Smtp-Source: APXvYqyO44D/eWrCVk6xB8f2wYSrvPII+E7xZ+EWS0Qqix3fXdLYvm50FrihN5TZCv99HfL6SpiQKmyl9tgazil8tiE=
X-Received: by 2002:a0d:dac5:: with SMTP id c188mr22110757ywe.34.1568130356506; 
 Tue, 10 Sep 2019 08:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <8736h4nby1.wl-kuninori.morimoto.gx@renesas.com>
 <87pnk8lxbu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnk8lxbu.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 10 Sep 2019 08:45:45 -0700
Message-ID: <CAFQqKeVGCO-VsvaVS0qTxJrQajJEAZOYKvOZa7fZQY05KWA75Q@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 09/13] ASoC: soc-core: use devm_kzalloc()
	for rtd
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

On Mon, Sep 9, 2019 at 7:12 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current rtd, rtd->dev, rtd->codec_dais are created by normal kzalloc(),
> but we want to use devm_kzalloc() as much as possible.
>
> Created rtd->dev is registered by device_register() at
> soc_new_pcm_runtime(), and it will be freed at
> soc_free_pcm_runtime() by device_unregister().
>
> This means, if we can use devm_kzalloc(rtd->dev, xxx) for
> rtd / rtd->codec_dais, all these are automatically freed
> via soc_free_pcm_runtime().
> This patch uses devm_kzalloc(rtd->dev, xxx) for rtd / rtd->codec_dais.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 8802287..968cf5c 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -370,11 +370,8 @@ static void soc_free_pcm_runtime(struct
> snd_soc_pcm_runtime *rtd)
>         if (!rtd)
>                 return;
>
> -       kfree(rtd->codec_dais);
> -       if (rtd->dev)
> -               device_unregister(rtd->dev); /* soc_release_rtd_dev */
>         list_del(&rtd->list);
> -       kfree(rtd);
>
Morimoto-san,

Just curious, why did you remove the check for if(rtd->dev) here before
calling device_unregister()?

Thanks,
Ranjani

> +       device_unregister(rtd->dev); /* soc_release_rtd_dev */
>  }
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
