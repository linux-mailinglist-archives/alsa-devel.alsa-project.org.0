Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AD4F5E6F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C7F216F2;
	Wed,  6 Apr 2022 15:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C7F216F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649250147;
	bh=Cm4lDeqEQOyjJCBX3DNQQATUFBaTivR2NqdSCIybZSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4QskIkVBbXoa7Ay0URPTWuwXsPzIOwqiwVCn0P2YxgOemvDMFvGmxP4N+Uq9pEXR
	 Wc/gl0gMv5de1qE82xAfxZ4UOqkljA8Ubj8ukHbOLlAlkUgYPVTJnowkvr4A/qZxJr
	 GNLQ6lm9rG7NuFv6CaCWZat1ECZhzxh/uhB1jR+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DAEF80141;
	Wed,  6 Apr 2022 15:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3DCEF80054; Wed,  6 Apr 2022 15:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AB39F80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AB39F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dr3zzzB4"
Received: by mail-qt1-x832.google.com with SMTP id s7so4082446qtk.6
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qd8mejVs29qHum1enWUl0dENvVUifmrt5WDwJAoNc1I=;
 b=dr3zzzB4iP6dBeAmm/9NzSYktWbO5uzptvzHwxLtcgLbwTBkEP8buyEb9FaZr0nIwX
 cWUCcoyCcvrIRiW7t+wYIN4rdTHqUFJvZAZj1qLKMPjoFnWibYteFVBPxG5fBTaOASy4
 WsAIDMUmJgV+qq/KgY6n4qfs2jyxgP/TPAAFTDKmEdLHPSiiS8T0fMPLvgNgisUXYC+4
 KWMhbEYy4TkuBnhrEtSRT+Fm8lIW6cesUjSGuGHKUbCHhm3/SLEC/S2e/4jiTWVDohpK
 JRTFNkd7D5tQgeCtbkQJCQ3qCPuqsZoer4w+7ciUWoWbtlxnFtog4hyHbHD1AujsNDRq
 eHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qd8mejVs29qHum1enWUl0dENvVUifmrt5WDwJAoNc1I=;
 b=wq9UhA4eBrrlEbBaDuKYyJzlm6aboUn9t01Kmle4j87D0VJAGSoIwB9utAzRqYE+iX
 qkA+YbrOXvbODSvp//zGJK4Tc70fAe9RaniegykQndBJlYcaMwwHNZGrfP0xK5IKk0I9
 OdLatCEmy9KkOxNCV3ZlVm7DxZdlKkCBnUwJEjhFLjBiCCaAq/3UX7yYBqAjTInz7RPk
 G8+4HCC+xmcjNymadSVL0IEstoYlKCnG8qjTEtgJ7+Mg8sneSuan80FwXy14604scVQ7
 7GQJB7KrU+f0dqn06wjyU+7NSC4RPx/rd5c1TAlnQG4tKc9z4yKsqmAtUkw6XEx3w9y+
 Ii3Q==
X-Gm-Message-State: AOAM530R6BXCxci534wbuUwxSReVd9SIEY5jWiBRHv6BCvXO7nUblJD4
 Gm/RGP1itIuhErMef0QA/dWNs1tktJsB4DmqKTM=
X-Google-Smtp-Source: ABdhPJzgbiJma/qUUpgQ3mSBppPDJrEcVKAgz75J/HI9Zyqw0bebpqNd5HzJES0v/fMNJ3oobbomCbXcO2sjADNDzg8=
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id
 b22-20020ac85bd6000000b002e1c84135f6mr7121200qtb.120.1649250078835; Wed, 06
 Apr 2022 06:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-4-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-4-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Apr 2022 21:01:08 +0800
Message-ID: <CAA+D8AMw11fwtjB+61ffXGYUEm6q2R7DHYorQrN=N_mbUmT25g@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] ASoC: fsl_micfil: drop fsl_micfil_set_mclk_rate()
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> All that the .set_sysclk hook in the micfil driver does is to pass
> the sysclk frequency to fsl_micfil_set_mclk_rate(). This function
> expects the sample rate as argument though, not any kind of sysclk
> frequency. The resulting rate setting of the clock is overwritten
> in hw_params anyway, so drop this altogether.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index cf10c212d770d..5353474d0ff2b 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -358,30 +358,10 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         return 0;
>  }
>
> -static int fsl_micfil_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
> -                                    unsigned int freq, int dir)
> -{
> -       struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
> -       struct device *dev = &micfil->pdev->dev;
> -
> -       int ret;
> -
> -       if (!freq)
> -               return 0;
> -
> -       ret = fsl_micfil_set_mclk_rate(micfil, freq);
> -       if (ret < 0)
> -               dev_err(dev, "failed to set mclk[%lu] to rate %u\n",
> -                       clk_get_rate(micfil->mclk), freq);
> -
> -       return ret;
> -}
> -
>  static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
>         .startup = fsl_micfil_startup,
>         .trigger = fsl_micfil_trigger,
>         .hw_params = fsl_micfil_hw_params,
> -       .set_sysclk = fsl_micfil_set_dai_sysclk,
>  };
>
>  static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
> --
> 2.30.2
>
>
