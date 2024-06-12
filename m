Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94137905AA0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 20:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AB3E68;
	Wed, 12 Jun 2024 20:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AB3E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718216345;
	bh=uM3A/QTCQEjzoE7Sb7paEO05DthHFo3RxVjPzBe73CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q9scW0bkKmN0CnERnNyxmjyHZqnFCCeckQxtbTBaJCDUebaFJz0I/ZJKXdO+3Ggnk
	 3EF7G/sJelSFYdCbTyU/UsxFGgiKMu5JtDUOP2NXfJrpuzp4BL+viG5XLuGwkpRfam
	 YdkmE2PMgw0Z4ZRFrHtygydHd+9mN0N1qKU8DiS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71DD4F805BB; Wed, 12 Jun 2024 20:18:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05160F805A1;
	Wed, 12 Jun 2024 20:18:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE322F8057A; Wed, 12 Jun 2024 20:18:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E9B5F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 20:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E9B5F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=heJ9YYsO
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52c84a21c62so231451e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 11:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216303; x=1718821103;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DheaBl17/wrTIWUg8nbFGKDT2XQ2iKfGsx9zy/UKyc=;
        b=heJ9YYsOKhlyYBfdHmqny771nO9yrK60JRd53VtB5nNcD47NUD0iUrNBZ576BLcl8d
         Y9kecyJmAkDAY+pHyAz5XEhP+fe4ZPwHGN4/7K8ZoVo9qpPah5thODxBe5tIGGcFhQ0e
         Y6me+Eb/CG+FYheFyKxcGVzz9T3wdD16RV7CkFLSKAX1fdUl3fhAGErjBbbpCJp/nW8P
         XH2kZqMm0uga6VhrwsZqZdYu8WSZcwKrNL0vB9UaBsdPfv7vsORe2VgFiIks8yt4+Dmz
         /r+RkEBNXSTIgNA65yKOYaXZr2sBNxnGf9wZ8VkVEnv/5mN7cpaxXMBSA5mlqueRGR8L
         VLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216303; x=1718821103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DheaBl17/wrTIWUg8nbFGKDT2XQ2iKfGsx9zy/UKyc=;
        b=gw74xn7oSpTadxnuCRcu5XtzCP7vC9aRafYt2ac8BAFpLwxqEZrUCHm9yMkWlr84fM
         7+oEPAossTlIUvXuCETXAxB968PrUhi95aAhkgxT7NwwbEwTYfSU5Om3XuL3E6W9AJoN
         oH5IRXbDnYRBzM5CWS+F1PjpweBThzDxDuG+7imIp8GjaqFrIokM8S5RDY7fGCmv11xp
         0Qgfi4c0dBKLDxvpRQRgMyJqW5GJOxpFv5csu3/chjAy1Mkr9n+OBvS+NYC9NKNXMzgt
         Xhn4cJEFHXpCdrq7R9S/gNr5p2cdI8KKVsjhflTKGAAxDnu9XBKA1Wzyd2S9OAcCu2Js
         3HaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu1IRgU1rytgvJeilYr/huk7x1ikgBx/mH/qzpG9Ti/UI6ryIXKi1vU12eXiiRwocMXXBrkVQe6g6F99YQFFrb1eFaV4AxLwcUmik=
X-Gm-Message-State: AOJu0YxeMhwENJwU9YhSvpsQX0m4yU7Mbxdg7gOEWjPw+S8h1GrV8jpW
	8yQgH/jynLJOrFd6Zbtmleb4cbXD7+Po5zYryt54R6gmXl7E39TLC/Fbhc9+6Xg1BPsyf2+TfRd
	PLcI=
X-Google-Smtp-Source: 
 AGHT+IFcasEe0j+9Di1GUyrChBO1YQv6qWzK+DWEa4zNpTKfqOdA++2fywZcmCRWBqpOyN+ZJKK/+Q==
X-Received: by 2002:a19:e05c:0:b0:52c:9ab1:a312 with SMTP id
 2adb3069b0e04-52c9ab1a41fmr1520496e87.4.1718216303424;
        Wed, 12 Jun 2024 11:18:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c97093be4sm606349e87.157.2024.06.12.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:18:22 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
