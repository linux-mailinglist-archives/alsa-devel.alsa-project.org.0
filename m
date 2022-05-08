Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4751EC1C
	for <lists+alsa-devel@lfdr.de>; Sun,  8 May 2022 09:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA8A71838;
	Sun,  8 May 2022 09:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA8A71838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651996795;
	bh=gHW/LGPIa1ErfxKa2OGAaLfRWnM6aPG9YQRniQfpnzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PSo+OHyca9DiD8JSPDpFaIanOjbiZL99RFAt70rhNFvhKetlDXQMxAsKrQj17/xnK
	 0tGzFJiwCF/t5s38deu5z8/suvtUNfDmWVy5PkCiFhUjZvNaPV1nZI6VFOmU68uniQ
	 pWsHzLbd9s0fbG1A3hYMHK2JsqmUtLfeGYaaHpD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 482EEF80279;
	Sun,  8 May 2022 09:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BC38F8023B; Sun,  8 May 2022 09:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7B2FF8014C
 for <alsa-devel@alsa-project.org>; Sun,  8 May 2022 09:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B2FF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gIUFYKCQ"
Received: by mail-qt1-x82c.google.com with SMTP id fu47so9018755qtb.5
 for <alsa-devel@alsa-project.org>; Sun, 08 May 2022 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZVhWVA+EdiAZkxXcgq5S21iMUVQBopURuPfX+xp/uQ=;
 b=gIUFYKCQeN/B58sPwgdDuch1cOCuxKNjSrwNzscjlympP+cuTuAqg6INyjeEzu+6IS
 bRycio946YWHG+w+7Bp5XrUWI2XN1IT4YCifS0wpudFLVHnWZFbp/lHFggVF2vttzAqH
 xlUhPfrdJjGLwLADAOT7Co+88F8jg4wQnE1Eh3xFTP+KNJRC9ZGFP6d7UptIvt96K3Hf
 HlEh/D7PObgDVhcwbmltRjJWQa7aIesVj/38/0J94Vt5Nf/WlPHKGoElLqw+Tw2n/ltE
 uAuJJ8ALz0zU/hHVjOevEy83NwQyIRC22RwP9odiQgljHRxq8Jsy0GNFcg8sSvpfZcVz
 kThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZVhWVA+EdiAZkxXcgq5S21iMUVQBopURuPfX+xp/uQ=;
 b=cIUbJO6bvL03+HyBzPaIHWcOtVwWwiVh+X1iG6rECxI1Idr2ZhY99depthJwllZmrP
 NrC5uGkrW7oqlOb/Vb5dweilXROc5QQWB4zqEYh6bo+zYDHUMaroVIOjSIwPL7xKuUzE
 CDGz6vC/SglRgCd6hsPWDm/uZIFNm4NIICM9fLuIREoUdFWpTMJI1zPZ42x+ji30iKCW
 YzCGaMPMg0nk6Q8n3YzFGJ/ow/jsP0cg+TECX6JfDYughGg3o/C3v1YRwgrHRtcNNndE
 HOD1Q6ijjth1zUZM510BgtJw+eyQ8GCXPzE0QkfRFjF4ED2O5UgWXZ+aCp3G5CogWMsQ
 9FRg==
X-Gm-Message-State: AOAM532nlAltXv++TOPgzLEqQiMR6UDaKK2ol/hZfh99a2UqtMN3CN3o
 c1l9b6iT90sZEVFD0wL968GZJN2n4Ole7pPEEfQ=
X-Google-Smtp-Source: ABdhPJyNd2eXVDqLQaJ2XSfZasJbZg++pVfPsBuzCeYRWHOHlaLxUTCqb6BQaZtTG0xKbNsZQYf7XOr/kc7ZoH7vedI=
X-Received: by 2002:ac8:5ad1:0:b0:2f3:cf42:b3bc with SMTP id
 d17-20020ac85ad1000000b002f3cf42b3bcmr5076602qtd.120.1651996726562; Sun, 08
 May 2022 00:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
In-Reply-To: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 8 May 2022 15:58:35 +0800
Message-ID: <CAA+D8APkCt4N9_Gm8324ffR-vAvX5e6eq7tegMy-MLMy4zRZVQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
To: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
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

On Sat, May 7, 2022 at 8:31 PM Pieterjan Camerlynck <
pieterjan.camerlynck@gmail.com> wrote:

> In commit <c3ecef21c3f26> ("ASoC: fsl_sai: add sai master mode support")
> the loop was changed to start iterating from 1 instead of 0. The error
> message however was not updated, reporting the wrong clock to the user.
>
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best Regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index ffc24afb5a7a..f0602077b385 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
>                         dev_err(&pdev->dev, "failed to get mclk%d clock:
> %ld\n",
> -                                       i + 1, PTR_ERR(sai->mclk_clk[i]));
> +                                       i, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
>         }
> --
> 2.25.1
>
>
