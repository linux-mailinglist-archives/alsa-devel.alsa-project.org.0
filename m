Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5B160F42
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:52:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F881671;
	Mon, 17 Feb 2020 10:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F881671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581933128;
	bh=0CGBN/KyiVH/+TtJcmWiI7a77Lg0b8okVtkSX5pX5/U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IfXH/tq+5fnGZLJZsuJHPF931grw7DCHmQS8TuseQWMBtbXr3risyWTUFPSI+NW76
	 c6+74mTFMZloDdsysIzYTFMIM+g84Jy2878fuJ/If9bFAC1r+MiuJR7FgiuPE5RY3r
	 V5AV+UbhpJsFOsKulFJ0bm+DiKInqIOoFGUJSKV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C144F800B6;
	Mon, 17 Feb 2020 10:50:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4BF9F80214; Mon, 17 Feb 2020 10:50:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB0E4F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB0E4F800B6
Received: by mail-ed1-f67.google.com with SMTP id j17so19949822edp.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XrEF/NtEu+Nj+IQK0nqsFK8onNp/rg/dsNwpBu7rDS8=;
 b=bxx5zuw/7d2l9tldrqdkT9HFlUljE6wr0DK0b8B/wheWeI/mgV/3s6cTcaX4IE5wOx
 nP7cLl+KHpvOtIKCQj+PTEqLOfzRkp6RmXjS5rRdEXL45TlZbko4Gul0fMciX8k4pgd8
 MNMxDjXoscQpERMRClkbJaBY1CxrPu/dcmoGdE+J4kz327+XJZHjBsalIE167kfoZeM9
 2EU4RQz+5FWy/O3IZlB7mTQWTBrjZtG+6zxupD646CHqaaGxczy4E2u6ZB32VxothDMF
 /yHyy3/fu4dhlSMU1camhYjnlktPKQBevc4tcAMG5Tu4x745bP3faGM+xcJL/ZYLR/iB
 +fPQ==
X-Gm-Message-State: APjAAAVlEdWpGmzVWyOls1ziCIuncOPL4XJf36CGRtA+0PDJAKZkifiz
 Z1MslZw77YY58gykfxjQtq2PHPmasv4=
X-Google-Smtp-Source: APXvYqzSM8VHliRl2+iaEeUp2R+aIoV+/PNvpnr8NKmWwzC2rU+QVB7LCfD8KnWLk7NelLcQ0dOKBA==
X-Received: by 2002:a50:d603:: with SMTP id x3mr13114889edi.384.1581933026694; 
 Mon, 17 Feb 2020 01:50:26 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id dk14sm815479ejb.12.2020.02.17.01.50.26
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 01:50:26 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id p9so16443615wmc.2
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:50:26 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr21962294wmd.77.1581933025751; 
 Mon, 17 Feb 2020 01:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-3-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-3-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 17:50:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v66b=JyB+7WYJ9Yv_C4TS3BSofjaahXc6VP3Kbzo91YffA@mail.gmail.com>
Message-ID: <CAGb2v66b=JyB+7WYJ9Yv_C4TS3BSofjaahXc6VP3Kbzo91YffA@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 02/34] ASoC: sun8i-codec: LRCK is not
	inverted on A64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 17, 2020 at 2:42 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On the A64 (tested with the Pinephone), the current code causes the
> left/right channels to be swapped during I2S playback from the CPU on
> AIF1, and breaks DSP_A communication with the modem on AIF2.
>
> Trusting that the comment in the code is correct, the existing behavior
> is kept for the A33.
>
> Cc: stable@kernel.org
> Fixes: ec4a95409d5c ("arm64: dts: allwinner: a64: add nodes necessary for analog sound support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 55798bc8eae2..14cf31f5c535 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/log2.h>
> @@ -89,6 +90,7 @@ struct sun8i_codec {
>         struct regmap   *regmap;
>         struct clk      *clk_module;
>         struct clk      *clk_bus;
> +       bool            inverted_lrck;
>  };
>
>  static int sun8i_codec_runtime_resume(struct device *dev)
> @@ -209,18 +211,19 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>                            value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
>
>         /*
> -        * It appears that the DAI and the codec don't share the same
> -        * polarity for the LRCK signal when they mean 'normal' and
> -        * 'inverted' in the datasheet.
> +        * It appears that the DAI and the codec in the A33 SoC don't
> +        * share the same polarity for the LRCK signal when they mean
> +        * 'normal' and 'inverted' in the datasheet.
>          *
>          * Since the DAI here is our regular i2s driver that have been
>          * tested with way more codecs than just this one, it means
>          * that the codec probably gets it backward, and we have to
>          * invert the value here.
>          */
> +       value ^= scodec->inverted_lrck;
>         regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
>                            BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
> -                          !value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
> +                          value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
>
>         /* DAI format */
>         switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> @@ -568,6 +571,8 @@ static int sun8i_codec_probe(struct platform_device *pdev)
>                 return PTR_ERR(scodec->regmap);
>         }
>
> +       scodec->inverted_lrck = (uintptr_t)of_device_get_match_data(&pdev->dev);
> +
>         platform_set_drvdata(pdev, scodec);
>
>         pm_runtime_enable(&pdev->dev);
> @@ -606,7 +611,14 @@ static int sun8i_codec_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id sun8i_codec_of_match[] = {
> -       { .compatible = "allwinner,sun8i-a33-codec" },
> +       {
> +               .compatible = "allwinner,sun8i-a33-codec",
> +               .data = (void *)1,

So depending on the answer to the previous patch, this might be enough,
though somewhat an eyesore. Otherwise I suggest using a proper quirks
structure.

ChenYu


> +       },
> +       {
> +               .compatible = "allwinner,sun50i-a64-codec",
> +               .data = (void *)0,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, sun8i_codec_of_match);
> --
> 2.24.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
