Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F0559E5A6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E4F839;
	Tue, 23 Aug 2022 17:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E4F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661267234;
	bh=9R/Hhk7MsM4NZY07827tMCEz0EUQHNM5ZNp2z82n6vk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3tbckzz0PD3v+tBbf3Alo6fOSIOL9jZOJwq8A8tcfElR3jB3dfsdY+BqSvCgIVE8
	 Qrvl70DFIBv8gnr+rjxuLIJ3G4Bql5fsqRnt3FCpJhmDc/yfjBJyZL+Gq5DdNFHeXd
	 nTrpFUv9NIw0jXRRVJMw8NlTb8NVlVs/TgCDIOAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0016F8030F;
	Tue, 23 Aug 2022 17:06:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEEC2F8027B; Tue, 23 Aug 2022 17:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C04F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 17:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C04F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KkfQbrhG"
Received: by mail-lf1-x12c.google.com with SMTP id z25so20091944lfr.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=VJHggJrXUECXF1xW3QM4wk2gjCgbLyYnmdBIRbWHJ0o=;
 b=KkfQbrhGiaLnkb0oji/NWEZKJYFvE+B4a64fNr0zRfUdDxD378XhQ0bptKoXRu/LxY
 YP5vn2LgfxtnY1yAMbCnPdy3y1z1EGCG0ViHXI/W8wW8nElZfCI7zVHghRoqr2EFlORK
 EPQpqXSKHmD4qXsHT0kOaXkIjdjuZ2qnoI/DuyXzH5HkmRawke8l7ZP/pJ7FPgqz6Nxs
 cyFChKO7s89+kF3zwVf8VoEsQSur6btK3amnNx+KPvd0lM+ecvOBU4W7NnXOIgH8J9vY
 ciO9cwMDoWRR06fg5lDeqtGmum+lzEkPTmVhnW1L1dzpeHAKIE2PCjoVwBaoq/jnvlsU
 n1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=VJHggJrXUECXF1xW3QM4wk2gjCgbLyYnmdBIRbWHJ0o=;
 b=Bvi9IVNyg6g5aQDu7tMHu9bquzW0ppUlT4P6WLHi1aAmdRm47H6qInZ8vOBahqs6Fs
 C8DUdofI3aLLs9jjR1O5ngnWeQ8uHwKBB57KbhW+cawK6rg/kYXP3P9Zr28Zl4lxixXh
 ILuIW13vtWnff2cSI14t9thqGEuW6iKxalvxb9B/tb1I6MgzItkPuKImWgFgkzaAREDz
 9gZQv/EqBiarXzXh1O0rTwQmbK/wIjjKSJ1ScasINl+wkbz6F4NdrmBqzfv3LOgw7Dmz
 3dxqv9Q0d5aY7AOHYMku5Kfe1/IZwQUKmf2BSegD6ZG02i4NU83aOS6euK0Z0P+W9Ei9
 ZSqA==
X-Gm-Message-State: ACgBeo2vb97MvMk9FDg1g1S/gHGNz4vGEtm/I1M0sxcq9juBtTqMuA0U
 baVHfEgLiI61F6cQmC/YoiyBXBn1q2vo6zHSnw==
X-Google-Smtp-Source: AA6agR5yf7CJlkdb16VaqT3lOTfQpaQ54bSbX0HBlt0wHLsTJMZY77kR0zG95Y2QP/1vSZn4TAW7emJh0mtO+H91VqY=
X-Received: by 2002:a05:6512:3b0f:b0:492:ef21:33a0 with SMTP id
 f15-20020a0565123b0f00b00492ef2133a0mr2133149lfv.419.1661267164196; Tue, 23
 Aug 2022 08:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <1660229343-14133-1-git-send-email-fengzheng923@gmail.com>
 <73dceca7-5244-ffa6-6ead-d4de84584b68@linux.intel.com>
In-Reply-To: <73dceca7-5244-ffa6-6ead-d4de84584b68@linux.intel.com>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Tue, 23 Aug 2022 23:05:52 +0800
Message-ID: <CAE=m61-djqRrCCaWgQQA+Qhf06ZObeHrPvrCz3+13nEDGgyueA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, samuel@sholland.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jernej.skrabec@gmail.com,
 lgirdwood@gmail.com, wens@csie.org, broonie@kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com> =E4=BA=
=8E2022=E5=B9=B48=E6=9C=8812=E6=97=A5=E5=91=A8=E4=BA=94
23:20=E5=86=99=E9=81=93=EF=BC=9A

> On 8/11/2022 4:49 PM, Ban Tao wrote:
> > The Allwinner H6 and later SoCs have an DMIC block
> > which is capable of capture.
> >
> > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> > ---
>
> ...
>
> > +
> > +#define SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000)
>
> Seeing supported rates in hw_params callback, you probably want to take
> a look at SNDRV_PCM_RATE_KNOT?
>

No, I don't need SNDRV_PCM_RATE_KNOT. Dmic does not support unknown rates.


>
> > +#define SUN50I_DMIC_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S24_LE)
> > +
> > +static struct snd_soc_dai_driver sun50i_dmic_dai =3D {
> > +     .capture =3D {
> > +             .channels_min =3D 1,
> > +             .channels_max =3D 8,
> > +             .rates =3D SUN50I_DMIC_RATES,
> > +             .formats =3D SUN50I_DMIC_FORMATS,
> > +             .sig_bits =3D 21,
> > +     },
> > +     .probe =3D sun50i_dmic_soc_dai_probe,
> > +     .ops =3D &sun50i_dmic_dai_ops,
> > +     .name =3D "dmic",
> > +};
> > +
>
> ...
>
>
