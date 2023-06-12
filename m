Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D777E72C6E2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4400820C;
	Mon, 12 Jun 2023 16:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4400820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686578744;
	bh=fG8chL97o9InagqruHI1Arui7O5Yc/7obFXq4akaMRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MqxCuBkJjRq/e9sI6+T9PvwOgY5J7IW1vuRPJCsBmqqevkbZ/wag13GRm/iMIm4bB
	 KwLhVzxyemwAyRvLW5wQPxRwihjPazX5nzfrd8ZPyXiTJ//pmsGsOQFt1x5H7qmtn3
	 iqbqqid4X3OuyilhARl+Sfx2xTuGRQXyTj129QQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B5FAF80301; Mon, 12 Jun 2023 16:04:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20101F80132;
	Mon, 12 Jun 2023 16:04:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70DF5F80149; Mon, 12 Jun 2023 16:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 434D6F800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434D6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=qM2YAKXV
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-3f9b8f1c2fdso29193701cf.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686578677; x=1689170677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Nqk7opXz56V7mIpqm5KsGyT1vRoRc3GpMXEUFtGyL8=;
        b=qM2YAKXVzfa2JaU+hOd5qfotCsKnAverw6L4epM9AS9ysVYswvh9HvnppUhzzBxjoU
         OcsZl4cEW9fgB/kc6IyqHN0mWij4ps37xol30hDagJE/VyrUKgEvvWNQFQhKLSTty9RS
         ChfTT3yp1DP1yrg34c05tKRfPcp5GtJxuPWpOs9wu+0z8XQ/Kqw0bFVRMIK/gYibPAtY
         XyItUrHqIqoYawupgLcCVCm+oUoh14WZtIdQQsEgOIpFHoS408rZH5XT/oakJDy0iDwS
         BH6dSVVyRONYDL4N+roBkjdLprotQVSFu+886KbZIBkrUDpSL9pl5WW9y5y4nrxTBzVA
         nWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686578677; x=1689170677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Nqk7opXz56V7mIpqm5KsGyT1vRoRc3GpMXEUFtGyL8=;
        b=cr0oZD1Id2eJ1IVjdxn7VDUM726D1DkH5L2W/UyX/ata0JvbcfYOBXM2nD/MnRsds5
         0fvByJK0IqsfCeY4GDEr2Li2qnQMINBaD1vsf6B5YybWon9UjdLchaZ6MEidqbgT09iO
         1D5ftP8ydnbYFakJffOr30tjk7RXLutqttkm4M3p49xuIlhY8kfcYZ3LAjcx3yQdYROR
         z4vZBvVwsAAO0NYnmTArscPTH0hzgnqdurlPoIYjtJgGI+C1uu0q4NX0KbR5GnuAtTWk
         DyFoU5yExe4SBPrMsQqiUiMi4b2UU6Im6Th/gvSUxDLiQMrFU0DHSLUAVQkfuabYDY1U
         Ubeg==
X-Gm-Message-State: AC+VfDxdI52Oj/Lrnopu2VMoqJSbqOKQyzpW2PLNTiZ7/rQMCQT/2Dit
	4gWvXUkZXqftYvjii83QGr+2hlfYz8zChaKSqvg=
X-Google-Smtp-Source: 
 ACHHUZ6CYvg10zoi9HIkb5vFNGGCLbHuRoSN1oR+9KoFwQC8JaYcEXHz6j+v+/QBdVrhCGleFWwCy3z8rKKcBsoqLb4=
X-Received: by 2002:a05:6214:e4d:b0:625:b849:f86 with SMTP id
 o13-20020a0562140e4d00b00625b8490f86mr8613739qvc.14.1686578677154; Mon, 12
 Jun 2023 07:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-4-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-4-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:04:01 +0300
Message-ID: 
 <CAHp75VcwaHEzZxpGiVNtrDT=2kYqEiLOALUm_KFb+036XYO1wQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] iio: inkern: Check error explicitly in
 iio_channel_read_max()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LSKPXRBH4W6A65A766VLFRDNVR73TCCI
X-Message-ID-Hash: LSKPXRBH4W6A65A766VLFRDNVR73TCCI
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSKPXRBH4W6A65A766VLFRDNVR73TCCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 3:30=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> The current implementation returns the error code as part of the
> default switch case.
> This can lead to returning an incorrect positive value in case of
> iio_avail_type enum entries evolution.
>
> In order to avoid this case, be more strict in error checking.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/iio/inkern.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 872fd5c24147..f738db9a0c04 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -858,6 +858,9 @@ static int iio_channel_read_max(struct iio_channel *c=
han,
>                 val2 =3D &unused;
>
>         ret =3D iio_channel_read_avail(chan, &vals, type, &length, info);
> +       if (ret < 0)
> +               return ret;
> +
>         switch (ret) {
>         case IIO_AVAIL_RANGE:
>                 switch (*type) {
> @@ -888,7 +891,7 @@ static int iio_channel_read_max(struct iio_channel *c=
han,
>                 return 0;
>
>         default:
> -               return ret;
> +               return -EINVAL;
>         }
>  }
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
