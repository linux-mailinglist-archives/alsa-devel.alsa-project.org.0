Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DFE72C724
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39DF93E8;
	Mon, 12 Jun 2023 16:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39DF93E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686579238;
	bh=Q3WBE5BA1C2DVQs+plNJCZd8eE/mmEpjRx+YNhmdfNc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UvfTY622yNBr5AtKi+L+LbqvC1M+0W99umbn3SBfFIjm+F95z9YdWg5KiyU/ECqIw
	 PCWrWITVHUppuINDTGt5eGYdthiCq7bq09o14sULLSnt7jkvmEClbvb7506vsgk/6q
	 wYJvpu0tGg+t5/vhUrv+NY5sl2tky3zd5sRefFJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D24F800ED; Mon, 12 Jun 2023 16:13:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0C9F80132;
	Mon, 12 Jun 2023 16:13:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC397F80149; Mon, 12 Jun 2023 16:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 592C2F80132
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 592C2F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JpCmZrgG
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-75d4f12d4a3so434797285a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579174; x=1689171174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwQG10OvI6bp5Np0f72lU7cLcijGe7ymruPqF2GZDRs=;
        b=JpCmZrgGbnD0/gw+qdwVRXyOpwtR59MoNMneUFCy3FczoF66ffM5Psp2Bc7Rb63I0a
         UbCL1I+I5HoEGCFcLC/EJxn0FJDEGvkKDbMEs0yGqBP97pRzIfCfJBrRGEEKPfGGY7zR
         O0KtRFFDqWQnOEiAEZcrPlJwPzH43j1KW6h62gSt0cp3ryIphp7xo8RD/c5/Rzw2IXuS
         aQB00DGEzDaz451ciZpPqK/Ygj0CTxdrKd8vGG43oWeIKPlgRQlnInEGUuh+FEdwvnqd
         jI76t5oXepYl/ZvJgQGWCZ/Pbyo4o3ai9XRqSxEDHCiYarYWQjg7vW3nPicZu6NGW88P
         eSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579174; x=1689171174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwQG10OvI6bp5Np0f72lU7cLcijGe7ymruPqF2GZDRs=;
        b=lyKabW/p0bBDF+5UcXYqIVQJ3VsUDim1XGk/DtBO+9JZVvd/ancrvS0GLhSXdBECDB
         22Z1ViJzHzC70cRNASjg96UTg2lljDiuVHgq1U+5wJki/d+8WAIJKp0NPP4UJtfEgSS0
         +NaA/76z+itnuLFXXC6AeJ2FPKLZhLpJKb5qhtirCj5P2nAqszpi/dM93cAE+OVsIe+P
         1Jy8rlgda/KOUixhMAq6pCm6sMDmmR/2GryIzjtg5pO0nEecRD5AjqCFfpKf4Ztvch0L
         ZumQ1o9uTWV4UqEfg6NURQfEhXZRRKNnO2sC83/r1Uug+Yu9M5uZsqnjshvsFsC1RTBd
         uwUg==
X-Gm-Message-State: AC+VfDyeXJFK+64/pKi1+caVLcwQ7km4m0ucnKHfpw80xdJ0CVOLlrVW
	P2JiLYvr96onvTq51yZQAjM/SlSoQPXFC0Aeo/k=
X-Google-Smtp-Source: 
 ACHHUZ7IfxVmmdzaBuW9CEDKaY7PegOwFcPmL2PZJELzk6uKmhCxAC6L6jKrxcH4wML32Rr1mb49PunadVLIKjgJfGc=
X-Received: by 2002:ad4:5b8a:0:b0:62d:edf6:6dc3 with SMTP id
 10-20020ad45b8a000000b0062dedf66dc3mr2330187qvp.37.1686579174003; Mon, 12 Jun
 2023 07:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-8-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-8-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:12:18 +0300
Message-ID: 
 <CAHp75Ve8BVO50TqhUV9YWkRBvYARNOAapZ21X=FehaBBfcC2jw@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] iio: inkern: Use max_array() to get the maximum
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
Message-ID-Hash: 55R7PVHFRGR4TKIAUW56G6XQYKTJLYOZ
X-Message-ID-Hash: 55R7PVHFRGR4TKIAUW56G6XQYKTJLYOZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55R7PVHFRGR4TKIAUW56G6XQYKTJLYOZ/>
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
> Use max_array() to get the maximum value from an array instead of a
> custom local loop.

Looks really good, thank you!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/iio/inkern.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index ce537b4ca6ca..ae1a41d3a559 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -8,6 +8,7 @@
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
> +#include <linux/minmax.h>
>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/iio-opaque.h>
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
