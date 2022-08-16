Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD34594EB4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 04:35:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B683857;
	Tue, 16 Aug 2022 04:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B683857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660617359;
	bh=AmNDxQynnfU8gQLSBs9FFFGwaI9fBDyRCqhRZACAAlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNUpObywg3VbvQ6cvk5tRbGs17AdGLxlkKzckiv2vgrLuGJmHQ2vV7sN67+aVhmQI
	 i/nH+5TY+WNOCaqm8EIr255X1Sp/I0GEYfHEXaf8K4uchGmcblOpPtX2KoPQLyWt6F
	 +CO985EQJcFrPnrnOJK//syPg06mdE73joHXW8/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C4CCF80424;
	Tue, 16 Aug 2022 04:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01B49F8032D; Tue, 16 Aug 2022 04:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37B94F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 04:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B94F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SxF1uTOE"
Received: by mail-lj1-x231.google.com with SMTP id j3so9386324ljo.0
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 19:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vmY+LUCJruKF8uLc3XlHm/fJT0a+m0ghSI6+yD5XTag=;
 b=SxF1uTOEDfk3qpRS8vrws1X9rPL0pWXqD5SeWgJSoSEIxAe2LjVcSc2Ms2uC/MzoSr
 b1KL0gMu7nxtqlDHUvsHX90BIlV4ErkwKvUp9vO8f8Ug3u1o8UQ5hEnApbhdpIxgJDsT
 Uq3MeuEfM/Jn7wsR+xlbtjiMtwGGpvuaQYsBSEgM4FxWmr7MSFPT+C/W6IZnlLoT3UyM
 +fuRhM63M30hg6vQhOyKe9yUugiJGNCnjkZHsKQ64wqd8RFxcZeq+H+sZo+NpTcAJWSr
 LqOzUpPy4Jov7HqZFDhweENUQl5ojcHj7CQBjW9cEKibR/enBOhWomaKKekIB63g65Fv
 rkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vmY+LUCJruKF8uLc3XlHm/fJT0a+m0ghSI6+yD5XTag=;
 b=fN+2802D+C5X7/CggjQ6esWJb2wU4JsyBaAEa+aM00/EpO+DAgFOWSt2LrgFKX/nYA
 J07QiCM6KrlDePnZAe/9/Es8heDyw6y2rRd3WUB7ObR6n4fq9pKpT0fYaC1RnnsEbhyK
 udSjAYNxrCepj3kqLqhQ6i8IRMpVJB4ve1PZ2bYwkOmD6ajzE7B3Vyi8bIzDxEFojyyD
 jtd/P4z/w3w85Ag3qoqox/e8MYQEuE6tdVOJWJDjiZk8vMk53DC6gw4CqUgnssFZnkXS
 fxyVoNqZAo7JeaiT0+Ddrn428h5SBppHdOGadYfrqR4znJKVg+EjIqcxCUuyV1jDfI3Z
 6MUg==
X-Gm-Message-State: ACgBeo1O9x4twQTKy49VKsLFXaxVLTXDb/fnft2NqGsVll5uWWW63uJi
 Y9akrxxh0n4jM4wUp8FiU4PgrbMHY0K+TtYrDBo=
X-Google-Smtp-Source: AA6agR4pZpz+E+mZWSp2TEXSFno6q0tnw2P+5v+jTyqjZvCeszMWPDWVBLCrJh6OVtSiGey7VZVViK56eitP0OvMchg=
X-Received: by 2002:a05:651c:ba5:b0:25e:c5d4:4341 with SMTP id
 bg37-20020a05651c0ba500b0025ec5d44341mr6095297ljb.272.1660617291087; Mon, 15
 Aug 2022 19:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220813083353.8959-1-pieterjan.camerlynck@gmail.com>
In-Reply-To: <20220813083353.8959-1-pieterjan.camerlynck@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 16 Aug 2022 10:34:39 +0800
Message-ID: <CAA+D8AN45E-2ATVQMY7z3OOQJwGuZQ9NJiSFfmQNN-rgYwKbsQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: fix incorrect mclk number in error
 message
To: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Sat, Aug 13, 2022 at 4:34 PM Pieterjan Camerlynck <
pieterjan.camerlynck@gmail.com> wrote:

> In commit c3ecef21c3f26 ("ASoC: fsl_sai: add sai master mode support")
> the loop was changed to start iterating from 1 instead of 0. The error
> message however was not updated, reporting the wrong clock to the user.
>
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu


> ---
> V2: rebase against latest version
> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 7523bb944b21..d430eece1d6b 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1306,7 +1306,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 sai->mclk_clk[i] = devm_clk_get(dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
>                         dev_err(dev, "failed to get mclk%d clock: %ld\n",
> -                                       i + 1, PTR_ERR(sai->mclk_clk[i]));
> +                                       i, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
>         }
> --
> 2.25.1
>
>
