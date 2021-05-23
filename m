Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A628638DDA1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 00:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CF0166F;
	Mon, 24 May 2021 00:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CF0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621810560;
	bh=1VhFToDlm0PYCMUgRKrMsTnLcbkh0jrIOXxl2YyHuPc=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wl/wt5JNinciMojvYvR+s78x3l/XWm+ZAzn4Dh8+v43UrVrzkRwqY5xzGeHRONqLc
	 S69fiSTQl4sHC7NVxHyOI/arfJ4+rdGIbdPF3kMtDF2XJHjS32ROdEtVkCCCiZrcdd
	 LSCTym6qK/fSi5h+Wl4NcDo1jOtCbsUOBsKn3RYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AABFF801F5;
	Mon, 24 May 2021 00:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF759F801EB; Mon, 24 May 2021 00:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9CA7F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 00:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9CA7F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bYyk8FSf"
Received: by mail-ot1-x334.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso23488798otn.3
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 15:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=1K/Zf6qVFEuzf3LeeUWAQu7y8CgaCqs3dPr1inenPpI=;
 b=bYyk8FSfT1TV7UPs81TdtN0954QCJeCRzD7K0EVI+uGfyiPaYKGqlEg9VcNPFobDZT
 K7yUNwmnlXYrwbHLyx7KXSi0kufc2cCzDekTyd3wgQMi6NT4/zuHNPGL/5EumWXT2Lnr
 qtVK+3VcB4PdJWIvq5vjekqXuQzzkAXFQaoxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=1K/Zf6qVFEuzf3LeeUWAQu7y8CgaCqs3dPr1inenPpI=;
 b=kyZ/OJhwVX8eQq1F4v6mnYzTXPof3dOBN6HEGm4+hgJV1hjRYEmMLj1fZBuc9n0ltF
 x9aSvlo1dxFA5QAOWusIDEg2zYMcNat/hkvb1T94UgarAHegkQeTPCdM6f8K5A58V0GL
 VlbeHDKTNcqeUVt9WfUkigRhsMfHl7qC6LBk+OWs0rNbE75PFsXU1MdweDHPhgB7ABka
 mYFdNhyMopQ3DGQ0Y65H5ilsm33/QZpn/Uh3MvGv2RRjABa+P5BFQdXS8WUR7/rEC+6e
 h5d4U/LZ00YcTSZgkzTQUHAVbQMzU53rMmTuB7zyo/AIq8Ik0XT46RzRc0GJgudj2yBP
 KrUw==
X-Gm-Message-State: AOAM532iDUy5UR48wwp9m/J+ljDG+52QMMAExw1tN9kb07gOZE7ueE7S
 PXJJxBg1H3KFaU32XrbfLkRz7cF8YLNytqYSqfqgDw==
X-Google-Smtp-Source: ABdhPJwoYoaR/C8nMh9n9rgeiaHd67jqnTMUKs8Z677FXDRZSbmeYGkUrXidIn9y95tLonGCJVOJSVXEF+TuV6VuoiA=
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr3389243oth.25.1621810455819; 
 Sun, 23 May 2021 15:54:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 May 2021 15:54:15 -0700
MIME-Version: 1.0
In-Reply-To: <20210520142432.29869-1-srivasam@codeaurora.org>
References: <20210520142432.29869-1-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sun, 23 May 2021 15:54:15 -0700
Message-ID: <CAE-0n50A18vru2bXQuQTq==J5bGQEzw4uUYv9qG7rNB5uk19jw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-05-20 07:24:32)
> This patch fixes PoP noise of around 15ms observed during audio capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for introducing some delay
> before capture start and clock enable.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

The SoB chain is weird. If Judy is first then Judy should show up with a

From: Judy Hsiao <judyhsiao@chromium.org>

initially. Otherwise, it's a Co-developed-by: tag that should be after
the SoB line.

> ---
> Changes Since V1:
>         -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
>         -- Added comments
>
>  sound/soc/qcom/lpass-cpu.c | 48 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..c5bb3f16d25f 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -93,9 +93,18 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>                 struct snd_soc_dai *dai)
>  {
>         struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
>
>         clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> -       clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
> +       /* To ensure BCLK/LRCLK disabled even in device node validation.
> +         Will not impact if disabled in trigger suspend */

/*
 * Can you use proper kernel doc multi-line notation please?
 */

And also, can we point to the function that is not impacted by "trigger
suspend"? Is that lpass_cpu_daiops_trigger()?

> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +       else
> +               regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +       clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>  }
>
>  static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> @@ -275,6 +284,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               /* To ensure lpass BCLK/LRCLK is enabled during
> +                       device resume. Will not impact if enabled in prepare */
>                 if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>                         ret = regmap_fields_write(i2sctl->spken, id,
>                                                  LPAIF_I2SCTL_SPKEN_ENABLE);
> @@ -296,6 +307,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>         case SNDRV_PCM_TRIGGER_STOP:
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               /* To ensure lpass BCLK/LRCLK is disabled during
> +                       device suspend */
>                 if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>                         ret = regmap_fields_write(i2sctl->spken, id,
>                                                  LPAIF_I2SCTL_SPKEN_DISABLE);
> @@ -308,19 +321,50 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>                                 ret);
>
>                 clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> -
> +               break;
> +       default:

It confuses me that we're adding 'default' now. Why? Is some define not
handled already? Why not use that define instead of 'default' so it is
explicit what is being handled? How is it even related to this patch?

>                 break;
>         }
>
>         return ret;
>  }
>
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +               struct snd_soc_dai *dai)
> +{
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
> +       int ret = -EINVAL;

ret will be assigned in the else though? Why assign it and then reassign
it?

> +       /* To ensure lpass BCLK/LRCLK is enabled bit before
> +          playback/capture data flow starts */
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
> +       else
> +               ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
> +
> +       if (ret)
> +               dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
> +              ret);

Why do we keep trying here instead of returning an error?

> +
> +       ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +
> +       if (ret) {
> +               dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +               clk_disable(drvdata->mi2s_osr_clk[id]);
> +               return ret;
> +       }
> +       return 0;

Could be

	return ret;


> +}
> +
> +

Nitpick: Why two newlines?

>  const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>         .set_sysclk     = lpass_cpu_daiops_set_sysclk,
>         .startup        = lpass_cpu_daiops_startup,
>         .shutdown       = lpass_cpu_daiops_shutdown,
>         .hw_params      = lpass_cpu_daiops_hw_params,
>         .trigger        = lpass_cpu_daiops_trigger,
> +       .prepare        = lpass_cpu_daiops_prepare,
>  };
