Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60513925630
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 11:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9EAC15FB;
	Wed,  3 Jul 2024 11:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9EAC15FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719998016;
	bh=fZjR28pBAkt6eSylkI8DEksfa2ZuVwFoI2Oxi5vkpOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oe+K77wEOrhijdQmpnQXCW8pF8ahZHhn2ynFTLDDxSOa3p/t/ZXTXX2vEWEGN5n7y
	 8lG69UQTgxTra6CV29CnwTHQdo6MEDcZuvAYTBYDLNI2+T5Q7+52OMqhlOKdVgsw/V
	 RMdBAp1+QwP0CZRB+VmAMMTz3DvioY3K/MoJaRg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47059F805B2; Wed,  3 Jul 2024 11:13:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D855DF805A0;
	Wed,  3 Jul 2024 11:13:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6328F8025E; Wed,  3 Jul 2024 11:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3960AF800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 11:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3960AF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HKN9Zg3Y
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3811d62a668so5855735ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719997970; x=1720602770;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jI0rslYrv6mUgs3l1hovuzLhd9gfH1CvVqaU89w3P0=;
        b=HKN9Zg3YdQaecqRsLKjTsVRZBAlSxCI3sfJTIv2qpkZ6Ghtwyfx4sZZNIT+IaWSfsC
         9spE2+JiJkfBAm3oiYokNf+CXXuS72UOLo1utJWI94lUz8l81tOVFIQ0+dBL2UFCN+fj
         0RSpkGcNsLOx5mYh4lwvlLQR6wAj/teTthNqmk+O+Kfx4fdoZzQdBKkIF5d9yNLjFUbz
         L2a1VoMGcq9WKq1c4XuGO5QDIOUAuBonIRvVWLWEYzNB9cN2McY/Vyjj7TMo7mLd8b6n
         x7rL7ytHVus30DSb+xPq06uJ+CnavglPPjiNyF5eLTUDEeep9wKnsRNg9OvM6SIaDz2q
         2GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719997970; x=1720602770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jI0rslYrv6mUgs3l1hovuzLhd9gfH1CvVqaU89w3P0=;
        b=B7CJAVk+aGevpNWIHqdt5tzRY/rVgAFnTuMzQHrXBguKRPLmHhCdM5Mm1MEcf9EXu6
         9DbV2cCdVLIi2xq+G77qRWwHEqpppbP1RHz4xqN6R1aohvjpItRr5s7D89VB45EjnI4H
         MkHkQrTq8gxQ+yD7ot48k6562B3enhLegM1ujSfLvc7hlnJD9he0rDMzTbwxQSFzffyX
         1fzaee+8+JKWlL/3nVUP5g54VTib5TTrgV14JC7quwr1txkNGFOuM4BXLr3ajRpB1wj+
         uJSL0zbXKwvlV2g+yeu5kA9ZJZ0O06Q49Q5BBIT2PoQ05h7zZ34zpYzlyrZORvKfZGiD
         mi+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc3oDnQNJ0zCbSeRKv8v36MMHaXR/jY2MUxWnWWX9C/Ec6yoEkUjHwsZtFo/AqfGqvq5fN+/d6N8PiJedAEWuW40W8W9MVQU0NhNE=
X-Gm-Message-State: AOJu0Yy8NKN3Ys09lloHy6F+7/tVJsymKCLFUEyfmTSx50eFctv2QbqC
	FOi9blxW94lmJWuIQcDBD9sPnlKNDMnoeQP6HM8PyfDIuA3dI7k+cFSD6t4vvtf51vtyQBqPeLd
	zSgKmYZ+e3MLlR3PkQ7vHRGVGwz0=
X-Google-Smtp-Source: 
 AGHT+IG1ehcAilYAWAvfE7/9RzOn+5jnvezYCw9DkZlXjjrBfIA432A0Ksubc/kan0xqgCTbvKnpweLKFvy1Sc7lLho=
X-Received: by 2002:a05:6e02:1c2c:b0:374:b0d8:6c4 with SMTP id
 e9e14a558f8ab-37cd0afefdfmr127007475ab.3.1719997969760; Wed, 03 Jul 2024
 02:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240628094354.780720-1-chancel.liu@nxp.com>
