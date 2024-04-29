Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E778B615A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 20:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1C5828;
	Mon, 29 Apr 2024 20:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1C5828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714416514;
	bh=sfI+2cPmGTBiHB7TzIRHUCIU4s0NL0U1nLJOzraxfJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fKgwLH4QEPv+cTnb1q4ZiwmmztCEPW+Yj3hTkZ6vOISCpaUqGTX68JeFrgCQh8iuV
	 UFds2SKAI3Nkdusriisthxz+vI7JKwpaDP9PXTLm38hAehGbt9ieZ+KRqac6HMqEYS
	 PrrML/KqDtWmIeSyT/8qvRByfw1B1KxXnIFUvp1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39228F805A0; Mon, 29 Apr 2024 20:48:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F87F8057D;
	Mon, 29 Apr 2024 20:48:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4045F8028D; Mon, 29 Apr 2024 20:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 436AEF80100
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 20:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436AEF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EbmpAe+q
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5724e69780bso5127919a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714416471; x=1715021271;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq1Z6VTK+H4REXB+uZc6F5LGvhHCssGWCotvhjHscAA=;
        b=EbmpAe+qEaIY3izkbOVGFvS1ferSTsN8+SZur1aRE3tUYzBcLNlpUSS9d7hcMznnYc
         nwjzNHV4sLqTQ7HTxVKyTu1XWNDEAsvH40OMBGtbB8/1aecnH9TwFXs9tNfRZ37BKcNc
         NKNyNcbT810NjWiRqSSkCoV4O1mBN5VZ6TQ+SRK6PZHyHtYvy6bpQmUgrHhexA1jWBCj
         hBVmObvq7q09XAyynQ7qp1uZdjwq5KZKtwmhruLj7xHyQz3RHsEkSJwlDlbAs0EP562S
         39WOZRkemAXW01M8g8bvDlMcwsaoXh48XHhz34fDF6lD8mJDYARoeAkIOqgD49oIP9Y0
         NJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714416471; x=1715021271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq1Z6VTK+H4REXB+uZc6F5LGvhHCssGWCotvhjHscAA=;
        b=PAdhVHF7pzy8C0zfaTa6xfWhmBxZ2d/1CuSE/2x56Pp/Z92blCNTmqkFDcOmjr0Y/V
         8V/aNV7t8s3MjRQIzrW2tRr+zl/0VHW35GWevUdhHEjp7xo+iuJ+0ZO9XbzzET1gfZS5
         LmB0HhKyYobtmrzrHCMiEHqFqxNNjdbdsGbzo9CWtzsJqk5QrZHclEn+A3fQIiIMlmZR
         yiJsJQevlQWEVzwSKgPokFVZGyiImURnlYZNgwwx2jz0UoUOPFJZH+V4ioWhqiLEZIor
         p6bhaJX01kE8B7KKiSFlO4pXp1+V4y4zc6beOWXoA0PQWUGQawVqZhsaXziunqRX3qBZ
         0/rg==
X-Gm-Message-State: AOJu0YwjiZTu47VdKEOk+LVe22hZ0T5LD7yppJVH7g51lVd4mcHpfmQ+
	11Xfi5GzzJvCniVJIndOYTOJ77KKzRJo5umyuluK9k7FgQw797cB2fwak2uR
X-Google-Smtp-Source: 
 AGHT+IG74LosNrsxgNf3gc2r6uvMZ7rXw4CtwJXibhsrxCiW+Y7ui7n7Uf15AUcOBckBy6ODLx9I+w==
X-Received: by 2002:a17:906:fb86:b0:a58:c80e:edd9 with SMTP id
 lr6-20020a170906fb8600b00a58c80eedd9mr5671018ejb.77.1714416470804;
        Mon, 29 Apr 2024 11:47:50 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id
 i22-20020a1709061cd600b00a55a10eb070sm11150150ejh.214.2024.04.29.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 11:47:50 -0700 (PDT)
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
Date: Mon, 29 Apr 2024 20:47:49 +0200
Message-ID: <2179677.irdbgypaU6@jernej-laptop>
In-Reply-To: <534a73a7-bc41-42a7-a060-bc1465f3a21e@schimsalabim.eu>
References: 
 <20240422150213.4040734-1-joao@schimsalabim.eu>
 <2262648.iZASKD2KPV@jernej-laptop>
 <534a73a7-bc41-42a7-a060-bc1465f3a21e@schimsalabim.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: PYBGZOHTZ2LUZ7NYN5EQBP7IDX44BGVI
