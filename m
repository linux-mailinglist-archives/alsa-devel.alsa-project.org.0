Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF1724643
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 16:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 159E774C;
	Tue,  6 Jun 2023 16:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 159E774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686062170;
	bh=RuoxOwX5Les5Cr77RpAppFWfYTdEPZ2evFR09CC8ZNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HJmLtPmYiUxInj9FC/j8N231F8ZjoDkAr6NZ1OvQW65wagjX25hGMTw84FkKyqZPu
	 jLGf4qo5VRETJLssbPfGPiG9zr9dTw+3D3UTbYq7rihckazepnT7jgmI1SVwf3WyLc
	 v3g6wMxs/cQrXHWFRKap5hUg4IfeEytO+nozaDNY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7853AF80254; Tue,  6 Jun 2023 16:35:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE1C0F8016C;
	Tue,  6 Jun 2023 16:35:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E836BF80254; Tue,  6 Jun 2023 16:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67C08F8016C
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 16:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67C08F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=DQ4FMvX5
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-62621035d15so64097136d6.2
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686062099; x=1688654099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubLsalXSoy/Ya10j4ymkpZHgwVV8ccg0Uc0f0PWrIso=;
        b=DQ4FMvX55hxTjxUqA6lurcdL4gQPjBbU5gNhBtcH5A+gC3g2zP3YEBdnzduPLhsQPv
         kfR0j6vjSv/US5i3jQw970qqRxMujQhC12EodC1oeIXAnWZu31OjO4vpwYlzCtXM/xP2
         Rt0QbRah1lQnu952QHwtPkW1Yi/AaSTbTivbKBFsOHDkrnolCLp7ZuBsEfvMtBR/Cug5
         Q9usEQZoV9xz3lYxkBCj4H2RlWHDWSYdtvau0WOyWOo7u938Xtas9t3QuBuyDOOfV10/
         xMLcioR2KTX4CwuFQBQBq/9At8fg36faSZOQ+QgIZjurlLzUAZd6kGNanT63iCGuQYvW
         TyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686062099; x=1688654099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubLsalXSoy/Ya10j4ymkpZHgwVV8ccg0Uc0f0PWrIso=;
        b=PNBUlUbNvOoydPB2/tdTnjaHq2c6SKTjksLRXHWEs0S0YKYKItjVycGNZVDqLRn8/Y
         L0GWQEjVKEyxint3qL9I8Fjm/FeeHwQDmvPGa6/LmB5lPrhg7yK2wGpbylWHMALx0lWX
         ZekQvWQWXBZ64xvlaCRKyHyDHX45yLzeIWS7FOrOPebRGYfMrLrsZWw4zLjYAqLzTegq
         69/Hkp5suciGNm4D46G2T56HrUnuZQUXvTK7Gm3+iY4pKHqPwrZYc7QH27yu1Npna4a2
         3SvMhqOhURTYiXVrG5IcJ2oqVj/31aMOkH2fz+WcF0KaLtiY8KCw+yhzs9L0YwmOj6C1
         QmYA==
X-Gm-Message-State: AC+VfDxjxoCBabRQteyFiL7tTK6nd66j+/PaiYA7o+J+OYuSFKE6O5On
	uGnJ4nbPb5D5x96s1XfremHDL/KH3Q9HijIfmgM=
X-Google-Smtp-Source: 
 ACHHUZ58EJc1NimrHm9HFKUT0yEW5424HAkwblu4NVsObmM2kI1uHfYW3uevL77UxjMv7aNkCKK/m62X0P8q3i6Lnnk=
X-Received: by 2002:a05:6214:b62:b0:629:78ae:80e3 with SMTP id
 ey2-20020a0562140b6200b0062978ae80e3mr3064231qvb.24.1686062098766; Tue, 06
 Jun 2023 07:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230523151223.109551-1-herve.codina@bootlin.com>
 <20230523151223.109551-8-herve.codina@bootlin.com>
 <ZHuFywIrTnEFpX6e@surfacebook>
 <20230606155404.28ada064@bootlin.com>
In-Reply-To: <20230606155404.28ada064@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 6 Jun 2023 17:34:22 +0300
Message-ID: 
 <CAHp75Vd00N8z7kgTb=WTZHJW3XhsKbLfhTTKPjnCvKUSfL+xDQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ASoC: codecs: Add support for the generic IIO
 auxiliary devices
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
Message-ID-Hash: 3DHUAOAV5OIYF4DCQ5N2XVQAIV5QGL7C
X-Message-ID-Hash: 3DHUAOAV5OIYF4DCQ5N2XVQAIV5QGL7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DHUAOAV5OIYF4DCQ5N2XVQAIV5QGL7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 6, 2023 at 4:54=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:
> On Sat, 3 Jun 2023 21:26:19 +0300
> andy.shevchenko@gmail.com wrote:
> > Tue, May 23, 2023 at 05:12:21PM +0200, Herve Codina kirjoitti:

...

> > > +   int max;
> > > +   int min;
> >
> > Wondering if there is already a data type for the ranges (like linear_r=
ange.h,
> > but not sure it's applicable here).
>
> Seems not applicable here.
>  - IIO does not use linear_range or something similar. It just uses simpl=
e int.
>  - ASoC does not use linear_range or something similar. It just uses simp=
le long.
>
> So, I keep the simple int min and max.

Sure.

...

> > > +   return 1; /* The value changed */
> >
> > Perhaps this 1 needs a definition?
>
> Yes but to be coherent, in ASoC code, many places need to be changed too
> in order to use the newly defined value.
> I don't think these modifications should be part of this series.

Yes, we are all for consistency.

...

> > > +   for (i =3D 0; i < iio_aux->num_chans; i++) {
> > > +           iio_aux_chan =3D iio_aux->chans + i;
> > > +
> > > +           ret =3D of_property_read_string_index(np, "io-channel-nam=
es", i,
> > > +                                               &iio_aux_chan->name);
> > > +           if (ret < 0) {
> > > +                   dev_err(iio_aux->dev, "%pOF: failed to read io-ch=
annel-names[%d]\n", np, i);
> > > +                   return ret;
> >
> > Ditto.
> Will be changed in next iteration.
> >
> > > +           }
> >
> > > +           tmp =3D 0;
> > > +           of_property_read_u32_index(np, "snd-control-invert-range"=
, i, &tmp);
> >
> > > +           iio_aux_chan->is_invert_range =3D tmp;
> >
> > You can use this variable directly.
>
> Not sure, is_invert_range is a bool and tmp is a u32.

Ah, I see.

> In previous iteration, I wrote
>   iio_aux_chan->is_invert_range =3D !!tmp;
>
> > > +   }
> >
> > Btw, can you avoid using OF APIs? It's better to have device property/f=
wnode
> > API to be used from day 1.
>
> Hum, this comment was raised in the previous iteration
>   https://lore.kernel.org/linux-kernel/20230501162456.3448c494@jic23-huaw=
ei/
>
> I didn't find any equivalent to of_property_read_u32_index() in the
> device_property_read_*() function family.
> I mean I did find anything available to get a value from an array using a=
n index.

This is done by reading the entire array at once and then parsing as
you wish in the code, device_property_read_u32_array() is for that.

> In the previous iteration it was concluded that keeping OF APIs in this s=
eries
> seemed "reasonable".

Maybe, but consider the above.

--
With Best Regards,
Andy Shevchenko
