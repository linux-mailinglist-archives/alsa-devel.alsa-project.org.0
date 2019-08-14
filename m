Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444608D817
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 18:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5C11670;
	Wed, 14 Aug 2019 18:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5C11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565800242;
	bh=m6eZpU6iOP4rt8HgdkhbIEyPzbsI3/NyZ37wMZHIcro=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMz1OMkRWL1td1vOxFS3FoLeLnbIacEihJLfOMPKQ9xFAyp6sQopN8HTaIeCYjEkD
	 kVHu6j5bNHGi45c3rLxHts69kv/lGIk0bhoG7zt0pAF++Yev+Ujdg+08SBJLHPA4s2
	 kQOCstJZAsJXaXJ1kdT2Cv2TgkoWktufJgv5vcn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA47DF803F4;
	Wed, 14 Aug 2019 18:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6EF0F80214; Wed, 14 Aug 2019 18:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71EA2F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 18:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71EA2F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uIIerIjl"
Received: by mail-oi1-x244.google.com with SMTP id p124so4582392oig.5
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRKUgkuCb+bpaaIhxfsezEuzbM/CgiVbv4p/htQS8vU=;
 b=uIIerIjl518HTJbKTLPtLn8STv3aLjpcj0XA4iUQHL85V1bKY3nzM2eC/fv8Yqzk9S
 JH468CZk6it8grqN/Oi6Ws2hVyMk9Dn9V8RpLJcidmTgkWmT9Q7uO8TnLvozypRWfza3
 UDAnLxFpnKOKE/+XskahtjxCxh356GrJrFjrzQ1Ori3vLBQQSzBPcxulF0p6G5Cn63xZ
 NlAAbEvqjh4fXv1v0oC5sgHzxB1wV4mNQg90t5yrDF5nRj1reF8F9vV19FJV5xiZE9dY
 hsMLvHfkjC7srzeOxdf924scEY38l9/uYc30k8ZX3r99neVhbQXc4+9DmIgbn/EGOoIp
 3rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRKUgkuCb+bpaaIhxfsezEuzbM/CgiVbv4p/htQS8vU=;
 b=jmggbfP0m8blRNL4uJ3kPZxlNa1WqkywwWrkZyImzCo60B/z37ljDZBbHPwm0qK8SO
 oVF6Ebl+WQlN2a3V7hpLNDdtvEY/+HwJztkO/LALNj1xaGAZFWJondi91NI38DUEKu4y
 aFHpP4Mk5iH4/o3FfAP4wAdl5F6RcD/fPNHzz1slJUussKaEUgUpitlLt8oNOHY5nkRT
 jS3bjw2QEo7QPMIIwnJHBpG6xiWUSgsZQmzqH2wYQRb4jIoBlBI6F9iOEGAa+5LAOxPQ
 sNj7FlHtGN8ORM1gDjOw2X89Hdf2ZM94ziaORddkaDCPmoOtcvphZOmIty9VBcDD5Bnr
 oxUg==
X-Gm-Message-State: APjAAAX5mZ8KPc6c6gHTpqyIhD7rFqwFjm69QXdim1JklUYJGDcK2wM4
 HCFAN+o77suCZBY1wpsOtRIGnePyAqxUNtm47IQ=
X-Google-Smtp-Source: APXvYqy6LYcmjQhwObihZ19ytwNA0e9mEy6i3FHFuenf621doc5cJ7U2CwxnwNj3MNga0vakkBKnbHXhRAatm/RLTww=
X-Received: by 2002:aca:897:: with SMTP id 145mr586717oii.60.1565800130435;
 Wed, 14 Aug 2019 09:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190814023625.21683-1-benquike@gmail.com>
 <s5hzhkcb6dh.wl-tiwai@suse.de>
In-Reply-To: <s5hzhkcb6dh.wl-tiwai@suse.de>
From: =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>
Date: Wed, 14 Aug 2019 12:28:39 -0400
Message-ID: <CAKpmkkUv=arsdJiexaM-UVhXEwfGN=zreny9P_kDNhQUij8=FQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, security@kernel.org,
 Wenwen Wang <wang6495@umn.edu>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 alsa-devel@alsa-project.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] Fix an OOB bug in parse_audio_mixer_unit
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

Hi, Takashi:
Here the problem is that `desc->bLength` is controlled by the device side,
so  `desc->bLength` may not represent the real length of the descriptor.
That is why I use pointer arithmetic operations to derive the real size of
the buffer
in my patch.

On Wed, Aug 14, 2019 at 2:36 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 14 Aug 2019 04:36:24 +0200,
> Hui Peng wrote:
> >
> > The `uac_mixer_unit_descriptor` shown as below is read from the
> > device side. In `parse_audio_mixer_unit`, `baSourceID` field is
> > accessed from index 0 to `bNrInPins` - 1, the current implementation
> > assumes that descriptor is always valid (the length  of descriptor
> > is no shorter than 5 + `bNrInPins`). If a descriptor read from
> > the device side is invalid, it may trigger out-of-bound memory
> > access.
> >
> > ```
> > struct uac_mixer_unit_descriptor {
> >       __u8 bLength;
> >       __u8 bDescriptorType;
> >       __u8 bDescriptorSubtype;
> >       __u8 bUnitID;
> >       __u8 bNrInPins;
> >       __u8 baSourceID[];
> > }
> > ```
> >
> > This patch fixes the bug by add a sanity check on the length of
> > the descriptor.
> >
> > Signed-off-by: Hui Peng <benquike@gmail.com>
> > Reported-by: Hui Peng <benquike@gmail.com>
> > Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> > ---
> >  sound/usb/mixer.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 7498b5191b68..38202ce67237 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -2091,6 +2091,15 @@ static int parse_audio_mixer_unit(struct
> mixer_build *state, int unitid,
> >       struct usb_audio_term iterm;
> >       int input_pins, num_ins, num_outs;
> >       int pin, ich, err;
> > +     int desc_len = (int) ((unsigned long) state->buffer +
> > +                     state->buflen - (unsigned long) raw_desc);
> > +
> > +     if (desc_len < sizeof(*desc) + desc->bNrInPins) {
> > +             usb_audio_err(state->chip,
> > +                           "descriptor %d too short\n",
> > +                           unitid);
> > +             return -EINVAL;
> > +     }
> >
> >       err = uac_mixer_unit_get_channels(state, desc);
> >       if (err < 0) {
>
> Hm, what is the desc->bLength value in the error case?
>
> Basically the buffer boundary is already checked against bLength in
> snd_usb_find_desc() which is called from obtaining the raw_desc in the
> caller of this function (parse_audio_unit()).
>
> So, if any, we need to check bLength for the possible overflow like
> below.
>
>
> thanks,
>
> Takashi
>
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -744,6 +744,8 @@ static int uac_mixer_unit_get_channels(struct
> mixer_build *state,
>                 return -EINVAL;
>         if (!desc->bNrInPins)
>                 return -EINVAL;
> +       if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
> +               return -EINVAL;
>
>         switch (state->mixer->protocol) {
>         case UAC_VERSION_1:
>


-- 
May the *Lord* Richly Bless you and yours !
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
