Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7014F5C96
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 13:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA7DC16DE;
	Wed,  6 Apr 2022 13:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA7DC16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649245691;
	bh=tXPhpgNGH81XCO0weHduJUeybFGlON6eNoh3yO+cW0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoVWNfTFjVBeCCeqDf6gBq3hmujAJJ44/rLRgbQy1LPMSYozqwVH00UtzsrrFhg0z
	 T0pWeB5HyDgxTBs/j0QKmFvsJLNTMdDxP70jCaV5y9IErDSt4aAHb1VZRqHlKg/M07
	 ed8VsRbDnNvs1BCqfTl6C8Yn8Q4TEmF1XccuLNvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 594C1F8019B;
	Wed,  6 Apr 2022 13:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF636F80161; Wed,  6 Apr 2022 13:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31CABF800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 13:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CABF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LxwYZdZS"
Received: by mail-qt1-x836.google.com with SMTP id t2so3719508qtw.9
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2Nl3JdFZ9VubeYR4Ev6cWdmlBon32kGwXYpk8+f+RA=;
 b=LxwYZdZSrG1ZSZvC2j8L0ROB7bO/fcPauFWQzgzYZkcS1eg/uCAijF+Joo4OwntqkZ
 rcQivVbZym4PiF+XPOFaO7G4FmTEXfTaIg1XLwJaK2twNfyDERqLyUXxKA4D1EErbPuO
 gs+g70xOC/wdqS/6HPYswjFO708psNS+GggSWheX30ynHPJ77IRxM5I7Kue97yGG+JYs
 6lyngVmzcaJwS8UpWoU38j2aPBaTtWKTD7S7JQ5ZOSGSLCLcBAOSXUdp47MK8g7fRLtc
 9DwmSfGTKb9eki9cE0gE/6S+6SNNfVf0CF5WaLlw3iEdZHX+el5CS6zGiiFkbChDq5RV
 FEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2Nl3JdFZ9VubeYR4Ev6cWdmlBon32kGwXYpk8+f+RA=;
 b=r3Id9SS6VkQo44eOrZdsKmstmRQkxh3XZ5TBrVtM/WJDKm+q+J2UBcB7KEc6CcWW8F
 8WKWqOhTUBizY3DgWRLbOqBEOAnuOPTySPVyMAf/Ad/DyxmO9OqHNQeZzcxtzdAElrd7
 ENkqDwM56YCxFHr/cOxznbsfoCg/nwdFH9qGQhBiaWtIjWJqdvmjsDbGeQH35kcbvkwG
 lFVAcWHREcX0w+edfFWKdupH+a/pcefAZi7I/POUY+J4iztAf3xJwybpM96Ij08Tno2S
 PkZl8xeA4sVBVbqds3pE2q/YMT6XXMKSb/CQreHKQNhbXJeTnZowifoUDJx5impaNSEX
 W+ow==
X-Gm-Message-State: AOAM530R3IypgUl/SZGFjZBqJD9yTGL1ym1JjUFnPXKY3DlpN+0mjM/v
 RJea3lht5pKQwfmjNPU5k1/CtLR9rYAVUF/6xOA=
X-Google-Smtp-Source: ABdhPJwudmIThBJ67fOrCNhkhLGMOleJ/iIuMroubZ2D8FO7Q+AKvzRxzMScGMUrHG1Tyju1bTr6aH3JI8PdykEuT0M=
X-Received: by 2002:a37:a28e:0:b0:67b:eac:e839 with SMTP id
 l136-20020a37a28e000000b0067b0eace839mr5275153qke.80.1649245617996; Wed, 06
 Apr 2022 04:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220405155731.745413-1-a.fatoum@pengutronix.de>
In-Reply-To: <20220405155731.745413-1-a.fatoum@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Apr 2022 19:46:47 +0800
Message-ID: <CAA+D8AMapYEGiiXjM84U90WcRwu3nMjXuZKPn3sQh9-y+AXg4w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Sascha Hauer <kernel@pengutronix.de>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
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

On Tue, Apr 5, 2022 at 11:58 PM Ahmad Fatoum <a.fatoum@pengutronix.de>
wrote:

> Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
> bclk:mclk ratio support") led to the bypass never happening
> as (ratio = 1) was caught in the existing if (ratio & 1) continue;
> check. The correct check sequence instead is:
>
>  - skip all ratios lower than one and higher than 512
>  - skip all odd ratios except for 1:1
>  - skip 1:1 ratio if and only if !support_1_1_ratio
>
> And for all others, calculate the appropriate divider. Adjust the
> code to facilitate this.
>
> Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio
> support")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu


> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a992d51568cc..50c377f16097 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -372,7 +372,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai,
> bool tx, u32 freq)
>                         continue;
>                 if (ratio == 1 && !support_1_1_ratio)
>                         continue;
> -               else if (ratio & 1)
> +               if ((ratio & 1) && ratio > 1)
>                         continue;
>
>                 diff = abs((long)clk_rate - ratio * freq);
> --
> 2.30.2
>
>
