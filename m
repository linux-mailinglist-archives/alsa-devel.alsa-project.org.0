Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F66CC4E5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 23:39:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F971685;
	Fri,  4 Oct 2019 23:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F971685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570225153;
	bh=Y6+u4IKxrsvVy31NkJBC3YW5Sh3cmxB4jiiEh6WbdM0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hiq3y6bKIzL5TZwW8dnho2JI+8sP00Gi7z1zTIz9mUXBv6ZX05XZOhVX3Hf3wll+2
	 TMtdg3j3XYG+/GLqLOusuiFDxfLLJqlzhl1xIFFWH+kwry9G4vOpCKfyJ4I7Z5fvRV
	 mK8oW49CfUtmuWDB9XeeX94elppv2Z0HublqbJ4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E87F803F3;
	Fri,  4 Oct 2019 23:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A8CEF80391; Fri,  4 Oct 2019 23:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9A9EF800C2
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 23:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A9EF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="DdKDc3ui"
Received: by mail-yw1-xc44.google.com with SMTP id s6so2849140ywe.5
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 14:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzwQ0dF0nbsToR4L6Y9cf/ELTlqdMC0keq/qlOMJDLc=;
 b=DdKDc3uioOhNU3lD9UctTVaQh0PVboRDZBp/HbExtqfBMJbfiepPqUq4wgz5cCwlaM
 hMxIHfkfda0hrUs/BAaFY16zi3V9BxXfgq1GmbpuUG3ZU0VJveEpjn7BJxsVr8pMaTM5
 q0KWP6epmQxcad+I5B5V7wB76JMhW1fwc9DILOSJsR4BfwdeTpkI36KF0qCpuqCG9M4j
 wr72R1rV1rfwDoRxyCwhs9Rk87WSg0YgzMhsixta5dfqhHu5qm7qnhIcxN6yIXzPAOXX
 FcvKGbxLEPRDEOy9gtfi7uaBf92e4QtRrc64QFBD4p0VB0etIYaEzZ9EuwtdECmsUh+I
 jOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzwQ0dF0nbsToR4L6Y9cf/ELTlqdMC0keq/qlOMJDLc=;
 b=XF7v+iB99WK5hlx7UOEA4ALaAH8/qWf8ojfV9Ungt2w025+NzHI6OlQdm0vPpUyhXr
 rMA59/HqlNsLqU2JjwpaUq3GvcWjSlBeHu2QORupD4ek47MZ8vf1HEcG71VJn5+W9QpT
 FRgvU5fB5qvIsbJwQ2hzJMkmYAMqpFo7z5ZauvYSrn3BFwKb1xc0wFp/e0W7K4aUr+5g
 8x4xq30kUJwTXGMx5E4eokM8RN6QNV6EoehUwn/gLKWBeCKPXB+tNwjvI6Nc4FvaObC8
 Jk//l+5xBtpvQIAx4WiaB5qjH5Vfg7zYpX4iR6rs6bL4GqrmRKBEiHRfm9tpFRd0wuoz
 ogYw==
X-Gm-Message-State: APjAAAWIqFVCZ/+Sp7aM3+zeU6uG2ykRxLMePzo2df4C+x+mlYRQm2BM
 TH77Bp+59YtlXzecbOloRgwU5tjOeWCYOstQsHRN2H4d
X-Google-Smtp-Source: APXvYqwiM21/CZnJbJd+ttbsKeODepWE0ZVGWbOGqkvb/OHPCE9s0mYysuqpRAvoOcwuUEvX0g6FJ6AxRclI2RkUqSg=
X-Received: by 2002:a81:3a4b:: with SMTP id h72mr12721733ywa.34.1570225040770; 
 Fri, 04 Oct 2019 14:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191004154127.28459-1-ranjani.sridharan@linux.intel.com>
 <20191004154127.28459-2-ranjani.sridharan@linux.intel.com>
 <ec51107d-f765-9308-cb02-11fd32817fc7@linux.intel.com>
In-Reply-To: <ec51107d-f765-9308-cb02-11fd32817fc7@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Fri, 4 Oct 2019 14:37:07 -0700
Message-ID: <CAFQqKeV8ety+zCsT+nzykG1ggMWPVwGMwf7drRTQUkBt=OLSkw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, tiwai@suse.com
Subject: Re: [alsa-devel] [RFC PATCH 1/2] ASoC: pcm: update FE/BE trigger
 order based on the command
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

On Fri, Oct 4, 2019 at 2:34 PM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

