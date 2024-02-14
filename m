Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D28540D7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 01:28:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E79EC7;
	Wed, 14 Feb 2024 01:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E79EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707870475;
	bh=yDHy5RDbymgdUKbLBpcBU7q0gdC36wyOUaU6V100yVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QVwjQCQvdczY4i7Qa3lldqv1pLRoNNSQgEm5DnGhX6VSDgXx5JG/rS5n0F+1R8ayL
	 xFxSQ46KTsKSRyvKLYdUAj3F/RAE3FkhfaY68ocFZj4nqkBNmoVOczjchKEGR1+rCi
	 xdDs7UchzdiwnxVyHlBAxGzI4HIqlnlfckf+GgZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC88AF80567; Wed, 14 Feb 2024 01:27:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0D9F8057D;
	Wed, 14 Feb 2024 01:27:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A776F80238; Wed, 14 Feb 2024 01:27:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	FSL_HELO_FAKE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 388E6F80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 01:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 388E6F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=i4VV5MrH
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so288517339f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 16:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870432; x=1708475232;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=i4VV5MrHq0Mm576nikTJdgbPopaiJ9FYByoN3alNEgGjJ4j8y+Pe1UxaGJSp1Xm1BQ
         R21fpN4f6yRRlybUy6JqloBGdXgV6Ri84rSRX5PQAlskTHEH5+eUhVmmYYY64pG5GZ8a
         hnTuQGiQly0bfExfFp4sP/bnrvATDmirWGL9252AXEQWTvKPrZn6VvLmQWew85jFZvEt
         VtRX5MaaSJybR5/Dg/wpaOat+fZSB9TaPTvAPtlduqrAZWEHg4PfA9zdvPmP+hmLKOF9
         kn1Fb8vzvk9QKcl0GXqlp5UQxsdxnDrUUkZc67zg2LtYgXUDKSg4WmOaeoNS8N7Cc+ta
         L4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870432; x=1708475232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=eo55zf4CqV53UDSSKFAAhrEVzra3j//DsK3mhE8cIKLDu6cT2FkEl923GjluWPDcEa
         yVojVPt/cot5jCrNAGr10Pjf1rlgv9kaLijsKJozHrmA1NJAF7LT1lQmN7gEHM/TMLRt
         vlkBLT2isou4EXU5dLljS93PV+6rE4xpDFIXo6MqzlKMhLy8gNecob6rEuBosdoLKHoS
         egREiirWS0sjZUd9382KhW2KO5bcmxX0SYTsHh0ONS5GJRCYK7XHFSOjO057YlXOCOPK
         rQDMxQpgVwWC8h4mHGVLiYPl2hGpfYWhRMbxdRdyvS2B52Lkj9dGqga0eYM7jvA7FgDP
         iCFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRCce0DbJHG/9QQLMM2FBXiel32PgFB761XNgKCFbYISkUYZ9wfJF7J9VTYr0aV+ZwEnSC532Zx3wsrMxWU/mQ5pvqE/1SEAXYW7A=
X-Gm-Message-State: AOJu0YzhMMMlnlEg4dYhQTkVeCJSngKy3D9clsfZ8szITGSZ8R5tXA6O
	PV2xf1udONS9iIDKBBMg3UhRLDvLD2iNkqUnjxCdgVc1/MOW6u9lSYPp9/rLMg==
X-Google-Smtp-Source: 
 AGHT+IFlwS590K6G5HLkJzVAbnXNA3kjuDrNpfVIBkAOMMF2uKbvfvsNtgUXwFSf/vpyKj4XnjzfVA==
X-Received: by 2002:a05:6602:1c3:b0:7c4:19c7:646a with SMTP id
 w3-20020a05660201c300b007c419c7646amr1528777iot.19.1707870431645;
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKbZdIao3MuWR588UKr53QbpcAZKhB9kXOjFoOwymzV+XRimiyLDuoM9Vs57HxOeDppfShIb00Z/u6rJ/tcurfJC3aTiIHy1JRA9nuzvdJSQyVigWL++i27Tg6fIAUmRPs3pe2p+FtKb8rdbUMwpszXHSfCYQ8lYx38ofWsyV43KntDzujWzjLLSYTYoTLz3/NQjxi7/US3Au353TFVbFIwDOwxfHDJfrUod67S4qui5i1m/1IHpqXQQ8wnRjb8MTF97izsHtcc/FdPHceEDqvEzUcFd3/ar9ByItkSBO9/+ufMNWKR/VqijYcxsIvZSPceDEMFIXWklvAyj1SFYHkWcQ5tDpEWTfPAvBv2CiYeyyLsoEeJXsoz8uTOZZuo2pDMSlEFzbAPlrHbAeBfQJJPM17PdZXYkPCbH0wUEjQyBL/W9YvrBKJV/h/Xh6m+14cbyX11OSRs9vYRixUqjBQBfEct7pfYePjSPdHykil6zADzWKQp4GEBbBYxlESGl2IAPVmFP5hsrMppTcEWxjF2HY22Cx0LgkOQRCIACoGIRiPq0cj6S3iAoDhbjgIvMmD+SLjXHsNtqaZMzM=
Received: from google.com (20.10.132.34.bc.googleusercontent.com.
 [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id
 cp27-20020a056638481b00b0047140ce03casm2180833jab.22.2024.02.13.16.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
Date: Wed, 14 Feb 2024 00:27:08 +0000
From: Justin Stitt <justinstitt@google.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type
 mismatch
Message-ID: <20240214002708.bhpvpt7cv7o4os5t@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-3-jbrunet@baylibre.com>
Message-ID-Hash: YHBVKPA343MIZ3TO43BQKVF7TUZYB4LW
X-Message-ID-Hash: YHBVKPA343MIZ3TO43BQKVF7TUZYB4LW
X-MailFrom: justinstitt@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHBVKPA343MIZ3TO43BQKVF7TUZYB4LW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Feb 13, 2024 at 10:58:04PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/t9015.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..571f65788c59 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -48,7 +48,6 @@
>  #define POWER_CFG	0x10
>
>  struct t9015 {
> -	struct clk *pclk;
>  	struct regulator *avdd;
>  };
>
> @@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
>  	struct t9015 *priv;
>  	void __iomem *regs;
>  	struct regmap *regmap;
> +	struct clk *pclk;
>  	int ret;
>
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, priv);
>
> -	priv->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(priv->pclk))
> -		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
>
>  	priv->avdd = devm_regulator_get(dev, "AVDD");
>  	if (IS_ERR(priv->avdd))
>  		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
>
> -	ret = clk_prepare_enable(priv->pclk);
> -	if (ret) {
> -		dev_err(dev, "core clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> -	if (ret)
> -		return ret;
> -
>  	ret = device_reset(dev);
>  	if (ret) {
>  		dev_err(dev, "reset failed\n");
> --
> 2.43.0
>
Thanks
Justin
