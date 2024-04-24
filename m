Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5F8B12A2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 20:43:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E82720E;
	Wed, 24 Apr 2024 20:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E82720E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713984200;
	bh=Itcg+Jd23ZQ0QilHdje/jSd9t3UqWVBHp9CbQrEwRDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BjOHvAy3i+IVTHrkRaKS/49iqzKga9soz+vJHvoXSq9+ofuoFqHLmWxL85LXt+BcX
	 WXMH16bOQCo98KfKnpXhBF90LuVLNc4GQXrcR8gfIWtClM3N2H5p2s1xPju1Fj3uIn
	 R6TjyCxm74KQjOeTadkrTxO1oMYM5DCqHi7xoFFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 490D7F80570; Wed, 24 Apr 2024 20:42:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1807F80570;
	Wed, 24 Apr 2024 20:42:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24E8FF80423; Wed, 24 Apr 2024 20:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C970EF800B5
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 20:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C970EF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z84Rb1C9
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-571bddd74c1so144905a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Apr 2024 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713984151; x=1714588951;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol9krzBmTOyIuy1ft27l71rabBxmYrw1+e+89jby570=;
        b=Z84Rb1C9JgKyPfNZNLQYDUeYe1EEg8B4MA3m2tgxQRGaQ9aKe+hVVuP9lUvNxNYnU/
         Kvn4522tZkpbc/JgNPJ2jpjWeUtBjTk1iWyE7aaX/DQtGSjf7ENrpN+fkQ/nJJhlgY9y
         2olvQMAK76B155FjwN12NayGD0aGINTnz6VnFXOUCNMLEu8u9MZa60a2nxX7ETDekDmM
         uFDD29wsAWcvAtGmwkvfj+k5pZIOUHvcxaajscLiUpCbuWMNTWkjBGMTlQHaGYTLqDSM
         vsfhDejkaQvt2l3aq6oAaZg5irn9UmVyyM2GrYhi5w1QGiHld59XDXoQ/Ka6funLJ6kf
         h1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713984151; x=1714588951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol9krzBmTOyIuy1ft27l71rabBxmYrw1+e+89jby570=;
        b=I1hHuvmWQ7kmOH3ICVEvX2n2zxNtN9KY+C78ky2jd9feTdsU/vGOTvSWHYb3ataNDM
         05R5gV8ceEr5tkuOu1hfumOUNi+vhrW90RYS4Yp4ENsEB1XQK6baDgYsHlTqLdDoo3GP
         ox4vZhtCYOPobB4mFCDoDVnC3Zv/xxTrXh1we4gS3uIb7f39QzR6HllxLCW40gHyJz0L
         dVW+OSaoTaEt3/L70zeUznPaXB9+f/SU+PsxO+d3cVBJHxn8LWYdI2tdjFjr3S7psZXY
         SL7/vjcLmgU+lQgL8lJhc46TlhdO4ygZWbDez6T2IM3GuETPxuSDWM3a+8MJlT8luyZy
         aK0g==
X-Gm-Message-State: AOJu0YxHX4DxuPJ+Cg+cs596jtLFu5jdkd3TAJ46dYabhFcyCdBZRE4i
	Yau+dh4iEWrMKuUkAEZVOGwD/cCIL0fX9UL5UVSpDifyt422fsBb
X-Google-Smtp-Source: 
 AGHT+IFJqfBO5mQOjDTG16NEhTc1tvbEXpcR5UL3y/xbDmPZLBWl1fVr9z9AG8k1xyje5QaUGr0gWw==
X-Received: by 2002:a50:9e64:0:b0:566:2f24:b063 with SMTP id
 z91-20020a509e64000000b005662f24b063mr2220945ede.23.1713984150928;
        Wed, 24 Apr 2024 11:42:30 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id
 j2-20020aa7de82000000b005720e083878sm3644714edv.49.2024.04.24.11.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 11:42:30 -0700 (PDT)
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
Date: Wed, 24 Apr 2024 20:42:29 +0200
Message-ID: <5772237.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240422150213.4040734-1-joao@schimsalabim.eu>
References: <20240422150213.4040734-1-joao@schimsalabim.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: TRJJOWXN2MDADRXBOTOJ27ZIPHJPUI75
X-Message-ID-Hash: TRJJOWXN2MDADRXBOTOJ27ZIPHJPUI75
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRJJOWXN2MDADRXBOTOJ27ZIPHJPUI75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Joao,

Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napisal(a):
> The AllWinner H6 and later SoCs that sport a DMIC block contain a set of registers to control
> the gain (left + right) of each of the four supported channels.
> 
> Add ASoC controls for changing each of the stereo channel gains using alsamixer and alike

Add SoB tag.

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..f8613d8c3462 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -14,6 +14,7 @@
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> +#include <sound/tlv.h>
>  
>  #define SUN50I_DMIC_EN_CTL			(0x00)
>  	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> @@ -43,6 +44,17 @@
>  	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
>  #define SUN50I_DMIC_CNT				(0x2c)
>  	#define SUN50I_DMIC_CNT_N				(1 << 0)
> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
> +
>  #define SUN50I_DMIC_HPF_CTRL			(0x38)
>  #define SUN50I_DMIC_VERSION			(0x50)
>  
> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
>  
> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, 1);

DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE should be
used instead.

Other than that, it looks fine.

Best regards,
Jernej

> +
> +static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
> +
> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +
> +
> +};
> +
>  static const struct snd_soc_component_driver sun50i_dmic_component = {
>  	.name           = "sun50i-dmic",
> +	.controls	= sun50i_dmic_controls,
> +	.num_controls	= ARRAY_SIZE(sun50i_dmic_controls),
>  };
>  
>  static int sun50i_dmic_runtime_suspend(struct device *dev)
> 




