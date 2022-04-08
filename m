Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8B4F8D43
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6C818B7;
	Fri,  8 Apr 2022 07:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6C818B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649395186;
	bh=pMavM58AkjCulhAhpzlGriH+gjR0LG1EcDRVk9emOzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTCnUzihXQh8LS0VTBn1C0qyvGEWx023NaM+Ny/FRvA+T8PP6r6ssY0ziFfoOmAf+
	 dXU53i5bXB/Eq5TvOz4m8dHoWpdlsuW8SG7uI0qjoev+XGTi5JzaYuGvLZe09Yk9la
	 2Nm1aW4lcQKOkB+exjIIWHB8+KqXnikIKCoYaLnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E21D1F80116;
	Fri,  8 Apr 2022 07:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D092F804CC; Fri,  8 Apr 2022 07:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E20EBF80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E20EBF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NQREYzBM"
Received: by mail-qk1-x72e.google.com with SMTP id v13so3990401qkv.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZTFBxXAzD7BoeYCtIhxA9yJWr071aBwKOCUcr7mPMw=;
 b=NQREYzBMYT5mo32oV/Tbrl0iDIdjKVFARFuH+Y7q5iyAFxPhzSbnm2HcXGxuQx0akI
 1Hcu6G8t9r6Lw03XxoVA3M7RF1m7Q9Ypx6UnHYzb8lhoAXUyXhOUipk5oJH8OtPIGtqk
 Ahg4UJk591p1ZG0CDslw8/DhJ0wFNI3cOQkTXe4KgeFb63Zi+uEb1KUH72CUI7xBkqnS
 8DmwnxxcuqHShchIhuWuydzSr0Fjw/VooNvgHDOWR2VlxKbNX6QQYaOaVh8tPFgd66NI
 U5XLkgJjbxWZUt8MeZ1fPgvYiirIsfqNwuGE7MSSHGjIGIUdtvBcsyBPRJo3Lf8h9ETS
 6EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZTFBxXAzD7BoeYCtIhxA9yJWr071aBwKOCUcr7mPMw=;
 b=5feaUSgeXpji+lzTtOj6EDM7QlSJCqPKXEeOOU0JxBEl2RXx+WAsq+qO77mWZs6lnw
 0YCtAL4GFLJ3XJAMxIVhdKubKZWRwJg7/1CKb6G9MfaIXIV4AUFGk6PyJRs0O7PJ9aoK
 2kDXkaSTJgtUNmwBQHZ/vTZLhOdOvDzJWNBu3PZ8XNII9+TATPiPg6zt53aurA6ITGdy
 X0scJkAH6g1b+YkHjzUM5IPw7J/oxQK2/Vap01xRep9lIGzdpriFIhAoXabZFfA0x1Ee
 5hkJkUZvIkYOK5I/Pil3GqPD5+obsSVRTFPn1x6Mpkj4YGalqrrpobPeMVWcev5IiUqG
 m+0A==
X-Gm-Message-State: AOAM531KwgC39MMKUOzZhI6evfSeQJTyq9w1EtD4gdbFxUU35I5A18k1
 3I+Z5ru4MmLHY9YvAQj1VFRbMPKIH2VafD+7R8o=
X-Google-Smtp-Source: ABdhPJzDOF32MjqKJm3gDetkQJ5hQ7xwFrHpWphHhZDWHPI/cXGC24NKDdqQXlL00crTPJFaR7/9cKk3cxsLD50xoLQ=
X-Received: by 2002:a05:620a:4305:b0:67e:8b39:201d with SMTP id
 u5-20020a05620a430500b0067e8b39201dmr11584185qko.741.1649395125196; Thu, 07
 Apr 2022 22:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-16-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-16-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:18:34 +0800
Message-ID: <CAA+D8APDgUAMvdt_MptR0E+Ya8G56xU+xoD35a7Cq1cLoOM_6A@mail.gmail.com>
Subject: Re: [PATCH v4 15/21] ASoC: fsl_micfil: simplify clock setting
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

On Thu, Apr 7, 2022 at 4:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

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
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>
> Notes:
>     Changes since v3:
>     - Don't use uninitialized and no longer present struct fsl_micfil::osr
>
>  sound/soc/fsl/fsl_micfil.c | 45 ++++----------------------------------
>  1 file changed, 4 insertions(+), 41 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 3ddc988b4fe65..4d8dfb2c22290 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -110,19 +110,6 @@ static const struct snd_kcontrol_new
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
> -       clk_div = mclk_rate / (rate * MICFIL_OSR_DEFAULT * 8);
> -
> -       return clk_div;
> -}
> -
>  /* The SRES is a self-negated bit which provides the CPU with the
>   * capability to initialize the PDM Interface module through the
>   * slave-bus interface. This bit always reads as zero, and this
> @@ -146,24 +133,6 @@ static int fsl_micfil_reset(struct device *dev)
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
> @@ -237,13 +206,12 @@ static int fsl_micfil_trigger(struct
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
> +       ret = clk_set_rate(micfil->mclk, rate * clk_div *
> MICFIL_OSR_DEFAULT * 8);
> +       if (ret)
> +               return ret;
>
>         /* set CICOSR */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> @@ -252,11 +220,6 @@ static int fsl_set_clock_params(struct device *dev,
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
