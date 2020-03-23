Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE018F1AE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 10:22:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC2281614;
	Mon, 23 Mar 2020 10:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC2281614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584955360;
	bh=Px9+PcY0GfwBkS4jXRBECQK28LxI1aFoBgmwVEP69Vw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgh7KLa2R5/iHuRlpNF2+LOA+oAW58t6vMc6v1FNJE7e/zl+pUadqlvHYRI89b5A6
	 Autwkpjar6qp2b8iM0o1YPibjycMoNwdclhoOnrg4KEsWL+0Cyt5CxZAOacyZ+QHfU
	 y/3iUR2yBjB88zx6LcHGsaElKFKP1PFUQ19R3oNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF54F80158;
	Mon, 23 Mar 2020 10:20:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BEF6F80158; Mon, 23 Mar 2020 10:20:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B33FBF800F6;
 Mon, 23 Mar 2020 10:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B33FBF800F6
IronPort-SDR: aAKCaMyoUEybNGY2OkUB3V1I1aphqvodOUxM5QjdIYHxK9fS5p28beykypcgwGja9MT/sFGY2h
 l5aWj5oj6/og==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 02:20:44 -0700
IronPort-SDR: A0ai73KosPaaJZDA3lSu+xy9+EDMb2t8NsbNcsZG31efTrCuS0k3F7PdWeWZToDKjJHNB/s2ha
 +bKR28WhoQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,295,1580803200"; d="scan'208";a="239343584"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.46.183])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2020 02:20:43 -0700
Date: Mon, 23 Mar 2020 10:20:41 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: [PATCH] ASoC: SOF: fix uninitialised "work" with VirtIO
Message-ID: <20200323092041.GA16757@ubuntu>
References: <20200320123634.GB2130@ubuntu>
 <CAFQqKeW1Fejm1WHwc+Wm8nAoiqj=MtuO6zv1RUYCZoBsre5hjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFQqKeW1Fejm1WHwc+Wm8nAoiqj=MtuO6zv1RUYCZoBsre5hjA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Ranjani,

On Fri, Mar 20, 2020 at 09:31:50AM -0700, Sridharan, Ranjani wrote:
> On Fri, Mar 20, 2020 at 5:36 AM Guennadi Liakhovetski <
> guennadi.liakhovetski@linux.intel.com> wrote:
> 
> > In the VirtIO case the sof_pcm_open() function isn't called on the
> > host during guest streaming, which then leaves "work" structures
> > uninitialised. However it is then used to handle position update
> > messages from the DSP. Move their initialisation to immediately after
> > allocation of the containing structure.
> >
> > Signed-off-by: Guennadi Liakhovetski <
> > guennadi.liakhovetski@linux.intel.com>
> > ---
> >
> > This is a re-send of "[PATCH 08/14] ASoC: SOF: fix uninitialised "work"
> > with VirtIO" as suggested by Mark, also taking into account a comment
> > from Ranjani - thanks. Note: I haven't sent patches before from mutt,
> > hope this will work, if not - will have to re-send.
> >
> >  sound/soc/sof/pcm.c       |  4 +---
> >  sound/soc/sof/sof-audio.h |  3 +++
> >  sound/soc/sof/topology.c  | 17 ++++++++++++-----
> >  3 files changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> > index f4769e1..47cd741 100644
> > --- a/sound/soc/sof/pcm.c
> > +++ b/sound/soc/sof/pcm.c
> > @@ -57,7 +57,7 @@ static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm,
> > struct snd_pcm_substream
> >  /*
> >   * sof pcm period elapse work
> >   */
> > -static void sof_pcm_period_elapsed_work(struct work_struct *work)
> > +void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
> >  {
> >         struct snd_sof_pcm_stream *sps =
> >                 container_of(work, struct snd_sof_pcm_stream,
> > @@ -475,8 +475,6 @@ static int sof_pcm_open(struct snd_soc_component
> > *component,
> >         dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
> >                 spcm->pcm.pcm_id, substream->stream);
> >
> > -       INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
> > -                 sof_pcm_period_elapsed_work);
> >
> >         caps = &spcm->pcm.caps[substream->stream];
> >
> > diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> > index eacd10e..bf65f31a 100644
> > --- a/sound/soc/sof/sof-audio.h
> > +++ b/sound/soc/sof/sof-audio.h
> > @@ -11,6 +11,8 @@
> >  #ifndef __SOUND_SOC_SOF_AUDIO_H
> >  #define __SOUND_SOC_SOF_AUDIO_H
> >
> > +#include <linux/workqueue.h>
> > +
> >  #include <sound/soc.h>
> >  #include <sound/control.h>
> >  #include <sound/sof/stream.h> /* needs to be included before control.h */
> > @@ -189,6 +191,7 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct
> > snd_soc_component *scomp,
> >  struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component
> > *scomp,
> >                                              unsigned int pcm_id);
> >  void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
> > +void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
> >
> >  /*
> >   * Mixer IPC
> > diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> > index 058de94..fe8ba3e 100644
> > --- a/sound/soc/sof/topology.c
> > +++ b/sound/soc/sof/topology.c
> > @@ -9,6 +9,7 @@
> >  //
> >
> >  #include <linux/firmware.h>
> > +#include <linux/workqueue.h>
> >  #include <sound/tlv.h>
> >  #include <sound/pcm_params.h>
> >  #include <uapi/sound/sof/tokens.h>
> > @@ -2448,7 +2449,7 @@ static int sof_dai_load(struct snd_soc_component
> > *scomp, int index,
> >         struct snd_soc_tplg_stream_caps *caps;
> >         struct snd_soc_tplg_private *private = &pcm->priv;
> >         struct snd_sof_pcm *spcm;
> > -       int stream = SNDRV_PCM_STREAM_PLAYBACK;
> > +       int stream;
> >         int ret = 0;
> >
> >         /* nothing to do for BEs atm */
> > @@ -2460,8 +2461,12 @@ static int sof_dai_load(struct snd_soc_component
> > *scomp, int index,
> >                 return -ENOMEM;
> >
> >         spcm->scomp = scomp;
> > -       spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id =
> > COMP_ID_UNASSIGNED;
> > -       spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id =
> > COMP_ID_UNASSIGNED;
> > +
> > +       for_each_pcm_streams(stream) {
> > +               spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
> > +               INIT_WORK(&spcm->stream[stream].period_elapsed_work,
> > +                         snd_sof_pcm_period_elapsed_work);
> > +       }
> >
> >         spcm->pcm = *pcm;
> >         dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
> > @@ -2482,8 +2487,10 @@ static int sof_dai_load(struct snd_soc_component
> > *scomp, int index,
> >         if (!spcm->pcm.playback)
> >                 goto capture;
> >
> > +       stream = SNDRV_PCM_STREAM_PLAYBACK;
> > +
> >         dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback
> > d0i3:%d\n",
> > -                spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
> > +                spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
> >
> Hi Guennadi,
> 
> This cleanup is unrelated to the commit message (and the one below)? Should
> it be a separate patch?

I think it is a matter of judgement. It was your request to use 
for_each_pcm_streams() which I did. While transitioning to it I noticed a 
couple of related inconsistencies which I then aso fixed. So IMHO the 
change is minor, obvious and related. But I agree that this now makes the 
patch a bit controversial.

Thanks
Guennadi

> Thanks,
> Ranjani
