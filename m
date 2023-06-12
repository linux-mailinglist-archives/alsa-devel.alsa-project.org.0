Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FA72C7F7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1BAF0;
	Mon, 12 Jun 2023 16:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1BAF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686579460;
	bh=g7vvW3JlubBzRc3ioP/tJ9xt5HTYDYeuyGlEDPTWZsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bBp9VSTjDs2YHKotHtTSjrlhvRaCU3AdEUjSLX22/J0kAqmbjdgIDGgD+3NGy+lLi
	 obckaN/CAofTNQUQ6rOj9E06o8NHHbVsLChGyQ5dOHVCaMJyGks1NGuQmQboFxnQOK
	 djcKzrhnX/t5JeTWhB+0jjQqvKRfct52EAcNvh10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F675F80301; Mon, 12 Jun 2023 16:16:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C26C1F80132;
	Mon, 12 Jun 2023 16:16:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D035EF80149; Mon, 12 Jun 2023 16:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E39FAF800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E39FAF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VYrc+/PS
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7606e639083so69639985a.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579381; x=1689171381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J56F2gro6FOKUtNX+Ibu7D0wvtB+UfEnw2ffuy1QzrY=;
        b=VYrc+/PSRxa19n3EYLsVoT3v/3px81mUNbQj7dp1olssQOoHMD5v5V0dc7kvmuWalU
         blOcKV1bEhKIRb8dHSA/d2q2KqpT55Dc6so2ev6hF0ID275CH8f+wGgzwK96noEPR2zH
         gkpNFAtXO/DyLVNKgguS4lVHTgiueJ3oL2ShJiQGKGKrWgm/sO7nt792V+stR5d/5LQx
         wEtr8btvJ0AYd/TlGOEd7HMhhPdWtaJxnP78FVjaQPRo6Kj6vA8ASMD2k2znh4xBVbuF
         27ybyczcaWXXOGij4365KqyCFaRQMW4hfcFBlP6j4iV3qAnY66JcSpgik5uWtrt0fKrf
         abUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579381; x=1689171381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J56F2gro6FOKUtNX+Ibu7D0wvtB+UfEnw2ffuy1QzrY=;
        b=bMvWf0JR4G5ReBDzILueDyR3lcVh04WxU+Rm48KCxjLgf4UaToNMu/r9fpkqP9c+Be
         Tf+wzhkup4g88aSTmN2IPeNBPWFSknJ1C//9twwncVxt9DRXwJwMHb4KjikvSBsRQYdM
         RLGgY7FPeCrRmJ6S2VOltWXXdc5rj0cIuONuXo/TGe7sHfQi4gsXNK6b4+NVXnLC+Xq3
         Nv//Rrr6ZY/Xkc50nd4S/eEv5F+HKbXMSN77JTGXf3eImlcjkPK0eFV2pLASnc/O3JdI
         QuKh72w/BJJ2WS7kTPwjiIdkqRGOOlLAg/8r3eSjRGECiJjMB41r2dCYmPqMsZIKivYn
         xiGQ==
X-Gm-Message-State: AC+VfDxQp5tZ18g84RjUHEfJdWxN2K0GX84H4RcWOtZQNtx4FABpsKvX
	hqMfmqfETEFyZVZS2AH+FX2JhiewMNf90zHU1D8=
X-Google-Smtp-Source: 
 ACHHUZ4XPsRNUdUHh24YV26MKxBIyaOxt62KXPAlGGGGnwhH3uGcj+WHpwdzo7780i4kXoH2ZbqxqN7AJm7KJRpRqAo=
X-Received: by 2002:a05:6214:21eb:b0:629:37e6:d43c with SMTP id
 p11-20020a05621421eb00b0062937e6d43cmr12939727qvj.18.1686579381157; Mon, 12
 Jun 2023 07:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-10-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-10-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:15:45 +0300
Message-ID: 
 <CAHp75VdL+e-BArbJheJVpgw+YRdj82iBL=6imeqjBXXwQrWDKQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] iio: inkern: Add a helper to query an available
 minimum raw value
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
Message-ID-Hash: D7JLXJIKJCK7BJ5URVJBKQHP3B3QH57P
X-Message-ID-Hash: D7JLXJIKJCK7BJ5URVJBKQHP3B3QH57P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7JLXJIKJCK7BJ5URVJBKQHP3B3QH57P/>
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
> A helper, iio_read_max_channel_raw() exists to read the available
> maximum raw value of a channel but nothing similar exists to read the
> available minimum raw value.
>
> This new helper, iio_read_min_channel_raw(), fills the hole and can be
> used for reading the available minimum raw value of a channel.
> It is fully based on the existing iio_read_max_channel_raw().

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/iio/inkern.c         | 63 ++++++++++++++++++++++++++++++++++++
>  include/linux/iio/consumer.h | 12 +++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 4331e74191cf..4f383a5ef59f 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -909,6 +909,69 @@ int iio_read_max_channel_raw(struct iio_channel *cha=
n, int *val)
>  }
>  EXPORT_SYMBOL_GPL(iio_read_max_channel_raw);
>
> +static int iio_channel_read_min(struct iio_channel *chan,
> +                               int *val, int *val2, int *type,
> +                               enum iio_chan_info_enum info)
> +{
> +       const int *vals;
> +       int length;
> +       int ret;
> +
> +       ret =3D iio_channel_read_avail(chan, &vals, type, &length, info);
> +       if (ret < 0)
> +               return ret;
> +
> +       switch (ret) {
> +       case IIO_AVAIL_RANGE:
> +               switch (*type) {
> +               case IIO_VAL_INT:
> +                       *val =3D vals[0];
> +                       break;
> +               default:
> +                       *val =3D vals[0];
> +                       if (val2)
> +                               *val2 =3D vals[1];
> +               }
> +               return 0;
> +
> +       case IIO_AVAIL_LIST:
> +               if (length <=3D 0)
> +                       return -EINVAL;
> +               switch (*type) {
> +               case IIO_VAL_INT:
> +                       *val =3D min_array(vals, length);
> +                       break;
> +               default:
> +                       /* TODO: learn about min for other iio values */
> +                       return -EINVAL;
> +               }
> +               return 0;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +int iio_read_min_channel_raw(struct iio_channel *chan, int *val)
> +{
> +       struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(chan-=
>indio_dev);
> +       int ret;
> +       int type;
> +
> +       mutex_lock(&iio_dev_opaque->info_exist_lock);
> +       if (!chan->indio_dev->info) {
> +               ret =3D -ENODEV;
> +               goto err_unlock;
> +       }
> +
> +       ret =3D iio_channel_read_min(chan, val, NULL, &type, IIO_CHAN_INF=
O_RAW);
> +err_unlock:
> +       mutex_unlock(&iio_dev_opaque->info_exist_lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(iio_read_min_channel_raw);
> +
>  int iio_get_channel_type(struct iio_channel *chan, enum iio_chan_type *t=
ype)
>  {
>         struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(chan-=
>indio_dev);
> diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> index f536820b9cf2..e9910b41d48e 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -301,6 +301,18 @@ int iio_write_channel_raw(struct iio_channel *chan, =
int val);
>   */
>  int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
>
> +/**
> + * iio_read_min_channel_raw() - read minimum available raw value from a =
given
> + *                             channel, i.e. the minimum possible value.
> + * @chan:              The channel being queried.
> + * @val:               Value read back.
> + *
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
> + */
> +int iio_read_min_channel_raw(struct iio_channel *chan, int *val);
> +
>  /**
>   * iio_read_avail_channel_raw() - read available raw values from a given=
 channel
>   * @chan:              The channel being queried.
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
