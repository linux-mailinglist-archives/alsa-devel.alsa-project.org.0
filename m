Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7F3F5152
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 21:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14AF185D;
	Mon, 23 Aug 2021 21:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14AF185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629747309;
	bh=u78umhY3zD8RUgrpBuzUCS9YCffI9uoJ/cwHa6jAjDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4NInFbNlCt+beZn9Sissjn8CRsTMX61cee0+O+KJdxAe8hJ9WVxP0nmLafpCutUx
	 RsWRD5hIqmtoQrRdX9LVZYbQt5Do7PWSHaj9AzMfipVjZeAFfRO0HMipXBXKf9s9O/
	 SrSQeZ8HI2onr7uYEfFGGT6y9aL471GF1GrC9nVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F8CAF8020D;
	Mon, 23 Aug 2021 21:33:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29722F8020C; Mon, 23 Aug 2021 21:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E056CF800AE
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 21:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E056CF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FPPlH+Uc"
Received: by mail-lf1-x132.google.com with SMTP id f10so25365060lfv.6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VigGZoQ/lKb3J05GDXlbNquWcUCOcEyt3V1BXAtRJVU=;
 b=FPPlH+UcAUU7532PrXy81mx8apn//J7AVgSU2M0LG8fIEhQuPBQDe2vFOAfcmhZrXZ
 e29zOWawHShO+KymnB3ma1qKXkdNVsCeZvLwfh7w+iq0DS4LuH4g1kGLetgYgcJU4Wh5
 4mGCjOShR2cBvzJ7Bf7b76GuDnHNnLRkoJ+WrzJMU8abWUKiiLICpu8YM23YoxoI++ZI
 1pT5ByUyY91H+Set4+hzVSAsqcPY+JWs4WlfLZRlRpVmI3FB08qOuZl7WhHXsByXnKA6
 /tFzITWEsEOLij1G5CrvWRqnqRQwuVORWLwBaDz7YIeH+3Jkzw2czTBJxTy5LB6naVJI
 eq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VigGZoQ/lKb3J05GDXlbNquWcUCOcEyt3V1BXAtRJVU=;
 b=Cmmrq9kYSqc0/O6tN2FX3MpMhXvMYrBIRxJpicG54jHaeadPklQpV6HfyjdQ4P+wLg
 J207zxHDRm+46t68K6h6ozY50Iyc0P6ek6f4OzfVAVE5Y+ZNiVMJGCkmCjM+oQInoGq9
 b9H+Ro1152NPpjF9yPcymWDT5Tzix6aT9a7leNELr55IEjaWq9qE6NU0iUrEqLo/G5PE
 5AY4J1jKExkuJx5IDcvEAeeK29K/OFdI/EsKVAxD19C1hG0SduoN21sYPJqWP8Nn7Oee
 pgRohJP1E7isimJ7NHCrHK/A+oCVyUu4gzUuaiJ98Q4C9VmahA6U9JG0SbUVmQQozS5s
 VP7A==
X-Gm-Message-State: AOAM531H9Jh1RzVCcHXyPObZHl6HN3ul0S2lBl7gz+mLyzwkjnO5gABp
 +X6rGav0HT/OFPpIRyDeVDKwAGdPzHfYZPxKY6U=
X-Google-Smtp-Source: ABdhPJyf59ELR6O7H+8wcsPArT0BSj2OHQW9Ug+wPSUqlxV1zCx8r5p2Dpqh0wjPd6qd2vy3Zkekx7GQ4nniNxBivyE=
X-Received: by 2002:ac2:4e03:: with SMTP id e3mr27815566lfr.74.1629747218956; 
 Mon, 23 Aug 2021 12:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
 <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
 <20210823184727.GE890690@belle.intranet.vanheusden.com>
 <CAAd2w=adJ3+Rw16ZVbkq72O7D0Dgo1ukHF1DLK6aaN3sGKu3DQ@mail.gmail.com>
 <20210823190853.GF890690@belle.intranet.vanheusden.com>
In-Reply-To: <20210823190853.GF890690@belle.intranet.vanheusden.com>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Tue, 24 Aug 2021 01:03:27 +0530
Message-ID: <CAAd2w=YDc9O7keXFSo++_B51TKbiBABVDbbCW=Mst8-W1FcCqg@mail.gmail.com>
Subject: Re: arecord is failing with -V stereo
To: folkert <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi folkert,

The above you suggested p=3D0 is  working .
i tried like
 if (p > bar_length || p < 0)
       p =3D bar_length;
This is also working.

Which is the perfect one we can use?
Is there any impact of p with driver data or this is just a
application calculated value.

Thanks
Sujith


On Tue, Aug 24, 2021 at 12:39 AM folkert <folkert@vanheusden.com> wrote:

