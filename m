Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4F3C14A7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 15:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AABF71607;
	Thu,  8 Jul 2021 15:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AABF71607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625752157;
	bh=nl4YU9AVpz8tjPyDGRUqEgnFlnpfw0Fvlt7kyai5sNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVahKf4M/Fal+EOVhP9SnZ8oYcbLx1LPx+T8hx5RsnSOUY8C7PC18ycSopMlNuxLb
	 0SebsdrbKitLdz3wmY6LNBrLSDq2tXEwWwEFw4tZbrBFGwMWWDG1CCTvcf1NzsOfBJ
	 jxk+/yNqpdADIRjbKNUQn2a/ZqMgmlRB8/6nLiHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB1FF8012A;
	Thu,  8 Jul 2021 15:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BEB6F80249; Thu,  8 Jul 2021 15:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE241F8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 15:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE241F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="FEUtm6k7"
Received: by mail-qk1-x735.google.com with SMTP id t19so5649438qkg.7
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dcoeEcEIjqF8z6oBeMSQO0+nsBtqHQ+RSAADgarXULk=;
 b=FEUtm6k7pOULwc1g2GuWwg9ec+OFT9nFXNHy0FQUg5yslsXl/zWIK27+1NTJbM/7DI
 MTvLfSYX+y9XUO/NN87bJfhcDj+YbAo0FTEV5jcfj9T6S39PcvCcIocusy3/AENHY20a
 +Va2YDR++bDDHnSJvNiAmDjwQI0064Eo+5uZfLyfqX9l6L3PcldrewWMOTwauECAgAfK
 BzVxphbpYg2bpsDp7mwiGgzX+geREXzeIsA/Xkfnul+Ycy/fniIXCEj2xchrYDxLIEX/
 Vxnzj4dMSw+elFVSfF8P/mBFzWEq37Gy3DsDtBRNy7dOUbteahYkHCK6oiaq/pACSUDq
 /1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dcoeEcEIjqF8z6oBeMSQO0+nsBtqHQ+RSAADgarXULk=;
 b=eMS6Lc2CZzsEE7iRc4sRdYZzFCpjajk85y/hOBBdXrGaP//OSoqwCPCsUmey3Ai/pF
 UeUUzOoltg36qaPmE2dlOG8OKrRxgISk528SCSFuqjTb4EpAUIBvESNSKUr34N5o+MvH
 JWCQaZp6oHD5jbRX1c1/jQshcnE/ANtDTRR82Q+KDNH0YirnvrwAhTATVERc6U4ajXnR
 x48ZkI93FAkP2T+V6i+R5mDbR5QGS3Ikxr9DGPMCLjVGN+dZ92DO2gLz84XfMeO0ZUdP
 4W4MCQNywtcsrPDU1e55fLOYw4qWi7k//tb2TIKmn7ERDmMe5fRLVAKOgExKPMqJh+oa
 mX7Q==
X-Gm-Message-State: AOAM532H29MAkYOk+iDJN3ZrWsF7E31fSs3RGTKBuqWsuWGVhsWKNQt5
 J+gRNCigWPcH602pjp1nsmuxxgXV3qBsO7l2CdHa
X-Google-Smtp-Source: ABdhPJyUsMtjO8wnhwRZut4p82VJ4jqmBsd5Llz44/hnsTOYseyp3t05psKtKvRnSTVa4QEwvKkRMweTnM1Cp/js6dY=
X-Received: by 2002:a37:8345:: with SMTP id f66mr31099925qkd.396.1625752055653; 
 Thu, 08 Jul 2021 06:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210708020815.3489365-1-lerobert@google.com>
 <s5ho8bd59q4.wl-tiwai@suse.de>
In-Reply-To: <s5ho8bd59q4.wl-tiwai@suse.de>
From: Robert Lee <lerobert@google.com>
Date: Thu, 8 Jul 2021 21:47:24 +0800
Message-ID: <CAOM6g_Cv6rsLOAb0+Lr_YkjHpKfw+zvWXH0X5LKR=Z4dtXGRng@mail.gmail.com>
Subject: Re: [Patch v2] ALSA: compress: allow to leave draining state when
 pausing in draining
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

It is a little complex to describe the design in detail, but try to
explain simply
what issue we meet.

If w/o the change,  after user resumes from the pause, our system would cal=
l
snd_compr_drain() or snd_compr_partial_drain() again after it returns from
previous drain (when EOF reaches). Then it will block in this drain and no =
one
wake it up because EOF has already reached. I add this change to return fro=
m
the previous drain.

And yes, after user resumes it, it will change state to RUNNING. Then it wi=
ll
call snd_compr_drain() or snd_compr_partial_drain() very soon and change
state to DRAINING again.

Actually, I am wondering how the pause-during-drain can keep the state in
DRAINING. It should have a different design. :)

I also checked the snd_compr_open() comment, and it doesn't mention that
we cannot pause in DRAINING state. Looks like it needs to be updated accord=
ing
to these changes. Maybe it can be updated in another commit?

* SNDRV_PCM_STATE_DRAINING: When stream is draining current data. This is d=
one
 *      by calling SNDRV_COMPRESS_DRAIN.
 * SNDRV_PCM_STATE_PAUSED: When stream is paused. This is done by calling
 *      SNDRV_COMPRESS_PAUSE. It can be stopped or resumed by calling
 *      SNDRV_COMPRESS_STOP or SNDRV_COMPRESS_RESUME respectively.

thanks,
Robert.

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=888=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:24=E5=AF=AB=E9=81=93=EF=BC=9A


Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=888=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 08 Jul 2021 04:08:15 +0200,
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
> > ---
> >  include/sound/compress_driver.h | 14 ++++++++++++++
> >  sound/core/compress_offload.c   |  8 +++++++-
> >  2 files changed, 21 insertions(+), 1 deletion(-)
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
> > index 21ce4c056a92..c6e5c8f072d7 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -719,8 +719,14 @@ static int snd_compr_pause(struct snd_compr_stream=
 *stream)
> >               if (!stream->device->use_pause_in_draining)
> >                       return -EPERM;
> >               retval =3D stream->ops->trigger(stream, SNDRV_PCM_TRIGGER=
_PAUSE_PUSH);
> > -             if (!retval)
> > +             if (!retval) {
> > +                     if (stream->device->leave_draining_in_pause) {
> > +                             stream->runtime->state =3D SNDRV_PCM_STAT=
E_PAUSED;
> > +                             wake_up(&stream->runtime->sleep);
> > +                             break;
> > +                     }
> >                       stream->pause_in_draining =3D true;
> > +             }
>
> Hrm, what actually happens with this new flag?  It changes the state
> to PAUSED even if it's done during the draining.  Then user resumes
> the pause via snd_compr_resume(), and now the state changes to
> RUNNING.  OTOH, if the draining runs normally, it'll end up with
> SETUP.
>
> Even if the above is even designed behavior, it must be described
> properly somewhere.  The state change is described in snd_compr_open()
> comment, and the new behavior should be mentioned there as well.
> (Admittedly, the previous hack for the pause-during-drain is also
> missing and should have been mentioned there; but an excuse is that
> the pause-during-drain doesn't change the state itself :)
>
>
> thanks,
>
> Takashi
