Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9828EBE1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 06:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE93916E5;
	Thu, 15 Oct 2020 06:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE93916E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602734464;
	bh=nXh9hjfmDO7FQ2hUMRw8nF7+tBopNyndc7jdbJNPrq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KVYijlKKY1x0479UvKzgH/9F8MUCKlfcmeF7W/Eh5h1qYIftDsvlY4Y2VJvIK25zZ
	 ijNRmD3xVHeelXm2RoW150hYfWkbuyruTkwNMeDt8+p8QqJpbKTZq47ujQ2K7Ari36
	 A/mO8UTtRqMDUSQ/hp7L7cU7QAqj2zncdGE+uyYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E77F8012A;
	Thu, 15 Oct 2020 05:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8490DF801A3; Thu, 15 Oct 2020 05:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B00EF800F6
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 05:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B00EF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vUbMCg0Z"
Received: by mail-wm1-x329.google.com with SMTP id k18so1783251wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 20:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ip6U2yos1bFcfZOuGKXZBrhpB8G/JJ6GoIBaicKoApQ=;
 b=vUbMCg0ZFoGr93mlVbEPsMHsKd9ffaPlRII/Acdw4LDhltB3PaMSK5t67dooerDJcl
 tO+VcTK0giTYNnCyZVBpi0t3EBThACEkuvOlwK2FIxZiOCufATiE4t33kC+Ve10Qqwi4
 49Y8W6rn1xbk1KFGegCW2NRgynepHUmq1zPcMqxugs0mfHp22ADWNquG738uGgV8YKT7
 mHTQtptkjztTnc3VQCm6+HPcUEGIzMYP/adR4ZYLuCRq7oICzGEAvi5K94bvEOt82rPL
 yLDgYtR2welBcjzXRyXLINmXqrvV6MoWFKtyiMsFKrZu8qGsrF/iKdfX0+ITAyBzaSoL
 Db/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ip6U2yos1bFcfZOuGKXZBrhpB8G/JJ6GoIBaicKoApQ=;
 b=FLKqeytTbVaPaCg8EgppkMkoV/osf/hPNKLG8dTRjfnBNeDzPcLcYtm8Fsgk6cstNJ
 hEUPDZA8Ein2fq+HlnzsFVCu/akrhkEMIXJSmmZwD0EaJz780IMPgWGnbBR8ESLqZyRa
 qgfaBi7hFFCw8stpErYuwOmFeQZHtMHmEmvcdrCmEyFXQWTyNP1QUiGFILYmsHvtKNnt
 ivMKyjKoll7qIvt55pqE0m0siupAy/p0hn3p7dU3hnpqppv1F15AnGI/xxFsWttS/GFL
 4U7WmNIPgM8klnwwTnq3ilP3+pv5LJ3gEt9x4iz0uxeiP+Q+QUD1iM+hieATsZY9SgRq
 aUeA==
X-Gm-Message-State: AOAM533Do71OcTezw+OtMD9bOXlfJ1FaCwlAZPa+E7ktAN+dkL4xzOk6
 hYxUjuInxnofaCF9cPkgqMo3FETxna1QjwVYJw==
X-Google-Smtp-Source: ABdhPJxk4H1rzzKUdzTrRip3XYUa1QXP2KUfj6bCN3+Vkx1NkVrwvNyJ1DVBCHs4ll8G2kJD0h/T2BFAaIRzgYcHgco=
X-Received: by 2002:a1c:7f97:: with SMTP id a145mr1856421wmd.160.1602734354179; 
 Wed, 14 Oct 2020 20:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAANJKekdzYeO7vp9o30a4yiB0M8mqjpuf2ZOPem4d8Ma_V8bjA@mail.gmail.com>
 <f05763b6-7b1a-29d1-3072-0642bca3d306@ivitera.com>
 <fb010ee6-3c20-0d2a-1be4-67500253740b@perex.cz>
In-Reply-To: <fb010ee6-3c20-0d2a-1be4-67500253740b@perex.cz>
From: Go Peppy <peppy.player@gmail.com>
Date: Wed, 14 Oct 2020 20:59:03 -0700
Message-ID: <CAANJKemSd+MSVGyhTVL_5HFBjvWCLBpZDoiFfE5Jei_bzjukBQ@mail.gmail.com>
Subject: Re: pcm_meter.c issue at s16_update
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
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

Hi Jaroslav,

I've tested the patch. It works fine. I didn't experience the original
issue with high CPU utilization after applying the patch.
When is the next planned release?

Thanks!
PPP


On Tue, Oct 13, 2020 at 10:35 AM Jaroslav Kysela <perex@perex.cz> wrote:

> Dne 17. 09. 20 v 21:13 Pavel Hofman napsal(a):
> > Hi,
> >
> > Dne 15. 09. 20 v 5:40 Go Peppy napsal(a):
> >>
> >> Just to remind what the issue is - while switching from one web radio
> >> station to another there is a high CPU usage for about 20 seconds.
> Because
> >> of that high CPU consumption almost all other processes are blocked.
> >
> > 20 seconds is only due to 32bit kernel on RPi. On 64bit machines the
> > boundary value is usually many orders of magnitude larger, basically
> > making the method never finish.
>
> Could you try this patch?
>
>
> https://github.com/alsa-project/alsa-lib/commit/a6c8ac0c85ca1b16684a687c7000c73aa38b7776
>
> It should prevent the big copies which are definitely nonsense and this
> change
> does not hide the real problem.
>
>                                         Jaroslav
>
> >
> > With regards,
> >
> > Pavel.
> >
>
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
