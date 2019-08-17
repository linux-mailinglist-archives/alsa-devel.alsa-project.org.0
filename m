Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F4911CB
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2019 17:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C646C166D;
	Sat, 17 Aug 2019 17:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C646C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566057581;
	bh=67bkuBU+CLiahn+JR0SwnMeaQAuiiVfwh5m4n/+FmEw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6GSTn7OSTPGPfDeGfM75jsYOyEIGiMY2ggFMxmjlIrzA7lhNp3vBvfH6ROv535CP
	 O7TPwuX7DHeS+lWK7pQvxz8c2pOQkNk08I6sYmm1tzbqUNszAd1NUWjwEPcnLp10vC
	 EWFDul+5/Punpw8nszE5QMm6KCuE3JvJHNM6SQU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FF6F8044C;
	Sat, 17 Aug 2019 17:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D981EF8044C; Sat, 17 Aug 2019 17:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C42A5F8011F
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 17:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C42A5F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YWvbWMHh"
Received: by mail-oi1-x244.google.com with SMTP id t24so6898125oij.13
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfRgBTPFfBw1C3kU0J82Exm2ShP1GAGDzvzzD1i0xxw=;
 b=YWvbWMHhoKoPVgSK/Wz6WGaHp79hhHNk7j+VcaApCFva5hmC+FpxlhJKlIKhmrBhJx
 e8viu3ik8hJTxxdiNzwXA6U+WopdvNJvLSElo6p2WyjNRlrAO8ZR+Rkr9mqwTCjxBSb0
 Y8oQnoGIrS3D1QeLU4d4Bds9HRfrFfsSoYkdfKwANCBcp/8xYfLAGbnJS2LGAp1L18cL
 q7Mi35wpj6jI8VIVRslt1INoWYr4O1m1y+R8pmUtYH+HTTP0j9h4SPR5e1BpZDnRtm/o
 Gru3xQmXXHMEZ7RRvUxNWkqPTRMBLnF2usqyJ32wyrx9QDjptkGIn1wMzeramrxqmytO
 06ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfRgBTPFfBw1C3kU0J82Exm2ShP1GAGDzvzzD1i0xxw=;
 b=EbPzbO0jzmNYyomCPVyYmUqFGwgz1l+Aj/b796CxdkComAB722LnwkkjoM+3CW8RXf
 zp+SUTGkadEJF7vRNjkAkjKtf5hAXA5ok9zMdNR0jcqf/hOu8aOs7B5x3vki5Nyt8dqB
 z0iJda8ZREVkx6aJOGHB8LXzOzMd/6At66yqDEMei0cn9PmjGv8u6y05oSigvcygZ0pI
 Ws6KkRkEiwRsYEKHBkrm1xLblc0HwFLIYLACREiHCMmhmTmU6JmRzdqufoHCfg15ArVh
 9HA8HC2lvzF7YmLBQCkLzcssK11TyN7uU5yhUeu9hMmJDLtjuzHOjRGk5HHzyBRSb4F2
 lpmA==
X-Gm-Message-State: APjAAAV1I35fLfZhUNWWjnLr23izVbwtx33dN0QWsJslT+Oxr7USCkrD
 fCz0mxha92at/PluSs2Jpxt8Rq3f6kRW+cWZuJE=
X-Google-Smtp-Source: APXvYqz78b02cqDowA5JWlGHiPFRn2YqBGa+ezo3/FwnnGZkjKN0Al6viwvvKSodXnoBjvaUt/DtqEJrSf0yf+MJKZ4=
X-Received: by 2002:aca:897:: with SMTP id 145mr8539670oii.60.1566057469581;
 Sat, 17 Aug 2019 08:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190817043208.12433-1-benquike@gmail.com>
 <s5hzhk8702j.wl-tiwai@suse.de>
In-Reply-To: <s5hzhk8702j.wl-tiwai@suse.de>
From: Hui Peng <benquike@gmail.com>
Date: Sat, 17 Aug 2019 11:57:38 -0400
Message-ID: <CAKpmkkW3dxfRGqCOdfRm9nXmLjqXk5hTLLonBDBJXSM0Hnu6eg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, Wenwen Wang <wang6495@umn.edu>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 security@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] Fix an OOB bug in uac_mixer_unit_bmControls
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

