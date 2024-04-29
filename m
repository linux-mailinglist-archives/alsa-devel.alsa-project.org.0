Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D68B6312
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 22:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4BB9828;
	Mon, 29 Apr 2024 22:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4BB9828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714421001;
	bh=v+dxWNWY34GkaZ5wYOrRbLg5bO3DUAUxb8ICY4EgA1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=atqu/lHcyGPJLAWRJcdy7ZyPuTqlxpmP9QD769o3jccAOKtqAX47qA6H3HrUYuZkD
	 +bNBci6pCL/xb3UXAfzsuOsswNmRPK5mvhH31H1RDZBICU7RqAcI6kui3b60LNlV6j
	 QnYRumQsthQ8Ai+y9ugZcaLf3ObZ+mfNGIXqT+Dg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2003EF805A9; Mon, 29 Apr 2024 22:02:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0150DF8059F;
	Mon, 29 Apr 2024 22:02:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92F83F8028D; Mon, 29 Apr 2024 22:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF27EF800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 22:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF27EF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DDqa6IuA
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5724f26b8c9so6696389a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714420946; x=1715025746;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsKE8r7F5xni1GwzY6+eg4w0O41Z5E2Stz6sTWPm390=;
        b=DDqa6IuAhOMpGof58lFIo2eDflshJgRtxUpC0jYpNmUvuM6YPGRgH3HOgcA/41MnzF
         l1/5yrzruJX7hLWCvlYETFtYGajHOrYP8scp31gfi4kADvmY+W3lm4Uj50Kl+o6uKIKQ
         ZKskc/NjbtsT0PtyNXOL1/tXn/gnDiLw8iEvl/viOi4EkeEdRK6zz2TXOyJJoBLquEF4
         vfoCixpFb6sYhRFYa7kgc0an0hSh1oGobLrB7fBzvOOvaB1jmd1/FA4zNierWWppRgjf
         AlkLntXKgjh90uRKG3Nt4qurNgmKUeiALDh10CkVjCtMRJvGPwBuUAtb/rj+uZEhFTNc
         FJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714420946; x=1715025746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsKE8r7F5xni1GwzY6+eg4w0O41Z5E2Stz6sTWPm390=;
        b=Kk4H1gNOD7ettTDPsNAoY7YtCmH4rcgWzjcCFxXI5WhZnUaTl6LnKwXpf4KrPAeFKA
         lYfgBUdzmssjvEsNJuFQFM/O/+SK7rYJAlwbAQXenv9qFbKzt0kYXceTHh7QyDv6O/tf
         UJ/TntX7B3LKpQYv0N8s/PWzTBp4gINSvLW+cdnmb0ch/kOtdablAwS3pGVAqtVZWd2j
         yQA7c2hqYRslGJvDhfGJEXc/mqxe11nfpUItHPSYogCE7rpTB1X9FSt3L0Rxc/bGo+C/
         OmGQH+yOHSltQJlpBCM9zYw5S/dAjAFu/ko2BbY2m5MGIeRReR6oWovsmm8HNsE4ndkb
         4Ezw==
X-Gm-Message-State: AOJu0YyrVnz0o1k+AmnAdjc2MQSYVqvPZiEw82A7LvLo9XPmO5ppPH1F
	cYA0CLbadS7P7sCZROpdgEgtAoHMLtn0Wrs1n6O4MEG0YNRT96YM
X-Google-Smtp-Source: 
 AGHT+IHIKx0SyAjsW4Smx5uzNZpKk0OnRHPvT5Zv6XPyI3hdLPyaGW8TdxmJ1VY4Gefq40RqnxSymg==
X-Received: by 2002:a17:907:7e9e:b0:a58:e8cf:664f with SMTP id
 qb30-20020a1709077e9e00b00a58e8cf664fmr718919ejc.23.1714420945336;
        Mon, 29 Apr 2024 13:02:25 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b00a555ef55ab5sm14215787ejj.218.2024.04.29.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:02:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Joao Schim <joao@schimsalabim.eu>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH v2] ASoC: sunxi: DMIC: Add controls for adjusting the mic gains
Date: Mon, 29 Apr 2024 22:02:23 +0200
Message-ID: <2931892.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240429194920.1596257-1-joao@schimsalabim.eu>
References: <20240429194920.1596257-1-joao@schimsalabim.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: QKB7CIGDHJFRGTNKE7MO37LIR77SVZJV
X-Message-ID-Hash: QKB7CIGDHJFRGTNKE7MO37LIR77SVZJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKB7CIGDHJFRGTNKE7MO37LIR77SVZJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne ponedeljek, 29. april 2024 ob 21:49:20 GMT +2 je Joao Schim napisal(a):
> The AllWinner H6 and later SoCs that sport a DMIC block contain a set of registers to control
> the gain (left + right) of each of the four supported channels.
> 
> Add ASoC controls for changing each of the stereo channel gains using alsamixer and alike
> 
> Signed-off-by: Joao Schim <joao@schimsalabim.eu>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..dd32780fb6a4 100644
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
> +static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, 1);
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




