Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD36C72F8A5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 11:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19E3825;
	Wed, 14 Jun 2023 11:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19E3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686733522;
	bh=TODJDWIs0YqSiTjuDoVqxyM+ID4ktVLW725GiKGsqi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GWQm1xTvqEgcxBr9zUMXSuBIpM9rFhVkIJMHmqjNkKM0vJeJwW8+Qx+kgvOQUcJIU
	 7rWfZf/R2psOHy8Lt2+mT8xf7efnFe8ZLOLUEL0H6y82E8Oo8PUzmMP+edPYnk81ry
	 xf6jNpOR2Sq8fj7ZMrXFFmNYitP8RnNz80lnKOWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66557F80552; Wed, 14 Jun 2023 11:04:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E64F8052E;
	Wed, 14 Jun 2023 11:04:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70814F80544; Wed, 14 Jun 2023 11:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 163CCF80132
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 11:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163CCF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=XrLh4RUT
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-62df53196edso13214746d6.3
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Jun 2023 02:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686733460; x=1689325460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lows68iQsXOSvm3HCxBnvL2yL2l/mCq00FeAR+8t4N4=;
        b=XrLh4RUT7vxzRzcNAAfxHLbxMbsshD54LNRR+9BVwGfk2AcfC7CcxZtmLMDhijHa+x
         HkG2z0ORB2TwtKabxSsuFCiv+cVLbPJbaCU61dRdXsOMXpaS7ArPJ9Xlk4aGEPpVv9Q9
         sF4959GFbmTMW41vSFLuDKAle3q59OcJ/A/AGTdKWnjwpO15JGL2ApIlBNUmo+kyhGJk
         Qo6vRgzWchSZmorOK8Hasc7Gqp1uYWk1mjduVeZ/YJlsVfyl6XUZds2Nsw/JL859SWnJ
         GVqRyUeCAiit2SgO7JBcGO0YQLgI1a1uIo/r72x+m0RUuUc6OGZzOMWEzfGBATaIq814
         ZGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686733460; x=1689325460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lows68iQsXOSvm3HCxBnvL2yL2l/mCq00FeAR+8t4N4=;
        b=LAz3YSYA//dKOjzwFYNmNdJoGUbLzo0C6jGBu/49Zs5lbKS9UgbjaC+YbWYPaQGtdo
         HSI+F9f/9Mzydy4W3KFFPg0uYXs823Hc8Ql8CaVud54TScodWbmdc2cQDylNG4QOBQZx
         03knzGnXuL89DBlMsRo5X7/cO13VPJZBvqCtqM3bwJb0X2gANiG7/k0e+SH9KO2mhqaQ
         ZIGRT6OmrWLh2A7hopl3lluJaKbJ2R/qbxkGcQ+TrkXSz+n6/j+3l3XL5kPsU4oK7+Kq
         t6s48Fv3ze/4joP79K8hxCHe/NhK/VS81J0zAc/2hiMcfaR5mVr062L0kEIrjGSfTe7w
         7DVw==
X-Gm-Message-State: AC+VfDxhd+/fhTBrRbuVOJ+ZsooxWri18zPHSipSTiSsu4kt9GJpFokK
	bRfvRz9vZ6Q7BSOKJeKurM2vPssP4J152A3NzWI=
X-Google-Smtp-Source: 
 ACHHUZ6qHiDPNSQdUmUTcUjqhB8Brvn2gqwoahAZG3Sx/5liMGhOeqV+s50MChJilNV8p0/AhEMXyalK8pdNsqdv9zA=
X-Received: by 2002:ad4:5f0a:0:b0:623:855a:9226 with SMTP id
 fo10-20020ad45f0a000000b00623855a9226mr17488041qvb.23.1686733460117; Wed, 14
 Jun 2023 02:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230614074904.29085-1-herve.codina@bootlin.com>
 <20230614074904.29085-9-herve.codina@bootlin.com>
In-Reply-To: <20230614074904.29085-9-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Jun 2023 12:03:44 +0300
Message-ID: 
 <CAHp75VcBcrFnQYC=2NJ4DpY5NgTP8PszXvx70EAzeEDRXs8Q+A@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] iio: inkern: Use max_array() to get the maximum
 value from an array
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
Message-ID-Hash: KVV4A7HBFV4A6GP2AQTEJGJ7IYAK6TSN
X-Message-ID-Hash: KVV4A7HBFV4A6GP2AQTEJGJ7IYAK6TSN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVV4A7HBFV4A6GP2AQTEJGJ7IYAK6TSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 10:49=E2=80=AFAM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Use max_array() to get the maximum value from an array instead of a
> custom local loop.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/iio/inkern.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 71d0424383b6..8bfd91f74101 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> @@ -875,11 +876,7 @@ static int iio_channel_read_max(struct iio_channel *=
chan,
>                         return -EINVAL;
>                 switch (*type) {
>                 case IIO_VAL_INT:
> -                       *val =3D vals[--length];
> -                       while (length) {
> -                               if (vals[--length] > *val)
> -                                       *val =3D vals[length];
> -                       }
> +                       *val =3D max_array(vals, length);
>                         break;
>                 default:
>                         /* FIXME: learn about max for other iio values */
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
