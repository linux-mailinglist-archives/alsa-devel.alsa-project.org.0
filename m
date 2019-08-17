Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B0911FE
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2019 18:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5330E1671;
	Sat, 17 Aug 2019 18:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5330E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566060549;
	bh=iz3yCpN6txERuyPq9U1jiOFqKX4hvhYnCH8hcjHpWqI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVu45R64a/2QsFeM8L3mebE7VVsEHa7icYszeMX+1VdTh0Cxbw513BBz+JyGVFqB3
	 BzBp6v56JWmkMYd8hYUxKYUAm8pPzVWz/eu0pqVcgkYCPWHG8F5gaQigW6/jNwZPEZ
	 txz2JH6a+uJx+Z62l0q16pto4iBsqtTIb9fHniFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E51F8049C;
	Sat, 17 Aug 2019 18:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B637F8044C; Sat, 17 Aug 2019 18:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DD7F801DA
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 18:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DD7F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HLKfJhCK"
Received: by mail-ot1-x343.google.com with SMTP id z17so12316689otk.13
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6lHobKEPKMpeYctJQQI3NiCyDXNtmDDjbRJpZfxdSk=;
 b=HLKfJhCKsG+Uu8cFzIg+h2D1V8eYtT6xW//W5b3/HLCYXJiBQwukrbptf1k/MpZTlN
 TU34iMa2ST5UwhD5LfDHr7dnccrvQ5+SfSopZqrUssyVthfemf4T0XnOiwxhYr2bui+B
 dA5xoywux6jtemjB8nc/aCuahO6E0Oab/7pn3L2yfvIxBiey/JycRSBl8T/3H5+tpqG1
 DawYZEfSxKmzdh2206Si9GZ7HlIK1GhNYNzm0xuN2pBxJFLM9VrMTF+oNpSlUA6e28p7
 9A52hh5ZMxPxAZ01wkviBctNE3MtSu/YqPCpGSl+STNGPzMPXn05I9z3182UFZRtHogJ
 b7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6lHobKEPKMpeYctJQQI3NiCyDXNtmDDjbRJpZfxdSk=;
 b=fWx9h6ZY0xYVmz4/FjIZwnKXtqy1WCwLdeAriaYXOojJPbN9iAZKw5raH2nwtMV7wH
 Y8AJkyPpnVgJgCtyrQzEG9vOna/D56RqorckOTXYVQdxlE3p7gnPf6HcGztX/aUICvyb
 kM+1kRhglzZ+xBnIv2jj5/vhg2Z1HgV+IamjYzJUVL5G6C5hYyyf+R1mpge4n8zfCb5+
 LLvUWmccLb/Ik7lSgaA3PkjwIPo/+n9DY3y8FwEex1tcCLBkqy3cXxxo9nANMOUIswq5
 FI/24A/abL9syWP6CboSVvagFb4gIuiGJDHcAkU8AbACjNaQ2TWyGQJsA9Xj+BCaJi3P
 01WA==
X-Gm-Message-State: APjAAAU/3Bk8uF/g/OAyH6t5T3vcqkwX7wapvDd6WMBAsTyhfW7NfNNS
 zr3w1WmwAmd5dd4EnCuXbXfetijV/BT5WZmHyOI=
X-Google-Smtp-Source: APXvYqz1E4c8xobnB4/Ugi1zx3c7+5S5wJijV8ztjsreMdXm8dGs/Q4MuslqfPxiNR26rcnm/xUo+EHRMdoMPVialkM=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr12337147otq.363.1566060437169; 
 Sat, 17 Aug 2019 09:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190817043208.12433-1-benquike@gmail.com>
 <s5hzhk8702j.wl-tiwai@suse.de>
 <CAKpmkkW3dxfRGqCOdfRm9nXmLjqXk5hTLLonBDBJXSM0Hnu6eg@mail.gmail.com>
 <s5hpnl37oki.wl-tiwai@suse.de>
In-Reply-To: <s5hpnl37oki.wl-tiwai@suse.de>
From: Hui Peng <benquike@gmail.com>
Date: Sat, 17 Aug 2019 12:47:05 -0400
Message-ID: <CAKpmkkXNcQWxco2Zxf5rBwyt7mHHkfZ2+COtZROyKmgsq2Ch_Q@mail.gmail.com>
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

No, there was not triggering. I found it accidentally when I was going
through the code.

Yeah, you are right. it is handled in the last check. Is it defined in the
spec that the descriptor needs to have 4/6/2 additional bytes for the
bmControl field?, if so, it is easier to understand the using the code in
the way in my first patch.

If you think this is unnecessary, we can skip this patch.

