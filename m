Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED78B3A37
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 16:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 633A91E93;
	Fri, 26 Apr 2024 16:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 633A91E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714142411;
	bh=GrYW9CDBavo2dcW9zM8Gw/4eM+v8rP9srC8IHUunxhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vbOi1pH3D4zc/086nN0ro1z9vt8oNLDc/zPHriu6cQxLsRJUmixdBmCOzTYAebPkS
	 vAbjICQYpSlG17ff41QuJLyLePCIzIFccCNRXs7NbWcoga/MzpuC/t+tIAQ5xWPqib
	 t+p914apubettciaZA4I47keQkhZj3oN2iaQGt6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B483BF8056F; Fri, 26 Apr 2024 16:39:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B7CF805A0;
	Fri, 26 Apr 2024 16:39:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE0DF802E8; Fri, 26 Apr 2024 16:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BA57F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 16:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA57F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GVOHIldh
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41adf3580dbso13493045e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714142364; x=1714747164;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6+Pa/hI1y9ZPcsTSA6wG8AnTaAGOiXpZcyJZzX026s=;
        b=GVOHIldh7lMZpTKXaPbZiG+wckx96sBvavej4UsgnmND7h5Y648cH8Jwaa0e30T86E
         aNL4nzMc8KuQUmwV8g50V2cp9p76XycVaDQiPmSJeuNazwR0TXO68BGiqGSaRxTp+Vpj
         xDJwPQV/Oe+rN7ZvRE4DxXKSfwH0zgZu5qOxjuzzOBd+FkaKg6KIzWmp+flYPuGu1khZ
         00Zg2GWmOO03e49v5EdrOkf0k9CX0I9Fnb5zIq1jlV1sL00zHAx8+4zsxjmlXuI3ozWV
         uqVK05DFavk4gm+HbYulJkxXmD2B7JyYQwa5Lgzljf4ySCXtZAcaEzkHtzdDNxs4x8IW
         PRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142364; x=1714747164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6+Pa/hI1y9ZPcsTSA6wG8AnTaAGOiXpZcyJZzX026s=;
        b=sFa54m0IxF3PoIEZUyIM0dYKm8/NUjwc1xIOenxj7dC6Cste3znkYx5YOLOvnuKb2X
         HPH2VOMtPUhmDcb51opf39ZEi+17OVIpHugXF6Mavp6T7bXbp8iNv3wdT3k+2EWl+WF1
         quoNWP0gAzI30/c+pPmM3gVvA9li75bt/bj40mDp5L/WUaF5noaEBSYqUT34n4MI2HhF
         AFsvT5p9o8HTGDxxRJPhPplD2Nx/wueRbCR7Zufxh9wAhmCuIwhe3ftpjAXc9Pf46VbS
         aTqAbnzobnvKuhsDJoV9bniBre/GfB9fo4t7Y0aKAXhiNtJc1/pyAF0weYEsR+nm9dqG
         rc8Q==
X-Gm-Message-State: AOJu0Yyj9wmHWnQ+WnPw0snVxKKNDqXrtZRFDh+yAMjoTJO+PXGfx4WK
	07z+AOiwrmKZ9PA+Cmw6ERXqQ5qYXNJJ6NozjVkbp5laMeWoCY6W
X-Google-Smtp-Source: 
 AGHT+IEeWmdV/an942UKZb0UcElZTOltLZZNCg90qG5k3ACvdMG2TZ2EWCL32aHLDIlkCsd0vGPv5g==
X-Received: by 2002:a05:600c:3b86:b0:419:618:ade3 with SMTP id
 n6-20020a05600c3b8600b004190618ade3mr2897823wms.19.1714142363495;
        Fri, 26 Apr 2024 07:39:23 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm35036561wmo.21.2024.04.26.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 07:39:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Joao Schim <joao@schimsalabim.eu>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH] ASoC: sunxi: DMIC: Add controls for adjusting the mic gains
