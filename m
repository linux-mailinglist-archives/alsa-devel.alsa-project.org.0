Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5D8C9D32
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92452E82;
	Mon, 20 May 2024 14:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92452E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208068;
	bh=75cwrOYxMCwkMEJj5WQ4qiiIWRNHOkMsDaWGNf20e1s=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YxEerVEhpBP/x8eDMWRzH4z6YVRGd9WYQJuR2zeTvOqoPZKSLENEKJnQ0dqdzCtkC
	 d6zLEdC2qVrMCmUGQNs07iGGwwSk94eHTd33ILjBacJEsE8o3vHJgbk34RXwAJ4voS
	 W3YZwvE+mO32nCI5WcbgEI/skbUJF4C/OpaIVXeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A981BF805F8; Mon, 20 May 2024 14:26:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3166F805F3;
	Mon, 20 May 2024 14:26:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B47F8042F; Fri, 17 May 2024 07:03:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC6D8F80171
	for <alsa-devel@alsa-project.org>; Fri, 17 May 2024 07:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC6D8F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=If6wjk7G
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4df7ba13412so219589e0c.1
        for <alsa-devel@alsa-project.org>;
 Thu, 16 May 2024 22:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715922191; x=1716526991;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olvJpcmkbApgR1MlcxrBTc0IASmmv7gHG32Arj+e5lw=;
        b=If6wjk7GcNjMjaT+4JZX+dhOVbQK4b9rYbDr26AWsROExUMDcZNtpI1Ob2vlWb7A0w
         2uHkv9BBY00cpvJazLX91L10ykw7VEBVKusx90IK2IK2bF3izmDqJjeguw7ALzE84bZh
         ws5aGFUFcjlPt6a48ZDc6TWl1XkhkdvlcmjcHqCdWgPOvyEKyGKDAAzthfg/R2QE/zyh
         YkPKpUQp+A3QjwA+yUCnoJ3treE/dKzZrMBaJpEaE0Ka0/TRP3bEesS95wVoAewMkbZ3
         EvKdFnwL2+NwbZwEPyH12evl3GZNApbATnjC/rE+VYYHVFw7aHvwxt41n/N+oyQnlq1b
         bx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715922191; x=1716526991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olvJpcmkbApgR1MlcxrBTc0IASmmv7gHG32Arj+e5lw=;
        b=BiYhVx/9puC06SIgVOxxHyxEnV66RAcJrhC5CJVo+K0jbKxSdU1CcUIzzph+dZBc3E
         Xft7iSn0hmmi5jtpwPMQMD7734HVq3GQuf5L0ngfpDpfR5tdd8J67HKfwwurRp9JF5j9
         CB5Dyqd5xKXtP6wFzUd0ZFR9f349eOVm7gBStAohGga1pEVMRJJ+Ur/FsE61BezxmN5O
         xyHuGtgSNVG+frNbJM9AwVvHRV2phe0Jh0WBkfiFGPH187q+O7hsDEQRRfXVaHgzazSZ
         9JG6rgSvGSwnkJii7+/l+jIUQhd/9YjJWJFmZT40sfhZnTOKDNTTpr52NAdz2ktdv7qd
         1l1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXL85pH7Y0CyQ2UC1IkbsqR3NqfaZPZWX+JIWMne7mG8+1RNBN6xqx8T2DT8Mk10qLUnUmlpua4v2qt/Loq20/iIFI1WvkIFvHUl0=
X-Gm-Message-State: AOJu0YzD1GogvHXwShEbGC5hbHWJFLwZwerh5KaKYtYQ9fvK08xvuddv
	v9iassLGz2771cNe2qNdRhQUIOu/cip8A3kPJECExqOETnLZCa8jdgxOyCFib9Nd24PdSRQFPui
	wZlLRrOG1djaDsVxgVrWxCdHdoaUdIGJa
X-Google-Smtp-Source: 
 AGHT+IEVcrPXwosj+wanDZMTZek4hmMva48UDxwz+HItd9WQFOvoxwrlMN0tE2PIZK+8YVSrbJRUnpdPKtEEuMHska0=
X-Received: by 2002:a05:6e02:158b:b0:36c:10b9:a040 with SMTP id
 e9e14a558f8ab-36cc117a121mr197170665ab.0.1715915290323; Thu, 16 May 2024
 20:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240507173735.3456334-1-festevam@gmail.com>
 <20240507173735.3456334-3-festevam@gmail.com>
In-Reply-To: <20240507173735.3456334-3-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 17 May 2024 11:07:59 +0800
Message-ID: 
 <CAA+D8ANa2dPo_fJ4ZOYVKWXi__D7OMkjYgiHVNdRRRoMUEdxOw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl: fsl_xcvr: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: S54IXKDIPHLNWJUUVH4J3IPKBUBETREW
X-Message-ID-Hash: S54IXKDIPHLNWJUUVH4J3IPKBUBETREW
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
>  sound/soc/fsl/fsl_xcvr.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index c46f64557a7f..5472ace23d82 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1364,7 +1364,7 @@ static void fsl_xcvr_remove(struct platform_device =
*pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
> +static int fsl_xcvr_runtime_suspend(struct device *dev)
>  {
>         struct fsl_xcvr *xcvr =3D dev_get_drvdata(dev);
>         int ret;
> @@ -1398,7 +1398,7 @@ static __maybe_unused int fsl_xcvr_runtime_suspend(=
struct device *dev)
>         return 0;
>  }
>
> -static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
> +static int fsl_xcvr_runtime_resume(struct device *dev)
>  {
>         struct fsl_xcvr *xcvr =3D dev_get_drvdata(dev);
>         int ret;
> @@ -1483,9 +1483,7 @@ static __maybe_unused int fsl_xcvr_runtime_resume(s=
truct device *dev)
>  }
>
>  static const struct dev_pm_ops fsl_xcvr_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend,
> -                          fsl_xcvr_runtime_resume,
> -                          NULL)
> +       RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend, fsl_xcvr_runtime_resume,=
 NULL)
>         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                 pm_runtime_force_resume)
>  };
> @@ -1494,7 +1492,7 @@ static struct platform_driver fsl_xcvr_driver =3D {
>         .probe =3D fsl_xcvr_probe,
>         .driver =3D {
>                 .name =3D "fsl,imx8mp-audio-xcvr",
> -               .pm =3D &fsl_xcvr_pm_ops,
> +               .pm =3D pm_ptr(&fsl_xcvr_pm_ops),
>                 .of_match_table =3D fsl_xcvr_dt_ids,
>         },
>         .remove_new =3D fsl_xcvr_remove,
> --
> 2.34.1
>
