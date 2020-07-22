Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D92299C5
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 16:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0B715F9;
	Wed, 22 Jul 2020 16:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0B715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595426796;
	bh=S7dY6eTUSDCX4vkLCfc1W0Ka79YbrCiqeuc5dPJkFZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSrqKfFoZ1W6ClVyB8kKFVB9fFrLg3ThqCuiAxsd56JDGRwA0syTGcv3FSu7wNpzZ
	 h8Y0/sfJX86mA+yS+TKyThYgLsJApPsvGvD3WyMstBbanhaCYSUX11tP5TWttA7BDQ
	 QCubR3lG8/SxLOo1EuC/KfajdNRY8RXuTk6mnYyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E48FF80139;
	Wed, 22 Jul 2020 16:04:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7082CF80139; Wed, 22 Jul 2020 16:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E1D5F80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 16:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E1D5F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ks1r01r8"
Received: by mail-wm1-x343.google.com with SMTP id o8so2052413wmh.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Rs2Y2EqzdkKrOA6XoS+7IQYSW7ep9XsRJtfJ1V00SI=;
 b=ks1r01r8IlR17EoE2Q5OyQVSs4AV9IGOQE1iaO69O1yAzO7nIEE0kbTXCSNW+hmHbm
 RQrHbYI35gsDOVPSFAwtW3J4PPwkOS4OH+pPX3HHOsGNsYhn7f1duuxwYJfCFIWVm9/U
 BZTcbtEpjVEhMLOKSLcMrbEthdks1UCP5rHk+XiUNwf+TywwR8swnUdxnPoTbPd1vPrJ
 JxN9ltz1Mcj6AnzOz7E2oHmT7N0zeSKY1jA+Jac99v/4rO3AFrWeKME/L6wx4Iw/IZ2H
 vl0S02Yj4RUPqrcuYA08ibKKeHPFOkX1ATDQsXqDk/uWWPA8Pz75m758Je0/bUkAJWMC
 Mkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Rs2Y2EqzdkKrOA6XoS+7IQYSW7ep9XsRJtfJ1V00SI=;
 b=CgAaSH7kdIL+lDuvOJIBryXXjHNk2N2ApsIYvVFjCgnASGZ7cbqDh6CAejtuSNMcLv
 LB/zB3yBUUhlo2K8cyxXGN7P6ZghUgSpQ0xe5lO4RNSBkxDW2Z1J510oE1aXAzN0E7XP
 wcRMexG7Brj4DOwjD7tEjQ06ggkdGuivBYV8oX2swmS9WGqqYtOX2r7DcxC6pWHsVmYO
 Pc3I5ElX7zakASOK6YyJwT2hDpHw5lwr9fICsqiHeL6nVEsp8pOb9cvQG0D5jT/HI0po
 ZvMMJgycN1ndjgedfaacCKIC7b3tkk2UD66UV9JMwfYIyEdhakk6yRRFMQL0ek/A5ZRt
 4yUg==
X-Gm-Message-State: AOAM532IkBr1vBRtI5Qmuvn/ThADFqV9T91zhlnwJcYiq45JLNOqnX6c
 mwV/jWVd7vPzfrKcAiMUYtDlsR6XfxyvbyJ53FpI7fdl
X-Google-Smtp-Source: ABdhPJzbBZpmvKOmpiAE1M0Qdqb/UFYsFJDbC0RenHJ5MR1TbtbU/Hqntla9nhteJ8Rfgxb5Lvy5BMZJ2KDmAy9jXz4=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr2173888wmk.153.1595426682017; 
 Wed, 22 Jul 2020 07:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
 <20200721170007.4554-7-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200721170007.4554-7-srinivas.kandagatla@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Jul 2020 17:04:30 +0300
Message-ID: <CAEnQRZA6Y99znD3ZtpuGhc+i-WVDtUW-jP1sF3MTg289S_Mr_g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/6] ASoC: q6asm-dai: add support to
 set_codec_params
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, ckeepax@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Tue, Jul 21, 2020 at 8:03 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Make use of new set_codec_params callback to allow decoder switching
> during gapless playback.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index b5c719682919..a8cfb1996614 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -876,6 +876,37 @@ static int __q6asm_dai_compr_set_codec_params(struct snd_soc_component *componen
>         return 0;
>  }
>
> +static int q6asm_dai_compr_set_codec_params(struct snd_soc_component *component,
> +                                           struct snd_compr_stream *stream,
> +                                           struct snd_codec *codec)
> +{
> +       struct snd_compr_runtime *runtime = stream->runtime;
> +       struct q6asm_dai_rtd *prtd = runtime->private_data;
> +       int ret;
> +
> +       ret = q6asm_open_write(prtd->audio_client, prtd->next_track_stream_id,
> +                              codec->id, codec->profile, prtd->bits_per_sample,
> +                              true);
> +       if (ret < 0) {
> +               pr_err("q6asm_open_write failed\n");

Since you have component->dev here I think it is worth it to use
dev_err instead of pr_err.

Same for the rest of the code.
