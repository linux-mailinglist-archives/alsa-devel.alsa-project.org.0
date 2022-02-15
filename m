Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E54B5FDA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 02:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F871838;
	Tue, 15 Feb 2022 02:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F871838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644887506;
	bh=kxtactLb/dMK25E7lqPkBFCnVAmYvJFZl1keusH89wE=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdWBjfxzXdVF5OSaWVR5QHBjINR4i2OZGiw9dTAGnO6wgCA/EFDxHHaGhuvCtgYbY
	 cmsnSpjDLFH4uxO0pk/ZPsJ5csjM/Hs5oC3kHeL8TYJXaRasjW3CBV/CGAFHAQNYl7
	 Pq+Q6WnbHDhFZfUiMutC+IDVYyOpQ6sfIyWKaaug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFB4F800D8;
	Tue, 15 Feb 2022 02:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6390FF80310; Tue, 15 Feb 2022 02:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03CC8F80169
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 02:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CC8F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JzfqXRBd"
Received: by mail-oo1-xc2b.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so21365294ooa.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ifGbg82ymBEfPdZo3oeoqJubchOD7aHMGI+CCM/6VeI=;
 b=JzfqXRBdTeWFxtrsMjScRtFzmZW7lSKyEy50rmc0dSZv5O/+iCf5iJDvrvV9zCI6kB
 GQVBY7mZcCF5POUCKH7krqOiAFTUj/eW6g2spxpsuqoo/Mj3yBjcdfFfIga//wboSLgn
 CLOy+TDL29LexsBAUajcqmrLl5yPq5VWv+Wm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ifGbg82ymBEfPdZo3oeoqJubchOD7aHMGI+CCM/6VeI=;
 b=GiykjJRsms9vv3ma2NnQ1qdVCJkJK2USMmz+dhiPvEgA1UhbCzs3HTSAICo+HylIG0
 G+La+Wotn9vU1Lf5I+TVgxXRCuRcIIyO2VJmerw44FXieZdJrecdY4aevUnAzFlUFssy
 1s2T+zwLAsY60oY45JF7zZNVB6yTbaxiwbl//rUj3Tdl4T54d68bdJkF7zbWITAq0Z4O
 rsyhdpWppkYjmNUgnqMK5XkDG8izIsnb3+RdzbxitrfKTSz1/U6TQHojSAuTFdyt7PYC
 USCCN9bmEq2W6EEF1YSt45AxC6Kg8lWNO8CniAPGWfuCLgq1VG67xRa+L/DboPqdrWJB
 e1pg==
X-Gm-Message-State: AOAM533KhnwFUvRuSCfP/5NjN2Rf54wFKk/9+tcDPSaZUB+0CM9cJink
 /8UAEM8TH+atQn0qyLJ14+K1XIaAla3rBhxSRhNk0Q==
X-Google-Smtp-Source: ABdhPJwigiiW4fBvsZ0I8ihR5uCpy6DMum+AGLTc9gc9XbYvRSjnadspyKecplQizwXnkD5dQ9nFVSV+Wr5HQ2YmwB8=
X-Received: by 2002:a05:6870:1209:: with SMTP id 9mr565635oan.8.1644887430198; 
 Mon, 14 Feb 2022 17:10:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 17:10:29 -0800
MIME-Version: 1.0
In-Reply-To: <1644850708-11099-5-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-5-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 14 Feb 2022 17:10:29 -0800
Message-ID: <CAE-0n504R0avU9Ybj68jxqDRH-Ya5ro0hPo5GJ=2zC6p2SZ_=g@mail.gmail.com>
Subject: Re: [RESEND v13 04/10] ASoC: qcom: Add helper function to get dma
 control and lpaif handle
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:22)
> Add support function to get dma control and lpaif handle to avoid
> repeated code in platform driver
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/lpass-platform.c | 113 +++++++++++++++++++++++-----------------
>  1 file changed, 66 insertions(+), 47 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index a44162c..5d77240 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -177,6 +177,49 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>         return 0;
>  }
>
> +static void __lpass_get_lpaif_handle(struct snd_pcm_substream *substream,

const?

> +                                    struct snd_soc_component *component,

const?

> +                                    struct lpaif_dmactl **dmactl, int *id, struct regmap **map)
> +{
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +       struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +       struct snd_pcm_runtime *rt = substream->runtime;
> +       struct lpass_pcm_data *pcm_data = rt->private_data;
> +       struct lpass_variant *v = drvdata->variant;
> +       int dir = substream->stream;
> +       unsigned int dai_id = cpu_dai->driver->id;
> +       struct lpaif_dmactl *l_dmactl = NULL;
> +       struct regmap *l_map = NULL;
> +       int l_id = 0;
> +
> +       switch (dai_id) {
> +       case MI2S_PRIMARY ... MI2S_QUINARY:
> +               if (dir == SNDRV_PCM_STREAM_PLAYBACK) {

Please write if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) and
drop 'dir' local variable.

> +                       l_id = pcm_data->dma_ch;
> +                       l_dmactl = drvdata->rd_dmactl;
> +               } else {
> +                       l_dmactl = drvdata->wr_dmactl;
> +                       l_id = pcm_data->dma_ch - v->wrdma_channel_start;
> +               }
> +               l_map = drvdata->lpaif_map;
> +               break;
> +       case LPASS_DP_RX:
> +               l_id = pcm_data->dma_ch;
> +               l_dmactl = drvdata->hdmi_rd_dmactl;
> +               l_map = drvdata->hdmiif_map;
> +               break;
> +       default:
> +               break;
> +       }
> +       if (dmactl)
> +               *dmactl = l_dmactl;
> +       if (id)
> +               *id = l_id;
> +       if (map)
> +               *map = l_map;

