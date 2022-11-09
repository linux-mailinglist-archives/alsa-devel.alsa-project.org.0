Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43405622707
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:31:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C31836;
	Wed,  9 Nov 2022 10:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C31836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667986312;
	bh=vAIptF5d23nihr4Uimx3PzRxpssyKHxrkkS2/rmYcRc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3UYD4G7kGOviiJCV8vwDaygoqQh5LQW6lJiDrHlhi1Z4qD4qukfyvP2DoHtczUBO
	 yMPgiyLelAYQEHwRHLkjsg4ExmnP8IsBhgcYG+GyDYUseL5SchGmZJqx/R3+tgWhYc
	 bzSzYTfxPIUD2RGedRjb8bL5ssmEQUmsdTJ3RPCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41169F8023B;
	Wed,  9 Nov 2022 10:30:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 903FEF80217; Wed,  9 Nov 2022 10:30:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23B6EF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:30:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23B6EF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lQSnCJQx"
Received: by mail-lj1-x22b.google.com with SMTP id t10so24936487ljj.0
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 01:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FwfMbt4n5T6BDFtg3Nccz1EsCW5xeLmEDJHpeJxFwHE=;
 b=lQSnCJQxHtfHlszTv5W0hBsxjk5cOO3+eFtMhHk319wporOQ8G7Ld6zqOc7UsjnPdD
 L9bhdRsQwlS37SYV1fZKnxm5Sv2c+qFRwt2/GNtV33IAksI+3n7eFEdtJ6vaT/bMYG7r
 AA2NOPVuMibpFikPKt2cn6136/Jx4cCp+Ap4obDP7mRRT+qD20Jkixyzi0tYz9HEjpT2
 WZllOicahQf2M2rQJXNDZsYYkHrzV5BnL9ZaStih6gFsHz5yj68ridYSgjEAwZrZby9M
 KmggfW5F9G8hz//iwdxtc/k5Llkpe7tJV9+Arddb66otaRUHeLc0PAI8Mg063NBL8FgR
 cFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FwfMbt4n5T6BDFtg3Nccz1EsCW5xeLmEDJHpeJxFwHE=;
 b=DBCI1/BVlDllGxn+vZr1X173WiYEYzk2YsAyu4rKeuEDS8iOJlC2kOdcC2Rvr1BazG
 NSwcjaFc0IC03Gm79YL3044OTis1YLruZSUlJ/7sSxwEeX0F/FGOQLzY0W3/NZtX/b+v
 2PvHpMj2ZjO+VB2oE9JCGpQKKUGS01XN1IN58Ou5bWApj6LTy3Q0DVX6Y05/MJESeWKl
 jHoGWLVGM3LMLd7yUCmGvk4umQZArp8eZyHOhBdjsKalKTtK0KkEOwYmePHFKavWTsl9
 OD643J5YtRRLSObPs9/MFFA3L06So8JAcJrltc0Qr0KuPjSErPzGxQSnotHwOhCbBJlS
 MYkA==
X-Gm-Message-State: ACrzQf1HtGVM6cbuGogl9YAJOOErU9SbeXcBd+HTkoADz6J0zpw3eWIx
 3XTzNJ5q4+EwerYnWa3Vpjj0b7UC4VumK5Sna94=
X-Google-Smtp-Source: AMsMyM531+3MPQnzPnhD+7DhDUC006glmwl7XuYVSt53ch9/frd/pbc3UH1SuxphEwGfox97kQqMlElOI2yY/ygZ/ws=
X-Received: by 2002:a05:651c:c8a:b0:26f:a90a:fd82 with SMTP id
 bz10-20020a05651c0c8a00b0026fa90afd82mr7999334ljb.248.1667986246355; Wed, 09
 Nov 2022 01:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20221107215201.434212-1-marex@denx.de>
In-Reply-To: <20221107215201.434212-1-marex@denx.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 9 Nov 2022 17:30:34 +0800
Message-ID: <CAA+D8AOCqfeVVPwJjLeniWSWeOZjL-64Hktsa===1fs7j96oYw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable transmitter when generating MCLK
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Tue, Nov 8, 2022 at 5:52 AM Marek Vasut <marex@denx.de> wrote:

> For SAI to generate MCLK on external SoC pad, the transmitter must be
> enabled as well. With transmitter disabled, no clock are generated.
> Enable the transmitter using the TERE bit.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> To: alsa-devel@alsa-project.org
> ---
>  sound/soc/fsl/fsl_sai.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 1c9be8a5dcb13..98c62027e5799 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -503,6 +503,10 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai,
> bool tx, u32 freq)
>                 /* SAI is in master mode at this point, so enable MCLK */
>                 regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>                                    FSL_SAI_MCTL_MCLK_EN,
> FSL_SAI_MCTL_MCLK_EN);
> +
> +               /* Transmitter must be enabled to generate MCLK on pad */
> +               regmap_update_bits(sai->regmap, FSL_SAI_xCSR(1, ofs),
> +                                  FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
>

No need to fix the transmitter,   FSL_SAI_xCSR(tx, ofs) should work also.



>         }
>
>         return 0;
> @@ -1445,6 +1449,11 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>             sai->soc_data->max_register >= FSL_SAI_MCTL) {
>                 regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>                                    FSL_SAI_MCTL_MCLK_EN,
> FSL_SAI_MCTL_MCLK_EN);
> +
> +               /* Transmitter must be enabled to generate MCLK on pad */
> +               regmap_update_bits(sai->regmap,
> +                                  FSL_SAI_xCSR(1,
> sai->soc_data->reg_offset),
> +                                  FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
>

After one time playback or recording,  the TERE is disabled, so this changes
in probe() only for the first time.  There is the same issue for the second
time.

best regards
wang shengjiu

>         }
>
>         ret = pm_runtime_put_sync(dev);
> --
> 2.35.1
>
>
