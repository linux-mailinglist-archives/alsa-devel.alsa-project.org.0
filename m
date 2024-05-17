Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3648C9D31
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE51C852;
	Mon, 20 May 2024 14:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE51C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208054;
	bh=a/yhtawGa5/bEHUyZJEsyRhH74dkuL/dYpksOY9aZ+c=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qPML7quz8urHpkP9CC3PQ1QCpmnIKwm/r1PqDdwRx2IRQsSF8EQhds55myZDgxd2n
	 J5mEdkbopV2GN+DDOYlWnjpJXifBYq7a8Q300C6Im1UDy3P3R+WtZXjttvK5Fh/xCf
	 sJqwo8K9Flg5Yl7MhfIr8dp2SP5xIk5Eak+p3Ups=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5EE7F805D4; Mon, 20 May 2024 14:26:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25138F805C0;
	Mon, 20 May 2024 14:26:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBE07F80578; Fri, 17 May 2024 07:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE13CF804B3
	for <alsa-devel@alsa-project.org>; Fri, 17 May 2024 07:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE13CF804B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e0ClS4OL
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6f69422c090so130879b3a.2
        for <alsa-devel@alsa-project.org>;
 Thu, 16 May 2024 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715925129; x=1716529929;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVtJ2FU/+H3Vwpl0z9ENRPJkq5Ez/N1xh7TOdjhGiJs=;
        b=e0ClS4OLnj+VkiARzlvBQ2yeZVm1nHAzfwnsbTDwczv5VQbqIoMBe4TImjGDhwrkcf
         JupfRSP5aAPyg9EzpaE1VjThkUQVz/t5y/2S0Hmita4lCs+PhKwlhkiz6I4yNU0CLkai
         vv3Vz4Ewi8WuXmkrDot8rNEvlCNRicLkGTQmH3nwp+cQHqeGXPxxkNAoXZJLkiYvuBM8
         x2SA9Hoo5MAERHj6lySbVAQxXciP5VDT2lWiqS0k5eVV/xUKW6Lwv6QW3Tc66qDUP8ey
         C0eqi28kbgocI/KZRjRkriRWeZ0JFe69xPP9OtCkkxa/8QBBuNS1wAZGuP2NqjCZV5mk
         r6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715925129; x=1716529929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVtJ2FU/+H3Vwpl0z9ENRPJkq5Ez/N1xh7TOdjhGiJs=;
        b=GwbWpAbiJOgquhBeZsTUx2/aH2hAF0kzzVcXM6GV3OqEJOU4IVDwSDXPgRZrpVkkMe
         uNSw2jkjwc9DbGxnMaZh10qJqzL6lH+OC4t1RxPXjvoAKG8RukEeM8WHbtBTo09+Gt8T
         vSAEjvFPGzjdz34YZdKkFfUq5ly71QrU6C84bx2fmDbpt8+ur4x1VkHPER4NyYFgg+4K
         ob+t0MBCZROjdsc5yHUbxvojJ4iI9DYzB9YDXDcO2dD+wiR1k9CUvyUavzDOYvJ1gSCq
         MfXvtigmGPs3ZdXBaQv7+Insem5T6qzGgYq8D2dUAEiutKlq/e+1tU5ubEzVSNcDBl5/
         UtLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZySlCs5EVcGkzG2aB0IqktQXvrGdG4JVMoDJr1V8xfq7H+KAUlBmSkeWxVEeJRPEl0H4QVAOjuSxkGVqS58BcP4cxssOnL36/www=
X-Gm-Message-State: AOJu0YwsyNYuZEO61VksCwmTUx5GhzrB6ITaZFOjHvDImjmndUyUhizY
	3EH3OcXtU/vwPEwST0qbDvTgZuMoX7/SFkivaVjdmj2JI7zxi1nsGg4aU6rZQNsoUnavTPpUG3/
	bf8GKDAHhEMYrmBR7nPByPs83b3hgcvGJ
X-Google-Smtp-Source: 
 AGHT+IE1y7QmTnvGj3mlsP6sv34dab5qzPP94+Jpgds4dCimlCNdrUKQqKIy4PPdGXOCUPYjtw96oRpD+yG/zXYTzJk=
X-Received: by 2002:a05:6e02:1c4d:b0:36b:f96e:1b15 with SMTP id
 e9e14a558f8ab-36cc13a8716mr255404015ab.0.1715915256814; Thu, 16 May 2024
 20:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240507173735.3456334-1-festevam@gmail.com>
In-Reply-To: <20240507173735.3456334-1-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 17 May 2024 11:07:25 +0800
Message-ID: 
 <CAA+D8ANks=dCfbtB-k8eHO=LD_Znk6m2ftKRTd2kw+h5dbxx+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl: fsl_aud2htx: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7AZVPW3X74MFYYB3CWBPJ23OX62PWRCD
X-Message-ID-Hash: 7AZVPW3X74MFYYB3CWBPJ23OX62PWRCD
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
>  sound/soc/fsl/fsl_aud2htx.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
> index ee2f6ad1f800..a6cbaa6364c7 100644
> --- a/sound/soc/fsl/fsl_aud2htx.c
> +++ b/sound/soc/fsl/fsl_aud2htx.c
> @@ -261,7 +261,7 @@ static void fsl_aud2htx_remove(struct platform_device=
 *pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev=
)
> +static int fsl_aud2htx_runtime_suspend(struct device *dev)
>  {
>         struct fsl_aud2htx *aud2htx =3D dev_get_drvdata(dev);
>
> @@ -271,7 +271,7 @@ static int __maybe_unused fsl_aud2htx_runtime_suspend=
(struct device *dev)
>         return 0;
>  }
>
> -static int __maybe_unused fsl_aud2htx_runtime_resume(struct device *dev)
> +static int fsl_aud2htx_runtime_resume(struct device *dev)
>  {
>         struct fsl_aud2htx *aud2htx =3D dev_get_drvdata(dev);
>         int ret;
> @@ -288,9 +288,8 @@ static int __maybe_unused fsl_aud2htx_runtime_resume(=
struct device *dev)
>  }
>
>  static const struct dev_pm_ops fsl_aud2htx_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend,
> -                          fsl_aud2htx_runtime_resume,
> -                          NULL)
> +       RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend, fsl_aud2htx_runtime_r=
esume,
> +                      NULL)
>         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                 pm_runtime_force_resume)
>  };
> @@ -300,7 +299,7 @@ static struct platform_driver fsl_aud2htx_driver =3D =
{
>         .remove_new =3D fsl_aud2htx_remove,
>         .driver =3D {
>                 .name =3D "fsl-aud2htx",
> -               .pm =3D &fsl_aud2htx_pm_ops,
> +               .pm =3D pm_ptr(&fsl_aud2htx_pm_ops),
>                 .of_match_table =3D fsl_aud2htx_dt_ids,
>         },
>  };
> --
> 2.34.1
>
