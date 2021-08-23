Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F73F5104
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 21:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170D985D;
	Mon, 23 Aug 2021 21:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170D985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629745666;
	bh=MB7fW8bIz3IVttQghHwCLdNhEyYrblrExiN/IT9pEk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rk9fQ8G7/fAytzxm6g0zhkkknWypuqjNv+uFntyWWjmaXYeqwFaVdPT7dUMZlX9Ec
	 QgzWaRwS+d5Tb6RojGUfQ18pwppprFJu5bNVXy8INNe1cqji1GVQzFrcrcANlrO18w
	 awRmTMYKEJGFe4J80WY9XUnxJPffvPx8hBKqQMaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0A4F8020D;
	Mon, 23 Aug 2021 21:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48673F800E7; Mon, 23 Aug 2021 21:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBEDF800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 21:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBEDF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MIhDofz+"
Received: by mail-lj1-x229.google.com with SMTP id w4so31781087ljh.13
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KmywwXK0A5vKxlEbBmU4vzVqtBFAdy+Nx/f1ijedxg4=;
 b=MIhDofz+Lv+TDZKS/WwvCEpU6riNDl2p0BdRUCTWAFWoYlH1OTwAP+/Pd1GOgFzU+c
 gROEPYw15UUaNOgfC401Y0JF1AZjzgEJUuALkx7pVA8OG/KrAwek01Lcj7XXOmSvUf4l
 ++L36AJD++7mWoH7+ZIqfkMvZCT8/TXSxpRONQiefPuD9mVXG5EJxjcuopTZHVz+ydFc
 eVT3le41WlxwTFFGDrWaEW3D3j2ccwY0ezy6EALC6Tfs/GJckk2VIMblmid0VLsaMV5D
 TnlYzpeJa8iSdF5BRGzoDvhCUEcLeCb4hRjf8hYpeaKPd51hpwFLr6lIblIjm1LjcMbW
 XLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KmywwXK0A5vKxlEbBmU4vzVqtBFAdy+Nx/f1ijedxg4=;
 b=CimIDNu8XY5hqugBxlcKPGSgnzp+XXUCH2rSBU20ei2OV3Fvv5JMXqxEOl0+Msh9J7
 0uJd+Tf5AMi2MyJsdOkY7bGIaqYgVqk7G77OHSu1XnwIjEmTpJ69DdZhRCxdcHKCcvFm
 F+4FWJRmsqREZRH6zSyZt+T57JaBKxsc8rphH/DN5Ndub6tTa9We6WlrAm3/oE+4Lkmi
 2Op7NqKRRsA+r52Lbscfvw4gX488R/RDuN0CN6BlXH8BcNB9Syx2wOOoI8zOLb3zrJrm
 8EAAg6J8qSAH0SJz8ipSrrsDjSbjzBCfl40i8kQ/7vMugh+Fh3nbSs1xV43AyDtI4auc
 PBwA==
X-Gm-Message-State: AOAM532Td5TROaLWMJcg2WcXSb49UZZZ9VUpYtvTzFqJlXJbjDa87GtU
 e73t2LKkBxRHEk/XXvuyLVcaMlhjdeaXnK6yPck=
X-Google-Smtp-Source: ABdhPJx4a+AscRiCA9WOVaZ/biN279HOQqcJCGXLxHiUY6N+berZApNzXHwa96tMXQn1UXeex0zWx92Uyf9ZQKsmvCs=
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr5543082ljp.494.1629745576889; 
 Mon, 23 Aug 2021 12:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
 <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
 <20210823184727.GE890690@belle.intranet.vanheusden.com>
In-Reply-To: <20210823184727.GE890690@belle.intranet.vanheusden.com>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Tue, 24 Aug 2021 00:36:05 +0530
Message-ID: <CAAd2w=adJ3+Rw16ZVbkq72O7D0Dgo1ukHF1DLK6aaN3sGKu3DQ@mail.gmail.com>
Subject: Re: arecord is failing with -V stereo
To: folkert <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Hi Folkert,