> On 10/4/19 8:41 AM, Ranjani Sridharan wrote:
> > Currently, the trigger orders SND_SOC_DPCM_TRIGGER_PRE/POST
> > determine the order in which FE DAI and BE DAI are triggered.
> > In the case of SND_SOC_DPCM_TRIGGER_PRE, the FE DAI is
> > triggered before the BE DAI and in the case of
> > SND_SOC_DPCM_TRIGGER_POST, the BE DAI is triggered before
> > the FE DAI. And this order remains the same irrespective of the
> > trigger command.
> >
> > In the case of the SOF driver, during playback, the FW
> > expects the BE DAI to be triggered before the FE DAI during
> > the START trigger. The BE DAI trigger handles the starting of
> > Link DMA and so it must be started before the FE DAI is started
> > to prevent xruns during pause/release. This can be addressed
> > by setting the trigger order for the FE dai link to
> > SND_SOC_DPCM_TRIGGER_POST. But during the STOP trigger,
> > the FW expects the FE DAI to be triggered before the BE DAI.
> > Retaining the same order during the START and STOP commands,
> > results in FW error as the DAI component in the FW is still
> > active.
> >
> > The issue can be fixed by mirroring the trigger order of
> > FE and BE DAI's during the START and STOP trigger. So, with the
> > trigger order set to SND_SOC_DPCM_TRIGGER_PRE, the FE DAI will be
> > trigger first during SNDRV_PCM_TRIGGER_START/STOP/RESUME
> > and the BE DAI will be triggered first during the
> > STOP/SUSPEND/PAUSE commands. Conversely, with the trigger order
> > set to SND_SOC_DPCM_TRIGGER_POST, the BE DAI will be triggered
> > first during the SNDRV_PCM_TRIGGER_START/STOP/RESUME commands
> > and the FE DAI will be triggered first during the
> > SNDRV_PCM_TRIGGER_STOP/SUSPEND/PAUSE commands.
> >
> > Github Issue: https://github.com/thesofproject/linux/issues/1160
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > ---
> >   sound/soc/soc-pcm.c | 99 ++++++++++++++++++++++++++++++++-------------
> >   1 file changed, 72 insertions(+), 27 deletions(-)
> >
> > diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> > index 66910500e3b6..8e5097eead27 100644
> > --- a/sound/soc/soc-pcm.c
> > +++ b/sound/soc/soc-pcm.c
> > @@ -2340,42 +2340,85 @@ int dpcm_be_dai_trigger(struct
> snd_soc_pcm_runtime *fe, int stream,
> >   }
> >   EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
> >
> > +static int dpcm_dai_trigger_fe_first(struct snd_pcm_substream
> *substream,
> > +                                  int cmd, bool fe_first)
>
> the function name is odd with the fe_first repeat
>
> maybe 'dpcm_dai_trigger_fe_be' ?
>
Sure, will change in v2.

>
> > +{
> > +     struct snd_soc_pcm_runtime *fe = substream->private_data;
> > +     int ret;
> > +
> > +     /* call trigger on the frontend before the backend. */
> > +     if (fe_first) {
> > +             dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
> > +                     fe->dai_link->name, cmd);
> > +
> > +             ret = soc_pcm_trigger(substream, cmd);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
> > +             return ret;
> > +     }
> > +
> > +     /* call trigger on the frontend after the backend. */
> > +     ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
> > +             fe->dai_link->name, cmd);
> > +
> > +     ret = soc_pcm_trigger(substream, cmd);
> > +
> > +     return ret;
> > +}
> > +
> >   static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream,
> int cmd)
> >   {
> >       struct snd_soc_pcm_runtime *fe = substream->private_data;
> > -     int stream = substream->stream, ret;
> > +     int stream = substream->stream;
> > +     int ret = 0;
> >       enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
> >
> >       fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
> >
> >       switch (trigger) {
> >       case SND_SOC_DPCM_TRIGGER_PRE:
> > -             /* call trigger on the frontend before the backend. */
> > -
> > -             dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
> > -                             fe->dai_link->name, cmd);
> > -
> > -             ret = soc_pcm_trigger(substream, cmd);
> > -             if (ret < 0) {
> > -                     dev_err(fe->dev,"ASoC: trigger FE failed %d\n",
> ret);
> > -                     goto out;
> > +             switch (cmd) {
> > +             case SNDRV_PCM_TRIGGER_START:
> > +             case SNDRV_PCM_TRIGGER_RESUME:
> > +             case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > +                     ret = dpcm_dai_trigger_fe_first(substream, cmd,
> true);
> > +                     break;
> > +             case SNDRV_PCM_TRIGGER_STOP:
> > +             case SNDRV_PCM_TRIGGER_SUSPEND:
> > +                     ret = dpcm_dai_trigger_fe_first(substream, cmd,
> false);
> > +                     break;
> > +             case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> > +                     ret = dpcm_dai_trigger_fe_first(substream, cmd,
> false);
> > +                     break;
>
> can we group these 3 cases together? The last two are identical.
>
Ahh yes, I originally intended to set the state here as well but changed my
mind later on . Will fix in v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
