Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1C553956
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 20:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255C92069;
	Tue, 21 Jun 2022 20:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255C92069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655834641;
	bh=m1X7FvI1uiifJspV+x3BmlWHT5A5zSRKyjEIzbgM4IM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=oqh/NNDuX80Wlo/cyUI5NCjOBO1dNdAgRWVUuPGJfJkhtNWdY+YZtb2xM8jVSJn9G
	 vJxaMPXsR49VgHdr6qWrFpBOTBpEZcHSL/Q+PlY9K+v8rF+h+VJKT4D7x7jZUZQ13S
	 mg1Cmw3fkaD4FhIGvqUxjHR4YwOZ0gwD8HJoSW+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A954F80256;
	Tue, 21 Jun 2022 20:03:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADB24F80253; Tue, 21 Jun 2022 20:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA201F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 20:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA201F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ghh7+xjq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA123B81AAC
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 18:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1F5C341C6
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655834573;
 bh=m1X7FvI1uiifJspV+x3BmlWHT5A5zSRKyjEIzbgM4IM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=ghh7+xjqdr9eFxyRx3wiMhMP/pIOlGjgxnejNYFTzAtIgG+cr9lbFCYwbEuKOnRs6
 EY8XnbUK3ZGsym5er2Pxb3sCu9bksrzVx6G841feJDuKgNc47SvVracpXZfaSEqU3o
 psoEQN5nGVjI6K3FNiwUpEaU8vv0a2A+xfJD01Fb9r0FbUl2T9j16RTWdcJ3ETNM8e
 Xkti3SJlyLmFkh070Yja4kNpsFLj72+W3GV5hgT7P1CrP+d9zZ7nStstwV89pL6yS1
 Og/V1tnp+9QdCeo3kQhHWhj4pqqomgVdqQg4b8OElGCPtvNSPYE4h7YFeCmTe4/3DP
 ZLHlOYtALRstw==
Received: by mail-vk1-f176.google.com with SMTP id b5so3801989vkp.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:02:53 -0700 (PDT)
X-Gm-Message-State: AJIora/yAygrrcPWrGyuqG7YtoY/DwMwwBMLJc5O2Vn4lc+YVoywbH7i
 SMMiVFAR2ffzgp/09sjYB27Es2GwT7Brnwxwiw4=
X-Google-Smtp-Source: AGRyM1uyIe7b28W4Jxl7Eqs9weFsOOBRrjta8K1BfyGR4+d14hvHWpkSnOYBB8+31J6rbc1R4Zx8Q/GvwqzUsNpPPQE=
X-Received: by 2002:a05:6122:d82:b0:36b:fb80:5116 with SMTP id
 bc2-20020a0561220d8200b0036bfb805116mr5776924vkb.26.1655834572507; Tue, 21
 Jun 2022 11:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220619095324.492678-1-judyhsiao@chromium.org>
 <20220619095324.492678-2-judyhsiao@chromium.org>
