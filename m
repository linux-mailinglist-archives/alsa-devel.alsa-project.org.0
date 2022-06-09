Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93B544159
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 04:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D58301FA9;
	Thu,  9 Jun 2022 04:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D58301FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654741152;
	bh=fFplY0lZNdosWL/2qU6rXadwu0PXKhe4urhgGk3hWnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSi/NGigpj1XPrEOXsgj+L+oJXnD9hRpl6jx51vAlVNkR6Qs1goPRtPyr0kvnUHxb
	 ypNdUVyDtCG5pTdP09xPs93DWRlmEARmQrXttCgRnHuhGuQp9CokNjC5Ks6R8Hmdqm
	 gMsTwRT+oGcvX484anyS6zqSI4ub45u7G/wVT99o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A59CF801F5;
	Thu,  9 Jun 2022 04:18:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C61FFF8019D; Thu,  9 Jun 2022 04:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F322F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 04:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F322F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AtZNFSa6"
Received: by mail-lf1-x135.google.com with SMTP id a2so29736067lfg.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 19:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/dwcXRT1EfsTmfF1oWE4kIXF7yR6zeplTFcpUpwq2Q=;
 b=AtZNFSa6HR/4hlpdAhhqKAA6h0TDkzFW4NjUtTcB+MKfSV1nQssHunB2xRccQ3f3iX
 4pblQ2zy9QMsxOT+NOsObcMCJaG0zlTRCrnWVNvrki0OXCpHMALFTxHlTrWZv5h6vzSP
 2N7wZCvxSh5O+fB3BXyKBqrqELPOeBpWrQucV0Iion6G5jFUubL3f/w4R6Wfq4OOVMvD
 qIMX22rFKW0sI+c89NxyISaod0dJpWPyD99aQYGX/4Fg9ajsIB5G4fhW16tQbo9A8DcU
 65raenoWNUqpLV6b+YeomW2N7mhoxtODCnRP5+Ukyk2092LVNQYzhHtG/FhXjKCWKoq9
 hL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/dwcXRT1EfsTmfF1oWE4kIXF7yR6zeplTFcpUpwq2Q=;
 b=l2s+4X4EQ41D8P84pkEkhK/LTTGU3qzkwT4IJy132Ys/8b7W6s9JuflFrWryfrt2gg
 dxReoBD9QCs2GLZmHPwObZ1OGTkIe2HSzTzoeFDkeP7fOrS63p1GzOsRE88TTX0MF/Wx
 s3iZhvIWlzWLpkAjUcBpIIwgWZ5J1QPcfI6oUrGnp9iXIsWOtR/DBlGBN/1M8DmXlpF4
 BbWvYbZ+A6QoqmA4Zeqfeq5byO4Q+ExlHchff2JLFAJJukqpOZiO3mhz+CJ+4p6/SnpY
 xovINO9NNfGZeyh4xEMOx5lKtZYXElnHvra1yRcS8QctQSOrd6/aDxzSA9rei9lHsVEb
 JRfA==
X-Gm-Message-State: AOAM533iGa2SSeofYQ4IIyH/YC4OkdOtUK8Ps8XGKIvsNwAuMJOFrCvq
 iQNyrJkdLZLN5KL6fNXf+RXnrJ1gCg/LAkUG/5I=
X-Google-Smtp-Source: ABdhPJx4rr+NvpHmeMc8BUL/Oe5NT3ext/hfg2FKUmWJkKvGHTzsRq6pGXm4BQ328krZfXAOaz7DnQ3UtT0vAM5Dyws=
X-Received: by 2002:a19:6445:0:b0:479:141c:cb5b with SMTP id
 b5-20020a196445000000b00479141ccb5bmr21185754lfj.280.1654741083394; Wed, 08
 Jun 2022 19:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220606033705.291048-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220606033705.291048-1-chi.minghao@zte.com.cn>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 Jun 2022 10:17:52 +0800
Message-ID: <CAA+D8ANPMvRg4SxS9ubWQWYJ_jpU189mA+8Sdefe5SejEhfAow@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: imx-audmux: remove unnecessary check of
 clk_disable_unprepare/clk_prepare_enable
To: cgel.zte@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Zeal Robot <zealci@zte.com.cn>, Liam Girdwood <lgirdwood@gmail.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Mon, Jun 6, 2022 at 11:37 AM <cgel.zte@gmail.com> wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
> v1->v2:
>         remove the check of audmux_clk before "clk_prepare_enable"
>  sound/soc/fsl/imx-audmux.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index dfa05d40b276..3ba82adace42 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -62,17 +62,14 @@ static ssize_t audmux_read_file(struct file *file,
> char __user *user_buf,
>         uintptr_t port = (uintptr_t)file->private_data;
>         u32 pdcr, ptcr;
>
> -       if (audmux_clk) {
> -               ret = clk_prepare_enable(audmux_clk);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = clk_prepare_enable(audmux_clk);
> +       if (ret)
> +               return ret;
>
>         ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>
>         buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>         if (!buf)
> @@ -209,17 +206,14 @@ int imx_audmux_v2_configure_port(unsigned int port,
> unsigned int ptcr,
>         if (!audmux_base)
>                 return -ENOSYS;
>
> -       if (audmux_clk) {
> -               ret = clk_prepare_enable(audmux_clk);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = clk_prepare_enable(audmux_clk);
> +       if (ret)
> +               return ret;
>
>         writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>
>         return 0;
>  }
> --
> 2.25.1
>
>
>
