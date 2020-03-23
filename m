Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0518F8E1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 16:44:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD4D1657;
	Mon, 23 Mar 2020 16:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD4D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584978294;
	bh=iZ822h72NE/s+kYkvIrs3CnzRc/yqGFLhSVVbxiebxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJ4IV50034gDWBhGcawppFUO45cz+LxnI1Co1RwYIEN1LI1QbTBsWqs/b1JVMFtXi
	 t8qCAnSdAjtq0V2uDYnpy+WTbyDBLsnxSI3E7Sp5hZBd0rp9O5dyd4JVW6R/Ptzlgi
	 NVhievYEmRam/dIZxy94ym5trak4ICWBvqOcQ+s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F60F801DA;
	Mon, 23 Mar 2020 16:43:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C113AF801DA; Mon, 23 Mar 2020 16:43:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5CC2F800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 16:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5CC2F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="wroPY5aU"
Received: by mail-io1-xd44.google.com with SMTP id k9so3898348iov.7
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/iMKdz2zejJZLlfp0PbLbxEnudm00ADfZuW8QIGhGA0=;
 b=wroPY5aUWECAhKyASrA5at7TfC6/abwbiQy7csS2FhE/Sr15QrpK2ZcgvnlZOCTkjV
 Zr/mMBBnVezDBSo/A6/XRZi689wPzWIM6IngXqwfA7rFlxViGfUQB7QqqzUtyqcLSK+z
 Gw9b400qr3mlG4STdDknJyi3bt30S7u5K+koOc2WkSiZUI4/BQ1FnDA8uP7A4yJoQbkf
 deZnXhb0TiijTtfBEO3IaLrFcLmiOoI4v4FEjphP+SxCE68j7o0jbyj5byAXp9tSoEA1
 u0AAo5zMAW5wCQuu+Lpoghksw+ffcROEAQAbiXOjHk37AqkuYRW/J49guustFXct2tLz
 wmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/iMKdz2zejJZLlfp0PbLbxEnudm00ADfZuW8QIGhGA0=;
 b=jfKFTgAFYx+8KhKBL38VP/YGZsaGIiyy+hkb6bxfu5AwILdHLopXnG9cejG3n0mJac
 w1GbIvllqwWWaLPV+V0VeBz4FERr5eQMA28A34LzgKT9xvo+/upBqeLAgxK1IFxo4fCZ
 b+ZrP01pslQCHiYDNrqjq9rHs/t/JpLiaLC76WNS5xRC8tEViWnDce8bq2VWCVQ+O4YA
 4BvYn74a67+B5IvfR7VZp9UcaLC2J/lA5dr53lJa7qSOS89B32gs8uAZ/5lO8xMs2dbY
 0Uijh0ubPeGJV1dMT81FeYRoPP6w6r4cwDtuA7+TG1RgkSwdUPXxI2QOhcCCNmt364uJ
 4wcg==
X-Gm-Message-State: ANhLgQ3DGZd7AtFwYnqkzLqyKVNP1ogWASYpYVZSaHVxeK68P69ibWM1
 J3LZTAOgsJ/k938JIU0SvSYUNKiJEOBUICLuoaWx5A==
X-Google-Smtp-Source: ADFU+vtoClZxh8rkWtnHDlFX72ur+UlQ2wrXpG3VLInRZN+ZpLFmk/fRzHDLKIUpEXAZQ1r8MdEwfgQBwnUy6lzvzZE=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr19865730iot.40.1584978179222; 
 Mon, 23 Mar 2020 08:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200320123634.GB2130@ubuntu>
 <CAFQqKeW1Fejm1WHwc+Wm8nAoiqj=MtuO6zv1RUYCZoBsre5hjA@mail.gmail.com>
 <20200323092041.GA16757@ubuntu>
In-Reply-To: <20200323092041.GA16757@ubuntu>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 23 Mar 2020 08:42:48 -0700
Message-ID: <CAFQqKeVrH+-jzX5L=hB3L7xpQ+aE6FaiioZEfELcXQGDcni79A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: fix uninitialised "work" with VirtIO
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

On Mon, Mar 23, 2020 at 2:20 AM Guennadi Liakhovetski <
guennadi.liakhovetski@linux.intel.com> wrote:

