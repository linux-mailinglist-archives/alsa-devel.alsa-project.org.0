Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D4B4F8D3B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE9E1896;
	Fri,  8 Apr 2022 07:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE9E1896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649394649;
	bh=naFhk8g/T+JC5HLTi/d0UDsHgF0QmU1YbU9SMkUQLbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/kiUCP8Xj5j5ch4vAtnqjpel8qELvDYBNfNRIjx3qBpihTdV3zrEHn7btgZNnMHC
	 JfLvYM4oYsnJBA4fB1pQch5Ldz/YC6v3zNGSFcNG93fWHpVGTUgjkHaJRdKvdO5hPO
	 3o/1TOKVm/jGQaVI3ySgOKlPiHBCdD9oOTybK6RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18DCCF804CC;
	Fri,  8 Apr 2022 07:09:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D9A8F804B1; Fri,  8 Apr 2022 07:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E003F80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E003F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g7KmGeyM"
Received: by mail-qt1-x829.google.com with SMTP id t7so9787548qta.10
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IYZ0eM2rdVomhNA8PfwZF9OhsNz8cGSP6ienyf2hfl4=;
 b=g7KmGeyM4LCTzy+ApLXq/vIsQ/kGugPJ8kz/GQXax5aideaA8yyxtW46TX5kO0EXEc
 cufrhtfCxGStkiFJBpHq/O7cd1lU+O0XlAp9i5SKzhRo4i8zyj0IHwtQ+41QVf7Fbdau
 LbbhapCsg4K8VmRVS+zoqLsPKqSWYU1sxrXutQxOHSDD6kPTutH7sj2SBZyo+OgURWAB
 hvZboQEDRU826B7P2MkLe64YbZ1khHa0RT1FxE7+SUlWkMsowOXhJbqxpaMqT6Xgy/wc
 GVfH7eyeJfsvK92f/3neuaHSNeH9k7JqoIYdY2mE/P3Y6u9wX+lkRkoImyWHdAg/B92O
 qsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IYZ0eM2rdVomhNA8PfwZF9OhsNz8cGSP6ienyf2hfl4=;
 b=JYEF99MmJ9r2GAp0dch//rMe+aSDbqD9N83B+mZSeKhB/dS9UQL5i3suNviW3tVqHk
 RV0NwiZLJJzoKCta2d4B121Ag7QHEiuMf2pVJfKMiybd9cfnQLrmroP9PWnfqenT4ZPw
 03kxdqS8JTRRqoTM+hncJNbxnYyuG/BSbik8dEte6gUqERwAp5RJWBF+bCG/wKiHmZFi
 +FVu5ObaUh4UFAS/1G5vS/rAC8jnDVmYImFWSxAoYXJxOFeEsjmPhgE0okCNuBeGSFPE
 xkILFePfEjbedWdjwn+Nlt3/qhMCtcmf1msZjAwEQy0qLOpayFtM8RsydcKGvFzx+zAo
 JGYQ==
X-Gm-Message-State: AOAM531Ilc/uyHdk23U35rzphMtNySVq3pwk4zfoERo9iADcl7VczmwY
 oCPz8W8WQjhBQSBuRrSMciGGw/h+ReIqKs3USwM6t8cC2zg=
X-Google-Smtp-Source: ABdhPJyOayNyBv/d0OEUQNCIKovLGQgd+PI/njd4YY/rtskddDylbfPUyjQ5HlHXSJD6RNo5eucIK0ttvjcEGZl0jeE=
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id
 b22-20020ac85bd6000000b002e1c84135f6mr14357436qtb.120.1649394589364; Thu, 07
 Apr 2022 22:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-9-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-9-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:09:38 +0800
Message-ID: <CAA+D8AMgSut7N0zvM6DgP5bM0QDM7bPn9ynDFa05fhezFWyV5w@mail.gmail.com>
Subject: Re: [PATCH v4 08/21] ASoC: fsl_micfil: drop unused variables
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

> struct fsl_micfil has unused fields, remove them.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>
> Notes:
>     Changes since v3:
>     - Add commit log
>
>  sound/soc/fsl/fsl_micfil.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 619e013cf272d..4656a18a03e45 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -38,10 +38,7 @@ struct fsl_micfil {
>         unsigned int dataline;
>         char name[32];
>         int irq[MICFIL_IRQ_LINES];
> -       unsigned int mclk_streams;
>         int quality;    /*QUALITY 2-0 bits */
> -       bool slave_mode;
> -       int channel_gain[8];
>  };
>
>  struct fsl_micfil_soc_data {
> @@ -342,7 +339,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
>         int ret;
> -       int i;
>
>         /* set qsel to medium */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> @@ -353,8 +349,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>
>         /* set default gain to max_gain */
>         regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
> -       for (i = 0; i < 8; i++)
> -               micfil->channel_gain[i] = 0xF;
>
>         snd_soc_dai_init_dma_data(cpu_dai, NULL,
>                                   &micfil->dma_params_rx);
> --
> 2.30.2
>
>
