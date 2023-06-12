Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522B72C6EA
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0691827;
	Mon, 12 Jun 2023 16:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0691827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686578846;
	bh=wDbWwwzxiuENnqkZmn39HUjt9g3WC4YVn2eZVNYPLJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DCAdgOmCaFFEV+naGPEjIREKu0bUIQnjdFEBCboyRr14VYJ8FZlis6d1W4+lUGiht
	 nT6M5vH3xBG79guGArAlQhmeYn6CzAWennmnlGtSneFRc8pToIjlBO+v9mdmkEJ3AV
	 CwwJ7Rwsn1PCj9QTdZXIagL4EZ4Pr+3h+fwRnDe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27CE4F80149; Mon, 12 Jun 2023 16:06:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E539F80132;
	Mon, 12 Jun 2023 16:06:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E016DF80155; Mon, 12 Jun 2023 16:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6269BF80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6269BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=DQABeuTL
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-75ebb3d57d0so369757385a.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686578763; x=1689170763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzGHAlJH/0YXEKipZ+Ms41o/6AaOdNH3x2SChySThcc=;
        b=DQABeuTLfLAmeKt8tVvq/jaKPBv/urqBjnHEkh0ByKqGpXluH6Z+1GGormG4y5x5MI
         KX28oZl7VIRbr4QsdcCoXwZK3jITjhKI20HgS1aYLLxTW94IMrnaN7K86FP/ZMcV5tT1
         6yv77z1MQ5qlj65i7yMqt7u4CWMmhf4ZPXpJbjo4bmUq+2APmCbgzX2659P6JNVD0inK
         Tm83araMfqQkMvX9nmBOgOGLzJwR8GFXwFHgXXsD4/nxFc8mPKXhPhpUmyHzKhsl8Yhq
         guJQhgKvFTo6CGRpwRm0P+VJXxRusBFE2MfjQlF9DvAn3MGBA/YWfU/oi1iGsnFpvs38
         87cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686578763; x=1689170763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzGHAlJH/0YXEKipZ+Ms41o/6AaOdNH3x2SChySThcc=;
        b=lXAPSMzYtKokSXRY+ZG/OeW7L2vzizK9i5Lf8BuejUH3ltfJWVWihjo1/lXFLiVd+w
         AeJNzGt6DwRxck64wqNmM0+922cVIgC5JAaZvHl1qx+xEy6GmEWhuoGT7cl6cz6ue3Iu
         AN6zHRqeX8tIOjGouqGjcI0RcE+p34hk56gVTSX06wFiUR2ixHHcXjO01ezpkOqfFuOK
         HlnMRqNLVZDexUkAucxihXeIHkT6cEhVCEZXNeP2EvDaBRZMWEaoD/AqdAXkpBfF9n04
         HggQYwuYgDVgBn3OuO2gze7cOhJgK6/xzPGu5rBpBzGaXgxcBYnkoHRZbxrwUUPjwIYt
         jUpQ==
X-Gm-Message-State: AC+VfDx/twXORhHiuE0By5vj707X4cKjeDvNKjBOpiwg5t+wqISt1tRw
	467oY+g3rL3iqt855G4PXWxJUcjAZcBoO/yAwIc=
X-Google-Smtp-Source: 
 ACHHUZ5uI20fWf+pWNjdO28+l44cjNEfQFnUdIimfKXlh/dtHGKpDu8ztgzTIX1zOzglSjftG5zT/WzO0W8ilN/xRm0=
X-Received: by 2002:a05:6214:5298:b0:61b:5e9b:a15d with SMTP id
 kj24-20020a056214529800b0061b5e9ba15dmr10948726qvb.36.1686578762963; Mon, 12
 Jun 2023 07:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-6-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-6-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:05:27 +0300
Message-ID: 
 <CAHp75Vc+Y7yOu1faosisPeL5N5x13DSTi142HuAwFgGmBiKsrA@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] iio: inkern: Remove the 'unused' variable usage
 in iio_channel_read_max()
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3HENJS4FUJBQZXJNDS5VK7WETTAJ2ZLX
X-Message-ID-Hash: 3HENJS4FUJBQZXJNDS5VK7WETTAJ2ZLX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HENJS4FUJBQZXJNDS5VK7WETTAJ2ZLX/>
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
> The code uses a local variable to initialize a null pointer in order to
> avoid accessing this null pointer later on.
>
> Simply removed the 'unused' variable and check for the null pointer just
> before accessing it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/iio/inkern.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index f738db9a0c04..ce537b4ca6ca 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -849,14 +849,10 @@ static int iio_channel_read_max(struct iio_channel =
*chan,
>                                 int *val, int *val2, int *type,
>                                 enum iio_chan_info_enum info)
>  {
> -       int unused;
>         const int *vals;
>         int length;
>         int ret;
>
> -       if (!val2)
> -               val2 =3D &unused;
> -
>         ret =3D iio_channel_read_avail(chan, &vals, type, &length, info);
>         if (ret < 0)
>                 return ret;
> @@ -869,7 +865,8 @@ static int iio_channel_read_max(struct iio_channel *c=
han,
>                         break;
>                 default:
>                         *val =3D vals[4];
> -                       *val2 =3D vals[5];
> +                       if (val2)
> +                               *val2 =3D vals[5];
>                 }
>                 return 0;
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
