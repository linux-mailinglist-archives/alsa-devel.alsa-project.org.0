Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E93BF851
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51D61701;
	Thu,  8 Jul 2021 12:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51D61701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625739571;
	bh=XSvPPJWG0EBqeu3l7t65Ur+TymIkaLsmWP86Gdc+twk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TigOkHgSRH1NpHa6StHj82C9ntRpFmjPeIk1pWL/K5tsNCoK/oburlkI8Vt4NCB7v
	 tAXRAFKbkn9PDCz84uOQ/MPvA6HqTDQ5jGtpaofpetwWlLLaiwuiTNC/k0m5+M7g+d
	 8YWZjAkqAUlwKqqJjtjebJWTFNLP1JJoQydUqbzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D87FF805F0;
	Thu,  8 Jul 2021 12:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B3E2F80249; Thu,  8 Jul 2021 04:23:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6088F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 04:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6088F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="FAlLOPyJ"
Received: by mail-qv1-xf33.google.com with SMTP id x6so2116909qvx.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Jul 2021 19:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lST2GatSsqwk3Z8FCgmMrt0ILXDDrNipd0HQcGxijfg=;
 b=FAlLOPyJ4H7IU5p4eQxNVLd+Rt3wbUfxsZhaqIJKkrpRxeFe6vIiJ/xlTa0AlGa1XB
 9KRxcAvIhtvdWrHpY+Ldv7aP3Iv/P+5I14p2f5bfFTGgMzGc7GhOfb+WyldJPOIjXA0u
 u1xeW8BFARWocufzyI/+0E1gWlFlN4iDilER/unfMN7E+/I8ddaHnYUDpBQN0IbnhHNa
 N97Y9m4H/4F7/S7u84Htw4YsrweJICinmoPNrc9QRxZXW6uCvFqX+fsAjwPyibwiubYW
 qRml9wQdmjc7e8LjveU0mFk3wMcB3J6zXN02qiICqF2acuprTPIw4GGyYZNsO23Baom2
 YAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lST2GatSsqwk3Z8FCgmMrt0ILXDDrNipd0HQcGxijfg=;
 b=n2nBXEaOmZNooI/A01IW2vztEgHgUg0+1+rnKiyCebL7pc6uwdecDcTN5QMqB+sKQ3
 kDITNQNOMkwZpwzMhQyjLbOBJPZ9QHKsDACl8I/KJTzJJz5eaMpmt97+kTKwXlo10Rlf
 tZS9ecK6A2EdTIgZq6pmmUX69syVuZo7YlmhOdpEo7loJsd9OlJeI7lxEl+s9tAkT7AI
 +mwgGdvRjvffYD70SSdrADqT/rbkB7w3Hn44EotlNKeahsIZdfw0XdnuLYm0T9hg0vae
 fc3jeD9NpfyXYp+jhPDXmTZjSPm62Hv/3fnZDEMuXZux3tKzhAFDBkAwpbwZ54WzK8ii
 4wDg==
X-Gm-Message-State: AOAM532oXlT8+KFK31VkQQXUTI/SuJmmJa5Wff/UipgEZQoEkxwhY+J3
 3bZ1N/1Y56E0TL4RNZfiKIjwt2F9+qzSUMwwgtkF
X-Google-Smtp-Source: ABdhPJy9HTVKpGucbawiqf7KNb+G9oMYcH6YLEKujjy13G56omVCNN8DzjnFWfdTDwgGfkVbxQGFwY3zZDjxWqqk7GM=
X-Received: by 2002:a05:6214:4e2:: with SMTP id
 cl2mr5425980qvb.55.1625710983970; 
 Wed, 07 Jul 2021 19:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210706124440.3247283-1-lerobert@google.com>
 <s5hbl7e8ib1.wl-tiwai@suse.de>
In-Reply-To: <s5hbl7e8ib1.wl-tiwai@suse.de>
From: Robert Lee <lerobert@google.com>
Date: Thu, 8 Jul 2021 10:22:46 +0800
Message-ID: <CAOM6g_B2s7Dqt3srp3U+8s0QLEogjkT=q-nmmRyDXPPs+Tdt8Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: compress: allow to leave draining state when
 pausing in draining
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 08 Jul 2021 12:04:27 +0200
Cc: alsa-devel@alsa-project.org, zxinhui@google.com, carterhsu@google.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org,
 bubblefang@google.com
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