Date: Fri, 26 Apr 2024 16:39:22 +0200
Message-ID: <2262648.iZASKD2KPV@jernej-laptop>
In-Reply-To: <e256942d-eba1-4800-bd02-c490167dea12@schimsalabim.eu>
References: 
 <20240422150213.4040734-1-joao@schimsalabim.eu>
 <5772237.DvuYhMxLoT@jernej-laptop>
 <e256942d-eba1-4800-bd02-c490167dea12@schimsalabim.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: OTO2WCVMVONFH5VY7C4YK5A37POGDHUS
X-Message-ID-Hash: OTO2WCVMVONFH5VY7C4YK5A37POGDHUS
X-MailFrom: jernej.skrabec@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTO2WCVMVONFH5VY7C4YK5A37POGDHUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne =C4=8Detrtek, 25. april 2024 ob 13:03:56 GMT +2 je Joao Schim napisal(a=
):
> On 4/24/24 20:42, Jernej =C5=A0krabec wrote:
> > Hi Joao,
> Hi Jernej,  thanks for your prompt response.
> >
> > Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napisal=
(a):
> >> The AllWinner H6 and later SoCs that sport a DMIC block contain a set =
of registers to control
> >> the gain (left + right) of each of the four supported channels.
> >>
> >> Add ASoC controls for changing each of the stereo channel gains using =
alsamixer and alike
> > Add SoB tag.
> Yeah, i realized that too late. Thanks for bringing that to my=20
> attention. I will add it in v1.
> >
> >> ---
> >>   sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 34 insertions(+)
> >>
> >> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dm=
ic.c
> >> index c76628bc86c6..f8613d8c3462 100644
> >> --- a/sound/soc/sunxi/sun50i-dmic.c
> >> +++ b/sound/soc/sunxi/sun50i-dmic.c
> >> @@ -14,6 +14,7 @@
> >>   #include <sound/dmaengine_pcm.h>
> >>   #include <sound/pcm_params.h>
> >>   #include <sound/soc.h>
> >> +#include <sound/tlv.h>
> >>  =20
> >>   #define SUN50I_DMIC_EN_CTL			(0x00)
> >>   	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> >> @@ -43,6 +44,17 @@
> >>   	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
> >>   #define SUN50I_DMIC_CNT				(0x2c)
> >>   	#define SUN50I_DMIC_CNT_N				(1 << 0)
> >> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
> >> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
> >> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
> >> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
> >> +
> >>   #define SUN50I_DMIC_HPF_CTRL			(0x38)
> >>   #define SUN50I_DMIC_VERSION			(0x50)
> >>  =20
> >> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of_m=
atch[] =3D {
> >>   };
> >>   MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
> >>  =20
> >> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, =
1);
> > DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE shoul=
d be
> > used instead.
> I can't seem to find that define in HEAD. what code-base are you=20
> referring to that i should checkout ?

Here is define:=20
https://elixir.bootlin.com/linux/v6.9-rc1/source/include/uapi/sound/tlv.h#L=
52

However, I'm not sure if this message means DECLARE_TLV_DB_SCALE is
deprecated or not:
https://elixir.bootlin.com/linux/v6.9-rc1/source/include/sound/tlv.h#L12

Best regards,
Jernej

> >
> > Other than that, it looks fine.
>=20
> Thanks.
>=20
> > Best regards,
> > Jernej
> >
> >> +
> >> +static const struct snd_kcontrol_new sun50i_dmic_controls[] =3D {
> >> +
> >> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D=
0D1_VOL_CTR,
> >> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_=
VOL_CTR_0R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D=
0D1_VOL_CTR,
> >> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_=
VOL_CTR_1R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D=
2D3_VOL_CTR,
> >> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_=
VOL_CTR_2R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D=
2D3_VOL_CTR,
> >> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_=
VOL_CTR_3R,
> >> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >> +
> >> +
> >> +};
> >> +
> >>   static const struct snd_soc_component_driver sun50i_dmic_component =
=3D {
> >>   	.name           =3D "sun50i-dmic",
> >> +	.controls	=3D sun50i_dmic_controls,
> >> +	.num_controls	=3D ARRAY_SIZE(sun50i_dmic_controls),
> >>   };
> >>  =20
> >>   static int sun50i_dmic_runtime_suspend(struct device *dev)
> >>
> >
> >
> >
> Kind regards,
>=20
> Joao
>=20
>=20




