Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2B73F57FA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 08:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C4C6851;
	Tue, 24 Aug 2021 08:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C4C6851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629785578;
	bh=5qRR8gTe18uuarB0skk8Ku2YBTzAKCpKV2WKFIdFYYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A25OtP2k2N+5xdWSnhgwE7gm4Elj5gNnLDTTuhv15DF37FM19b1/YT0sjfD3yzOVA
	 FxdF+1mPc9My6wWWP5w96qEej7nYQEf3+H5h0MOanW4PNyTFpF+/awT2dg18ZeooG9
	 atIYdYKHvPnAbWs1vbro3soCrtrdnr+b5zGeOjbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A34FDF80171;
	Tue, 24 Aug 2021 08:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1691EF801D5; Tue, 24 Aug 2021 08:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF5DBF80171
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 08:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5DBF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aZWQE88w"
Received: by mail-lf1-x12a.google.com with SMTP id r9so43086123lfn.3
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 23:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z2RDDCH6+2HODtOE6diP60eLSIEZPIZ3uXM8lT1PrOM=;
 b=aZWQE88wVjjh/y05EZTAKuNErT4uZ8RaEdqQmhcPSZl8KF59Z8pTj4JVOL49qYwRE6
 N7a2eXAPsFZdrpiCDTxJ6kJlgGz6Z64YRVSKuQWPG4SZ2yi2y8GFuy8UIy4Ky9U9Pmvw
 uWZF595wDEvqSwRuijE6nDn5NnmQpXdd14vi/1zWZn5TGNoi06Z7UltN3GZHHa+B+uev
 QNXsrtZc8sYsVKedEd80PZ/7xHY0dXB/r2SZykdhZ/1++VDh2F2MNxSbAC8y0jm6xuPx
 n3mp/JqcqyhsOMK9IgkEDFfk/fcup0Z6f5mq/F+85VA4uuwdkOdzdNaCv+FUfZNM20Ao
 ar/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z2RDDCH6+2HODtOE6diP60eLSIEZPIZ3uXM8lT1PrOM=;
 b=HN4+MhrhYv55fFlmg4y7Ex/oPcdF5k2TE0bJS+KCHKDIIexgpjnqW35uVqOFJpqI3P
 EZLta64BtU6HnMxq5TCXCUd21HUg4/JGJdAmywfx7WAcDPoFTFYNQrlhoa8H172zaBO1
 1UjHPYpimyIL6IP0QnZfjMmgWQfZ0qv5EeqbTJSHOhCEfg92tKi+r3Yo/u8yDXmGm7V+
 8rFvmJzZsyTO8w1hti5ZcyfXLU188zyKjxpFwWh+pfTyW8bfqVjfkHKF4mWw6caqzTEW
 AFgVZ5V82qcAO2a4LYt+ixLANaoEJM1NJMQ5XWQh2RyDFUchSg/2vX+rVco98WOfIyG3
 c/Yw==
X-Gm-Message-State: AOAM533RToV/wGiEB+7X4v2yfQPIf0o/q8oUuNtzKWArglTxEZYXaVsy
 ZiM8UgwJYyDgOK27xg8TD1XplczBrg+00JjPDMs=
X-Google-Smtp-Source: ABdhPJy2QMIRJhOH/NxkPQcmuob+hB5dkLVMqn1g+v8i+4HoJ/YlgO9TdnOtqvafXgr+Z+E5xuEIzWytSrLvixUaPXY=
X-Received: by 2002:ac2:5470:: with SMTP id e16mr27766077lfn.399.1629785485187; 
 Mon, 23 Aug 2021 23:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
 <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
 <20210823184727.GE890690@belle.intranet.vanheusden.com>
 <CAAd2w=adJ3+Rw16ZVbkq72O7D0Dgo1ukHF1DLK6aaN3sGKu3DQ@mail.gmail.com>
 <20210823190853.GF890690@belle.intranet.vanheusden.com>
 <CAAd2w=YDc9O7keXFSo++_B51TKbiBABVDbbCW=Mst8-W1FcCqg@mail.gmail.com>
 <20210823201640.GG890690@belle.intranet.vanheusden.com>
 <CAAd2w=afs7GtaVNNT_PbP6j7feGD=0e0o+8=eC-AUNmJASFoHA@mail.gmail.com>
In-Reply-To: <CAAd2w=afs7GtaVNNT_PbP6j7feGD=0e0o+8=eC-AUNmJASFoHA@mail.gmail.com>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Tue, 24 Aug 2021 11:41:13 +0530
Message-ID: <CAAd2w=YcOAj++17hza+mRp25s2WioUSM5-6g+9HnidCpsJ-rXg@mail.gmail.com>
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

