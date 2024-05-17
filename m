Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694418C9D2E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE70DF8;
	Mon, 20 May 2024 14:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE70DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208035;
	bh=wno3mvyB9rswkIziJtoVknpyO2BS80j9jQ7TD4R4GkA=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gdloj5CJ+JGa4I6wjYgDAlOok3hOoyYe7lenVw5d5SVggBACOLEUQ2e8QbHp9D9Dq
	 lJyd+wUcHCDj+UsyAI0kxB+amo60FzEmf/60doZ5GQiJVXgHvckEvorPhJtfq2I9+s
	 CLcLgiWEs/wDE/pDRJoGd9AktQO+m2Cob5u3ZBhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 047D4F80578; Mon, 20 May 2024 14:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3FDF805A8;
	Mon, 20 May 2024 14:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F88AF8026A; Fri, 17 May 2024 07:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA609F80171
	for <alsa-devel@alsa-project.org>; Fri, 17 May 2024 07:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA609F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=clOx+bMy
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-61b2218ab6fso77257967b3.1
        for <alsa-devel@alsa-project.org>;
 Thu, 16 May 2024 22:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715922167; x=1716526967;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsTiYRTb8kW6XgWbApXaIsMhZYCgNj+s/eoWcnY34Dg=;
        b=clOx+bMyxT53+iZrrRJ22E7SMy+PLCyXLFlqD3mecpPn88XL2z+l7I1DX97493crBl
         E7qvcSHSMWW5HU0glnC6VvCj0jSrFLYS81IzMYaiy3LD+5/tO+ssjiJ72omU77PuLTgK
         uKBPlXDZycMFWqF8JEKpChdWlL8WqbFeddN2bG8bFjkfOq1XOY2czFf7q0nNZuMPdL3m
         YUuu5f1ke+TafE3nEEHLQ2cY4pGKrXaECTmjMRk4Z3gOnacHyiQJHv7bu4NIctPgXg1m
         biriw3XSSn+h/BZZjq6+iScL64M4fdahucWzoEJ9q6oVGRVuD9jG8m3xeYk7cmuriUMq
         4E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715922167; x=1716526967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsTiYRTb8kW6XgWbApXaIsMhZYCgNj+s/eoWcnY34Dg=;
        b=uxffECJZ9u/eXBq+FcNpjXQzRbrDWNVtUGox5PSUxlkr9BeBDt+o9wsYDzvU3LThpJ
         ciy+dENxCcZpQ6ckk+Vt04onlU37kzoIXsLRiDMJFEbblxntrNZztxC3GFOqCUtp77RM
         C15qrxbCWxX6osM2UYiIrdQDH+QsYJ8yF2dM2wAXbyT7o5SsaLTqQNEcLR13ALPfZE74
         bVUF5q55De9kvnphKZVtLvhCOCUyr/VX3HciQXnR61gvouABx/YBbmX8HNATQe1HpDu3
         lzWCahbK+3V50GHdH/QFWTd0I8DJfTiNlecENzYNKPnlUnflyca0QOc5IdmhLiuaZdUI
         2pYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR+i0TUVFQFFHhY40Ap2yswHObUMXWJDC/VQRt3JNpW8oe7uYH34QoZilB9hZ127mpTwigpTFLFe0JCkBRSEqr65HwZdS07lPGeFg=
X-Gm-Message-State: AOJu0YyqwsIEIutLmCxiYiIlKquXFMJ9TZ9Voy0nw1gr7PfjPIiw2HIM
	BOKnaGT/q+nJ4fVzftaYhUdJ0qyb1WubhYfxTNvbk73Ps5Jqcv2MoyB3le/h+0Ixt+iOqkUmm/C
	rNAiHzcNj7TLNzLdN3jENXL6rz1xDQ7vk
X-Google-Smtp-Source: 
 AGHT+IF+b1JaL/KPAWsKTgxSJQRtjK2LbT+CAip6FI2bH5Xb2N2aLbGSoEUAowS5mxecMmyacLreiJo78kD8Q5xliJA=
X-Received: by 2002:a05:6e02:1989:b0:36a:ff03:d2c5 with SMTP id
 e9e14a558f8ab-36cc14687b1mr243253775ab.3.1715915272643; Thu, 16 May 2024
 20:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240507173735.3456334-1-festevam@gmail.com>
 <20240507173735.3456334-2-festevam@gmail.com>
In-Reply-To: <20240507173735.3456334-2-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 17 May 2024 11:07:41 +0800
Message-ID: 
 <CAA+D8AMyWg=F+NC5hoYXdx4XVxVcyiJRFRLH-5OzCoa3q+=+Pg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl: fsl_easrc: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: EIVCXMK7IG4SY33HDXMSOCSERFHR5CRP
X-Message-ID-Hash: EIVCXMK7IG4SY33HDXMSOCSERFHR5CRP
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@denx.de>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 8, 2024 at 1:37=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS()=
.
>
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the runtime suspend/resume() functions are used
> at build time or are simply dead code.
>
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang

> ---
>  sound/soc/fsl/fsl_easrc.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index ec53bda46a46..962f30912091 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1988,7 +1988,7 @@ static void fsl_easrc_remove(struct platform_device=
 *pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
> +static int fsl_easrc_runtime_suspend(struct device *dev)
>  {
>         struct fsl_asrc *easrc =3D dev_get_drvdata(dev);
>         struct fsl_easrc_priv *easrc_priv =3D easrc->private;
> @@ -2005,7 +2005,7 @@ static __maybe_unused int fsl_easrc_runtime_suspend=
(struct device *dev)
>         return 0;
>  }
>
> -static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
> +static int fsl_easrc_runtime_resume(struct device *dev)
>  {
>         struct fsl_asrc *easrc =3D dev_get_drvdata(dev);
>         struct fsl_easrc_priv *easrc_priv =3D easrc->private;
> @@ -2086,9 +2086,7 @@ static __maybe_unused int fsl_easrc_runtime_resume(=
struct device *dev)
>  }
>
>  static const struct dev_pm_ops fsl_easrc_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(fsl_easrc_runtime_suspend,
> -                          fsl_easrc_runtime_resume,
> -                          NULL)
> +       RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resum=
e, NULL)
>         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                 pm_runtime_force_resume)
>  };
> @@ -2098,7 +2096,7 @@ static struct platform_driver fsl_easrc_driver =3D =
{
>         .remove_new =3D fsl_easrc_remove,
>         .driver =3D {
>                 .name =3D "fsl-easrc",
> -               .pm =3D &fsl_easrc_pm_ops,
> +               .pm =3D pm_ptr(&fsl_easrc_pm_ops),
>                 .of_match_table =3D fsl_easrc_dt_ids,
>         },
>  };
> --
> 2.34.1
>
