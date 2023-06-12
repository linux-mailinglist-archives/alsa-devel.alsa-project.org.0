Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B672C8BD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550D2827;
	Mon, 12 Jun 2023 16:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550D2827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686580717;
	bh=dRf3o1MCmElp7pQN+JzTA3alqrvtQNGvLUgAxvm7Ro8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TA98rbH/b3dsaZboR7NTMIHIFSOOBIireK/PVVjoxlsZIMicQEGv9B1BUr/fylVHe
	 EucbjKJWgMdA+8Lz6KFNwhhQoR230ydyVHxtSi1qBtqN3e7njCbSzgIili12wtwD48
	 Krr0X2tWZTajrwJuIntnqFal+mzOTN16NnN9lR5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91FECF80130; Mon, 12 Jun 2023 16:37:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EEA5F80132;
	Mon, 12 Jun 2023 16:37:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAD57F80149; Mon, 12 Jun 2023 16:37:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B3F9F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3F9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=TDU4ml5c
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-62de651bcf0so9549076d6.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686580657; x=1689172657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmSsLFguTLJjtTHyvAvqjYdTmV32NSHTxBWlCv3zHog=;
        b=TDU4ml5ch6xZRnQ9VDKFueU/TLUi3rWBPsflKK6FSeqvLIYEecXz4u3zkxQ7AoTstz
         Shyv4Dbupw02KdavKgHB4oE+pEoPqnObV5pg6MxkRgzoGrGRX72UvhsjXD5Vu9dP9enz
         1vCF/QnSmAq48yAcYFnyQzQEjyL/vAULNGK26VkZXDFndIWcgpzORmgpO16JJ/Xfx+qc
         Knnr52TBoQjiU0QWHcFEEEIqSCrftgf3pycyVCDJSW899V2ManLnwg/Uym8Lh6ptcP3i
         zgXJLgKLXltamTjg5OK14C5jGfOF2WT3B/QBWET0aWs8PREt/z4q4/2/XgwiNU/6J3iX
         E1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686580657; x=1689172657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmSsLFguTLJjtTHyvAvqjYdTmV32NSHTxBWlCv3zHog=;
        b=WcCKyu4Ahi5M30Rm9MqG6Pc4uaSpJ0Cp910YoiQEurJw8BFBuACV/21XkgwRWQ/fxJ
         ABA6X86VpZ6Ht1Rt31zdhUCCO2MWmTL4Ms0G95Ye8GGuI3Cjxu/mlpNw/U7qAWYX3O1L
         j69bbPDB9bHx298mvYI5HXaVn7aZty/03Qb8eP6r3nYR/2gfj8YYVfY5pzPAhUVNDzcZ
         1ApnBLIzNaK0xM8tEf1s+skMi89EP76rrSdOGI50VnpB73CCARUsCiRVIp21SvBbV7E3
         j+tvUKyRa0fPHSVCPGr3ozMp660f/hAXCSG+x2Bmxf2Y37Cnrg6d0MVoyFVQDEfzQFOP
         KQrA==
X-Gm-Message-State: AC+VfDzbmSRdOHNES9cOn5RmifrvzLwXBpp6maQK6aZifBuLD4aPJuFW
	Pgrd3vSGJ2EC5RYZ5aIvGptRkdSYxXPSBYi6M24=
X-Google-Smtp-Source: 
 ACHHUZ7nS7ciyNOUxF5wEsTyHkkZkD4qaCOb8fp62HByN8hKzmuFZEHozZVENXt3UghG0BQYtizir1726/li13koNwQ=
X-Received: by 2002:a05:6214:f28:b0:625:aa1a:b6d9 with SMTP id
 iw8-20020a0562140f2800b00625aa1ab6d9mr10687001qvb.59.1686580656910; Mon, 12
 Jun 2023 07:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-12-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-12-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:37:00 +0300
Message-ID: 
 <CAHp75Vfz+vSJ7rQ4sxb0R+zRbrjipXUX3VpaHyvOWWePdPxejQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] ASoC: codecs: Add support for the generic IIO
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
Message-ID-Hash: FPI3RJX4TQAHWQJHJV55CS6SWLAQDFGG
X-Message-ID-Hash: FPI3RJX4TQAHWQJHJV55CS6SWLAQDFGG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPI3RJX4TQAHWQJHJV55CS6SWLAQDFGG/>
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
> Industrial I/O devices can be present in the audio path.
> These devices needs to be used as audio components in order to be fully
> integrated in the audio path.
>
> This support allows to consider these Industrial I/O devices as auxliary