Tried with the above code.This is also getting p value negative.

My point is p is negative it doesn't go to

if (p >= bar_length)
             p = bar_length - 1;
it is going to memset second argument p,that is negative so crashing.


logs:
localhost ~ # ./sujith/arecord -D hw:1,2 -f S32_LE -r 48000 -c 2 1.wav -V s
Sujith entry: main
Recording WAVE '1.wav' : Signed 32 bit Little Endian, Rate 48000 Hz, Stereo

 print_vu_meter_stereo sujith 35  ////////////////////////// c=0 case
 print_vu_meter_stereo sujith* -9227433* /////////////////////c=1 case p
value negative which is going to memset second argument.

Thanks
Sujith



On Tue, Aug 24, 2021 at 12:17 AM folkert <folkert@vanheusden.com> wrote:

> Ah same bug.
> Please try this.
> The idea is that in both cases the extra '-1' breaks it.
>
> diff --git a/aplay/aplay.c b/aplay/aplay.c
> index cc51dcb..47db7e7 100644
> --- a/aplay/aplay.c
> +++ b/aplay/aplay.c
> @@ -1753,8 +1753,8 @@ static void print_vu_meter_stereo(int *perc, int
> *maxperc)
>         for (c = 0; c < 2; c++) {
>                 int p = perc[c] * bar_length / 100;
>                 char tmp[4];
> -               if (p > bar_length)
> -                       p = bar_length;
> +               if (p >= bar_length)
> +                       p = bar_length - 1;
>                 if (c)
>                         memset(line + bar_length + 6 + 1, '#', p);
>                 else
>
>
> On Tue, Aug 24, 2021 at 12:14:00AM +0530, sujith kumar reddy wrote:
> > Tried with the above code.This is also getting p value negative.
> >
> > snippet code:
> >
> >    fprintf(stderr, _(" %s sujith %d \n"), __func__,p);
> >                 if (p > bar_length)
> >                         p = bar_length;
> >                 if (c)
> >                         memset(line + bar_length + 6 + 1, '#', p);
> >                 else
> >                         memset(line + bar_length - p - 1, '#', p);
> >
> >
> > logs....
> > //  c=0 case
> >
> > print_vu_meter_stereo sujith 35  ///value of p is 35
> > c =1 case
> >
> >  print_vu_meter_stereo sujith -9227433 ///value is negative//
> >
> > On Mon, Aug 23, 2021 at 10:33 PM folkert <folkert@vanheusden.com> wrote:
> >
> > > >         const int bar_length = 35;
> > > >         char line[80];
> > > ...
> > > >                 if (p > bar_length)
> > > >                         p = bar_length;
> > > >                 if (c)
> > > >                         memset(line + bar_length + 6 + 1, '#', p);
> > > > ----------------//this is the line where it is crashing.here p value
> is
> > > > becoming negative at c=1.As we see if we change the p value to
> bar_length
> > > > it works fine ..As it is a player issue not a driver issue.
> > >
> > > This is puzzling.
> > > bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77, that fits
> > > easlity in 80.
> > >
> > > But wait:
> > >
> > >                         line[bar_length - p - 1] = '+';
> > >
> > > p is max bar_length, so we would end up putting '+' in line[-1]
> > >
> > > Can you try this?
> > >
> > >
> > > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > > index cc51dcb..9cfd52c 100644
> > > --- a/aplay/aplay.c
> > > +++ b/aplay/aplay.c
> > > @@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int *perc, int
> > > *maxperc)
> > >                         p = bar_length;
> > >                 if (c)
> > >                         line[bar_length + 6 + 1 + p] = '+';
> > > -               else
> > > +               else if (p < bar_length)
> > >                         line[bar_length - p - 1] = '+';
> > >                 if (ABS(maxperc[c]) > 99)
> > >                         sprintf(tmp, "MAX");
> > >
>