Looking around, there are other suspicious codes. E.g., in the following
function, it seems to be the same as `uac_mixer_unit_bmControls`, but it is
accessing `desc->bNrInPins + 5`, in case of UAC_VERSION_1.
Is this intended?

static inline __u8
<https://elixir.bootlin.com/linux/latest/ident/__u8>
*uac_processing_unit_bmControls
<https://elixir.bootlin.com/linux/latest/ident/uac_processing_unit_bmControls>(struct
uac_processing_unit_descriptor
<https://elixir.bootlin.com/linux/latest/ident/uac_processing_unit_descriptor>
*desc,
						   int protocol <https://elixir.bootlin.com/linux/latest/ident/protocol>){
	switch (protocol <https://elixir.bootlin.com/linux/latest/ident/protocol>) {
	case UAC_VERSION_1
<https://elixir.bootlin.com/linux/latest/ident/UAC_VERSION_1>:
		return &desc->baSourceID[desc->bNrInPins + 5];
	case UAC_VERSION_2
<https://elixir.bootlin.com/linux/latest/ident/UAC_VERSION_2>:
		return &desc->baSourceID[desc->bNrInPins + 6];
	case UAC_VERSION_3
<https://elixir.bootlin.com/linux/latest/ident/UAC_VERSION_3>:
		return &desc->baSourceID[desc->bNrInPins + 2];
	default:
		return NULL;
	}}



On Sat, Aug 17, 2019 at 2:55 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Sat, 17 Aug 2019 06:32:07 +0200,
> Hui Peng wrote:
> >
> > `uac_mixer_unit_get_channels` calls `uac_mixer_unit_bmControls`
> > to get pointer to bmControls field. The current implementation of
> > `uac_mixer_unit_get_channels` does properly check the size of
> > uac_mixer_unit_descriptor descriptor and may allow OOB access
> > in `uac_mixer_unit_bmControls`.
> >
> > Reported-by: Hui Peng <benquike@gmail.com>
> > Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> > Signed-off-by: Hui Peng <benquike@gmail.com>
>
> Ah a good catch.
>
> One easier fix in this case would be to get the offset from
> uac_mixer_unit_bmControls(), e.g.
>
>         /* calculate the offset of bmControls field */
>         size_t bmc_offset = uac_mixer_unit_bmControls(NULL, protocol) -
> NULL;
>         ....
>         if (desc->bLength < bmc_offset)
>                 return 0;
>
> thanks,
>
> Takashi
>
>
> > ---
> >  sound/usb/mixer.c | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index b5927c3d5bc0..00e6274a63c3 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -738,28 +738,39 @@ static int get_cluster_channels_v3(struct
> mixer_build *state, unsigned int clust
> >  static int uac_mixer_unit_get_channels(struct mixer_build *state,
> >                                      struct uac_mixer_unit_descriptor
> *desc)
> >  {
> > -     int mu_channels;
> > +     int mu_channels = 0;
> >       void *c;
> >
> > -     if (desc->bLength < sizeof(*desc))
> > -             return -EINVAL;
> >       if (!desc->bNrInPins)
> >               return -EINVAL;
> > -     if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
> > -             return -EINVAL;
> >
> >       switch (state->mixer->protocol) {
> >       case UAC_VERSION_1:
> > +             // limit derived from uac_mixer_unit_bmControls
> > +             if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 4)
> > +                     return 0;
> > +
> > +             mu_channels = uac_mixer_unit_bNrChannels(desc);
> > +             break;
> > +
> >       case UAC_VERSION_2:
> > -     default:
> > -             if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 1)
> > +             // limit derived from uac_mixer_unit_bmControls
> > +             if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 6)
> >                       return 0; /* no bmControls -> skip */
> > +
> >               mu_channels = uac_mixer_unit_bNrChannels(desc);
> >               break;
> >       case UAC_VERSION_3:
> > +             // limit derived from uac_mixer_unit_bmControls
> > +             if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 2)
> > +                     return 0; /* no bmControls -> skip */
> > +
> >               mu_channels = get_cluster_channels_v3(state,
> >                               uac3_mixer_unit_wClusterDescrID(desc));
> >               break;
> > +
> > +     default:
> > +             break;
> >       }
> >
> >       if (!mu_channels)
> > --
> > 2.22.1
> >
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