Message-ID: <dxkgfqxdx4kovs4lfgl6y22chv7b7skmacpttp2z5nzhqj2ijh@6sofslw756mp>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>
Message-ID-Hash: PJRJ6EMXW7ZBUS2PIEUNATC6OPHZM4VT
X-Message-ID-Hash: PJRJ6EMXW7ZBUS2PIEUNATC6OPHZM4VT
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJRJ6EMXW7ZBUS2PIEUNATC6OPHZM4VT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 12, 2024 at 05:57:23PM +0100, Srinivas Kandagatla wrote:
> LPASS Codec v2.5 has significant changes in the rx register strides.
> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
> after SM8450 have only Left working.
> 
> This patch adjusts the registers to accomdate 2.5 changes. With this
> fixed now L and R are functional on Headset playback.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 220 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 207 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 8beeacbd6ae6..7e8bb005b0b9 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -262,6 +262,53 @@
>  #define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
>  #define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
>  #define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
> +
> +/* LPASS CODEC version 2.5 rx reg offsets */
> +#define CDC_2_5_RX_RX1_RX_PATH_CTL		(0x04c0)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG0		(0x04c4)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG1		(0x04c8)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG2		(0x04cC)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG3		(0x04d0)
> +#define CDC_2_5_RX_RX1_RX_VOL_CTL		(0x04d4)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_CTL		(0x04d8)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_CFG		(0x04dC)
> +#define CDC_2_5_RX_RX1_RX_VOL_MIX_CTL		(0x04e0)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC1		(0x04e4)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC2		(0x04e8)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC3		(0x04eC)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC4		(0x04f0)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC7		(0x04f4)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0		(0x04f8)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1		(0x04fC)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_CTL		(0x0500)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1	(0x0504)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2	(0x0508)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3	(0x050C)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4	(0x0510)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5	(0x0514)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6	(0x0518)
> +
> +#define CDC_2_5_RX_RX2_RX_PATH_CTL		(0x0580)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG0		(0x0584)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG1		(0x0588)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG2		(0x058C)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG3		(0x0590)
> +#define CDC_2_5_RX_RX2_RX_VOL_CTL		(0x0594)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_CTL		(0x0598)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_CFG		(0x059C)
> +#define CDC_2_5_RX_RX2_RX_VOL_MIX_CTL		(0x05a0)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC0		(0x05a4)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC1		(0x05a8)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC2		(0x05aC)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC3		(0x05b0)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC4		(0x05b4)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC5		(0x05b8)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC6		(0x05bC)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC7		(0x05c0)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0		(0x05c4)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1		(0x05c8)
> +#define CDC_2_5_RX_RX2_RX_PATH_DSM_CTL		(0x05cC)
> +
>  #define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
>  #define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
>  #define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
> @@ -764,6 +811,8 @@ static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
>  			    rx_int_dem_inp_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
>  			    rx_int_dem_inp_mux_text);
> +static SOC_ENUM_SINGLE_DECL(rx_2_5_int1_dem_inp_enum, CDC_2_5_RX_RX1_RX_PATH_CFG1, 0,
> +			    rx_int_dem_inp_mux_text);
>  
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
> @@ -1083,6 +1132,52 @@ static const struct reg_default rx_defaults[] = {
>  	{ CDC_RX_DSD1_CFG2, 0x96 },
>  };
>  
> +static const struct reg_default rx_2_5_defaults[] = {
> +	{ CDC_2_5_RX_RX1_RX_PATH_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG0, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG1, 0x64 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG2, 0x8F },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG3, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_VOL_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
> +	{ CDC_2_5_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC1, 0x08 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC2, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC3, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC4, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC7, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG0, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG1, 0x64 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG2, 0x8F },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG3, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_VOL_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
> +	{ CDC_2_5_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC0, 0x04 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC1, 0x08 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC2, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC3, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC4, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC5, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC6, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC7, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
> +};
> +
>  static const struct reg_default rx_pre_2_5_defaults[] = {
>  	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
>  	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
> @@ -1236,8 +1331,62 @@ static bool rx_pre_2_5_is_rw_register(struct device *dev, unsigned int reg)
>  	return false;
>  }
>  
> +static bool rx_2_5_is_rw_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CDC_2_5_RX_RX1_RX_PATH_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG0:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG1:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG2:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG3:
> +	case CDC_2_5_RX_RX1_RX_VOL_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_CFG:
> +	case CDC_2_5_RX_RX1_RX_VOL_MIX_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC1:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC2:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC3:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC4:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC7:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6:
> +	case CDC_2_5_RX_RX2_RX_PATH_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG0:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG1:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG2:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG3:
> +	case CDC_2_5_RX_RX2_RX_VOL_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_CFG:
> +	case CDC_2_5_RX_RX2_RX_VOL_MIX_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC0:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC1:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC2:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC3:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC4:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC5:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC6:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC7:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1:
> +	case CDC_2_5_RX_RX2_RX_PATH_DSM_CTL:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>  {
> +	struct rx_macro *rx = dev_get_drvdata(dev);
> +
>  	switch (reg) {
>  	case CDC_RX_TOP_TOP_CFG0:
>  	case CDC_RX_TOP_SWR_CTRL:
> @@ -1453,6 +1602,9 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>  		return true;
>  	}
>  
> +	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5)
> +		return rx_2_5_is_rw_register(dev, reg);
> +
>  	return rx_pre_2_5_is_rw_register(dev, reg);
>  }
>  
> @@ -1551,6 +1703,10 @@ static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
>  		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
>  		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
>  
> +static const struct snd_kcontrol_new rx_2_5_int1_dem_inp_mux =
> +		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_2_5_int1_dem_inp_enum,
> +		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
> +
>  static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
>  					       int rate_reg_val, u32 sample_rate)
>  {
> @@ -2835,6 +2991,18 @@ static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
>  			  -84, 40, digital_gain),
>  };
>  
> +static const struct snd_kcontrol_new rx_macro_2_5_snd_controls[] = {
> +
> +	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_2_5_RX_RX1_RX_VOL_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_2_5_RX_RX2_RX_VOL_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_2_5_RX_RX1_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_2_5_RX_RX2_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
> +};
> +
>  static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
>  	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
>  			  -84, 40, digital_gain),
> @@ -2956,6 +3124,12 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
>  
>  	return 0;
>  }
> +
> +static const struct snd_soc_dapm_widget rx_macro_2_5_dapm_widgets[] = {
> +	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
> +			 &rx_2_5_int1_dem_inp_mux),
> +};
> +
>  static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
>  	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
>  			 &rx_int1_dem_inp_mux),
> @@ -3454,10 +3628,17 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>  				      CDC_RX_DC_COEFF_SEL_MASK,
>  				      CDC_RX_DC_COEFF_SEL_TWO);
>  
> -	controls = rx_macro_def_snd_controls;
> -	num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
> -	widgets = rx_macro_def_dapm_widgets;
> -	num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
> +	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5) {
> +		controls = rx_macro_2_5_snd_controls;
> +		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
> +		widgets = rx_macro_2_5_dapm_widgets;
> +		num_widgets = ARRAY_SIZE(rx_macro_2_5_dapm_widgets);
> +	} else {
> +		controls = rx_macro_def_snd_controls;
> +		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
> +		widgets = rx_macro_def_dapm_widgets;
> +		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
> +	}
>  
>  	rx->component = component;
>  
> @@ -3609,15 +3790,28 @@ static int rx_macro_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  	rx->codec_version = lpass_macro_get_codec_version();
> -
> -	rx->rxn_reg_stride = 0x80;
> -	def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> -	reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> -	if (!reg_defaults)
> -		return -ENOMEM;
> -	memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> -	memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> -			rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> +	switch (rx->codec_version) {
> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:

I don't like that the next 2.9 version will end up in a default bucket.
It might be better to have an explicit list of versions instead and then
return -EINVAL in the default case.

> +		rx->rxn_reg_stride = 0xc0;
> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> +		if (!reg_defaults)
> +			return -ENOMEM;
> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
> +		break;
> +	default:
> +		rx->rxn_reg_stride = 0x80;
> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> +		if (!reg_defaults)
> +			return -ENOMEM;
> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> +		break;
> +	}
>  
>  	rx_regmap_config.reg_defaults = reg_defaults;
>  	rx_regmap_config.num_reg_defaults = def_count;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
