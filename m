Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1638FF3A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 12:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640F5173C;
	Tue, 25 May 2021 12:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640F5173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621938742;
	bh=+AYxHiIJ3dfjlLK1lNBxCeKhNVMhjtTaVMVEfBDhK4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mSUlUMa1trcmWihZCG8hdbwsEc5xMHbXx2E6YPyBFdJBj1FKRST9mE0eX+jiNdDRE
	 opMZpskcdPn1+g2hMAJbJvsomfLU3EuiHeDzF4URyyUFBsKWwQJOTVzXofGptQV1Kz
	 7pKyvw+VTbW03IrYOy5qRJA1IB/2KfoW1wIO4uM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1A3F8026B;
	Tue, 25 May 2021 12:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10724F8026B; Tue, 25 May 2021 12:31:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87CDAF80113
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 12:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87CDAF80113
Received: by mail-ua1-f48.google.com with SMTP id h26so3130706uab.13
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 03:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caJKpR22UE+yWdNX3qHv38WZNk5LVcxR9KLK7ev4RjQ=;
 b=Pl3r/z7YfLlaas5PoWQmmIfkpt6Hw/pUk9bW2t+WZWMyE5dS1quVuXuQl5fmbQsJC/
 OdgJYgMW882ubSblVXPHfUQj/lE7LhatFvrqohULuLBHHAM2CAecIvNGk6WMmzTTUkj8
 Tnl0ZWAgQ+Q4yWeTBDoPNz5SYuduMBTpq+qdzFuZYStXlrlAUynjHaVRr9hOSwIFbl4o
 Q1YUVBPhB15duLqPb6QNBds8h4DpyE9emTWDZKVT3seFxBzZkh2QQMV+Vr+eev5FPMOK
 1+SUeKoo3hLSiJwngdWIDVqMkNVABkugRMNwxy9sdFmxaH1Jn+cVDRkdwv5Bo2RteHha
 HtRA==
X-Gm-Message-State: AOAM533UrnvjA6EBdp6TXxedLJDrqY8Bn3mJbIbDDU6qpLJz7x7yRgB0
 m856dSIxV+IacuKXOvOsA1b6tq/m17hSuNI/BGA=
X-Google-Smtp-Source: ABdhPJwblKYwm9RJW3XSVKWE+5kVk7eMvDJLF/P2KKmUb0AT/32MauXQN1zZLxKBYw6+qox7pESabyebTfYSEjgBWcc=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr25244439uaq.2.1621938679481;
 Tue, 25 May 2021 03:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <87y2c4oe3y.wl-kuninori.morimoto.gx@renesas.com>
 <87tumsoe2p.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tumsoe2p.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 May 2021 12:31:08 +0200
Message-ID: <CAMuHMdXLYvEBE0bVk=8D+GkuaHRUvdTayCQPqTYAkPJEaW8MDQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: rsnd: add null CLOCKIN support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

Hi Morimoto-san,

On Mon, May 24, 2021 at 8:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Some Renesas SoC doesn't have full CLOCKIN.
> This patch add null_clk, and accepts it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch, which is now commit d6956a7dde6fbf84 ("ASoC:
rsnd: add null CLOCKIN support") in asoc/for-next.

]> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -389,6 +389,30 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
>         }
>  }
>
> +#define NULL_CLK "rsnd_adg_null"
> +static struct clk *rsnd_adg_null_clk_get(struct rsnd_priv *priv)
> +{
> +       static struct clk_hw *hw;
> +       struct device *dev = rsnd_priv_to_dev(priv);
> +
> +       if (!hw) {
> +               struct clk_hw *_hw;
> +               int ret;
> +
> +               _hw = clk_hw_register_fixed_rate_with_accuracy(dev, NULL_CLK, NULL, 0, 0, 0);
> +               if (IS_ERR(_hw))
> +                       return NULL;
> +
> +               ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, _hw);

I'm not such a big fan of creating dummy clocks.
And what if a future SoC lacks two CLOCKIN pins? Then you'll try to
register a second dummy clock with the same name, which will fail,
presumably?

> +               if (ret < 0)
> +                       clk_hw_unregister_fixed_rate(_hw);
> +
> +               hw = _hw;
> +       }
> +
> +       return clk_hw_get_clk(hw, NULL_CLK);
> +}
> +
>  static void rsnd_adg_get_clkin(struct rsnd_priv *priv,
>                                struct rsnd_adg *adg)
>  {
> @@ -398,7 +422,12 @@ static void rsnd_adg_get_clkin(struct rsnd_priv *priv,
>         for (i = 0; i < CLKMAX; i++) {
>                 struct clk *clk = devm_clk_get(dev, clk_name[i]);
>
> -               adg->clk[i] = IS_ERR(clk) ? NULL : clk;
> +               if (IS_ERR(clk))
> +                       clk = rsnd_adg_null_clk_get(priv);

This should only be done when the clock does not exist, not in case
of other errors (e.g. -EPROBE_DEFER, which isn't handled yet)?

As devm_clk_get_optional() already checks for existence, you could use:

    struct clk *clk = devm_clk_get_optional(dev, clk_name[i]);
    if (!clk)
            clk = rsnd_adg_null_clk_get(priv);

But in light of the above (avoiding dummy clocks), it might be more
robust to make sure all code can handle adg->clk[i] = NULL?

> +               if (IS_ERR(clk))
> +                       dev_err(dev, "no adg clock (%s)\n", clk_name[i]);
> +
> +               adg->clk[i] = clk;
>         }
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