Hi Takashi,
Nice catch. I make a change and mail patch v2 for reviewing.

thanks,
Robert.


Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=887=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:38=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 06 Jul 2021 14:44:40 +0200,
> Robert Lee wrote:
> >
> > When compress offload pauses in draining state, not all platforms
> > need to keep in draining state. Some platforms may call drain or
> > partial drain again when resume from pause in draining, so it needs
> > to wake up from snd_compress_wait_for_drain() in this case.
> >
> > Call API snd_compr_leave_draining_in_pause(), if the platform
> > doesn't need to keep in draining state when pause in draining
> > state.
> >
> > Signed-off-by: Robert Lee <lerobert@google.com>
>
> Well, the logic is a bit confusing (hard to understand what really
> "leave-draining-in-pause" actually means) but also error-prone;
> e.g. you left pause_in_draining flag set while changing the state to
> SNDRV_PCM_STATE_PAUSED.  This will keep the pause_in_draining flag
> even after snd_compr_resume() call.
>
>
> thanks,
>
> Takashi
>
> > ---
> >  include/sound/compress_driver.h | 14 ++++++++++++++
> >  sound/core/compress_offload.c   |  7 ++++++-
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/sound/compress_driver.h b/include/sound/compress_d=
river.h
> > index 277087f635f3..e16524a93a14 100644
> > --- a/include/sound/compress_driver.h
> > +++ b/include/sound/compress_driver.h
> > @@ -145,6 +145,7 @@ struct snd_compr_ops {
> >   * @lock: device lock
> >   * @device: device id
> >   * @use_pause_in_draining: allow pause in draining, true when set
> > + * @leave_draining_in_pause: leave draining state when pausing in drai=
ning
> >   */
> >  struct snd_compr {
> >       const char *name;
> > @@ -156,6 +157,7 @@ struct snd_compr {
> >       struct mutex lock;
> >       int device;
> >       bool use_pause_in_draining;
> > +     bool leave_draining_in_pause;
> >  #ifdef CONFIG_SND_VERBOSE_PROCFS
> >       /* private: */
> >       char id[64];
> > @@ -182,6 +184,18 @@ static inline void snd_compr_use_pause_in_draining=
(struct snd_compr_stream *subs
> >       substream->device->use_pause_in_draining =3D true;
> >  }
> >
> > +/**
> > + * snd_compr_leave_draining_in_pause - Leave draining state when pause=
 in draining
> > + * @substream: compress substream to set
> > + *
> > + * In some platform, we need to leave draining state when we use pause=
 in draining.
> > + * Add API to allow leave draining state.
> > + */
> > +static inline void snd_compr_leave_draining_in_pause(struct snd_compr_=
stream *substream)
> > +{
> > +     substream->device->leave_draining_in_pause =3D true;
> > +}
> > +
> >  /* dsp driver callback apis
> >   * For playback: driver should call snd_compress_fragment_elapsed() to=
 let the
> >   * framework know that a fragment has been consumed from the ring buff=
er
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offloa=
d.c
> > index 21ce4c056a92..9c7bd4db6ecd 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -719,8 +719,13 @@ static int snd_compr_pause(struct snd_compr_stream=
 *stream)
> >               if (!stream->device->use_pause_in_draining)
> >                       return -EPERM;
> >               retval =3D stream->ops->trigger(stream, SNDRV_PCM_TRIGGER=
_PAUSE_PUSH);
> > -             if (!retval)
> > +             if (!retval) {
> >                       stream->pause_in_draining =3D true;
> > +                     if (stream->device->leave_draining_in_pause) {
> > +                             stream->runtime->state =3D SNDRV_PCM_STAT=
E_PAUSED;
> > +                             wake_up(&stream->runtime->sleep);
> > +                     }
> > +             }
> >               break;
> >       default:
> >               return -EPERM;
> > --
> > 2.32.0.93.g670b81a890-goog
> >
