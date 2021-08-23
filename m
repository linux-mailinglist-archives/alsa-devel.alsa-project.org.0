Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6B3F510A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 21:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4DE850;
	Mon, 23 Aug 2021 21:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4DE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629745829;
	bh=9iS9vu9vSBW8ja8KPg8K71EYHJvRhkJ5v9BY/qQrEIE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mtDSTEZXJQpp6jLtvHE3hzJ00ZSY/T6OLf5VIgn0ZhqeT+AhjpJKLHWEK34AP7XO5
	 g6+QFQrNEKtTU4uNYazbIClMRS9GhYrDzb/BNbUK9KcAsTrLr55WDtLJt4vLtj+WpL
	 bb792uSZg2KVrZv0/trAEj3v+behscytVmgowOFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7172F800AE;
	Mon, 23 Aug 2021 21:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CA82F8020C; Mon, 23 Aug 2021 21:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0DBDF800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 21:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DBDF800E7
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id IFJamcM5lUWyVIFJbmwKgF; Mon, 23 Aug 2021 21:09:00 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id C17DC161E77;
 Mon, 23 Aug 2021 21:08:58 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id KjEmgPPTCdqD; Mon, 23 Aug 2021 21:08:53 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 30808161E6D;
 Mon, 23 Aug 2021 21:08:53 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 21279162DC6; Mon, 23 Aug 2021 21:08:53 +0200 (CEST)
Date: Mon, 23 Aug 2021 21:08:53 +0200
From: folkert <folkert@vanheusden.com>
To: sujith kumar reddy <sujithreddy6192@gmail.com>
Subject: Re: arecord is failing with -V stereo
Message-ID: <20210823190853.GF890690@belle.intranet.vanheusden.com>
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
 <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
 <20210823184727.GE890690@belle.intranet.vanheusden.com>
 <CAAd2w=adJ3+Rw16ZVbkq72O7D0Dgo1ukHF1DLK6aaN3sGKu3DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd2w=adJ3+Rw16ZVbkq72O7D0Dgo1ukHF1DLK6aaN3sGKu3DQ@mail.gmail.com>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfAMYr+EctOj08AbPaUGGM5+CkL5H5blCbahAgCWCPw+sKPhGzHY4AaFsALaAVtgVG1TuO/sU4GTky8M46Nr9r/d+ZepspG5ZhoBwvLlnBJoMg1A2Crls
 avTywXKi6//YzE+l+kITSrG7SY8KuY4Ootn5kpFicVxHh9HOnNpo7Cf1c/Ons82k/HuLn9qh3jWf629gOAvev8jLaH42iRuyk7Mw85lzXzkjvyID4HjgZY7V
 addDrWxmibVIlnEBfxFmTGXmLIy4LVPXPW7ygVrtWPY=
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

:-)

If this also doesn't work, then I give up.

