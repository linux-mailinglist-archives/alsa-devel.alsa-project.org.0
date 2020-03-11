Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95228180D8F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 02:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A374166A;
	Wed, 11 Mar 2020 02:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A374166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583890380;
	bh=Jph8Re4foBCTBZh6YJyyJTYwU2gyHhX/JY2RFqxptE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0lCB3xM4NeP6O48sAcD552K/ZhiY5P/wTiY2YhWzBKO42XfRycP/yFFidGPbDwNs
	 y1ohYPdn9/aeo4jf07zVddIxNgs1fN8NSsm7UQvQ/UvJLsNrYZhIEjqH2CmF+rFiHj
	 hqp6vhUEm2p+BYj/oxhi8hoTRaGnJjoSw13LIWmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C77F80247;
	Wed, 11 Mar 2020 02:30:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD28F80246; Wed, 11 Mar 2020 02:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDF16F800DA
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 02:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF16F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="U8vsvppg"
Received: by mail-io1-xd42.google.com with SMTP id t26so214468ios.11
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ooCHc5vk8a4X1xq60qwPMWVao+DwlqAIUBgQbpS+CxI=;
 b=U8vsvppg015rzMsVKFhrsunS3xZZYipp8qJ2HQSSKleQOjPQicm0fSdEY9cJiQmuio
 sI7PATT3ipNhW3mdUh6o8RGpR4Ip5AQXNgkzpxthpOFym5zLAI7AktukvszJA/9QGSDd
 qwBu2kCTXBBc58sM5trGdf+GOfA1/buqTw+d2VAvVyHgTNEYeVL20QpjcVhEHNHuHNFX
 ngxO0HhAAF3MU37u21ules/N27Ulj2xkGzZhim0brClJznNmzZX112Ub0FZcHZ8nReeo
 oDA9oVWxQh8q1BcqlBkawpeuGFMRRNd75hktBioRFMq3jtwyTV8Xr3wCrTLnHTceYmI/
 j8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ooCHc5vk8a4X1xq60qwPMWVao+DwlqAIUBgQbpS+CxI=;
 b=WByYHPRblYYubiw0hKw0bmBoiz+HahAKEQxh0Tb0UoYMNO7auh3govQtFXqlu4BSV3
 vdLU89nAHjPFML+JML0F7LxxL4zFwcf93KiVHuzNX6pcoUcey+5cseAgdYHZdmSxOBWQ
 qkbLqXBYLmVz0dV1p9aRmN1Scxufznt6TwQ84oY/O9FHGVczAlaBDKVlpBN8VNUwv60d
 d2tM7mzWocIslkV58747IrgG3vVYPxEmdWazz4HYwXlPqvrDkGD1mDb4YLingaY624MN
 IUdZ+XvBOthkZ179jhoPIXCuf1PZ+JxDjqgDlZfpA7Awjc6/JCVarkPz5zMYnPkpyFOJ
 8RDQ==
X-Gm-Message-State: ANhLgQ3qvJoWG886jS0+nw+uFdS6TxPLkOXSd+LKYVi/vRnXRthD0F1q
 OI33f3ELRtKmYEqFlQl7lu+CjKrYD6YjO6mdFmBzzw==
X-Google-Smtp-Source: ADFU+vtSWbYTq20pX9uAF1OVo6e60ZduF2dIgY097wjn4Ozw6APVKx6UnPF8Vn9mrgtUsXtXP7X72RJfy09u3zDbU1w=
X-Received: by 2002:a02:9203:: with SMTP id x3mr868052jag.62.1583890239888;
 Tue, 10 Mar 2020 18:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <87y2s7vgxb.wl-kuninori.morimoto.gx@renesas.com>
 <87sgifvgvj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgifvgvj.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 10 Mar 2020 18:30:29 -0700
