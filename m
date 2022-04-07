Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448D4F7442
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 05:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B4C01703;
	Thu,  7 Apr 2022 05:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B4C01703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649302992;
	bh=mgyvMkElm13sfrEem+ACjo0SE+jIvrHKV5hXdaLK3nY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQQ03KCEOhPv7qu3NR66PqScI3PV8H2C1nrwLY/66s5YS2lOF0PqEQrKJlvB/SRTy
	 zNS7APaBZ0U/PSm1LpagaymcqTmK0symv+T9qmSLQi/Px4X4ojXveGHinRjkZsPvmk
	 Egm8nk05f7FpjiO68Q++8OYMdCTSeCkKulw/rSdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6B4F8026A;
	Thu,  7 Apr 2022 05:42:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7866F80085; Thu,  7 Apr 2022 05:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18D67F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 05:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D67F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CGsJvFVb"
Received: by mail-qk1-x733.google.com with SMTP id b19so1245179qkk.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 20:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nyIKGpObAokLJcI/WPJvQ/YZkaCPovtJ1OIYmMawEcQ=;
 b=CGsJvFVbexMQvFZDpMA2ROJxiXGYM3Wf95el4lOAmmfcMmpuCAQsQw5sEjA9RGAeaJ
 qxrUe3kP8VmAWlZ/YbRnLqWK0jKQZP089RnHDmK0kTJ+o1O2a+/l06s1/OjNamhIEc3z
 OoM/gcRdb88Gfnu3qyf2tC7N/265f7PlcZ+LfOTdkQbzZ0wdHeKGx5p5nFKyVWi/v21w
 5DAP1pD/omMXnCh2b7yK6hCmoW8IcjLtMinI9AeOd1+b9qvV7e6/QvZoodqoP6rEisV6
 0w0v3aeLBULHfbhl+z7UHzdtiszNBUrlELjpTguoWVeLxk27mA3daKrqIjpEezcomXw8
 muDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nyIKGpObAokLJcI/WPJvQ/YZkaCPovtJ1OIYmMawEcQ=;
 b=JaZOcBc194m1LEnKC9zpg97Dyh2V4nxDoV1oDq7sQ3PRx/DT8quREZE1jBFk8r5siD
 odKf8O69VvRyD7xM6jUTwRGAD7Qw5MSCkxfPqyKIWczvPD3sx402YNM2T3s83htAvUJj
 xrEr8JiaKXgncfYxN7OGqS840VADdXDhY61ApdTQpsTf70Ix8cqx1M54fYTOVJZ38vSe
 nKo7R1amgf7FSsws9HfRM81pe7LYMmNUJN4TOSlYG6hPlibrbQ50IhyaYRS58CxfzuAc
 wAi0Q3aT8PY7eHp48B8msmBxtjfpGPhl3e60kHaum+57cp/M2VCPIG/oNpPH9Uzn5cAD
 K/Og==
X-Gm-Message-State: AOAM530rAQScG087o2GTO9ZCrpk093Xl3I6xhhNhcMYKvzsaZUepe2jJ
 o+ZyS0I+KPxxAmHpIan3F/brU+F1WiCIQ5/ph2AY9j51
X-Google-Smtp-Source: ABdhPJzTWJZUdt9C4JFr390si6fIBWn+pif2fhqhAA+7D2CtXU2pJwHPcvFkqq0O6tqLOYDei2d4p9A7ChhWfnSyNxs=
X-Received: by 2002:a37:a28e:0:b0:67b:eac:e839 with SMTP id
 l136-20020a37a28e000000b0067b0eace839mr7947574qke.80.1649302923476; Wed, 06
 Apr 2022 20:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-15-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-15-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 11:41:52 +0800
Message-ID: <CAA+D8AMMDF1eL_sdE_zF-52ZoaxyWjAtCOQyOZ71+ozzfqf1qg@mail.gmail.com>
Subject: Re: [PATCH v3 14/20] ASoC: fsl_micfil: Drop get_pdm_clk()
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

> get_pdm_clk() calculates the PDM clock based on the quality setting,
> but really the PDM clock is independent of the quality, it's always
> rate * 4 * micfil->osr. Just drop the function and do the calculation
> in the caller.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_micfil.c | 38 +-------------------------------------
>  1 file changed, 1 insertion(+), 37 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 4b4b7fbbf5c4f..8335646a84d17 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -111,42 +111,6 @@ static const struct snd_kcontrol_new
> fsl_micfil_snd_controls[] = {
>                      snd_soc_get_enum_double, snd_soc_put_enum_double),
>  };
>
> -static inline int get_pdm_clk(struct fsl_micfil *micfil,
> -                             unsigned int rate)
> -{
> -       u32 ctrl2_reg;
> -       int qsel;
> -       int bclk;
> -       int osr = MICFIL_OSR_DEFAULT;
> -
> -       regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
> -       qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
> -
> -       switch (qsel) {
> -       case MICFIL_QSEL_HIGH_QUALITY:
> -               bclk = rate * 8 * osr / 2; /* kfactor = 0.5 */
> -               break;
> -       case MICFIL_QSEL_MEDIUM_QUALITY:
> -       case MICFIL_QSEL_VLOW0_QUALITY:
> -               bclk = rate * 4 * osr * 1; /* kfactor = 1 */
> -               break;
> -       case MICFIL_QSEL_LOW_QUALITY:
> -       case MICFIL_QSEL_VLOW1_QUALITY:
> -               bclk = rate * 2 * osr * 2; /* kfactor = 2 */
> -               break;
> -       case MICFIL_QSEL_VLOW2_QUALITY:
> -               bclk = rate * osr * 4; /* kfactor = 4 */
> -               break;
> -       default:
> -               dev_err(&micfil->pdev->dev,
> -                       "Please make sure you select a valid quality.\n");
> -               bclk = -1;
> -               break;
> -       }
> -
> -       return bclk;
> -}
> -
>  static inline int get_clk_div(struct fsl_micfil *micfil,
>                               unsigned int rate)
>  {
> @@ -155,7 +119,7 @@ static inline int get_clk_div(struct fsl_micfil
> *micfil,
>
>         mclk_rate = clk_get_rate(micfil->mclk);
>
> -       clk_div = mclk_rate / (get_pdm_clk(micfil, rate) * 2);
> +       clk_div = mclk_rate / (rate * micfil->osr * 8);
>

Where is micfil->osr assigned a value?


>
>         return clk_div;
>  }
> --
> 2.30.2
>
>
