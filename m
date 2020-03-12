Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A6E1832A2
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:16:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07F3170C;
	Thu, 12 Mar 2020 15:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07F3170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584022586;
	bh=L8m5f7LkYQSyUy9VoMTKRJGzeLhoZXA5/Eamgzg17KU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDI/STDbPjziPj4vZFWkKtANFf4871Pha45QzRMWZBrGVAUM06FKERu5d/sigoWi+
	 IDZ3jbhEdcOAAbA6ZmPFVnZTDnBOG0r+Cqeu7eryRUMJpWOciVU7oKnmT9qSQ8DBvt
	 Pgxxzw2Eq2qYhH+i6VOBW3ItTGnETa2mNK9spfIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE68EF8021C;
	Thu, 12 Mar 2020 15:14:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DC62F8020C; Thu, 12 Mar 2020 15:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B827F80086
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 15:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B827F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="WsFn068e"
Received: by mail-il1-x141.google.com with SMTP id c8so5640849ilm.1
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZcxqVyBiqO0i50yj4jZz73RJW1xwJOBRyn/8RWoq7gY=;
 b=WsFn068eC/1bramyC2gvjWFMcAEsBK4yKAk4uY+jlJK32k425mui7k/9V/jbnGfJzu
 02bXxvSuIwtMuZo75pLHXd8gEj7QF1z8KdOHpv0FwfNDkvyD6hxOXt+hLV0xM+cLo/OB
 FhUsEC2l0p62vwAfacu9do7BuDqlY8w6k3KLjiAEy0rFLBdDwvdCvYIxpkJp9jfkwZer
 TUGIenOG1rKtPVvXc2rcecK9/f29LDs4xeLjIl6gYBA+sHnVdVDi+NxMv8kM7fAzVS7B
 4zS/z7qbKKKhy1k9luGrOu8o44Ny7K6HBKyxtCc5aLyB+tRJEfxMGUQgyMangl4RqIU5
 MytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZcxqVyBiqO0i50yj4jZz73RJW1xwJOBRyn/8RWoq7gY=;
 b=Y+ARVNp65lNJR6f03Jwecd6WNDlZ0esENikZ/aCaYL0nEzNcfw+kxr0+GKvUYz4kwj
 4T5laUaDIdyEvlod1Ae/pG5BN2h2E7XT19V9w7VAa7WuJruQnegPH9mlgxdWOHnYARCE
 wvScMPCSMMg6XCeVywX+uQDHR7pLT3u/52Mlq1v1TsKpqQDPYE9cK6+8omFv+lKCMc83
 If8CD11wtRImAyOjLc89Dcav/7DrAfclY5ltCXaEi8cZ6y9j5PiZvc9TuD/GLhqYndew
 r05H2j/LVq3CeDuHzBJVlKVT5Fc3i02BzaRyMJScq4RB2Vvsgcahv+vHRWr5SnoWvegU
 01qA==
X-Gm-Message-State: ANhLgQ3dmLvR9jQ85vS4l7iueoKDGvw/ny1OyRwkFc5v3ghm1rqEJGnq
 qteogYGU+Vxhy0+uXDvyGzmgKw2XAKdFJHOGqrbQLQ==
X-Google-Smtp-Source: ADFU+vsKCwpMcITxSruxdpm94ALZpM47X4TI2/I49z+kOxCj0foVzRzYNjytZi0qA0+pN7HLPaZpYbuGDk9JfUlcTWo=
X-Received: by 2002:a05:6e02:685:: with SMTP id
 o5mr8631248ils.86.1584022477931; 
 Thu, 12 Mar 2020 07:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200312122239.14489-1-amadeuszx.slawinski@linux.intel.com>
 <CAFQqKeUOQ5EU57SvEpzkSJ=khsRZ=E-WqarFoq2xpoycmhHqeA@mail.gmail.com>
 <9f821557-dd15-638f-02bf-5d3abc37e5ca@linux.intel.com>
In-Reply-To: <9f821557-dd15-638f-02bf-5d3abc37e5ca@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 12 Mar 2020 07:14:27 -0700
Message-ID: <CAFQqKeU3uNfkPcnxfFJqU1FdVffn+hu4ukabYjNVvjSLe2xNJA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: topology: Perform component check upfront
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

On Thu, Mar 12, 2020 at 7:11 AM Amadeusz S=C5=82awi=C5=84ski <
amadeuszx.slawinski@linux.intel.com> wrote:

>
>
> On 3/12/2020 2:57 PM, Sridharan, Ranjani wrote:
> > On Thu, Mar 12, 2020 at 3:14 AM Amadeusz S=C5=82awi=C5=84ski <
> > amadeuszx.slawinski@linux.intel.com> wrote:
> >
> >> Function soc_tplg_dbytes_create(), calls soc_tplg_init_kcontrol() to
> >> perform additional driver specific initialization. While
> >> soc_tplg_init_kcontrol() ensures that component is valid before invoki=
ng
> >> ops->control_load, there is no such check at the end of
> >> soc_tplg_dbytes_create() where list_add() is used.
> >>
> >> Also in quite a few places, there is reference of tplg->comp->dapm or
> >> tplg->comp->card, without any checks for tplg->comp.
> >>
> >> In consequence of the above this may lead to referencing NULL pointer.
> >>
> >> This allows for removal of now unnecessary checks.
> >>
> >> Signed-off-by: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux=
.intel.com>
> >> ---
>
> (...)
>
> >> @@ -2736,6 +2736,10 @@ int snd_soc_tplg_component_load(struct
> >> snd_soc_component *comp,
> >>          struct soc_tplg tplg;
> >>          int ret;
> >>
> >> +       /* component needs to exist to keep and reference data while
> >> parsing */
> >> +       if (!comp)
> >> +               return -EINVAL;
> >> +
> >
> > Amadeusz,
> >
> > Thanks for this change. I agree that the checks for tplg->comp in the
> above
> > functions should be removed but is the check here really necessary at
> all?
> > snd_soc_tplg_component_load() is typically called when a component is
> > probed. Can it ever be null at all if it is getting probed?
> >
> > Thanks,
> > Ranjani
> >
> Well it can happen if you pass it wrong pointer for some reason (don't
> ask :P), I think it's better to have check than none at all.
> If you pass it NULL pointer to component it can parse part of a file and
> then suddenly give you NULL pointer dereference in some seemingly
> "random" function. I would say it's easier for programmer to understand
> what happens and use such functionality if it performs such check upfront=
.

Yes, I suppose it is not a bad idea to have the check for robustness. So,

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