auxiliary

> audio devices and allows to control them using mixer controls.

allows one to control?

...

> +#include <linux/iio/consumer.h>
> +#include <linux/minmax.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

> +#include <sound/soc.h>
> +#include <linux/string_helpers.h>

Perhaps a bit of order? And maybe a blank line between linux/* and sound/*?

> +#include <sound/tlv.h>

...

> +       struct snd_kcontrol_new control =3D {0};

0 is not needed.

...

> +static int audio_iio_aux_add_dapms(struct snd_soc_component *component,
> +                                  struct audio_iio_aux_chan *chan)
> +{
> +       struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(=
component);

> +       char *input_name =3D NULL;
> +       char *output_name =3D NULL;
> +       char *pga_name =3D NULL;

Now these assignments can be dropped.

> +       int ret;
> +
> +       input_name =3D kasprintf(GFP_KERNEL, "%s IN", chan->name);
> +       if (!input_name) {
> +               ret =3D -ENOMEM;
> +               goto out;
> +       }
> +       output_name =3D kasprintf(GFP_KERNEL, "%s OUT", chan->name);
> +       if (!output_name) {
> +               ret =3D -ENOMEM;
> +               goto out_free_input_name;
> +       }
> +       pga_name =3D kasprintf(GFP_KERNEL, "%s PGA", chan->name);
> +       if (!pga_name) {
> +               ret =3D -ENOMEM;
> +               goto out_free_output_name;
> +       }
> +
> +       widgets[0] =3D SND_SOC_DAPM_INPUT(input_name);
> +       widgets[1] =3D SND_SOC_DAPM_OUTPUT(output_name);
> +       widgets[2] =3D SND_SOC_DAPM_PGA(pga_name, SND_SOC_NOPM, 0, 0, NUL=
L, 0);
> +       ret =3D snd_soc_dapm_new_controls(dapm, widgets, 3);
> +       if (ret)
> +               goto out_free_pga_name;
> +
> +       routes[0].sink =3D pga_name;
> +       routes[0].control =3D NULL;
> +       routes[0].source =3D input_name;
> +       routes[1].sink =3D output_name;
> +       routes[1].control =3D NULL;
> +       routes[1].source =3D pga_name;
> +       ret =3D snd_soc_dapm_add_routes(dapm, routes, 2);
> +
> +       /* Allocated names are no more needed (duplicated in ASoC interna=
ls) */
> +
> +out_free_pga_name:
> +       kfree(pga_name);
> +out_free_output_name:
> +       kfree(output_name);
> +out_free_input_name:
> +       kfree(input_name);

> +out:

Seems redundant label, you can return directly.

> +       return ret;
> +}

...

With

  struct device *dev =3D &pdev->dev;

> +       iio_aux =3D devm_kzalloc(&pdev->dev, sizeof(*iio_aux), GFP_KERNEL=
);
> +       if (!iio_aux)
> +               return -ENOMEM;

You can make this kind of call neater.

...

> +       iio_aux->dev =3D &pdev->dev;
> +
> +       count =3D device_property_string_array_count(iio_aux->dev, "io-ch=
annel-names");

It's not recommended to switch over inside one function to a new
pointer even if they are the same. With dev here as a parameters it's
much easier to understand where the property is taken from.

> +       if (count < 0)
> +               return dev_err_probe(iio_aux->dev, count, "failed to coun=
t io-channel-names\n");

Ditto. And for the rest.

...

> +       iio_aux->chans =3D devm_kmalloc_array(iio_aux->dev, iio_aux->num_=
chans,

Esp. in this case, it will add confusion, because we have been having
the object lifetime issues with devm_*() APIs from the past and
then...

> +                                           sizeof(*iio_aux->chans), GFP_=
KERNEL);
> +       if (!iio_aux->chans)
> +               return -ENOMEM;

...

> +       /*
> +        * snd-control-invert-range is optional and can contain fewer ite=
ms
> +        * than the number of channel. Unset values default to 0.

channels

> +        */
> +       count =3D device_property_count_u32(iio_aux->dev, "snd-control-in=
vert-range");
> +       if (count > 0) {
> +               count =3D min_t(unsigned int, count, iio_aux->num_chans);
> +               device_property_read_u32_array(iio_aux->dev, "snd-control=
-invert-range",
> +                                              invert_ranges, count);

Probably good to check an error, while it might be almost a dead code.
If something happens during this we will at least know.

> +       }

--=20
With Best Regards,
Andy Shevchenko