Are you going to submit the fix  .

Thanks
Sujith

On Tue, Aug 24, 2021 at 6:45 AM sujith kumar reddy <
sujithreddy6192@gmail.com> wrote:

> Ok thank you folkert .
>
>
>
> On Tue, 24 Aug, 2021, 1:46 AM folkert, <folkert@vanheusden.com> wrote:
>
>> p=3D0 is more correct I think
>>
>> this is application only
>>
>> On Tue, Aug 24, 2021 at 01:03:27AM +0530, sujith kumar reddy wrote:
>> > Hi folkert,
>> >
>> > The above you suggested p=3D0 is  working .
>> > i tried like
>> >  if (p > bar_length || p < 0)
>> >        p =3D bar_length;
>> > This is also working.
>> >
>> > Which is the perfect one we can use?
>> > Is there any impact of p with driver data or this is just a
>> > application calculated value.
>> >
>> > Thanks
>> > Sujith
>> >
>> >
>> > On Tue, Aug 24, 2021 at 12:39 AM folkert <folkert@vanheusden.com>
>> wrote:
>> >
>> > > :-)
>> > >
>> > > If this also doesn't work, then I give up.
>> > >
>> > > diff --git a/aplay/aplay.c b/aplay/aplay.c
>> > > index cc51dcb..03a4f73 100644
>> > > --- a/aplay/aplay.c
>> > > +++ b/aplay/aplay.c
>> > > @@ -1753,8 +1753,10 @@ static void print_vu_meter_stereo(int *perc,
>> int
>> > > *maxperc)
>> > >         for (c =3D 0; c < 2; c++) {
>> > >                 int p =3D perc[c] * bar_length / 100;
>> > >                 char tmp[4];
>> > > -               if (p > bar_length)
>> > > -                       p =3D bar_length;
>> > > +               if (p >=3D bar_length)
>> > > +                       p =3D bar_length - 1;
>> > > +               if (p < 0)
>> > > +                       p =3D 0;
>> > >                 if (c)
>> > >                         memset(line + bar_length + 6 + 1, '#', p);
>> > >                 else
>> > >
>> > > On Tue, Aug 24, 2021 at 12:36:05AM +0530, sujith kumar reddy wrote:
>> > > > Hi Folkert,
>> > > >
>> > > > Tried with the above code.This is also getting p value negative.
>> > > >
>> > > > My point is p is negative it doesn't go to
>> > > >
>> > > > if (p >=3D bar_length)
>> > > >              p =3D bar_length - 1;
>> > > > it is going to memset second argument p,that is negative so
>> crashing.
>> > > >
>> > > >
>> > > > logs:
>> > > > localhost ~ # ./sujith/arecord -D hw:1,2 -f S32_LE -r 48000 -c 2
>> 1.wav
>> > > -V s
>> > > > Sujith entry: main
>> > > > Recording WAVE '1.wav' : Signed 32 bit Little Endian, Rate 48000 H=
z,
>> > > Stereo
>> > > >
>> > > >  print_vu_meter_stereo sujith 35  ////////////////////////// c=3D0
>> case
>> > > >  print_vu_meter_stereo sujith* -9227433* /////////////////////c=3D=
1
>> case p
>> > > > value negative which is going to memset second argument.
>> > > >
>> > > > Thanks
>> > > > Sujith
>> > > >
>> > > >
>> > > >
>> > > > On Tue, Aug 24, 2021 at 12:17 AM folkert <folkert@vanheusden.com>
>> wrote:
>> > > >
>> > > > > Ah same bug.
>> > > > > Please try this.
>> > > > > The idea is that in both cases the extra '-1' breaks it.
>> > > > >
>> > > > > diff --git a/aplay/aplay.c b/aplay/aplay.c
>> > > > > index cc51dcb..47db7e7 100644
>> > > > > --- a/aplay/aplay.c
>> > > > > +++ b/aplay/aplay.c
>> > > > > @@ -1753,8 +1753,8 @@ static void print_vu_meter_stereo(int
>> *perc, int
>> > > > > *maxperc)
>> > > > >         for (c =3D 0; c < 2; c++) {
>> > > > >                 int p =3D perc[c] * bar_length / 100;
>> > > > >                 char tmp[4];
>> > > > > -               if (p > bar_length)
>> > > > > -                       p =3D bar_length;
>> > > > > +               if (p >=3D bar_length)
>> > > > > +                       p =3D bar_length - 1;
>> > > > >                 if (c)
>> > > > >                         memset(line + bar_length + 6 + 1, '#', p=
);
>> > > > >                 else
>> > > > >
>> > > > >
>> > > > > On Tue, Aug 24, 2021 at 12:14:00AM +0530, sujith kumar reddy
>> wrote:
>> > > > > > Tried with the above code.This is also getting p value negativ=
e.
>> > > > > >
>> > > > > > snippet code:
>> > > > > >
>> > > > > >    fprintf(stderr, _(" %s sujith %d \n"), __func__,p);
>> > > > > >                 if (p > bar_length)
>> > > > > >                         p =3D bar_length;
>> > > > > >                 if (c)
>> > > > > >                         memset(line + bar_length + 6 + 1, '#',
>> p);
>> > > > > >                 else
>> > > > > >                         memset(line + bar_length - p - 1, '#',
>> p);
>> > > > > >
>> > > > > >
>> > > > > > logs....
>> > > > > > //  c=3D0 case
>> > > > > >
>> > > > > > print_vu_meter_stereo sujith 35  ///value of p is 35
>> > > > > > c =3D1 case
>> > > > > >
>> > > > > >  print_vu_meter_stereo sujith -9227433 ///value is negative//
>> > > > > >
>> > > > > > On Mon, Aug 23, 2021 at 10:33 PM folkert <
>> folkert@vanheusden.com>
>> > > wrote:
>> > > > > >
>> > > > > > > >         const int bar_length =3D 35;
>> > > > > > > >         char line[80];
>> > > > > > > ...
>> > > > > > > >                 if (p > bar_length)
>> > > > > > > >                         p =3D bar_length;
>> > > > > > > >                 if (c)
>> > > > > > > >                         memset(line + bar_length + 6 + 1,
>> '#',
>> > > p);
>> > > > > > > > ----------------//this is the line where it is
>> crashing.here p
>> > > value
>> > > > > is
>> > > > > > > > becoming negative at c=3D1.As we see if we change the p va=
lue
>> to
>> > > > > bar_length
>> > > > > > > > it works fine ..As it is a player issue not a driver issue=
.
>> > > > > > >
>> > > > > > > This is puzzling.
>> > > > > > > bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77,
>> that
>> > > fits
>> > > > > > > easlity in 80.
>> > > > > > >
>> > > > > > > But wait:
>> > > > > > >
>> > > > > > >                         line[bar_length - p - 1] =3D '+';
>> > > > > > >
>> > > > > > > p is max bar_length, so we would end up putting '+' in
>> line[-1]
>> > > > > > >
>> > > > > > > Can you try this?
>> > > > > > >
>> > > > > > >
>> > > > > > > diff --git a/aplay/aplay.c b/aplay/aplay.c
>> > > > > > > index cc51dcb..9cfd52c 100644
>> > > > > > > --- a/aplay/aplay.c
>> > > > > > > +++ b/aplay/aplay.c
>> > > > > > > @@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int
>> *perc,
>> > > int
>> > > > > > > *maxperc)
>> > > > > > >                         p =3D bar_length;
>> > > > > > >                 if (c)
>> > > > > > >                         line[bar_length + 6 + 1 + p] =3D '+'=
;
>> > > > > > > -               else
>> > > > > > > +               else if (p < bar_length)
>> > > > > > >                         line[bar_length - p - 1] =3D '+';
>> > > > > > >                 if (ABS(maxperc[c]) > 99)
>> > > > > > >                         sprintf(tmp, "MAX");
>> > > > > > >
>> > > > >
>> > >
>> > >
>> > > Folkert van Heusden
>> > >
>> > > --
>> > > Multitail es una herramienta flexible que permite visualizar los "lo=
g
>> > > file" y seguir la ejecuci=C3=B3n de comandos. Permite filtrar, a=C3=
=B1adir
>> > > colores, combinar archivos, la visualizaci=C3=B3n de diferencias (di=
ff-
>> > > view), etc.  http://www.vanheusden.com/multitail/
>> > > --------------------------------------------------------------------=
--
>> > > Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
>> > >
>>
>>
>> Folkert van Heusden
>>
>> --
>> Multitail es una herramienta flexible que permite visualizar los "log
>> file" y seguir la ejecuci=C3=B3n de comandos. Permite filtrar, a=C3=B1ad=
ir
>> colores, combinar archivos, la visualizaci=C3=B3n de diferencias (diff-
>> view), etc.  http://www.vanheusden.com/multitail/
>> ----------------------------------------------------------------------
>> Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
>>
>