> Hi Ranjani,
>
> On Fri, Mar 20, 2020 at 09:31:50AM -0700, Sridharan, Ranjani wrote:
> > On Fri, Mar 20, 2020 at 5:36 AM Guennadi Liakhovetski <
> > guennadi.liakhovetski@linux.intel.com> wrote:
> >
> > > In the VirtIO case the sof_pcm_open() function isn't called on the
> > > host during guest streaming, which then leaves "work" structures
> > > uninitialised. However it is then used to handle position update
> > > messages from the DSP. Move their initialisation to immediately after
> > > allocation of the containing structure.
> > >
> > > Signed-off-by: Guennadi Liakhovetski <
> > > guennadi.liakhovetski@linux.intel.com>
> > > ---
> > >
> > > This is a re-send of "[PATCH 08/14] ASoC: SOF: fix uninitialised "work"
> > > with VirtIO" as suggested by Mark, also taking into account a comment
> > > from Ranjani - thanks. Note: I haven't sent patches before from mutt,
> > > hope this will work, if not - will have to re-send.
> > >
> > >  sound/soc/sof/pcm.c       |  4 +---
> > >  sound/soc/sof/sof-audio.h |  3 +++
> > >  sound/soc/sof/topology.c  | 17 ++++++++++++-----
> > >  3 files changed, 16 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> > > index f4769e1..47cd741 100644
> > > --- a/sound/soc/sof/pcm.c
> > > +++ b/sound/soc/sof/pcm.c
> > > @@ -57,7 +57,7 @@ static int sof_pcm_dsp_params(struct snd_sof_pcm
> *spcm,
> > > struct snd_pcm_substream
> > >  /*
> > >   * sof pcm period elapse work
> > >   */
> > > -static void sof_pcm_period_elapsed_work(struct work_struct *work)
> > > +void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
> > >  {
> > >         struct snd_sof_pcm_stream *sps =
> > >                 container_of(work, struct snd_sof_pcm_stream,
> > > @@ -475,8 +475,6 @@ static int sof_pcm_open(struct snd_soc_component
> > > *component,
> > >         dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
> > >                 spcm->pcm.pcm_id, substream->stream);
> > >
> > > -       INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
> > > -                 sof_pcm_period_elapsed_work);
> > >
> > >         caps = &spcm->pcm.caps[substream->stream];
> > >
> > > diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> > > index eacd10e..bf65f31a 100644
> > > --- a/sound/soc/sof/sof-audio.h
> > > +++ b/sound/soc/sof/sof-audio.h
> > > @@ -11,6 +11,8 @@
> > >  #ifndef __SOUND_SOC_SOF_AUDIO_H
> > >  #define __SOUND_SOC_SOF_AUDIO_H
> > >
> > > +#include <linux/workqueue.h>
> > > +
> > >  #include <sound/soc.h>
> > >  #include <sound/control.h>
> > >  #include <sound/sof/stream.h> /* needs to be included before
> control.h */
> > > @@ -189,6 +191,7 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct
> > > snd_soc_component *scomp,
> > >  struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component
> > > *scomp,
> > >                                              unsigned int pcm_id);
> > >  void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
> > > +void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
> > >
> > >  /*
> > >   * Mixer IPC
> > > diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> > > index 058de94..fe8ba3e 100644
> > > --- a/sound/soc/sof/topology.c
> > > +++ b/sound/soc/sof/topology.c
> > > @@ -9,6 +9,7 @@
> > >  //
> > >
> > >  #include <linux/firmware.h>
> > > +#include <linux/workqueue.h>
> > >  #include <sound/tlv.h>
> > >  #include <sound/pcm_params.h>
> > >  #include <uapi/sound/sof/tokens.h>
> > > @@ -2448,7 +2449,7 @@ static int sof_dai_load(struct snd_soc_component
> > > *scomp, int index,
> > >         struct snd_soc_tplg_stream_caps *caps;
> > >         struct snd_soc_tplg_private *private = &pcm->priv;
> > >         struct snd_sof_pcm *spcm;
> > > -       int stream = SNDRV_PCM_STREAM_PLAYBACK;
> > > +       int stream;
> > >         int ret = 0;
> > >
> > >         /* nothing to do for BEs atm */
> > > @@ -2460,8 +2461,12 @@ static int sof_dai_load(struct snd_soc_component
> > > *scomp, int index,
> > >                 return -ENOMEM;
> > >
> > >         spcm->scomp = scomp;
> > > -       spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id =
> > > COMP_ID_UNASSIGNED;
> > > -       spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id =
> > > COMP_ID_UNASSIGNED;
> > > +
> > > +       for_each_pcm_streams(stream) {
> > > +               spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
> > > +               INIT_WORK(&spcm->stream[stream].period_elapsed_work,
> > > +                         snd_sof_pcm_period_elapsed_work);
> > > +       }
> > >
> > >         spcm->pcm = *pcm;
> > >         dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
> > > @@ -2482,8 +2487,10 @@ static int sof_dai_load(struct snd_soc_component
> > > *scomp, int index,
> > >         if (!spcm->pcm.playback)
> > >                 goto capture;
> > >
> > > +       stream = SNDRV_PCM_STREAM_PLAYBACK;
> > > +
> > >         dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback
> > > d0i3:%d\n",
> > > -                spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
> > > +                spcm->pcm.pcm_name,
> spcm->stream[stream].d0i3_compatible);
> > >
> > Hi Guennadi,
> >
> > This cleanup is unrelated to the commit message (and the one below)?
> Should
> > it be a separate patch?
>
> I think it is a matter of judgement. It was your request to use
> for_each_pcm_streams() which I did. While transitioning to it I noticed a
> couple of related inconsistencies which I then aso fixed. So IMHO the
> change is minor, obvious and related. But I agree that this now makes the
> patch a bit controversial.

Hi Guennadi,

May I suggest to break it up into 2 patches: First, to move to using the
new for_each_pcm_stream_macro() and  the second to add the add the work
init. That way there would be no confusion.

Thanks,
Ranjani
