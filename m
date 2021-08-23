Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9FF3F50B6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 20:49:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAFB15DC;
	Mon, 23 Aug 2021 20:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAFB15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629744541;
	bh=t6SDF1HPB/yXLJI3ndkmjtklJnKPLfvoTnkK9rvkFa8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwdp+TvkNvZCARxkFB+rzV8ky+KoVjBXsxpYvlbqFhnsruwzaHKEOe6SqPJ/UL8IM
	 BhVaevQ6yj0rwUcGW2wPj1lIIhkroL1fZ1C37ttvE2ow6r/yoLi5NOh9jfeTneoWzW
	 6DmTUmyBZCfRbvrnYfB1b+By5G6wow36wju3MDi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C533F8020D;
	Mon, 23 Aug 2021 20:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD684F8020C; Mon, 23 Aug 2021 20:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C0B7F800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 20:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C0B7F800E7
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id IEyrmcHH5UWyVIEysmwIu0; Mon, 23 Aug 2021 20:47:34 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 8C95E161E68;
 Mon, 23 Aug 2021 20:47:33 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id AYKVghqQQMsD; Mon, 23 Aug 2021 20:47:27 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id C81C5160AAF;
 Mon, 23 Aug 2021 20:47:27 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id BA116162DC6; Mon, 23 Aug 2021 20:47:27 +0200 (CEST)
Date: Mon, 23 Aug 2021 20:47:27 +0200
From: folkert <folkert@vanheusden.com>
To: sujith kumar reddy <sujithreddy6192@gmail.com>
Subject: Re: arecord is failing with -V stereo
Message-ID: <20210823184727.GE890690@belle.intranet.vanheusden.com>
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
 <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfLEwCSlJfYnmF6YraGUAmIgwsZyWq/os45D72YJZ+hRpYvj6Wkbv86UmH7jdlgDC4QaxkYp//kxkLxb9k6Ngz4twQhSSRYMg8WPM5xQfTgD/wEtG238X
 vk6TyjMYBia96jpUuibWWwwFsMXv0eNLuclps1kPRvhTaKaju8GDnFFl0jsCgBaZXYwRkrsyTfx3vRXYMsiwStFWWFMUPUnKlIVGM1n9f9LOwLN7RWp7hrIZ
 V0w9zrlQN2RgjmAMDarV4w==
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

Ah same bug.
Please try this.
The idea is that in both cases the extra '-1' breaks it.

diff --git a/aplay/aplay.c b/aplay/aplay.c
index cc51dcb..47db7e7 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1753,8 +1753,8 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 	for (c = 0; c < 2; c++) {
 		int p = perc[c] * bar_length / 100;
 		char tmp[4];
-		if (p > bar_length)
-			p = bar_length;
+		if (p >= bar_length)
+			p = bar_length - 1;
 		if (c)
 			memset(line + bar_length + 6 + 1, '#', p);
 		else


On Tue, Aug 24, 2021 at 12:14:00AM +0530, sujith kumar reddy wrote:
> Tried with the above code.This is also getting p value negative.
> 
> snippet code:
> 
>    fprintf(stderr, _(" %s sujith %d \n"), __func__,p);
>                 if (p > bar_length)
>                         p = bar_length;
>                 if (c)
>                         memset(line + bar_length + 6 + 1, '#', p);
>                 else
>                         memset(line + bar_length - p - 1, '#', p);
> 
> 
> logs....
> //  c=0 case
> 
> print_vu_meter_stereo sujith 35  ///value of p is 35
> c =1 case
> 
>  print_vu_meter_stereo sujith -9227433 ///value is negative//
> 
> On Mon, Aug 23, 2021 at 10:33 PM folkert <folkert@vanheusden.com> wrote:
> 
> > >         const int bar_length = 35;
> > >         char line[80];
> > ...
> > >                 if (p > bar_length)
> > >                         p = bar_length;
> > >                 if (c)
> > >                         memset(line + bar_length + 6 + 1, '#', p);
> > > ----------------//this is the line where it is crashing.here p value is
> > > becoming negative at c=1.As we see if we change the p value to bar_length
> > > it works fine ..As it is a player issue not a driver issue.
> >
> > This is puzzling.
> > bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77, that fits
> > easlity in 80.
> >
> > But wait:
> >
> >                         line[bar_length - p - 1] = '+';
> >
> > p is max bar_length, so we would end up putting '+' in line[-1]
> >
> > Can you try this?
> >
> >
> > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > index cc51dcb..9cfd52c 100644
> > --- a/aplay/aplay.c
> > +++ b/aplay/aplay.c
> > @@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int *perc, int
> > *maxperc)
> >                         p = bar_length;
> >                 if (c)
> >                         line[bar_length + 6 + 1 + p] = '+';
> > -               else
> > +               else if (p < bar_length)
> >                         line[bar_length - p - 1] = '+';
> >                 if (ABS(maxperc[c]) > 99)
> >                         sprintf(tmp, "MAX");
> >