In-Reply-To: <20220619095324.492678-2-judyhsiao@chromium.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jun 2022 02:02:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WsRV_pPsD4BQOjtFXOwca5xVkrXRxyxz2OLvQqKifPg@mail.gmail.com>
Message-ID: <CAGb2v64WsRV_pPsD4BQOjtFXOwca5xVkrXRxyxz2OLvQqKifPg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
To: Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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
Reply-To: wens@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Sun, Jun 19, 2022 at 5:54 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> We discoverd that the state of BCLK on, LRCLK off and SD_MODE on
> may cause the speaker melting issue. Removing LRCLK while BCLK
> is present can cause unexpected output behavior including a large
> DC output voltage as described in the Max98357a datasheet.
>
> In order to:
>   1. prevent BCLK from turning on by other component.
>   2. keep BCLK and LRCLK being present at the same time
>
> This patch switches BCLK to GPIO func before LRCLK output, and
> configures BCLK func back during LRCLK is output.
>
> Without this fix, BCLK is turned on 11 ms earlier than LRCK by the
> da7219.
> With this fix, BCLK is turned on only 0.4 ms earlier than LRCK by
> the rockchip codec.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
>  sound/soc/rockchip/rockchip_i2s.c | 171 ++++++++++++++++++++++--------
>  1 file changed, 124 insertions(+), 47 deletions(-)
>
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 47a3971a9ce1..8e4a9b8746fd 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -54,8 +54,38 @@ struct rk_i2s_dev {
>         const struct rk_i2s_pins *pins;
>         unsigned int bclk_ratio;
>         spinlock_t lock; /* tx/rx lock */
> +       struct pinctrl *pinctrl;
> +       struct pinctrl_state *bclk_on;
> +       struct pinctrl_state *bclk_off;
>  };
>
> +static int i2s_pinctrl_select_bclk_on(struct rk_i2s_dev *i2s)
> +{
> +       int ret = 0;
> +
> +       if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_on))
> +               ret = pinctrl_select_state(i2s->pinctrl, i2s->bclk_on);
> +
> +       if (ret)
> +               dev_err(i2s->dev, "bclk enable failed %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int i2s_pinctrl_select_bclk_off(struct rk_i2s_dev *i2s)
> +{
> +
> +       int ret = 0;
> +
> +       if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_off))
> +               ret = pinctrl_select_state(i2s->pinctrl, i2s->bclk_off);
> +
> +       if (ret)
> +               dev_err(i2s->dev, "bclk disable failed %d\n", ret);
> +
> +       return ret;
> +}
> +
>  static int i2s_runtime_suspend(struct device *dev)
>  {
>         struct rk_i2s_dev *i2s = dev_get_drvdata(dev);
> @@ -92,39 +122,46 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
>         return snd_soc_dai_get_drvdata(dai);
>  }
>
> -static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
> +static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  {
>         unsigned int val = 0;
>         int retry = 10;
> -
> +       int ret = 0;
> +
>         spin_lock(&i2s->lock);
>         if (on) {
> -               regmap_update_bits(i2s->regmap, I2S_DMACR,
> -                                  I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
> -
> -               regmap_update_bits(i2s->regmap, I2S_XFER,
> -                                  I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> -                                  I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -
> +               ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +                                        I2S_DMACR_TDE_ENABLE,
> +                                        I2S_DMACR_TDE_ENABLE);
> +               if (ret < 0)
> +                       goto end;
> +               ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +                                        I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> +                                        I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> +               if (ret < 0)
> +                       goto end;
>                 i2s->tx_start = true;
>         } else {
>                 i2s->tx_start = false;
>
> -               regmap_update_bits(i2s->regmap, I2S_DMACR,
> -                                  I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
> +               ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +                                        I2S_DMACR_TDE_ENABLE,
> +                                        I2S_DMACR_TDE_DISABLE);
> +               if (ret < 0)
> +                       goto end;
>
>                 if (!i2s->rx_start) {
> -                       regmap_update_bits(i2s->regmap, I2S_XFER,
> -                                          I2S_XFER_TXS_START |
> -                                          I2S_XFER_RXS_START,
> -                                          I2S_XFER_TXS_STOP |
> -                                          I2S_XFER_RXS_STOP);
> -
> +                       ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +                                                I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> +                                                I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
> +                       if (ret < 0)
> +                               goto end;
>                         udelay(150);
> -                       regmap_update_bits(i2s->regmap, I2S_CLR,
> -                                          I2S_CLR_TXC | I2S_CLR_RXC,
> -                                          I2S_CLR_TXC | I2S_CLR_RXC);
> -
> +                       ret = regmap_update_bits(i2s->regmap, I2S_CLR,
> +                                                I2S_CLR_TXC | I2S_CLR_RXC,
> +                                                I2S_CLR_TXC | I2S_CLR_RXC);
> +                       if (ret < 0)
> +                               goto end;
>                         regmap_read(i2s->regmap, I2S_CLR, &val);
>
>                         /* Should wait for clear operation to finish */
> @@ -138,42 +175,55 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>                         }
>                 }
>         }
> +end:
>         spin_unlock(&i2s->lock);
> +       if (ret < 0)
> +               dev_err(i2s->dev, "lrclk update failed\n");
> +
> +       return ret;
>  }
>
> -static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
> +static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>  {
>         unsigned int val = 0;
>         int retry = 10;
> +       int ret = 0;
>
>         spin_lock(&i2s->lock);
>         if (on) {
> -               regmap_update_bits(i2s->regmap, I2S_DMACR,
> -                                  I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
> -
> -               regmap_update_bits(i2s->regmap, I2S_XFER,
> -                                  I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> -                                  I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -
> +               ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +                                        I2S_DMACR_RDE_ENABLE,
> +                                        I2S_DMACR_RDE_ENABLE);
> +               if (ret < 0)
> +                       goto end;
> +
> +               ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +                                        I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> +                                        I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> +               if (ret < 0)
> +                       goto end;
>                 i2s->rx_start = true;
>         } else {
>                 i2s->rx_start = false;
>
> -               regmap_update_bits(i2s->regmap, I2S_DMACR,
> -                                  I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
> +               ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +                                        I2S_DMACR_RDE_ENABLE,
> +                                        I2S_DMACR_RDE_DISABLE);
> +               if (ret < 0)
> +                       goto end;
>
>                 if (!i2s->tx_start) {
> -                       regmap_update_bits(i2s->regmap, I2S_XFER,
> -                                          I2S_XFER_TXS_START |
> -                                          I2S_XFER_RXS_START,
> -                                          I2S_XFER_TXS_STOP |
> -                                          I2S_XFER_RXS_STOP);
> -
> +                       ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +                                                I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> +                                                I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
> +                       if (ret < 0)
> +                               goto end;
>                         udelay(150);
> -                       regmap_update_bits(i2s->regmap, I2S_CLR,
> -                                          I2S_CLR_TXC | I2S_CLR_RXC,
> -                                          I2S_CLR_TXC | I2S_CLR_RXC);
> -
> +                       ret = regmap_update_bits(i2s->regmap, I2S_CLR,
> +                                                I2S_CLR_TXC | I2S_CLR_RXC,
> +                                                I2S_CLR_TXC | I2S_CLR_RXC);
> +                       if (ret < 0)
> +                               goto end;
>                         regmap_read(i2s->regmap, I2S_CLR, &val);
>
>                         /* Should wait for clear operation to finish */
> @@ -187,7 +237,12 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>                         }
>                 }
>         }
> +end:
>         spin_unlock(&i2s->lock);
> +       if (ret < 0)
> +               dev_err(i2s->dev, "lrclk update failed\n");
> +
> +       return ret;
>  }
>
>  static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
> @@ -425,17 +480,25 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>                 if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> -                       rockchip_snd_rxctrl(i2s, 1);
> +                       ret = rockchip_snd_rxctrl(i2s, 1);
>                 else
> -                       rockchip_snd_txctrl(i2s, 1);
> +                       ret = rockchip_snd_txctrl(i2s, 1);
> +               if (ret < 0)
> +                       return ret;
> +               i2s_pinctrl_select_bclk_on(i2s);
>                 break;
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_STOP:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -               if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> -                       rockchip_snd_rxctrl(i2s, 0);
> -               else
> -                       rockchip_snd_txctrl(i2s, 0);
> +               if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +                       if (!i2s->tx_start)
> +                               i2s_pinctrl_select_bclk_off(i2s);
> +                       ret = rockchip_snd_rxctrl(i2s, 0);
> +               } else {
> +                       if (!i2s->rx_start)
> +                               i2s_pinctrl_select_bclk_off(i2s);
> +                       ret = rockchip_snd_txctrl(i2s, 0);
> +               }
>                 break;
>         default:
>                 ret = -EINVAL;
> @@ -736,6 +799,20 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
>         }
>
>         i2s->bclk_ratio = 64;
> +       i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
> +       if (IS_ERR(i2s->pinctrl))
> +               dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
> +
> +       i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");

This will crash on any I2S controller that doesn't have pinctrl properties,
notably the I2S controller that sends audio to the HDMI controller will
never have pinctrl properties, since the connection is internal to the
SoC.

I'd say just put pinctrl lookup calls in an else block.


ChenYu

> +       if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
> +               i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
> +               if (IS_ERR_OR_NULL(i2s->bclk_off)) {
> +                       dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
> +                       goto err_clk;
> +               }
> +       }
> +
> +       i2s_pinctrl_select_bclk_off(i2s);
>
>         dev_set_drvdata(&pdev->dev, i2s);
>
> --
> 2.36.1.476.g0c4daa206d-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
