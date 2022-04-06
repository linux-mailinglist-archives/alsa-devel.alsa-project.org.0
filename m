Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F84F5DED
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 14:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA1E1693;
	Wed,  6 Apr 2022 14:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA1E1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649249044;
	bh=yZKYJZ8B+dI6owknLdPOxBy0sa8VH3iewFjqfEk/IIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TaQ82/J6uCQm0f3aAQklcCtnofVgmtItnK2IqmxE1jX5pYsjJqyaRKMIckapT9t55
	 VI+PbMcPxXZbQmbbYZGZKnjfYuSJPKgHqFJPq3Mz8Nz2sz1tJR2n94iB9JCbRp57ir
	 xeAiSw2d6HlIYuVqRNStDby+zaYLqJrUHS6q0jlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE36AF80054;
	Wed,  6 Apr 2022 14:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC584F80161; Wed,  6 Apr 2022 14:43:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81E31F800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 14:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E31F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CvvZRr08"
Received: by mail-qt1-x82d.google.com with SMTP id a11so3907230qtb.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GWC+lPP/22ApCcB6wVfNJb5DCFb4CIGpZFl+I1yPhAE=;
 b=CvvZRr088I+vR/aXcvhdm6DI5Ra60L8mcG44QJQiZw+i6aH8ALEASItp7Vxlk3P9Ss
 tXvGwo7sMVu2wLz82kaS0eokxmsIITydUcn5vMBY4XDMScWwFfUD+scQ/y5fgE8cR39E
 mXqU+sApUB4YWUc/0MWWioO2JqccOm5gBxhpnrKjqArwZRR7U9T4/zBtjrevjz+6fAzc
 FAcccXU5n8vwyRJdeQRJwe/D/jYg+25BpUieQEzPgZIBssSJLg7B7E6rTU9hRJA8C8SY
 UaQ2vP0tnDm9yAzCjyZV8+j+c/5UO6KvPDKWxnHNQmFHgdZlnI8YaPErNTCiCyOo+eoX
 bdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GWC+lPP/22ApCcB6wVfNJb5DCFb4CIGpZFl+I1yPhAE=;
 b=TL4z2gomc/btbYlvRmecV90de1rG9bQwpkcrstMeXdwL1v4z4uoI+qmQW1KcYEOZ5W
 68XHVT25WAixJxGcO3W8Mb7gzSyfeYeiYGwTmqdDHiwrBbDnOWZeJc8zkcjBGqiFJFkJ
 EeQ8n5vBz3A4n2j6u+abjIjkUDzYueRIoUWYJALWjM26OM9mNtMZlswtgtlnc5lhOQT9
 DNXMA1JHvgodTeNH0pO4ZyXzLVNya/0HeiGGSdPe/h7u55E41iz+NIuUx/ydHnJApvQS
 rcFQJti09qi5nxsavrYg70io+AQMHBI703IskBIbXBvOZ7cnWIvd66jAascapfHj9Z4V
 Q6yA==
X-Gm-Message-State: AOAM5334I1P8NSqB4DQzGb1ecU+Ed1nnD7jWP8DSoZ5PRZ+KYw8Z2Phy
 RKBE/EyXoLtAdSU1zELsX02mB8uATqIqT+9IvP0=
X-Google-Smtp-Source: ABdhPJw48Prav97eCGz6e7aJ7aN561eI9zOIIFeQUw9AkOWhFgx8gFrvDHxXxAapcgMjFwPMOPKpyXIO+f1ZKk+xrqs=
X-Received: by 2002:a05:622a:1990:b0:2e1:a7bf:9222 with SMTP id
 u16-20020a05622a199000b002e1a7bf9222mr7234130qtc.230.1649248973324; Wed, 06
 Apr 2022 05:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-2-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-2-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Apr 2022 20:42:42 +0800
Message-ID: <CAA+D8AOedSoK5gMVr2hTDJu_1Y9JNJor28vLooVRhtcwKOsoJA@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] ASoC: fsl_micfil: Drop unnecessary register read
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

> in get_pdm_clk() REG_MICFIL_CTRL2 is read twice. Drop second read.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 9f90989ac59a6..64019d003784b 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -118,8 +118,6 @@ static inline int get_pdm_clk(struct fsl_micfil
> *micfil,
>         regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
>         osr = 16 - ((ctrl2_reg & MICFIL_CTRL2_CICOSR_MASK)
>                     >> MICFIL_CTRL2_CICOSR_SHIFT);
> -
> -       regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
>         qsel = ctrl2_reg & MICFIL_CTRL2_QSEL_MASK;
>
>         switch (qsel) {
> --
> 2.30.2
>
>