On Sat, Aug 17, 2019 at 12:18 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Sat, 17 Aug 2019 17:57:38 +0200,
> Hui Peng wrote:
> >
> > Looking around, there are other suspicious codes. E.g., in the following
> > function, it seems to be the same as `uac_mixer_unit_bmControls`, but it
> is
> > accessing `desc->bNrInPins + 5`, in case of UAC_VERSION_1.
> > Is this intended?
>
> Yes, this isn't for the mixer unit but for the processing unit.
> They have different definitions.
>
> Now back to the original report: I read the code again but fail to see
> where is OOB access.  Let's see the function:
>
> static int uac_mixer_unit_get_channels(struct mixer_build *state,
>                                        struct uac_mixer_unit_descriptor
> *desc)
> {
>         int mu_channels;
>         void *c;
>
>         if (desc->bLength < sizeof(*desc))
>                 return -EINVAL;
>         if (!desc->bNrInPins)
>                 return -EINVAL;
>         if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
>                 return -EINVAL;
>
>         switch (state->mixer->protocol) {
>         case UAC_VERSION_1:
>         case UAC_VERSION_2:
>         default:
>                 if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 1)
>                         return 0; /* no bmControls -> skip */
>                 mu_channels = uac_mixer_unit_bNrChannels(desc);
>                 break;
>         case UAC_VERSION_3:
>                 mu_channels = get_cluster_channels_v3(state,
>                                 uac3_mixer_unit_wClusterDescrID(desc));
>                 break;
>         }
>
>         if (!mu_channels)
>                 return 0;
>
> ... until this point, mu_channels is calculated but no actual access
> happens.  Then:
>
>         c = uac_mixer_unit_bmControls(desc, state->mixer->protocol);
>
> ... this returns the *address* of the bmControls bitmap.  At this
> point, it's not accessed yet.  Now:
>
>         if (c - (void *)desc + (mu_channels - 1) / 8 >= desc->bLength)
>                 return 0; /* no bmControls -> skip */
>
> ... here we check whether the actual bitmap address plus the max
> bitmap size overflows bLength.  And if it overflows, returns 0,
> indicating no bitmap available.
>
> So the code doesn't access but checks properly beforehand as far as I
> understand.  Is the actual OOB access triggered by some program?
>
>
> thanks,
>
> Takashi
>
> >
> > static inline __u8 *uac_processing_unit_bmControls(struct
> uac_processing_unit_descriptor *desc,
> >                                                    int protocol)
> > {
> >         switch (protocol) {
> >         case UAC_VERSION_1:
> >                 return &desc->baSourceID[desc->bNrInPins + 5];
> >         case UAC_VERSION_2:
> >                 return &desc->baSourceID[desc->bNrInPins + 6];
> >         case UAC_VERSION_3:
> >                 return &desc->baSourceID[desc->bNrInPins + 2];
> >         default:
> >                 return NULL;
> >         }
> > }
> >
> > On Sat, Aug 17, 2019 at 2:55 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> >     On Sat, 17 Aug 2019 06:32:07 +0200,
> >     Hui Peng wrote:
> >     >
> >     > `uac_mixer_unit_get_channels` calls `uac_mixer_unit_bmControls`
> >     > to get pointer to bmControls field. The current implementation of
> >     > `uac_mixer_unit_get_channels` does properly check the size of
> >     > uac_mixer_unit_descriptor descriptor and may allow OOB access
> >     > in `uac_mixer_unit_bmControls`.
> >     >
> >     > Reported-by: Hui Peng <benquike@gmail.com>
> >     > Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> >     > Signed-off-by: Hui Peng <benquike@gmail.com>
> >
> >     Ah a good catch.
> >
> >     One easier fix in this case would be to get the offset from
> >     uac_mixer_unit_bmControls(), e.g.
> >
> >             /* calculate the offset of bmControls field */
> >             size_t bmc_offset = uac_mixer_unit_bmControls(NULL,
> protocol) -
> >     NULL;
> >             ....
> >             if (desc->bLength < bmc_offset)
> >                     return 0;
> >
> >     thanks,
> >
> >     Takashi
> >
> >     > ---
> >     >  sound/usb/mixer.c | 25 ++++++++++++++++++-------
> >     >  1 file changed, 18 insertions(+), 7 deletions(-)
> >     >
> >     > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> >     > index b5927c3d5bc0..00e6274a63c3 100644
> >     > --- a/sound/usb/mixer.c
> >     > +++ b/sound/usb/mixer.c
> >     > @@ -738,28 +738,39 @@ static int get_cluster_channels_v3(struct
> >     mixer_build *state, unsigned int clust
> >     >  static int uac_mixer_unit_get_channels(struct mixer_build *state,
> >     >                                      struct
> uac_mixer_unit_descriptor
> >     *desc)
> >     >  {
> >     > -     int mu_channels;
> >     > +     int mu_channels = 0;
> >     >       void *c;
> >     >
> >     > -     if (desc->bLength < sizeof(*desc))
> >     > -             return -EINVAL;
> >     >       if (!desc->bNrInPins)
> >     >               return -EINVAL;
> >     > -     if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
> >     > -             return -EINVAL;
> >     >
> >     >       switch (state->mixer->protocol) {
> >     >       case UAC_VERSION_1:
> >     > +             // limit derived from uac_mixer_unit_bmControls
> >     > +             if (desc->bLength < sizeof(*desc) + desc->bNrInPins
> + 4)
> >     > +                     return 0;
> >     > +
> >     > +             mu_channels = uac_mixer_unit_bNrChannels(desc);
> >     > +             break;
> >     > +
> >     >       case UAC_VERSION_2:
> >     > -     default:
> >     > -             if (desc->bLength < sizeof(*desc) + desc->bNrInPins
> + 1)
> >     > +             // limit derived from uac_mixer_unit_bmControls
> >     > +             if (desc->bLength < sizeof(*desc) + desc->bNrInPins
> + 6)
> >     >                       return 0; /* no bmControls -> skip */
> >     > +
> >     >               mu_channels = uac_mixer_unit_bNrChannels(desc);
> >     >               break;
> >     >       case UAC_VERSION_3:
> >     > +             // limit derived from uac_mixer_unit_bmControls
> >     > +             if (desc->bLength < sizeof(*desc) + desc->bNrInPins
> + 2)
> >     > +                     return 0; /* no bmControls -> skip */
> >     > +
> >     >               mu_channels = get_cluster_channels_v3(state,
> >     >
>  uac3_mixer_unit_wClusterDescrID(desc));
> >     >               break;
> >     > +
> >     > +     default:
> >     > +             break;
> >     >       }
> >     >
> >     >       if (!mu_channels)
> >     > --
> >     > 2.22.1
> >     >
> >     >
> >
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