> :-)
>
> If this also doesn't work, then I give up.
>
> diff --git a/aplay/aplay.c b/aplay/aplay.c
> index cc51dcb..03a4f73 100644
> --- a/aplay/aplay.c
> +++ b/aplay/aplay.c
> @@ -1753,8 +1753,10 @@ static void print_vu_meter_stereo(int *perc, int
> *maxperc)
>         for (c =3D 0; c < 2; c++) {
>                 int p =3D perc[c] * bar_length / 100;
>                 char tmp[4];
> -               if (p > bar_length)
> -                       p =3D bar_length;
> +               if (p >=3D bar_length)
> +                       p =3D bar_length - 1;
> +               if (p < 0)
> +                       p =3D 0;
>                 if (c)
>                         memset(line + bar_length + 6 + 1, '#', p);
>                 else
>
> On Tue, Aug 24, 2021 at 12:36:05AM +0530, sujith kumar reddy wrote:
> > Hi Folkert,
> >
> > Tried with the above code.This is also getting p value negative.
> >
> > My point is p is negative it doesn't go to
> >
> > if (p >=3D bar_length)
> >              p =3D bar_length - 1;
> > it is going to memset second argument p,that is negative so crashing.
> >
> >
> > logs:
> > localhost ~ # ./sujith/arecord -D hw:1,2 -f S32_LE -r 48000 -c 2 1.wav
> -V s
> > Sujith entry: main
> > Recording WAVE '1.wav' : Signed 32 bit Little Endian, Rate 48000 Hz,
> Stereo
> >
> >  print_vu_meter_stereo sujith 35  ////////////////////////// c=3D0 case
> >  print_vu_meter_stereo sujith* -9227433* /////////////////////c=3D1 cas=
e p
> > value negative which is going to memset second argument.
> >
> > Thanks
> > Sujith
> >
> >
> >
> > On Tue, Aug 24, 2021 at 12:17 AM folkert <folkert@vanheusden.com> wrote=
:
> >
> > > Ah same bug.
> > > Please try this.
> > > The idea is that in both cases the extra '-1' breaks it.
> > >
> > > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > > index cc51dcb..47db7e7 100644
> > > --- a/aplay/aplay.c
> > > +++ b/aplay/aplay.c
> > > @@ -1753,8 +1753,8 @@ static void print_vu_meter_stereo(int *perc, in=
t
> > > *maxperc)
> > >         for (c =3D 0; c < 2; c++) {
> > >                 int p =3D perc[c] * bar_length / 100;
> > >                 char tmp[4];
> > > -               if (p > bar_length)
> > > -                       p =3D bar_length;
> > > +               if (p >=3D bar_length)
> > > +                       p =3D bar_length - 1;
> > >                 if (c)
> > >                         memset(line + bar_length + 6 + 1, '#', p);
> > >                 else
> > >
> > >
> > > On Tue, Aug 24, 2021 at 12:14:00AM +0530, sujith kumar reddy wrote:
> > > > Tried with the above code.This is also getting p value negative.
> > > >
> > > > snippet code:
> > > >
> > > >    fprintf(stderr, _(" %s sujith %d \n"), __func__,p);
> > > >                 if (p > bar_length)
> > > >                         p =3D bar_length;
> > > >                 if (c)
> > > >                         memset(line + bar_length + 6 + 1, '#', p);
> > > >                 else
> > > >                         memset(line + bar_length - p - 1, '#', p);
> > > >
> > > >
> > > > logs....
> > > > //  c=3D0 case
> > > >
> > > > print_vu_meter_stereo sujith 35  ///value of p is 35
> > > > c =3D1 case
> > > >
> > > >  print_vu_meter_stereo sujith -9227433 ///value is negative//
> > > >
> > > > On Mon, Aug 23, 2021 at 10:33 PM folkert <folkert@vanheusden.com>
> wrote:
> > > >
> > > > > >         const int bar_length =3D 35;
> > > > > >         char line[80];
> > > > > ...
> > > > > >                 if (p > bar_length)
> > > > > >                         p =3D bar_length;
> > > > > >                 if (c)
> > > > > >                         memset(line + bar_length + 6 + 1, '#',
> p);
> > > > > > ----------------//this is the line where it is crashing.here p
> value
> > > is
> > > > > > becoming negative at c=3D1.As we see if we change the p value t=
o
> > > bar_length
> > > > > > it works fine ..As it is a player issue not a driver issue.
> > > > >
> > > > > This is puzzling.
> > > > > bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77, that
> fits
> > > > > easlity in 80.
> > > > >
> > > > > But wait:
> > > > >
> > > > >                         line[bar_length - p - 1] =3D '+';
> > > > >
> > > > > p is max bar_length, so we would end up putting '+' in line[-1]
> > > > >
> > > > > Can you try this?
> > > > >
> > > > >
> > > > > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > > > > index cc51dcb..9cfd52c 100644
> > > > > --- a/aplay/aplay.c
> > > > > +++ b/aplay/aplay.c
> > > > > @@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int *perc=
,
> int
> > > > > *maxperc)
> > > > >                         p =3D bar_length;
> > > > >                 if (c)
> > > > >                         line[bar_length + 6 + 1 + p] =3D '+';
> > > > > -               else
> > > > > +               else if (p < bar_length)
> > > > >                         line[bar_length - p - 1] =3D '+';
> > > > >                 if (ABS(maxperc[c]) > 99)
> > > > >                         sprintf(tmp, "MAX");
> > > > >
> > >
>
>
> Folkert van Heusden
>
> --
> Multitail es una herramienta flexible que permite visualizar los "log
> file" y seguir la ejecuci=C3=B3n de comandos. Permite filtrar, a=C3=B1adi=
r
> colores, combinar archivos, la visualizaci=C3=B3n de diferencias (diff-
> view), etc.  http://www.vanheusden.com/multitail/
> ----------------------------------------------------------------------
> Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
>
