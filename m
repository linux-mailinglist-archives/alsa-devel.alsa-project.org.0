Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D5155878
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 14:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 244B21698;
	Fri,  7 Feb 2020 14:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 244B21698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581082246;
	bh=u7qio39YOeBCDUU9hl80YcDdLa6gVz2bAvotoBFtEf8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qb9v8NQMezwlhDgaWygC+nYDUtDFDX2euNnKxpSJQnQSkI1kqMsiijo1Z9RbgkYk3
	 8LFMVzGC95GsOFSTvvJmLwaUmzljyzuz5ZMv6s3Tbdoxds0UDJdSmphUCfS2TM2Veg
	 +ZaqIwpniQevTd7+N52W++77Xtqil//HytqiAs6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB27F8027B;
	Fri,  7 Feb 2020 14:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 616AAF80162; Fri,  7 Feb 2020 01:20:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD9A4F80059
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 01:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD9A4F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qj3OJ5o+"
Received: by mail-wm1-x344.google.com with SMTP id t23so803317wmi.1
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 16:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoKbncYciVD/U0lXsVtX7zMw7+64OYjcPIBvVRn+6s0=;
 b=Qj3OJ5o+NZYQqiNpwhkHY6NkuDOWN2WRHGvAESwIPHvALrAwukfBresMJmpJXKm+RL
 hC761V+ZxgFXQ2clScIMgNLNnq4/2AsWbaOwyZXwwHGo/Ec4XqTYFXvq/gRxREfho6qk
 Zt89/SHhCUmd/v5EmIzxa/MyEGhONkIc+SJvTo0eCHdMuPCtvLnmYzCnz22eY7InpZjP
 nQxDE6wYNdlmBPXVjkVanaSK1I1qRX7Y5/ly8PNs2P0bdWcWCYcgabLmfyQoEsaAp0Lo
 C5DMWWdN9MG9LLSR4oUyFsFszJ5uaBxEHtl/iiks5u4TpGl007Cx+5mjrk+9k1UxeGrS
 TuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoKbncYciVD/U0lXsVtX7zMw7+64OYjcPIBvVRn+6s0=;
 b=N17Pze9t1vbuP4tKbcz/KMVGF4JxlCucTOuZMnuXAXZZiYfBkoNxrLgXDBK49HXdks
 5YTjruyYdst0JVMBJcQ+3I9+JMfjlcWTZDw6EiSV8Z7Y0NHDEBYYJ4HtN8tO5XTBLjcr
 K77X+9L/kpAJUoGFW9u7mG3cthzZfBv9YShbMmBkcyxr0Cbb2rr64s0unhIkZcJghpZ6
 TjrFEw5W0Dn9tYAQXQ0ReIg7w3BJOD2MVKOpz16ZPDjroHG1ZVlithZdKfGrSbkkBkKi
 zKSEHCkbzDusRiEQ8dShz/B0isczzpzYPLPippncORT9Q/C4Xin8U0xUNWTN7iJSrqj7
 IOFw==
X-Gm-Message-State: APjAAAVnNKcZbIi3IihyF6bLl52Bg4xID/S56lBO6IIJfAh4pZ6as49L
 CyjJDnsKrbymOve5pzvxvnYvIgI8y5y359IZ2m0=
X-Google-Smtp-Source: APXvYqzIXRjuSZxTb33abfAb+H/njTbl0nEKpgWqOqkYgZ+CNxE/mVsT6oRBXG3M2VYM0yV8Hfepdj13NX/56V6/zAs=
X-Received: by 2002:a1c:964f:: with SMTP id y76mr454472wmd.62.1581034809466;
 Thu, 06 Feb 2020 16:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20200206200345.175344-1-caij2003@gmail.com>
 <20200206232840.227705-1-ndesaulniers@google.com>
 <CAOHxzjGiO54BwUDR4zz6MwvFT3-XXDx830cQcQAcVUPA1N_emA@mail.gmail.com>
 <CAKwvOdkaQJrXt3y_QDyZpQpeJqB0nYsV_p21h63SS1k2Q3Da=w@mail.gmail.com>
In-Reply-To: <CAKwvOdkaQJrXt3y_QDyZpQpeJqB0nYsV_p21h63SS1k2Q3Da=w@mail.gmail.com>
From: Jian Cai <caij2003@gmail.com>
Date: Thu, 6 Feb 2020 16:19:58 -0800
Message-ID: <CAOHxzjGmqM2F=U23M7hFm6+dumsdDi8g1HFm3t3vQV2fozFz+w@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Approved-At: Fri, 07 Feb 2020 14:27:21 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: fix an uninitialized use
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

Thanks for the pointers. You are absolutely right (despite working late),
this is not an issue upstream anymore. I was looking at 4.14 and 4.19 on
ChromeOS. I did double check the upstream code but stopped right after
seeing 'ret' was still uninitialized. Thanks again for the information.

On Thu, Feb 6, 2020 at 4:04 PM Nick Desaulniers <ndesaulniers@google.com>
wrote:

> On Fri, Feb 7, 2020 at 12:55 AM Jian Cai <caij2003@gmail.com> wrote:
> >
> > Hi Nick,
> >
> > 'ret' is only defined in if branches and for loops (e.g.
> for_each_component_dais). If none of these branches or loops get executed,
> then eventually we end up having
>
> https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L1276
> and
> https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L1287
> both assign to `ret` before any `goto` is taken.  Are you perhaps
> looking at an older branch of the LTS tree, but not the master branch
> of the mainline tree? (Or it's possible that it's 1am here in Zurich,
> and I should go to bed).
>
>
> >
> > int ret;
> >
> > err_probe:
> >         if (ret < 0)
> >                 soc_cleanup_component(component);
> >
> > With -ftrivial-auto-var-init=pattern, this code becomes
> >
> > int ret;
> >
> > err_probe:
> >        ret = 0xAAAAAAAA;
> >         if (ret < 0)
> >                 soc_cleanup_component(component);
> >
> > So soc_cleanup_component gets called unintentionally this case, which
> causes the built kernel to miss some files.
> >
> >
> >
> > On Thu, Feb 6, 2020 at 3:28 PM Nick Desaulniers <ndesaulniers@google.com>
> wrote:
> >>
> >> > Fixed the uninitialized use of a signed integer variable ret in
> >> > soc_probe_component when all its definitions are not executed. This
> >> > caused  -ftrivial-auto-var-init=pattern to initialize the variable to
> >> > repeated 0xAA (i.e. a negative value) and triggered the following code
> >> > unintentionally.
> >>
> >> > Signed-off-by: Jian Cai <caij2003@gmail.com>
> >>
> >> Hi Jian,
> >> I don't quite follow; it looks like `ret` is assigned to multiple times
> in
> >> `soc_probe_component`. Are one of the return values of one of the
> functions
> >> that are called then assigned to `ret` undefined? What control flow
> path leaves
> >> `ret` unitialized?
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