diff --git a/aplay/aplay.c b/aplay/aplay.c
index cc51dcb..03a4f73 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1753,8 +1753,10 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 	for (c = 0; c < 2; c++) {
 		int p = perc[c] * bar_length / 100;
 		char tmp[4];
-		if (p > bar_length)
-			p = bar_length;
+		if (p >= bar_length)
+			p = bar_length - 1;
+		if (p < 0)
+			p = 0;
 		if (c)
 			memset(line + bar_length + 6 + 1, '#', p);
 		else

On Tue, Aug 24, 2021 at 12:36:05AM +0530, sujith kumar reddy wrote:
> Hi Folkert,
> 
> Tried with the above code.This is also getting p value negative.
> 
> My point is p is negative it doesn't go to
> 
> if (p >= bar_length)
>              p = bar_length - 1;
> it is going to memset second argument p,that is negative so crashing.
> 
> 
> logs:
> localhost ~ # ./sujith/arecord -D hw:1,2 -f S32_LE -r 48000 -c 2 1.wav -V s
> Sujith entry: main
> Recording WAVE '1.wav' : Signed 32 bit Little Endian, Rate 48000 Hz, Stereo
> 
>  print_vu_meter_stereo sujith 35  ////////////////////////// c=0 case
>  print_vu_meter_stereo sujith* -9227433* /////////////////////c=1 case p
> value negative which is going to memset second argument.
> 
> Thanks
> Sujith
> 
> 
> 
> On Tue, Aug 24, 2021 at 12:17 AM folkert <folkert@vanheusden.com> wrote:
> 
> > Ah same bug.
> > Please try this.
> > The idea is that in both cases the extra '-1' breaks it.
> >
> > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > index cc51dcb..47db7e7 100644
> > --- a/aplay/aplay.c
> > +++ b/aplay/aplay.c
> > @@ -1753,8 +1753,8 @@ static void print_vu_meter_stereo(int *perc, int
> > *maxperc)
> >         for (c = 0; c < 2; c++) {
> >                 int p = perc[c] * bar_length / 100;
> >                 char tmp[4];
> > -               if (p > bar_length)
> > -                       p = bar_length;
> > +               if (p >= bar_length)
> > +                       p = bar_length - 1;
> >                 if (c)
> >                         memset(line + bar_length + 6 + 1, '#', p);
> >                 else
> >
> >
> > On Tue, Aug 24, 2021 at 12:14:00AM +0530, sujith kumar reddy wrote:
> > > Tried with the above code.This is also getting p value negative.
> > >
> > > snippet code:
> > >
> > >    fprintf(stderr, _(" %s sujith %d \n"), __func__,p);
> > >                 if (p > bar_length)
> > >                         p = bar_length;
> > >                 if (c)
> > >                         memset(line + bar_length + 6 + 1, '#', p);
> > >                 else
> > >                         memset(line + bar_length - p - 1, '#', p);
> > >
> > >
> > > logs....
> > > //  c=0 case
> > >
> > > print_vu_meter_stereo sujith 35  ///value of p is 35
> > > c =1 case
> > >
> > >  print_vu_meter_stereo sujith -9227433 ///value is negative//
> > >
> > > On Mon, Aug 23, 2021 at 10:33 PM folkert <folkert@vanheusden.com> wrote:
> > >
> > > > >         const int bar_length = 35;
> > > > >         char line[80];
> > > > ...
> > > > >                 if (p > bar_length)
> > > > >                         p = bar_length;
> > > > >                 if (c)
> > > > >                         memset(line + bar_length + 6 + 1, '#', p);
> > > > > ----------------//this is the line where it is crashing.here p value
> > is
> > > > > becoming negative at c=1.As we see if we change the p value to
> > bar_length
> > > > > it works fine ..As it is a player issue not a driver issue.
> > > >
> > > > This is puzzling.
> > > > bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77, that fits
> > > > easlity in 80.
> > > >
> > > > But wait:
> > > >
> > > >                         line[bar_length - p - 1] = '+';
> > > >
> > > > p is max bar_length, so we would end up putting '+' in line[-1]
> > > >
> > > > Can you try this?
> > > >
> > > >
> > > > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > > > index cc51dcb..9cfd52c 100644
> > > > --- a/aplay/aplay.c
> > > > +++ b/aplay/aplay.c
> > > > @@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int *perc, int
> > > > *maxperc)
> > > >                         p = bar_length;
> > > >                 if (c)
> > > >                         line[bar_length + 6 + 1 + p] = '+';
> > > > -               else
> > > > +               else if (p < bar_length)
> > > >                         line[bar_length - p - 1] = '+';
> > > >                 if (ABS(maxperc[c]) > 99)
> > > >                         sprintf(tmp, "MAX");
> > > >
> >


Folkert van Heusden

-- 
Multitail es una herramienta flexible que permite visualizar los "log
file" y seguir la ejecución de comandos. Permite filtrar, añadir
colores, combinar archivos, la visualización de diferencias (diff-
view), etc.  http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
