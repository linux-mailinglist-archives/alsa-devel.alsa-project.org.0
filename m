Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A079A5EE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C802184B;
	Mon, 11 Sep 2023 10:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C802184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420558;
	bh=KpsGaekDs4cex+1J/H36kzGOWsnSl0FHUOXgQ8tZqDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uTU4V+AeLtMiM4C/uaImBucyjYy7aXiHP3Ddb8NudMVwnsHWqn70vMuablGSeKUmQ
	 i7vv1b/0yPN1xboKE8M6IOLtVEGuWtfIw2EBXJIsPflBjWIfvWUBWlTmbJkotxoypa
	 z9MXPiNFizI7Mcga1lEi9ps+jbbqEdOLlovQt6Iw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDF4EF8055B; Mon, 11 Sep 2023 10:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DACEF80246;
	Mon, 11 Sep 2023 10:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2737AF80425; Mon, 11 Sep 2023 10:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE8BFF801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE8BFF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=RUJYn8Rv
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so3140977a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694420489; x=1695025289;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om18+sUwBguON/0kSfIOHctylC5vMOCNq6Z4ohrW9o8=;
        b=RUJYn8Rv1N7S4AVVUIiP41WWL9q95mNj5jY/cFyKZIwNa5aCwc5LRFOxfQnifzE/K+
         AS/tRc+fLDkJ7EyMoKIKzi75bxW5Wnca7N0dwGIPqWIBX3MTqlGOY1fXCL8r9AH6BqNK
         wO+hS4iApps17L6nHqNiWeVwQjZr+cmXaAH/zHXzI8ND/Dgt1uqSKVyh76GuWYn4ktW+
         MzAW6uYGTghaLM8kUAqQaTlrOsTqLvxB2wJKS8ODerEGX35BU6/mwdjDRLGIZvtkXahp
         jS1Q0RX5i6gSonOyzdnqOJaDMgdO+fWe/6hI4zlcVUJ8OKhF/LtSPPFnZw6nRKIv6IS6
         uq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420489; x=1695025289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=om18+sUwBguON/0kSfIOHctylC5vMOCNq6Z4ohrW9o8=;
        b=HGfjA10ccSU/oaGTt5CTRTUs9qKPSBvfMuvNQWwtkTR3bgSvtd+aDLBwRlvNVfcD5q
         X0Bx97gcFPoInYtPz6L5yeQlCuN+JbZ4Bjqw37GjuCiCeIca3/qrCqFdXfh8Me3zQyS0
         ogHWn6T3MJZWYW3iRDSmjLZ0Hjicl/u1m1FYW2hIKt17Eui+M60w/t92QughlkRLpwZ9
         +OdOt+NdSPUP6BjZJtDP7GWWNup7KXPUYcRgGR/3LtqYRl4NZuny97BOF7gSV3/r7cYH
         YpoOqzc7hJTE344oE00gNd+lEjsrRd5hnlS8fKW20sATl471TiyBwehr+amaRvAFiNPo
         6wpQ==
X-Gm-Message-State: AOJu0YyEW6QAjnZd5a5pxVKHnApq2PvyaaCUHucWucgXUsbp+QB3B2Li
	ONd+b95k9LA+EP/AYY/87JD9gNp/jXZO8McNRqk=
X-Google-Smtp-Source: 
 AGHT+IGn+056ypumkJvRZt8A3CzJfnnksSci4rXO4wl2YrKKe34lPOgXLzUTdKKSBUvNK3g81nGf+3ClS1zBobWEWxo=
X-Received: by 2002:a17:90a:e2d6:b0:262:fb5d:147b with SMTP id
 fr22-20020a17090ae2d600b00262fb5d147bmr8388187pjb.19.1694420489120; Mon, 11
 Sep 2023 01:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
 <20230901144550.520072-2-elinor.montmasson@savoirfairelinux.com>
In-Reply-To: <20230901144550.520072-2-elinor.montmasson@savoirfairelinux.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 11 Sep 2023 16:21:17 +0800
Message-ID: 
 <CAA+D8AM3RyrWOB4pmYgF4+q+X7Ro7coyDbGpsC4qzg_NX20N6Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] ASoC: fsl-asoc-card: add new compatible for dummy
 codec
To: elinor.montmasson@savoirfairelinux.com, Mark Brown <broonie@kernel.org>
Cc: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QC66XDLAFXLTLA5EDX4LKEVZ46GFWYS2
X-Message-ID-Hash: QC66XDLAFXLTLA5EDX4LKEVZ46GFWYS2
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QC66XDLAFXLTLA5EDX4LKEVZ46GFWYS2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 1, 2023 at 10:46=E2=80=AFPM <elinor.montmasson@savoirfairelinux=
.com> wrote:
>
> From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
>
> Add support for the new compatible fsl,imx-audio-dummy-codec.
> It allows using the fsl-asoc-card driver with the dummy codec provided
> by the kernel utilities instead of a real codec.
> For now the compatible is recognised and the codec driver names are set,
> but a sound card with this compatible will still be deferred during
> initialisation.

Add Mark

In the "Question about simple-audio-card with dummy CODEC"
Mark said dummy codec may not be used. we should have a driver
to describe the codec.

Best regards
wang shengjiu

>
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index 76b5bfc288fd..c12a356a86d5 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -575,7 +575,11 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
>                 goto fail;
>         }
>
> -       codec_np =3D of_parse_phandle(np, "audio-codec", 0);
> +       if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec"))
> +               codec_np =3D NULL;
> +       else
> +               codec_np =3D of_parse_phandle(np, "audio-codec", 0);
> +
>         if (codec_np) {
>                 struct platform_device *codec_pdev;
>                 struct i2c_client *codec_i2c;
> @@ -705,6 +709,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
>                 priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
>                 if (codec_dev)
>                         priv->codec_priv.mclk =3D devm_clk_get(codec_dev,=
 NULL);
> +       } else if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec=
")) {
> +               codec_dai_name =3D "snd-soc-dummy-dai";
>         } else {
>                 dev_err(&pdev->dev, "unknown Device Tree compatible\n");
>                 ret =3D -EINVAL;
> @@ -806,7 +812,9 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
>         priv->dai_link[0].cpus->of_node =3D cpu_np;
>         priv->dai_link[0].codecs->dai_name =3D codec_dai_name;
>
> -       if (!fsl_asoc_card_is_ac97(priv))
> +       if (of_device_is_compatible(np, "fsl,imx-audio-dummy-codec"))
> +               priv->dai_link[0].codecs->name =3D "snd-soc-dummy";
> +       else if (!fsl_asoc_card_is_ac97(priv))
>                 priv->dai_link[0].codecs->of_node =3D codec_np;
>         else {
>                 u32 idx;
> @@ -931,6 +939,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids=
[] =3D {
>         { .compatible =3D "fsl,imx-audio-si476x", },
>         { .compatible =3D "fsl,imx-audio-wm8958", },
>         { .compatible =3D "fsl,imx-audio-nau8822", },
> +       { .compatible =3D "fsl,imx-audio-dummy-codec", },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
> --
> 2.25.1
>
