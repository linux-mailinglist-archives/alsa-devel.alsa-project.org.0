Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504353A39C1
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 04:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C8317D6;
	Fri, 11 Jun 2021 04:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C8317D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623378457;
	bh=xdDhcXcyITYzCgL30PKqNO2dx+lPbs1pBRJ95LB/rI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dtKA/Z7h5OgzsCGed06FFpJSObqNZ9OWy0BiXdhde4W5Xr6gn+sICBI/s3jVLS4Bo
	 k+13ZKdpXX5KMTQhHxn8MPJnyrmrAutdL67yltnwM8aPC8O5oex1PP/jlruDleREgR
	 +B8WgJe5kFqiJr3Goiv9bkDq47L12PPTSmS39wyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48E20F80276;
	Fri, 11 Jun 2021 04:26:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93486F8026C; Fri, 11 Jun 2021 04:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 143FBF800FB
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 04:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143FBF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I2eukyki"
Received: by mail-qv1-xf2b.google.com with SMTP id im10so14936427qvb.3
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 19:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FsXY/TbSGUUDENZzS6CIpHdUvNAOKNKXgpKq5u4rXU=;
 b=I2eukykiphXFQViXcXYmNXYcayHQieCzV49bgZWYLDdkww6G3d2j0qfqzxreHlnYSI
 v/HEDSDf02kjpLsUckDsFqDTQoVG0g4s04oX/4cCJ+iN8hs/Ar1nRZ+2CaodIEbP/CQR
 fBL9nAbihtMYVpgNmymE0y4FaiGGHXBr5JQipolDQ9y1duTTcuOn1biEoOsaWsk4ts0H
 oBQkD6Wvsz/4nkbP9EEfgsDmbAwS0Voq6kY6jTBaCKZBdIGolFuD8IdP0ZJF3nvQq/sa
 zglPT+b/jLnTA8hkzYcjo6OcDop+++rp4rdNR5Tk3ceiqO8ntyN9mf6+Ae87R3jMbJI4
 +t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FsXY/TbSGUUDENZzS6CIpHdUvNAOKNKXgpKq5u4rXU=;
 b=C7Bht0XjZGk4MQVubE6BIlwXL/2nsT5AEckXBop9NHeBGW4RGv8ZwRA/wnLolLxsyI
 rWfxoRj4S5FYYyGYKtKR4mswn4rVRHAr50qrPiLHK261nFmo9NhjZSRQogtNPyg+9s17
 tki97NYh7uCM3kF6klRc/40bTbMHfvOCvS/Kl1Kd2Abt68fKCOF43XrjhbGUWFmXU83C
 MuuTN8JdTcG8lFcp2XCDwbZmD5zz4xda3bKudax1FEk+nmqroS857oJnm73P84GIPrdV
 An5pMfmQJFAB/chCtpXpHT/bLF6i2FFCvpoNSH8vAxym+EQV+aErJXKctL93s7wiGT4R
 ejEw==
X-Gm-Message-State: AOAM533+426QPqafFembxbt1w91gdaghWEhNL0FPbrKrpgzOS2i5YV0s
 c/WOB5UqIbRz+Rhj5y0x2XuTl2YWo8oQq2wkuNw=
X-Google-Smtp-Source: ABdhPJxT+CsEUPgmUbbvvdovqN50qvrZPZs4VXtBZa26L9aij/35ZW5rkX2cu6uMHZw3aT20weyVwPl2f64lDccacTM=
X-Received: by 2002:ad4:576c:: with SMTP id r12mr2699884qvx.28.1623378357051; 
 Thu, 10 Jun 2021 19:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210610040037.1064-1-hbut_tan@163.com>
In-Reply-To: <20210610040037.1064-1-hbut_tan@163.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 11 Jun 2021 10:25:46 +0800
Message-ID: <CAA+D8AOseYcjf6erSObjkpAhZGJW0VGio-T91kFZ7q0f3PhQPA@mail.gmail.com>
Subject: Re: [PATCH] ASoC:fsl_spdif:Remove superfluous error message around
 platform_get_irq()
To: Zhongjun Tan <hbut_tan@163.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Tan Zhongjun <tanzhongjun@yulong.com>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
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

On Thu, Jun 10, 2021 at 12:02 PM Zhongjun Tan <hbut_tan@163.com> wrote:
>
> From: Tan Zhongjun <tanzhongjun@yulong.com>
>
> The platform_get_irq() prints error message telling that interrupt is
> missing, hence there is no need to duplicated that message.
>
> Signed-off-by: Tan Zhongjun <tanzhongjun@yulong.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

> ---
>  sound/soc/fsl/fsl_spdif.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 2a76714eb8e6..29cefd459241 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -1368,10 +1368,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
>
>         for (i = 0; i < spdif_priv->soc->interrupts; i++) {
>                 irq = platform_get_irq(pdev, i);
> -               if (irq < 0) {
> -                       dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
> +               if (irq < 0)
>                         return irq;
> -               }
>
>                 ret = devm_request_irq(&pdev->dev, irq, spdif_isr, 0,
>                                        dev_name(&pdev->dev), spdif_priv);
> --
> 2.17.1
>