In-Reply-To: <20240628094354.780720-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Jul 2024 17:12:38 +0800
Message-ID: 
 <CAA+D8APvL_wo_L62M-LD88B9EZ6Sg89jtJrCkt4vuCuH3q9p4A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Improve suspend/resume flow in
 fsl_xcvr_trigger()
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LOXCSO2NU66YVQT4WP5FXKWSLAGTJQGN
X-Message-ID-Hash: LOXCSO2NU66YVQT4WP5FXKWSLAGTJQGN
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOXCSO2NU66YVQT4WP5FXKWSLAGTJQGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 28, 2024 at 5:44=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> In the current flow all interrupts are disabled in runtime suspend
> phase. However interrupts enablement only exists in fsl_xcvr_prepare().
> After resume fsl_xcvr_prepare() may not be called so it will cause all
> interrupts still disabled even if resume from suspend. Interrupts
> should be explictily enabled after resume.
>
> Also, DPATH reset setting only exists in fsl_xcvr_prepare(). After
> resume from suspend DPATH should be reset otherwise there'll be channel
> swap issue.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 43 +++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 337da46a2f90..bf9a4e90978e 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -529,16 +529,6 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream=
 *substream,
>                 break;
>         }
>
> -       ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
> -                                FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC=
_ALL);
> -       if (ret < 0) {
> -               dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
> -               return ret;
> -       }
> -
> -       /* set DPATH RESET */
> -       m_ctl |=3D FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
> -       v_ctl |=3D FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
>         ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl=
, v_ctl);
>         if (ret < 0) {
>                 dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", r=
et);
> @@ -679,6 +669,15 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               /* set DPATH RESET */
> +               ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTR=
L,
> +                                        FSL_XCVR_EXT_CTRL_DPTH_RESET(tx)=
,
> +                                        FSL_XCVR_EXT_CTRL_DPTH_RESET(tx)=
);
> +               if (ret < 0) {
> +                       dev_err(dai->dev, "Failed to set DPATH RESET: %d\=
n", ret);
> +                       return ret;
> +               }
> +
>                 if (tx) {
>                         switch (xcvr->mode) {
>                         case FSL_XCVR_MODE_EARC:
> @@ -711,6 +710,13 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>                         return ret;
>                 }
>
> +               ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER=
0,
> +                                        FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_=
IRQ_EARC_ALL);
> +               if (ret < 0) {
> +                       dev_err(dai->dev, "Error while setting IER0: %d\n=
", ret);
> +                       return ret;
> +               }
> +
>                 /* clear DPATH RESET */
>                 ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTR=
L,
>                                          FSL_XCVR_EXT_CTRL_DPTH_RESET(tx)=
,
> @@ -733,6 +739,13 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>                         return ret;
>                 }
>
> +               ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER=
0,
> +                                        FSL_XCVR_IRQ_EARC_ALL, 0);
> +               if (ret < 0) {
> +                       dev_err(dai->dev, "Failed to clear IER0: %d\n", r=
et);
> +                       return ret;
> +               }
> +
>                 if (tx) {
>                         switch (xcvr->mode) {
>                         case FSL_XCVR_MODE_SPDIF:
> @@ -1411,16 +1424,6 @@ static int fsl_xcvr_runtime_suspend(struct device =
*dev)
>         struct fsl_xcvr *xcvr =3D dev_get_drvdata(dev);
>         int ret;
>
> -       /*
> -        * Clear interrupts, when streams starts or resumes after
> -        * suspend, interrupts are enabled in prepare(), so no need
> -        * to enable interrupts in resume().
> -        */
> -       ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
> -                                FSL_XCVR_IRQ_EARC_ALL, 0);
> -       if (ret < 0)
> -               dev_err(dev, "Failed to clear IER0: %d\n", ret);
> -
>         if (!xcvr->soc_data->spdif_only) {
>                 /* Assert M0+ reset */
>                 ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTR=
L,
> --
> 2.43.0
>
