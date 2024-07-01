Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45D91D63E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 04:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7ECF233B;
	Mon,  1 Jul 2024 04:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7ECF233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719801847;
	bh=xzi07c7GKOJME/WHCQ/3gDV2INYWUviFigFkDt43Gj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HSAIRAqzFEvmGnUs/HQZ+lscUnPjaGTh790ZtFEOqYjrYWwYKNpiHe7HNPobysFVK
	 /JTIfrSHEKXSRUZpObOB/h8Z9b3DR9+J1DwET+gJfmmi71oE2Kpc14qWpVtEghqxzt
	 ZPB1GiWeOvwPllHXuQ1kUu+zB4fH2Alsv+nKpIsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AECDF805AF; Mon,  1 Jul 2024 04:43:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D172AF805AF;
	Mon,  1 Jul 2024 04:43:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449FAF8028B; Mon,  1 Jul 2024 04:39:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C30E2F80086
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 04:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C30E2F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ay6j1oQt
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-375af3538f2so13030645ab.3
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jun 2024 19:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719801548; x=1720406348;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y40QwGli4KT7ff1uF7HzZYK9rm2EfcOvxXXgg3mEqoo=;
        b=ay6j1oQt8+82oHP44Js5h+idFSEhzrMg+LpNuAiVlvPf7Jg2njT0sd9fbUdJsHRdJZ
         NmT+yGm5HcursoXTqNsgjlOOJTnXOQbxuRO5wkmnhFdyC0Y+fp8cU6a2D9wGi1o5iLWF
         Eq2GgHJFaJqktP+B9y3lVgxwFodN/zDh/ch1llyEVf7NMjGR7OrtnXvseE4rQKUL7V/g
         a76h3S5wg6VDcKi3rpyIsftVbGKPg+u2Syh+QHPNawSJLGzweX9LoQ35b+8fB1HfdkPe
         UvyiAa8zlcYJDAFeDnTHIjFR8BVNfXq5vamnUZpNdSFJLgJUGiMe5UabTnpjfCcK38Ms
         PBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719801548; x=1720406348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y40QwGli4KT7ff1uF7HzZYK9rm2EfcOvxXXgg3mEqoo=;
        b=WbCCt3OOtoedrTv6FiNiK5C1RXSV7ztkvSEqhaum5y429qvUKRw3EZ3WYk5K8fI6Pp
         AR0BTDDLblaedNwOClduZFfhNBiJUxQz/VA0rY7IJ2TeXKU+IHy8p9mRQRsTmVsirGeQ
         T6yKa4x9j+SGsqC9TWfqCXHcAOfCyR1IsDtFkmdbYIE7STEjthbpoVIqXe0QeH9ggBEb
         6kmgYf9Eqlrer8s7JPBJxwrC36/SjN4gO0j+tXr4jDwqpgpg2FX0oMqfFP5ndpOEMrl/
         jf2rjdnihTbv93GYkpi8aYUyvpBcWUGyJZaFM+FNn65OiyCkbOH3bvlvI+wvLk2sWhfI
         EhBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZDVjBzZWPNRW8cHw6dZdQQnBcm/p48awJHbz5IgUKrUWNO8QJG0jmuRwF03NPFGMEMAGTmS7NnG5O6Rn87eC0U4SDtaq3NINB6Co=
X-Gm-Message-State: AOJu0Yw3sWilTo32AjdEoalF6ZpdpejTKTN7VyoU+bmr8tQsejRGELef
	LhUU2wUN3cdw0jUi0qZRNUO2WbMpbot6LqYydPu+7fuVlD0OqsKI9z138dchaqFk7v//5Dgr/tu
	hJ58183YAw4HpnFgP5FLKHSYd4K8=
X-Google-Smtp-Source: 
 AGHT+IFl6hhIVwcNWvb7KuIdXA/G8P41RTV32LeQ6fy/SVP0IkTxdaNJCEE4hHhayovF9Ke2gw9gVLaBx7hagg/hTfU=
X-Received: by 2002:a05:6e02:b46:b0:375:a4e5:1dc9 with SMTP id
 e9e14a558f8ab-37cd0913b1fmr60376685ab.4.1719801547584; Sun, 30 Jun 2024
 19:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240626071202.7149-1-chancel.liu@nxp.com>
 <20240626071202.7149-2-chancel.liu@nxp.com>
In-Reply-To: <20240626071202.7149-2-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 1 Jul 2024 10:38:56 +0800
Message-ID: 
 <CAA+D8ANH8+FBsatondzSfiVD0H0BweRdPLOmoPaBNW6gMFck_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_rpmsg: Add support for i.MX95 platform
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 36LDLRDIXUQFQZ3KKIK2TYQQBWL7YYQN
X-Message-ID-Hash: 36LDLRDIXUQFQZ3KKIK2TYQQBWL7YYQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36LDLRDIXUQFQZ3KKIK2TYQQBWL7YYQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 26, 2024 at 3:12=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> Add compatible string and specific soc data to support rpmsg sound card
> on i.MX95 platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_rpmsg.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index bc41a0666856..467d6bc9f956 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -175,6 +175,14 @@ static const struct fsl_rpmsg_soc_data imx93_data =
=3D {
>                    SNDRV_PCM_FMTBIT_S32_LE,
>  };
>
> +static const struct fsl_rpmsg_soc_data imx95_data =3D {
> +       .rates =3D SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 |
> +                SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
> +                SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000,
> +       .formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
> +                  SNDRV_PCM_FMTBIT_S32_LE,
> +};
> +
>  static const struct of_device_id fsl_rpmsg_ids[] =3D {
>         { .compatible =3D "fsl,imx7ulp-rpmsg-audio", .data =3D &imx7ulp_d=
ata},
>         { .compatible =3D "fsl,imx8mm-rpmsg-audio", .data =3D &imx8mm_dat=
a},
> @@ -182,6 +190,7 @@ static const struct of_device_id fsl_rpmsg_ids[] =3D =
{
>         { .compatible =3D "fsl,imx8mp-rpmsg-audio", .data =3D &imx8mp_dat=
a},
>         { .compatible =3D "fsl,imx8ulp-rpmsg-audio", .data =3D &imx7ulp_d=
ata},
>         { .compatible =3D "fsl,imx93-rpmsg-audio", .data =3D &imx93_data}=
,
> +       { .compatible =3D "fsl,imx95-rpmsg-audio", .data =3D &imx95_data}=
,
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
> --
> 2.43.0
>
