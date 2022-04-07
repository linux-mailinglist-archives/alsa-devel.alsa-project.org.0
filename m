Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849454F7553
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 07:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AC6C1757;
	Thu,  7 Apr 2022 07:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AC6C1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649309355;
	bh=o2nrvHmu6qjuk3MdVvzn317h0S2WQqFGckVuUaxerLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVSCQ9xS5u3MKJilkHgeb6tVLWzifoWkA190thW7K6+P0pMnFXmzb+QUFvKan/MKS
	 6LIAtrQ8FAgw3Dr79Nhxo2wLIG+BTTjvbCF9vVBsUS0yS6QHorgZ1P/XzGQUhbi8zA
	 ORPc7P9RUSRhwfkud1K9LeHDot3YIe8DFDF3uGPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90EBFF80085;
	Thu,  7 Apr 2022 07:28:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B61CBF8024C; Thu,  7 Apr 2022 07:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0AB3F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 07:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0AB3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fUJxRLKD"
Received: by mail-qv1-xf2a.google.com with SMTP id x5so4194540qvk.4
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 22:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldbLsUHm374sNc3UpdmMjncX7qA2R4ibDH7L9znVRqg=;
 b=fUJxRLKD/IV4TBT+wV7xSfgTfoLGm+sJeFvq+c5ge6HcuHfUttJK0fmN4MYa2XQIS4
 E+sZrxy/jlWU83TCY0JTh01VWbjdbgBKRJ/6piODu3QRBWLpr0kt9wbCAFnSh5Wt6lW1
 UPtXMe2EMDQZswcVqaZiowj6auSCkRZ0rubuCYr4GT5sKUezfqeFt0LHpTrcTDGqk9vy
 nkqP+iAd8z5nYSsWTc/cN5im2tyk4s+FQLiAn28b1gMRhTPJ3d6d/IqZ0Xp5awBrplgW
 3veGt4CqdT5G3blYRpl4/gGB25Rpr/o+PofHzWEjhT1aOLZpuGTKbmPMo6AplMq+2z83
 NN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldbLsUHm374sNc3UpdmMjncX7qA2R4ibDH7L9znVRqg=;
 b=1P97dIOl18QXRfe5o5XzXzHIuA1WNLK5Rw+Q8QBdyxHQjJz2gA5mkwgOjWZKFF2SUK
 eo6mxokrh1a2EizfYVGHCQbB6/Xbkc3nnNQqfcV4Ly8OF1UYevLpNI6JP7xsjcgwtIuT
 iXMPBDq2Dyi6SGD/keKdfMxTcT7ghQywKOa6tm9cUOBqpbWHqi7k2YWd7U4N3DuU7Iac
 WXFmQoAnFXj6sv8aERxlcSmhxfWzuuNenOaKtEF+YEuJtUTEZhPVJp+v24jPQfQ7TDyj
 PybB6mmLNz6yHKDHup/xGs54qVY7xNGAXnOj4zVphO3y94DTESA7S5y29fbEQs6T0mrP
 rNXQ==
X-Gm-Message-State: AOAM532LTemkhrIfWwDw8/5kpVogwh4CsFfjPBQhNBx40yEcM3xjz6KZ
 Dp+LTxEY1NfLVa2hqa6SGrWGwMV7UvKCXXjSyp4=
X-Google-Smtp-Source: ABdhPJxEQg/CKOmXtJQwDR+EBuE7rMbzGeruTf8ywQtJPScmZ7dAzAZATjwzSYOtSE6GM0F00hYOx4a0JZq8s+Z9tbg=
X-Received: by 2002:a05:6214:c85:b0:441:2bb9:92fa with SMTP id
 r5-20020a0562140c8500b004412bb992famr10172470qvr.21.1649309283528; Wed, 06
 Apr 2022 22:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-19-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-19-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 13:27:52 +0800
Message-ID: <CAA+D8APwHzoammbpmVCW+k44C-vU_LMGywoJZ8jCDcVN7x3gMQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] ASoC: fsl_micfil: drop only once used defines
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

On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> FSL_MICFIL_RATES and FSL_MICFIL_FORMATS is only used once. Drop
> the unnecesary indirection and use SNDRV_PCM_RATE_8000_48000 and
> SNDRV_PCM_FMTBIT_S16_LE directly.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu


> ---
>  sound/soc/fsl/fsl_micfil.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index f7742a6e6c204..f536ea2db89db 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -25,9 +25,6 @@
>
>  #include "fsl_micfil.h"
>
> -#define FSL_MICFIL_RATES               SNDRV_PCM_RATE_8000_48000
> -#define FSL_MICFIL_FORMATS             (SNDRV_PCM_FMTBIT_S16_LE)
> -
>  #define MICFIL_OSR_DEFAULT     16
>
>  enum quality {
> @@ -349,8 +346,8 @@ static struct snd_soc_dai_driver fsl_micfil_dai = {
>                 .stream_name = "CPU-Capture",
>                 .channels_min = 1,
>                 .channels_max = 8,
> -               .rates = FSL_MICFIL_RATES,
> -               .formats = FSL_MICFIL_FORMATS,
> +               .rates = SNDRV_PCM_RATE_8000_48000,
> +               .formats = SNDRV_PCM_FMTBIT_S16_LE,
>         },
>         .ops = &fsl_micfil_dai_ops,
>  };
> --
> 2.30.2
>
>
