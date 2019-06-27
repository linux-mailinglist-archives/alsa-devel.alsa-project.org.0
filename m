Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466857C9D
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 08:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A890716F8;
	Thu, 27 Jun 2019 08:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A890716F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561618794;
	bh=JA9z6RT8xd59/FIQbDl8q5/VJrqNlmXNfBj+j+jbyIk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ajYB7QLwhbM6RFfmMmmqVA4HygiIrBnTmwZVyY1IyNcJkDC77jRx+seHiRNV597+R
	 U5JYxMSNF8W82g/oNWpRMuovk1F2NgIP82D1+sQLD1wcLRXPvCGPHcNtvkaNCB2hjn
	 l5M7Xez2qnHVNgamONTRwUs2zwLZAV8XKfoVz6lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44DA7F896F6;
	Thu, 27 Jun 2019 08:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845EEF896F6; Thu, 27 Jun 2019 08:58:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77BA4F806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 08:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77BA4F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OEHt7LVA"
Received: by mail-wm1-x341.google.com with SMTP id 207so4532054wma.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 23:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pQlpkNqrrDVSIj/MwaPqDyyJ2zTZNMcB1hbxVj/EYc=;
 b=OEHt7LVAi3RpBtrXx+nkZN7DXsbC4x0Sc1KnWLdR5eXVI9j28Skt1dkdesPa88Onl3
 lraZmc69SUJnFPiTW0c3KalIeztIIPDfpMObHZ+EOok321GDDxOy3DKn0299sEly8h1r
 ai9vd4aTFVta0h4rX1hDulgVASW50AfSc4WNuzwKeb/ZOqjcyly88UZJNcLbkq9A6odg
 rWzdQ2WFDo461oMXfP86opN6mWD8I1xhshXo5b3gYE1uIhH0OJpgaJa3GU+qU2A9kaqD
 z2mQ80re7cjnS/VNjoPjYNEUzFHAIlrlfhuw1pdricwtrXfpw6O/XOK6/YwJTXCs1nCi
 av8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pQlpkNqrrDVSIj/MwaPqDyyJ2zTZNMcB1hbxVj/EYc=;
 b=ncRp89c9YqNQ3QxNPN106uImDQ46KBKP2D85MZX/SXm2tndlNpJIrv/INK0CAHO+LI
 TlpJUfJdpczB9+glSZA0NDWwuczfhHclQ8BurEbzGew2j6eb5zZPFL2J0wm17c1rlp5j
 j1i49aI42YX6kSLeXscqBf20sGps+dgrvAYhl3MjkApnefcfWIgjymfdGKMNXTlbzQZl
 W9A9V7SFsf/DE2N6md1S5Vd+BgUXR0RWZhyOHhIgpKbTvV2J6X8VW2R8avLjMbjW3i31
 9lQNRbXTCBmd5JauAf5dmVPwPQ9kU4JTh39KfB3llhfwSwRq8JGYoBf3jBAOqnwskhvU
 j6fg==
X-Gm-Message-State: APjAAAVv8pqenrWSiilKzVXGExK3yol4vS79D4h8lx2b3gy0WIm3B6Qm
 qpzaNQ5vmtZKKQtPSz92xwyT4ZNaTKnf5iVVtWA=
X-Google-Smtp-Source: APXvYqxdJ8NGWw/UFwCEtAYa1rMFwkFFBI+qpGab9AIIrqKtL3D9BKok7v9gg/4Okx6mzmpJxhix6ymumX3vTFC3AA0=
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr1836939wmi.73.1561618683374; 
 Wed, 26 Jun 2019 23:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87sgsnfjge.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBnvfuZDbnvbmqAavh9DAbA_EeRc6OuH6OOiR1WB4zUrg@mail.gmail.com>
 <874l4bkg16.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l4bkg16.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Jun 2019 09:57:52 +0300
Message-ID: <CAEnQRZChF-L5t4iVY_ZCS+q-VfeAjRfL+y9OrmEdm5BZzys6dQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 paul.olaru@nxp.com, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH v2 116/146] ASoC: sof: use modern dai_link
	style
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

Hi Morimoto-san,

<replying again now also including all Cc's>

On Thu, Jun 27, 2019 at 3:52 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> Thank you for feedback and sorry for bother you
>
> > > @@ -2708,7 +2705,11 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
> > >         int ret;
> > >         int i = 0;
> > >
> > > -       link->platform_name = dev_name(sdev->dev);
> > > +       if (!link->platforms) {
> > > +               dev_err(sdev->dev, "error: no platforms\n");
> > > +               return -EINVAL;
> >
> > Why do we need this check? With linux-next this check fails for me.
>
> I don't remember but some sof might use without platform it I thought.
> But, current ALSA SoC can handle NULL platform today.
> Maybe/Maybe not support timing issue ?
>
> > diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> > index f485f7f751a1..ee73318135fc 100644
> > --- a/sound/soc/soc-topology.c
> > +++ b/sound/soc/soc-topology.c
> > @@ -1883,7 +1883,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
> >         int ret;
> >
> >         /* link + cpu + codec */
> > -       link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
> > +       link = kzalloc(sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
> >         if (link == NULL)
> >                 return -ENOMEM;
> >
> > @@ -1891,9 +1891,11 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
> >
> >         link->cpus      = &dlc[0];
> >         link->codecs    = &dlc[1];
> > +       link->platforms = &dlc[2];
> >
> >         link->num_cpus   = 1;
> >         link->num_codecs = 1;
> > +       link->num_platforms = 1;
> >
> > Can you please help me figure this out?
>
> I think this is same as
>
>         3e6de89409bf7ad149bfb05dd0dce6c5678ea0a8
>         ("ASoC: soc-topology: fix modern dai link style")
>

Yes, it is! Sorry, I'm doing development on 5.2-rc3 - not latest
sources.

> Above one is also OK, but now we can use NULL platform.
> I'm not familiar with SOF, but maybe like this code instead
> of having dummy platform can salve your issue ?
>
>         if (link->platforms) {
>                 link->platforms->name = dev_name(sdev->dev);
>         }
>
Yes, this also seems to work.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
