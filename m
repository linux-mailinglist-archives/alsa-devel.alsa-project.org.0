Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755E2DAF65
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 15:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1329917F1;
	Tue, 15 Dec 2020 15:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1329917F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608043963;
	bh=EMhkHNpAPOawBPoxx8aIYqL99OnmxufW9BxuT1EheZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0wrfIpHf5L18ESlNNHCXR3RWpxiu5c5HrnSGlGAItsqPuPILpV3vueZilz0Oi1xX
	 revyyk85UDCOGhRW/VQ9xLSMr3Pfc8R8ZSL/asgZRER33HN5sMs9oBLj0FF+8QOxRY
	 tRHVNQG5sPGWnChZRMV3OCrCO7Njzfqae5dBLqNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 683C2F8027B;
	Tue, 15 Dec 2020 15:51:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C298F80278; Tue, 15 Dec 2020 15:51:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C15FF80121
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 15:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C15FF80121
Received: by mail-oi1-f194.google.com with SMTP id d203so2397205oia.0
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 06:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Fr1RXEENBXmloTxPCCmEENufAgrOJXMXh7xD4Llq9k=;
 b=rzweqjbCTCQC7Wt8ZPA5lcTHUdDtk39Z9eiDUERbaR48Ix0kWpkTSricXzFW0veQhj
 s4B5ZkX8JBzOHevBMWs0jXokmzv0JBnz21yv09VKQuFOn0J6iunEr9mgbJD8VSva4acH
 Q+AnYzdcWJYMSV8JtjJif9IB+jJpQsl6RrLMwdR6RvkVDZY21vXNBOxwWXOBbe+pPdMZ
 CdEyR5HqgYHKrDkQICQSxo1UZ1Ue2tbUim3k+ExF2sGv/baZrGrHVkN+zQ1DIAu/i+ba
 RTmJ1xm6JmmXagikn65ryPShVnR7c6+HCUxPlCnqoBcDeezWPLK5Q5gEcZta0dB2IpEW
 WcCA==
X-Gm-Message-State: AOAM530E3y6XqxjgUrfKI7k7h1uDzA8ad8UV51wtSkppTZnbqJ4dJi6v
 jq0027YubGTef8FRnXYvQnjYBne/nJrTrSU0sfo=
X-Google-Smtp-Source: ABdhPJyAoGZvTKFQNdwkt2a8Nald5iIQlTH36q6kMZIjhd5Xxy0UdgAkH6Xt8z8Z2eC1If/OVgWsJo+D200Lr0ItDss=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr21526892oia.148.1608043854951; 
 Tue, 15 Dec 2020 06:50:54 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
 <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Dec 2020 15:50:43 +0100
Message-ID: <CAMuHMdVMcjJempYDUA+AJiXWe=OgKAkGAyZDOS6R2Xp8_Xum2Q@mail.gmail.com>
Subject: Re: [PATCH][RFC] ASoC: rsnd: don't call clk_disable_unprepare() if
 can't use
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

Hi Morimoto-san,

On Tue, Dec 15, 2020 at 1:06 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> We need to care clock accessibility,
> because we might can't use clock for some reasons.
>
> It sets clk_rate for each clocks when enabled.
> This means it doesn't have clk_rate if we can't use.
> We can avoid to call clk_disable_unprepare() in such case.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Feel free to use geert+renesas@glider.be instead ;-)

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>
> Hi Geert.
>
> Thank you for your reporting.
> I have never seen this kind of error, but it possible to happen.
> Unfortunately, I can't reproduce this but I hope this patch can solve it.
> Could you please check this ?
> I added [RFC] on this patch Subject.

The patch looks good to me, but I also cannot trigger the issue at will.
I went through my old boot logs, and found 2 other occurrences, also
on Ebisu.  In all cases, it happened while a lot of output was printed to
the serial console (either a WARN() splat, or DEBUG_PINCTRL output).
My guess is that console output or disabling interrupts too long is
triggering a race condition or other issue in the i2c driver (clk 1 is the
cs2000 clock generator, controlled through i2c).

> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -366,25 +366,25 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
>         struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
>         struct device *dev = rsnd_priv_to_dev(priv);
>         struct clk *clk;
> -       int i, ret;
> +       int i;
>
>         for_each_rsnd_clk(clk, adg, i) {
> -               ret = 0;
>                 if (enable) {
> -                       ret = clk_prepare_enable(clk);
> +                       int ret = clk_prepare_enable(clk);
>
>                         /*
>                          * We shouldn't use clk_get_rate() under
>                          * atomic context. Let's keep it when
>                          * rsnd_adg_clk_enable() was called
>                          */
> -                       adg->clk_rate[i] = clk_get_rate(adg->clk[i]);
> +                       if (ret < 0)
> +                               dev_warn(dev, "can't use clk %d\n", i);
> +                       else
> +                               adg->clk_rate[i] = clk_get_rate(adg->clk[i]);
>                 } else {
> -                       clk_disable_unprepare(clk);
> +                       if (adg->clk_rate[i])
> +                               clk_disable_unprepare(clk);

As pointed out by Mark, you may want to clear adg->clk_rate[i] here?

>                 }
> -
> -               if (ret < 0)
> -                       dev_warn(dev, "can't use clk %d\n", i);
>         }
>  }

With the above sorted out:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
