Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB819614464
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 06:46:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D0711694;
	Tue,  1 Nov 2022 06:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D0711694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667281587;
	bh=VTzzvmyEZlt+XflAXoxuRCwGkkh9WCK4f+3It/1TwFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhCBPBwUO+faAVquF5fggULUzioT8fHf8IlkA3rn0DsXpqpS0DOwPCMWnMR78TeTL
	 gKl/5Hcwws1aeysrq+7uuRDAUTTz2Gq4Y2KbCcVbnkBFWvhdKPYbqyPgpf3aC8rYox
	 L5lmJAwhcTYAEpF7BGilhwyQtij8RM76J+Hkq1xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6948F80423;
	Tue,  1 Nov 2022 06:45:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AFBAF80519; Tue,  1 Nov 2022 06:45:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A956BF80423
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 06:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A956BF80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VjShMQy9"
Received: by mail-lj1-x233.google.com with SMTP id b8so19512386ljf.0
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 22:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vDaw5eC6bXjv+s/idpalyykG065gVlj405gOBjwpIu4=;
 b=VjShMQy9lLbK7YjAdRlBqWLKO4yzFON/f/7s5WTT79x9T4+YF8PNElIHZJz4M7VOZ7
 YwtiB7PCbtZeWuD1LPa78e6HmsBiVwdX322qZCpoFbVAq606bmnwSwnD8wkyAZxDgLRA
 yRqdllCCSadVlbMpDmen1UJfkr+7AO5QQLHbL06XY0kA100Mnk2GVc8DmVVsAybqUbWs
 jcRhcEfL61Xs8TjElpJCp16ZmmDc+06GTH+0fME+SEG2Gpv2tG4Wi1M6rZ/TmcoN/MSy
 cp+Gm/Prbwv16nYsG0s98MaTdR2x34n3hCwNENZDGzX1jc997QZvDnAixtfdk0PtLl49
 GmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vDaw5eC6bXjv+s/idpalyykG065gVlj405gOBjwpIu4=;
 b=e/mUOblia88ZktaJd8goC1EEiEudnWey01bS314QKirwldE2j83XMG5ToInOLE8I2M
 oXAFOOalYVdP4drPLEY4th8T+ugSpVUwh7HeyZrNwnYkPnANWQgCK9cWcGpubuDxfpoK
 sejitorkmtFmQpYuLE6V7O1CB+6ftHsA0jrfOamcUaMit1udirh/1T4bbu+rTrD3FMhd
 b9ehgJLU6fH9KYNgBnVr9niH8HfqbNOx5EzXsBuidDYQmvLGEvg+yzk/bqCQep3L9c7Y
 MJaWP/+tThjC62b6dUb9Iadqa0hcpa+ySHbaH0GYDxQ5mHfNmHVyLiiVguIt7VOwMpHo
 10hQ==
X-Gm-Message-State: ACrzQf11t31v7uHe5bLoGzhsjPaC/lZx0jUw5FjaVdDuQR2X1tWHSfiT
 FGJSgzszdGGpnVhYUg9pVV7HoZM2tx3AsIE0kM0=
X-Google-Smtp-Source: AMsMyM5nU6UMXntrVs7Da/6zFSVFD9MdqLgtBjE0PNrBvN3GMBJ4Bv8R0iH/1rd+GXKPjMZAd0J2toxSyaYKuml3t0E=
X-Received: by 2002:a2e:a385:0:b0:277:34ff:e56b with SMTP id
 r5-20020a2ea385000000b0027734ffe56bmr7154649lje.297.1667281515220; Mon, 31
 Oct 2022 22:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221028082750.991822-1-chancel.liu@nxp.com>
 <20221028082750.991822-4-chancel.liu@nxp.com>
In-Reply-To: <20221028082750.991822-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Nov 2022 13:45:03 +0800
Message-ID: <CAA+D8ANKPOEgr6F4_7hq=b5dKOkSHrGjDAE14=Je3K1gbdDY6Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_micfil: Add support when using eDMA
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 festevam@gmail.com
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

On Fri, Oct 28, 2022 at 4:28 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> On i.MX93 platform MICFIL uses eDMA. The maxburst should be set to the
> number of channels in eDMA multiple FIFO mode.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index b8a9504441df..22e75c14cac4 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -63,6 +63,7 @@ struct fsl_micfil_soc_data {
>         unsigned int fifo_depth;
>         unsigned int dataline;
>         bool imx;
> +       bool use_edma;
>         u64  formats;
>  };
>
> @@ -88,6 +89,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
>         .fifo_depth = 32,
>         .dataline =  0xf,
>         .formats = SNDRV_PCM_FMTBIT_S32_LE,
> +       .use_edma = true,
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] = {
> @@ -690,6 +692,8 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         micfil->sdmacfg.n_fifos_src = channels;
>         micfil->sdmacfg.sw_done = true;
>         micfil->dma_params_rx.maxburst = channels * MICFIL_DMA_MAXBURST_RX;
> +       if (micfil->soc->use_edma)
> +               micfil->dma_params_rx.maxburst = channels;
>
>         return 0;
>  }
> --
> 2.25.1
>
>
