Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320526208F0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 06:30:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7044E;
	Tue,  8 Nov 2022 06:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7044E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667885438;
	bh=7gkKU+Kthws7LEKrAo+qSOfkUTeFTxTtAI7TZIkf8ao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZbXBUz9xxrhQAGg+GhpAVmPFjoE5o3v1XCvQIenTbryAT83fRSMFfuCloKGRvmfJg
	 m0nVRr0LxvlIzeLrOavsE09Ku3/o4BTr8zOueTbGrsil43cuxk2nBiDTOXi5+xYZxB
	 JlHRFVRQrimTo4XpCSqsPKK1oGjUILl14AgfDzJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1077AF801D8;
	Tue,  8 Nov 2022 06:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 959D9F8016E; Tue,  8 Nov 2022 06:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44F9BF800F4
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 06:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F9BF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U12K6aCH"
Received: by mail-lf1-x12d.google.com with SMTP id g7so19721832lfv.5
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 21:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UgQPPhTi3somNr8brvqCVrv35jcNzf/K6iUmv2+8mAE=;
 b=U12K6aCH5eEcVhcCvvLWEhnFdcy7FkwyNvf0HPD+MBlBREMb5ffbXt3xKyRRbMUhI0
 eAcZMdCRz1xklDCuwy/s24W7y1KdbR62Lax6fSZVb7Q1TeEhQV7aNhMb4lcCLPQ5im86
 I9QVYiNFV0rwMiJ1MjS+DqzA8e/n0oCU0vzzXhwq97niJjjWp8vq9dPH5BpLxUsLwWbi
 jeLz38r/tc8yCXoK0fxlW9uxUiVu5HXcV8dX+f/Oi9yZhPiXKym0uGklerkrBXLUcmzK
 +CJiboA+Rpg8FLD77zEaHY6NPEvnvXohCqbqqwryqNeSgtqRpl1ijIQoT++zx4JaUuQ9
 5ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UgQPPhTi3somNr8brvqCVrv35jcNzf/K6iUmv2+8mAE=;
 b=cV44/qsqpDxtQxPpHI0466vEJtlOcpmyedeFEQqZSPumxC/jdWvpd/wFecAkWqcJVH
 MUL+UykzR6ZOesUZXjUXXntZcafr8dkuWdmbkwa5yeUFdVYD3cvYaeP5m3n8R5z3sbRg
 JPOcG5vs7U1BkTkxVia5NvZHi/2W2AVA4trhZ2mKmmoiCIhNAQwP/pDS1K0oZDr0HESo
 z+K3dab9Z1MGMFGOdnqr33oVQ76fXcXZI1XV1cUpPr3h2g/zLk2EVwnYtKOZFbxdN9YS
 w+kx/S47yy6b3O30tfHOTaxw1GISjiXuz50zzCa/lo84GIUYOiuck4xbdiiyAfSN2B0y
 LrXA==
X-Gm-Message-State: ACrzQf1w9/TiRq9i+0S2SM7Sk9CV2LmbIj52Ld7615pkpMcekingKoVA
 95qO4EtlE3BVH7z+cUo74jktdXwhz5nXRB5DoQY=
X-Google-Smtp-Source: AMsMyM7esPtP1ZIbv7q2BVp+vAtlFCe3VzamiJwL7Ma5Y5mpP9Scy/KXaLyQg7/bb28pfKOpkiWuHRKOQZs8fmqpHYg=
X-Received: by 2002:ac2:58d8:0:b0:4af:af1f:87e0 with SMTP id
 u24-20020ac258d8000000b004afaf1f87e0mr17991846lfo.283.1667885368012; Mon, 07
 Nov 2022 21:29:28 -0800 (PST)
MIME-Version: 1.0
References: <20221107215201.434212-1-marex@denx.de>
In-Reply-To: <20221107215201.434212-1-marex@denx.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 8 Nov 2022 13:29:16 +0800
Message-ID: <CAA+D8AOGLUKfg6sfkf7k4P8XnQdDHpjmy4jQK648Mnmupuugyg@mail.gmail.com>
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

It is already done in trigger(), why need to do this operation in probe()
and set_bclk() again?

best regards
wang shengjiu

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
>         }
>
>         ret = pm_runtime_put_sync(dev);
> --
> 2.35.1
>
>