Message-ID: <CAFQqKeXR-ymj-5Xz=+LEKbPP1_eqVfoLNF5a88Yf10An3FdoFw@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Tue, Mar 10, 2020 at 6:10 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now we can use for_each_rtd_dais().
> Let's use it instead of for_each_rtd_cpu/codec_dais().
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 314 +++++++++++---------------------------------
>  1 file changed, 75 insertions(+), 239 deletions(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 733d7e8a0e55..dae1821c78dc 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -259,25 +259,15 @@ static int soc_rtd_trigger(struct
> snd_soc_pcm_runtime *rtd,
>  static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
>                                    int stream, int action)
>  {
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         int i;
>
>         lockdep_assert_held(&rtd->card->pcm_mutex);
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               cpu_dai->stream_active[stream] += action;
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               codec_dai->stream_active[stream] += action;
> -
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               cpu_dai->active += action;
> -               cpu_dai->component->active += action;
> -       }
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               codec_dai->active += action;
> -               codec_dai->component->active += action;
> +       for_each_rtd_dais(rtd, i, dai) {
> +               dai->stream_active[stream] += action;
> +               dai->active += action;
> +               dai->component->active += action;
>         }
>  }
>
> @@ -444,8 +434,8 @@ static int soc_pcm_params_symmetry(struct
> snd_pcm_substream *substream,
>                                 struct snd_pcm_hw_params *params)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *dai;
>         struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
>         unsigned int rate, channels, sample_bits, symmetry, i;
>
>         rate = params_rate(params);
> @@ -455,11 +445,8 @@ static int soc_pcm_params_symmetry(struct
> snd_pcm_substream *substream,
>         /* reject unmatched parameters when applying symmetry */
>         symmetry = rtd->dai_link->symmetric_rates;
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               symmetry |= cpu_dai->driver->symmetric_rates;
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               symmetry |= codec_dai->driver->symmetric_rates;
> +       for_each_rtd_cpu_dais(rtd, i, dai)
> +               symmetry |= dai->driver->symmetric_rates;
>
>         if (symmetry) {
>                 for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> @@ -473,11 +460,8 @@ static int soc_pcm_params_symmetry(struct
> snd_pcm_substream *substream,
>
>         symmetry = rtd->dai_link->symmetric_channels;
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               symmetry |= cpu_dai->driver->symmetric_channels;
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               symmetry |= codec_dai->driver->symmetric_channels;
> +       for_each_rtd_dais(rtd, i, dai)
> +               symmetry |= dai->driver->symmetric_channels;
>
>         if (symmetry) {
>                 for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> @@ -492,11 +476,8 @@ static int soc_pcm_params_symmetry(struct
> snd_pcm_substream *substream,
>
>         symmetry = rtd->dai_link->symmetric_samplebits;
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               symmetry |= cpu_dai->driver->symmetric_samplebits;
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               symmetry |= codec_dai->driver->symmetric_samplebits;
> +       for_each_rtd_dais(rtd, i, dai)
> +               symmetry |= dai->driver->symmetric_samplebits;
>
>         if (symmetry) {
>                 for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> @@ -516,25 +497,18 @@ static bool soc_pcm_has_symmetry(struct
> snd_pcm_substream *substream)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_soc_dai_link *link = rtd->dai_link;
> -       struct snd_soc_dai *codec_dai;
> -       struct snd_soc_dai *cpu_dai;
> +       struct snd_soc_dai *dai;
>         unsigned int symmetry, i;
>
>         symmetry = link->symmetric_rates ||
>                 link->symmetric_channels ||
>                 link->symmetric_samplebits;
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               symmetry = symmetry ||
> -                       cpu_dai->driver->symmetric_rates ||
> -                       cpu_dai->driver->symmetric_channels ||
> -                       cpu_dai->driver->symmetric_samplebits;
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> +       for_each_rtd_dais(rtd, i, dai)
>                 symmetry = symmetry ||
> -                       codec_dai->driver->symmetric_rates ||
> -                       codec_dai->driver->symmetric_channels ||
> -                       codec_dai->driver->symmetric_samplebits;
> +                       dai->driver->symmetric_rates ||
> +                       dai->driver->symmetric_channels ||
> +                       dai->driver->symmetric_samplebits;
>
>         return symmetry;
>  }
> @@ -772,19 +746,15 @@ static int soc_pcm_close(struct snd_pcm_substream
> *substream)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_soc_component *component;
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         int i;
>
>         mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
>
>         snd_soc_runtime_deactivate(rtd, substream->stream);
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               snd_soc_dai_shutdown(cpu_dai, substream);
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               snd_soc_dai_shutdown(codec_dai, substream);
> +       for_each_rtd_dais(rtd, i, dai)
> +               snd_soc_dai_shutdown(dai, substream);
>
>         soc_rtd_shutdown(rtd, substream);
>
> @@ -816,8 +786,7 @@ static int soc_pcm_open(struct snd_pcm_substream
> *substream)
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         struct snd_soc_component *component;
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         const char *codec_dai_name = "multicodec";
>         const char *cpu_dai_name = "multicpu";
>         int i, ret = 0;
> @@ -842,28 +811,19 @@ static int soc_pcm_open(struct snd_pcm_substream
> *substream)
>         }
>
>         /* startup the audio subsystem */
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               ret = snd_soc_dai_startup(cpu_dai, substream);
> -               if (ret < 0) {
> -                       dev_err(cpu_dai->dev, "ASoC: can't open interface
> %s: %d\n",
> -                               cpu_dai->name, ret);
> -                       goto cpu_dai_err;
> -               }
> -       }
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               ret = snd_soc_dai_startup(codec_dai, substream);
> +       for_each_rtd_dais(rtd, i, dai) {
> +               ret = snd_soc_dai_startup(dai, substream);
>                 if (ret < 0) {
> -                       dev_err(codec_dai->dev,
> -                               "ASoC: can't open codec %s: %d\n",
> -                               codec_dai->name, ret);
> +                       dev_err(dai->dev,
> +                               "ASoC: can't open DAI %s: %d\n",
> +                               dai->name, ret);
>                         goto config_err;
>                 }
>
>                 if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -                       codec_dai->tx_mask = 0;
> +                       dai->tx_mask = 0;
>                 else
> -                       codec_dai->rx_mask = 0;
> +                       dai->rx_mask = 0;
>         }
>
>         /* Dynamic PCM DAI links compat checks use dynamic capabilities */
> @@ -903,17 +863,9 @@ static int soc_pcm_open(struct snd_pcm_substream
> *substream)
>         soc_pcm_apply_msb(substream);
>
>         /* Symmetry only applies if we've already got an active stream. */
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               if (cpu_dai->active) {
> -                       ret = soc_pcm_apply_symmetry(substream, cpu_dai);
> -                       if (ret != 0)
> -                               goto config_err;
> -               }
> -       }
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               if (codec_dai->active) {
> -                       ret = soc_pcm_apply_symmetry(substream, codec_dai);
> +       for_each_rtd_dais(rtd, i, dai) {
> +               if (dai->active) {
> +                       ret = soc_pcm_apply_symmetry(substream, dai);
>                         if (ret != 0)
>                                 goto config_err;
>                 }
> @@ -935,11 +887,8 @@ static int soc_pcm_open(struct snd_pcm_substream
> *substream)
>         return 0;
>
>  config_err:
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               snd_soc_dai_shutdown(codec_dai, substream);
> -cpu_dai_err:
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               snd_soc_dai_shutdown(cpu_dai, substream);
> +       for_each_rtd_dais(rtd, i, dai)
> +               snd_soc_dai_shutdown(dai, substream);
>
>         soc_rtd_shutdown(rtd, substream);
>  rtd_startup_err:
> @@ -978,8 +927,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream
> *substream)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_soc_component *component;
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         int i, ret = 0;
>
>         mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
> @@ -1000,21 +948,11 @@ static int soc_pcm_prepare(struct snd_pcm_substream
> *substream)
>                 }
>         }
>
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               ret = snd_soc_dai_prepare(codec_dai, substream);
> -               if (ret < 0) {
> -                       dev_err(codec_dai->dev,
> -                               "ASoC: codec DAI prepare error: %d\n",
> -                               ret);
> -                       goto out;
> -               }
> -       }
> -
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               ret = snd_soc_dai_prepare(cpu_dai, substream);
> +       for_each_rtd_dais(rtd, i, dai) {
> +               ret = snd_soc_dai_prepare(dai, substream);
>                 if (ret < 0) {
> -                       dev_err(cpu_dai->dev,
> -                               "ASoC: cpu DAI prepare error: %d\n", ret);
> +                       dev_err(dai->dev,
> +                               "ASoC: DAI prepare error: %d\n", ret);
>                         goto out;
>                 }
>         }
> @@ -1029,11 +967,8 @@ static int soc_pcm_prepare(struct snd_pcm_substream
> *substream)
>         snd_soc_dapm_stream_event(rtd, substream->stream,
>                         SND_SOC_DAPM_STREAM_START);
>
> -       for_each_rtd_codec_dais(rtd, i, codec_dai)
> -               snd_soc_dai_digital_mute(codec_dai, 0,
> -                                        substream->stream);
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> -               snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
> +       for_each_rtd_dais(rtd, i, dai)
> +               snd_soc_dai_digital_mute(dai, 0, substream->stream);
>
>  out:
>         mutex_unlock(&rtd->card->pcm_mutex);
> @@ -1217,44 +1152,23 @@ static int soc_pcm_hw_params(struct
> snd_pcm_substream *substream,
>  static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         int i;
>
>         mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
>
>         /* clear the corresponding DAIs parameters when going to be
> inactive */
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               if (cpu_dai->active == 1) {
> -                       cpu_dai->rate = 0;
> -                       cpu_dai->channels = 0;
> -                       cpu_dai->sample_bits = 0;
> -               }
> -       }
> +       for_each_rtd_dais(rtd, i, dai) {
> +               int active = dai->stream_active[substream->stream];
>
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               if (codec_dai->active == 1) {
> -                       codec_dai->rate = 0;
> -                       codec_dai->channels = 0;
> -                       codec_dai->sample_bits = 0;
> +               if (dai->active == 1) {
> +                       dai->rate = 0;
> +                       dai->channels = 0;
> +                       dai->sample_bits = 0;
>                 }
> -       }
> -
> -       /* apply codec digital mute */
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               int active = codec_dai->stream_active[substream->stream];
> -
> -               if (active == 1)
> -                       snd_soc_dai_digital_mute(codec_dai, 1,
> -                                                substream->stream);
> -       }
> -
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               int active = cpu_dai->stream_active[substream->stream];
>
>                 if (active == 1)
> -                       snd_soc_dai_digital_mute(cpu_dai, 1,
> -                                                substream->stream);
> +                       snd_soc_dai_digital_mute(dai, 1,
> substream->stream);
>         }
>
>         /* free any machine hw params */
> @@ -1264,18 +1178,11 @@ static int soc_pcm_hw_free(struct
> snd_pcm_substream *substream)
>         soc_pcm_components_hw_free(substream, NULL);
>
>         /* now free hw params for the DAIs  */
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               if (!snd_soc_dai_stream_valid(codec_dai,
> substream->stream))
> +       for_each_rtd_dais(rtd, i, dai) {
> +               if (!snd_soc_dai_stream_valid(dai, substream->stream))
>                         continue;
>
> -               snd_soc_dai_hw_free(codec_dai, substream);
> -       }
> -
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> -                       continue;
> -
> -               snd_soc_dai_hw_free(cpu_dai, substream);
> +               snd_soc_dai_hw_free(dai, substream);
>         }
>
>         mutex_unlock(&rtd->card->pcm_mutex);
> @@ -1286,8 +1193,7 @@ static int soc_pcm_trigger_start(struct
> snd_pcm_substream *substream, int cmd)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_soc_component *component;
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         int i, ret;
>
>         ret = soc_rtd_trigger(rtd, substream, cmd);
> @@ -1300,14 +1206,8 @@ static int soc_pcm_trigger_start(struct
> snd_pcm_substream *substream, int cmd)
>                         return ret;
>         }
>
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
> -               if (ret < 0)
> -                       return ret;
> -       }
> -
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
> +       for_each_rtd_dais(rtd, i, dai) {
> +               ret = snd_soc_dai_trigger(dai, substream, cmd);
>                 if (ret < 0)
>                         return ret;
>         }
> @@ -1319,18 +1219,11 @@ static int soc_pcm_trigger_stop(struct
> snd_pcm_substream *substream, int cmd)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_soc_component *component;
> -       struct snd_soc_dai *cpu_dai;
> -       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *dai;
>         int i, ret;
>
> -       for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -               ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
> -               if (ret < 0)
> -                       return ret;
> -       }
> -
> -       for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -               ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
> +       for_each_rtd_dais(rtd, i, dai) {
>
Morimoto-san,

We are switching the order in which the codec dais and cpu dais are stopped
here with this new macro no. Does it make a difference? The same comment
applies to some other changes as well.

If the trigger_start() started cpu dais first and then codec dais, do we
need to stop in the reverse order?

Thanks,
Ranjani
