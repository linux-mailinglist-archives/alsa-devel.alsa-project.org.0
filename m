Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2170518D490
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 17:35:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C532084A;
	Fri, 20 Mar 2020 17:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C532084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584722117;
	bh=7SWG2PEKXZk41WcCclAKyzauDiC5TQbND7sxl+uEuA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FcuqU0+kXGog8tKU5jMxwhh0dn/6C5jURh5UirOnQuNcij0x2p98txbcK5AI8LAHR
	 4l7GOGYvipsBzFIUM/i4+NrtNPH2+vpgrXMoCxoQyby21MJ1qAvtOQXOZIZFJvucqD
	 /fipPo25BCy6tOQKXAHEpyMgyOcbhDIHzSVHYNBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F49F80171;
	Fri, 20 Mar 2020 17:32:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B78C3F80171; Fri, 20 Mar 2020 17:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0211DF800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 17:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0211DF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="zOAM8XWN"
Received: by mail-io1-xd44.google.com with SMTP id h131so6613851iof.1
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1BKn5CFFINTZLbm5APIlvKqfDqqqj0uOyzG9WIQ1Sk=;
 b=zOAM8XWNKXsd04zWxYT9MvQLzUHu7VCbMqCfbh0K28FaMP4OdT44hJAzYNBPqP/wNa
 IF1qbfJZxMcR1gM1j091IygW0J9Cva+6OZvVybmVprr/az0J/WNSXuezAkPSzaVzZddo
 aEXTfk2kjMMo+1Hfikm5MNNDJE5zGRBF6PG22H1y5sNMh6OAIbffsakjUsMe7MRFe0T/
 MRoBToyrgSZsmnn3QwGQj+7MAT58YeryKCnLu6azcm8UQ3K2bDpONhYussWuT5iBwU2O
 9/6PQ9YPHTMBek8ltYieSUROGyR5ThLJpfVGOsFuF8HWriU9JwLhV/bxpvwUfIuwOYvR
 DoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1BKn5CFFINTZLbm5APIlvKqfDqqqj0uOyzG9WIQ1Sk=;
 b=RLUP5Vmz0TA4p7eWQLpeNKmBFgn619cuAZHGW8L5TbZHgQNTVTwQmyk5pyHru6a8A8
 SyxrJNfu/uH/wTtejiPWfMl7DFGKr1PWYtyTHo0x3TLw3kqbo9bUDzefr5ia2rcj2rzk
 sJRvMk/j5eTu5X/07DjGSI4Zd9KRXkF/kRe8YkkzPExD43iOsC8a8KxgJ7BJATzRI6IK
 UxIIdUMAzTr13hz1yhBLSiXU9ng3nlszkXF2Ft/qSpINAv1pv8+TCvGcbZ1yCwBr56Bk
 tCM1DHbe4u55WWa4+QvHchzfF9x8RAENXy+QpLxvxrreplt7CN3FUWtj/Z+MfWoVb6ft
 Elrg==
X-Gm-Message-State: ANhLgQ2LXDplEM99xDyN3+hLafYwBGyfYRPB5dnrpM5K3VK1xP3Bm4Ot
 SaA7SF3vtD5l/LxfgSq2czuQweD+Ag85tsGC5N5K6w==
X-Google-Smtp-Source: ADFU+vseGHQoNI+PNhcMyhTyhAknhoGRs6au0uEgNWF75id2Bv8SdhfAN2h7XqJlUQ+v8u8V88DSivfoPGKADqz9A28=
X-Received: by 2002:a05:6638:103:: with SMTP id
 x3mr8586872jao.62.1584721920922; 
 Fri, 20 Mar 2020 09:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200320123634.GB2130@ubuntu>
In-Reply-To: <20200320123634.GB2130@ubuntu>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Fri, 20 Mar 2020 09:31:50 -0700
Message-ID: <CAFQqKeW1Fejm1WHwc+Wm8nAoiqj=MtuO6zv1RUYCZoBsre5hjA@mail.gmail.com>
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

On Fri, Mar 20, 2020 at 5:36 AM Guennadi Liakhovetski <
guennadi.liakhovetski@linux.intel.com> wrote:

> In the VirtIO case the sof_pcm_open() function isn't called on the
> host during guest streaming, which then leaves "work" structures
> uninitialised. However it is then used to handle position update
> messages from the DSP. Move their initialisation to immediately after
> allocation of the containing structure.
>
> Signed-off-by: Guennadi Liakhovetski <
> guennadi.liakhovetski@linux.intel.com>
> ---
>
> This is a re-send of "[PATCH 08/14] ASoC: SOF: fix uninitialised "work"
> with VirtIO" as suggested by Mark, also taking into account a comment
> from Ranjani - thanks. Note: I haven't sent patches before from mutt,
> hope this will work, if not - will have to re-send.
>
>  sound/soc/sof/pcm.c       |  4 +---
>  sound/soc/sof/sof-audio.h |  3 +++
>  sound/soc/sof/topology.c  | 17 ++++++++++++-----
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index f4769e1..47cd741 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -57,7 +57,7 @@ static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm,
> struct snd_pcm_substream
>  /*
>   * sof pcm period elapse work
>   */
> -static void sof_pcm_period_elapsed_work(struct work_struct *work)
> +void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
>  {
>         struct snd_sof_pcm_stream *sps =
>                 container_of(work, struct snd_sof_pcm_stream,
> @@ -475,8 +475,6 @@ static int sof_pcm_open(struct snd_soc_component
> *component,
>         dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
>                 spcm->pcm.pcm_id, substream->stream);
>
> -       INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
> -                 sof_pcm_period_elapsed_work);
>
>         caps = &spcm->pcm.caps[substream->stream];
>
> diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> index eacd10e..bf65f31a 100644
> --- a/sound/soc/sof/sof-audio.h
> +++ b/sound/soc/sof/sof-audio.h
> @@ -11,6 +11,8 @@
>  #ifndef __SOUND_SOC_SOF_AUDIO_H
>  #define __SOUND_SOC_SOF_AUDIO_H
>
> +#include <linux/workqueue.h>
> +
>  #include <sound/soc.h>
>  #include <sound/control.h>
>  #include <sound/sof/stream.h> /* needs to be included before control.h */
> @@ -189,6 +191,7 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct
> snd_soc_component *scomp,
>  struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component
> *scomp,
>                                              unsigned int pcm_id);
>  void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
> +void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
>
>  /*
>   * Mixer IPC
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 058de94..fe8ba3e 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -9,6 +9,7 @@
>  //
>
>  #include <linux/firmware.h>
> +#include <linux/workqueue.h>
>  #include <sound/tlv.h>
>  #include <sound/pcm_params.h>
>  #include <uapi/sound/sof/tokens.h>
> @@ -2448,7 +2449,7 @@ static int sof_dai_load(struct snd_soc_component
> *scomp, int index,
>         struct snd_soc_tplg_stream_caps *caps;
>         struct snd_soc_tplg_private *private = &pcm->priv;
>         struct snd_sof_pcm *spcm;
> -       int stream = SNDRV_PCM_STREAM_PLAYBACK;
> +       int stream;
>         int ret = 0;
>
>         /* nothing to do for BEs atm */
> @@ -2460,8 +2461,12 @@ static int sof_dai_load(struct snd_soc_component
> *scomp, int index,
>                 return -ENOMEM;
>
>         spcm->scomp = scomp;
> -       spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id =
> COMP_ID_UNASSIGNED;
> -       spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id =
> COMP_ID_UNASSIGNED;
> +
> +       for_each_pcm_streams(stream) {
> +               spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
> +               INIT_WORK(&spcm->stream[stream].period_elapsed_work,
> +                         snd_sof_pcm_period_elapsed_work);
> +       }
>
>         spcm->pcm = *pcm;
>         dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
> @@ -2482,8 +2487,10 @@ static int sof_dai_load(struct snd_soc_component
> *scomp, int index,
>         if (!spcm->pcm.playback)
>                 goto capture;
>
> +       stream = SNDRV_PCM_STREAM_PLAYBACK;
> +
>         dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback
> d0i3:%d\n",
> -                spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
> +                spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
>
Hi Guennadi,

This cleanup is unrelated to the commit message (and the one below)? Should
it be a separate patch?

Thanks,
Ranjani