X-Message-ID-Hash: PYBGZOHTZ2LUZ7NYN5EQBP7IDX44BGVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYBGZOHTZ2LUZ7NYN5EQBP7IDX44BGVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne ponedeljek, 29. april 2024 ob 20:39:24 GMT +2 je Joao Schim napisal(a):
> On 4/26/24 16:39, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 25. april 2024 ob 13:03:56 GMT +2 je Joao Schim napis=
al(a):
> >> On 4/24/24 20:42, Jernej =C5=A0krabec wrote:
> >>> Hi Joao,
> >> Hi Jernej,  thanks for your prompt response.
> >>> Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napis=
al(a):
> >>>> The AllWinner H6 and later SoCs that sport a DMIC block contain a se=
t of registers to control
> >>>> the gain (left + right) of each of the four supported channels.
> >>>>
> >>>> Add ASoC controls for changing each of the stereo channel gains usin=
g alsamixer and alike
> >>> Add SoB tag.
> >> Yeah, i realized that too late. Thanks for bringing that to my
> >> attention. I will add it in v1.
> >>>> ---
> >>>>    sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++=
++++
> >>>>    1 file changed, 34 insertions(+)
> >>>>
> >>>> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-=
dmic.c
> >>>> index c76628bc86c6..f8613d8c3462 100644
> >>>> --- a/sound/soc/sunxi/sun50i-dmic.c
> >>>> +++ b/sound/soc/sunxi/sun50i-dmic.c
> >>>> @@ -14,6 +14,7 @@
> >>>>    #include <sound/dmaengine_pcm.h>
> >>>>    #include <sound/pcm_params.h>
> >>>>    #include <sound/soc.h>
> >>>> +#include <sound/tlv.h>
> >>>>   =20
> >>>>    #define SUN50I_DMIC_EN_CTL			(0x00)
> >>>>    	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> >>>> @@ -43,6 +44,17 @@
> >>>>    	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
> >>>>    #define SUN50I_DMIC_CNT				(0x2c)
> >>>>    	#define SUN50I_DMIC_CNT_N				(1 << 0)
> >>>> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
> >>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
> >>>> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
> >>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
> >>>> +
> >>>>    #define SUN50I_DMIC_HPF_CTRL			(0x38)
> >>>>    #define SUN50I_DMIC_VERSION			(0x50)
> >>>>   =20
> >>>> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of=
_match[] =3D {
> >>>>    };
> >>>>    MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
> >>>>   =20
> >>>> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75=
, 1);
> >>> DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE sho=
uld be
> >>> used instead.
> >> I can't seem to find that define in HEAD. what code-base are you
> >> referring to that i should checkout ?
> > Here is define:
> > https://elixir.bootlin.com/linux/v6.9-rc1/source/include/uapi/sound/tlv=
=2Eh#L52
> >
> > However, I'm not sure if this message means DECLARE_TLV_DB_SCALE is
> > deprecated or not:
> > https://elixir.bootlin.com/linux/v6.9-rc1/source/include/sound/tlv.h#L12
>=20
> Right, apparently i sneaked in another D in the name. That explains i=20
> could not find it.
>=20
> Will send v1 in a few minutes. Thanks.

that would be v2?

v1 is first submission and it's usually not marked as such.

Best regards,
Jernej

>=20
> Kind regards,
>=20
> Joao
>=20
> > Best regards,
> > Jernej
> >
> >>> Other than that, it looks fine.
> >> Thanks.
> >>
> >>> Best regards,
> >>> Jernej
> >>>
> >>>> +
> >>>> +static const struct snd_kcontrol_new sun50i_dmic_controls[] =3D {
> >>>> +
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC=
_D0D1_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D=
1_VOL_CTR_0R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC=
_D0D1_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D=
1_VOL_CTR_1R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC=
_D2D3_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D=
3_VOL_CTR_2R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC=
_D2D3_VOL_CTR,
> >>>> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D=
3_VOL_CTR_3R,
> >>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
> >>>> +
> >>>> +
> >>>> +};
> >>>> +
> >>>>    static const struct snd_soc_component_driver sun50i_dmic_componen=
t =3D {
> >>>>    	.name           =3D "sun50i-dmic",
> >>>> +	.controls	=3D sun50i_dmic_controls,
> >>>> +	.num_controls	=3D ARRAY_SIZE(sun50i_dmic_controls),
> >>>>    };
> >>>>   =20
> >>>>    static int sun50i_dmic_runtime_suspend(struct device *dev)
> >>>>
> >>>
> >>>
> >> Kind regards,
> >>
> >> Joao
> >>
> >>
> >
> >
> >
>=20