Why not 'return 0' here and return -EINVAL in the default case above? Then
we can skip the checks for !map or !dmactl below and simply bail out if
it failed with an error value.

> +}
> +
>  static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>                                            struct snd_pcm_substream *substream,
>                                            struct snd_pcm_hw_params *params)
> @@ -191,21 +234,15 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>         unsigned int channels = params_channels(params);
>         unsigned int regval;
>         struct lpaif_dmactl *dmactl;
> -       int id, dir = substream->stream;
> +       int id;
>         int bitwidth;
>         int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
>         unsigned int dai_id = cpu_dai->driver->id;
>
> -       if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -               id = pcm_data->dma_ch;
> -               if (dai_id == LPASS_DP_RX)
> -                       dmactl = drvdata->hdmi_rd_dmactl;
> -               else
> -                       dmactl = drvdata->rd_dmactl;
> -
> -       } else {
> -               dmactl = drvdata->wr_dmactl;
> -               id = pcm_data->dma_ch - v->wrdma_channel_start;
> +       __lpass_get_lpaif_handle(substream, component, &dmactl, &id, NULL);
> +       if (!dmactl) {
> +               dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +               return -EINVAL;
>         }
>
>         bitwidth = snd_pcm_format_width(format);
> @@ -350,10 +387,11 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
>         struct regmap *map;
>         unsigned int dai_id = cpu_dai->driver->id;
>
> -       if (dai_id == LPASS_DP_RX)
> -               map = drvdata->hdmiif_map;
> -       else
> -               map = drvdata->lpaif_map;
> +       __lpass_get_lpaif_handle(substream, component, NULL, NULL, &map);
> +       if (!map) {
> +               dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +               return -EINVAL;
> +       }
>
>         reg = LPAIF_DMACTL_REG(v, pcm_data->dma_ch, substream->stream, dai_id);
>         ret = regmap_write(map, reg, 0);
> @@ -379,22 +417,12 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>         int ret, id, ch, dir = substream->stream;
>         unsigned int dai_id = cpu_dai->driver->id;
>
> -
>         ch = pcm_data->dma_ch;
> -       if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -               if (dai_id == LPASS_DP_RX) {
> -                       dmactl = drvdata->hdmi_rd_dmactl;
> -                       map = drvdata->hdmiif_map;
> -               } else {
> -                       dmactl = drvdata->rd_dmactl;
> -                       map = drvdata->lpaif_map;
> -               }
>
> -               id = pcm_data->dma_ch;
> -       } else {
> -               dmactl = drvdata->wr_dmactl;
> -               id = pcm_data->dma_ch - v->wrdma_channel_start;
> -               map = drvdata->lpaif_map;
> +       __lpass_get_lpaif_handle(substream, component, &dmactl, &id, &map);
> +       if (!dmactl) {
> +               dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +               return -EINVAL;
>         }
>
>         ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
> @@ -444,25 +472,15 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>         struct lpaif_dmactl *dmactl;
>         struct regmap *map;
>         int ret, ch, id;
> -       int dir = substream->stream;
>         unsigned int reg_irqclr = 0, val_irqclr = 0;
>         unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
>         unsigned int dai_id = cpu_dai->driver->id;
>
>         ch = pcm_data->dma_ch;
> -       if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -               id = pcm_data->dma_ch;
> -               if (dai_id == LPASS_DP_RX) {
> -                       dmactl = drvdata->hdmi_rd_dmactl;
> -                       map = drvdata->hdmiif_map;
> -               } else {
> -                       dmactl = drvdata->rd_dmactl;
> -                       map = drvdata->lpaif_map;
> -               }
> -       } else {
> -               dmactl = drvdata->wr_dmactl;
> -               id = pcm_data->dma_ch - v->wrdma_channel_start;
> -               map = drvdata->lpaif_map;
> +       __lpass_get_lpaif_handle(substream, component, &dmactl, &id, &map);
> +       if (!dmactl) {
> +               dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +               return -EINVAL;
>         }
>
>         switch (cmd) {
> @@ -597,10 +615,11 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>         struct regmap *map;
>         unsigned int dai_id = cpu_dai->driver->id;
>
> -       if (dai_id == LPASS_DP_RX)
> -               map = drvdata->hdmiif_map;
> -       else
> -               map = drvdata->lpaif_map;
> +       __lpass_get_lpaif_handle(substream, component, NULL, NULL, &map);
> +       if (!map) {
> +               dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +               return -EINVAL;
> +       }
>
>         ch = pcm_data->dma_ch;
>
> --
> 2.7.4
>
