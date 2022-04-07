Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6F4F7516
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 07:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA12172F;
	Thu,  7 Apr 2022 07:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA12172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649308262;
	bh=7Vvf/1jMINxGAUphNj0CGi+jAbf1FnjNxEIPaHg+fEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezAprhpmQezfq3dWMjEKwQE7U5LiFEWW9fSXuNEgTj39jrLioeDr2ECV3ZnuXGCBX
	 K7o1qFxfI3gYdDyldxzcOfWDrbIJkcTXRWNkmMO4LDqfQaevREbbgiPzFe8tMSSDCj
	 azHTtAmJ2fWh1QHrN7C1n2/kGmF514ifCQ1bl200=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80382F8026A;
	Thu,  7 Apr 2022 07:10:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9530F80085; Thu,  7 Apr 2022 07:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99310F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 07:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99310F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qj8lvt9f"
Received: by mail-qv1-xf2f.google.com with SMTP id kl29so4183755qvb.2
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 22:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TojaBXJYkyCMJnf0fO4Tc9Kym+aV7Bb6lRy3GrWjxas=;
 b=Qj8lvt9f3/uXlow2GmxTyZ5924qeVB43Vguoo0DJpOJDfEGAF8ily9AcbNTZcRXCP+
 CLXGtq/+FsbLvXWiD+5oi0F0E3bO6DF4bzkGsztKbLMb3ih0soBnZdrLtHfqSVb6tovN
 M7BrCK+CTM64URNbm96L7DhH4Rkt4VxKLpR1+69bNi5JZC2CP1+rnXhUg1XSgFKWEjUN
 DKQhbzzP8ujw+k97TSSAmVUgdloAOuaZ/6JpVWjWhe0dReAjj0wteO8PzWJIV9Nv38tK
 MONDLVGn6SkD4p9xPmtAOO9Qm05pRXoYIPnROaMzLt/qHakhhY1+e+R/g0+UyXJ4m7bD
 IiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TojaBXJYkyCMJnf0fO4Tc9Kym+aV7Bb6lRy3GrWjxas=;
 b=3PPXdL8+Cw1BsgdqAXL7RFXZUuaYhFBV/DyGTih10Fcve4yxz/4kZw8kS/9dQFrhhE
 8s+nCERY/C0C4edlGDkOlTKyeGMgCX8Anc84X6K18XUziyOddopfCphCG84rR54g/kzR
 Jlh3CTJdbWv6qQluhDDQQm5Wb8q5JO2TIlnML1HSf1lSMsenAbDF9gD85pnNcju9pQ3O
 yj5jB4bAb1Do/aLWqIuW+xI41Jr1PQWz08x776W66RPTNqZuu9baetGRwtSDRGTK6o4P
 k9IN+E+IBOHvOowco/sLXu2nCuL+om0GqbZExr+sCnBijk8iFytU1SfZi5Ip1wMPJdeY
 NnkA==
X-Gm-Message-State: AOAM533yZwyTJ3T5ubmym+OIroOFWyUnKCEnpqY4pdSVr3lwSKFamGod
 aT9sshrq0mnlkX0P7YW3/fHky/Y3iQY1vdCubfY=
X-Google-Smtp-Source: ABdhPJwyGz04+81z6/NSDDiBldCurRX9Co4TIMEWJEXq/cu8khWHtEQoYr7NXb4/f4R4XKuVfy5gZYyIE9bacOkBe5s=
X-Received: by 2002:a05:6214:20c8:b0:443:f201:aa89 with SMTP id
 8-20020a05621420c800b00443f201aa89mr7237953qve.30.1649308188438; Wed, 06 Apr
 2022 22:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-16-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-16-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 13:09:37 +0800
Message-ID: <CAA+D8AOWVaaAEvR-tK=fL9KL463-NwKGvtdPOXcs0AZ0WOgZDA@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] ASoC: fsl_micfil: simplify clock setting
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

> The reference manual has this for calculating the micfil internal clock
> divider:
>
>          MICFIL Clock rate
> clkdiv = -----------------
>          8 * OSR * outrate
>
> (with OSR == Oversampling Rate, outrate == output sample rate)
>
> The driver first sets the MICFIL Clock rate to (outrate * 1024) and then
> calculates back the clkdiv value from the above calculation.
>
> Simplify this by using a fixed clkdiv value of 8 and set the MICFIL
> Clock rate to (outrate * clkdiv * OSR * 8).
>
> While at it drop disabling the clock before setting its rate. The MICFIL
> module is disabled when the rate is changed and it is also resetted
> before it is started again, so I doubt it's necessary to disable the
> clock.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_micfil.c | 45 ++++----------------------------------
>  1 file changed, 4 insertions(+), 41 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 8335646a84d17..fd3b168a38661 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -111,19 +111,6 @@ static const struct snd_kcontrol_new
> fsl_micfil_snd_controls[] = {
>                      snd_soc_get_enum_double, snd_soc_put_enum_double),
>  };
>
> -static inline int get_clk_div(struct fsl_micfil *micfil,
> -                             unsigned int rate)
> -{
> -       long mclk_rate;
> -       int clk_div;
> -
> -       mclk_rate = clk_get_rate(micfil->mclk);
> -
> -       clk_div = mclk_rate / (rate * micfil->osr * 8);
> -
> -       return clk_div;
> -}
> -
>  /* The SRES is a self-negated bit which provides the CPU with the
>   * capability to initialize the PDM Interface module through the
>   * slave-bus interface. This bit always reads as zero, and this
> @@ -147,24 +134,6 @@ static int fsl_micfil_reset(struct device *dev)
>         return 0;
>  }
>
> -static int fsl_micfil_set_mclk_rate(struct fsl_micfil *micfil,
> -                                   unsigned int freq)
> -{
> -       struct device *dev = &micfil->pdev->dev;
> -       int ret;
> -
> -       clk_disable_unprepare(micfil->mclk);
> -
> -       ret = clk_set_rate(micfil->mclk, freq * 1024);
> -       if (ret)
> -               dev_warn(dev, "failed to set rate (%u): %d\n",
> -                        freq * 1024, ret);
> -
> -       clk_prepare_enable(micfil->mclk);
> -
> -       return ret;
> -}
> -
>  static int fsl_micfil_startup(struct snd_pcm_substream *substream,
>                               struct snd_soc_dai *dai)
>  {
> @@ -238,13 +207,12 @@ static int fsl_micfil_trigger(struct
> snd_pcm_substream *substream, int cmd,
>  static int fsl_set_clock_params(struct device *dev, unsigned int rate)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(dev);
> -       int clk_div;
> +       int clk_div = 8;
>         int ret;
>
> -       ret = fsl_micfil_set_mclk_rate(micfil, rate);
> -       if (ret < 0)
> -               dev_err(dev, "failed to set mclk[%lu] to rate %u\n",
> -                       clk_get_rate(micfil->mclk), rate);
> +       ret = clk_set_rate(micfil->mclk, rate * clk_div * micfil->osr * 8);
>

Please make sure micfil->osr is assigned.


> +       if (ret)
> +               return ret;
>
>         /* set CICOSR */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> @@ -253,11 +221,6 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>         if (ret)
>                 return ret;
>
> -       /* set CLK_DIV */
> -       clk_div = get_clk_div(micfil, rate);
> -       if (clk_div < 0)
> -               ret = -EINVAL;
> -
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>                                  MICFIL_CTRL2_CLKDIV,
>                                  FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
> --
> 2.30.2
>
>
