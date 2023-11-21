Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F007F61AB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12FCE75;
	Thu, 23 Nov 2023 15:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12FCE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700750415;
	bh=S4q/1U/7OnsVm5T9b1Jb8iUwXyi+utV5ntjMRjVpFSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eDCErbY3n1HFv+r/lmbB99GXelWUeB5CKlk6KnlQmeR1iKfFM8GpbjfyoFMpnFema
	 SpiWlZ05JfIwnhafc+/3TwEfPawGaz6UX3VdYu3yUVogbp7wp2WoFwXpVF3Ig4AGp9
	 pXdVsQiury6zei+a+XzonQQPOIQoeQFAxHj99aBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C2BF8055C; Thu, 23 Nov 2023 15:39:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACDB7F8055C;
	Thu, 23 Nov 2023 15:39:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE7D5F802E8; Tue, 21 Nov 2023 18:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEDB2F80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 18:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEDB2F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=R7TDtfZY
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5c194b111d6so4505208a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Nov 2023 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700588920; x=1701193720;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAK/ItuSDRPVMNR15AwNhdUvFP+x071LcAQ3w3yTJs0=;
        b=R7TDtfZY6vna6M+0vNgahUR0866++X3UroA5b6Its10BOD+qXJQKHEv35SlxOwx+2f
         DrvgcE3lFxqsokgUDrjfSIwzDDEja58c+GujJCJbe8L0ET3dxcJVqQfrZZmLF3FDNFW0
         /UyGeL8QDhSg+w9uxTRxVWOrvqcnUNtE+9OFLrd/IYh52xw0aFBMK1O2+e3uzrgBcCo4
         O7s3rT4OTD1Fav9xTpUFYYv3xpk9ZMWp3opVgCPasYrEEEqp0TEbvVipnXGlXz0I22sO
         1CsuFR126AlGy8+tvNeiObEE6Hg6UZC260dEOzEgtHn6QMCCNtRJy214E/wxlh8CnRyI
         XXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700588920; x=1701193720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAK/ItuSDRPVMNR15AwNhdUvFP+x071LcAQ3w3yTJs0=;
        b=EtfHohtKDod2HAW1xS/Mz4bz1O1X/xeJyTksdhph3X+IUQLekn13Xr5HlwrVltlodF
         OvTztPUFPUo6RAmU/d4Ei90mFIc6KO/9QmZPRR0uO9Vx3Ew/NqehKym/atL231uYiZh2
         4o2W4rIqSp4f+ix+cVpuc2iXpZRPV88/cPz49XqoTRo/G3nlr6PTpeDHQDjBoBxq6Dp7
         szmr/Hv817Wyy1GZQRWrXPy06F0UiA2ExanJ3hGlJpZmRZek50XNEYg1gaT1fJC1KnkH
         RwSKVxt+CdYCV5DvcVbYTao2Tlq0XFpzTG+8ClTCgtMC4DWwv0lFPI44GFOjTgV2kveL
         kjkw==
X-Gm-Message-State: AOJu0YxysrG23YN49Hggm4khQJLSaoTf/YYM02gOfgpLmTlRp0/g0SHX
	c22r7FcGqR8wYIMvmDlxnc200irFhlgc3OYXYxL29w==
X-Google-Smtp-Source: 
 AGHT+IGsVYAziCjXoCBHiftycTLKlFRj+F3xZDSfXKxIguYqxWX7xqT/er/I16AqY0h4UFWzZ5qHqodRZyjJQpRXSA8=
X-Received: by 2002:a05:6a20:4306:b0:187:5be4:67e2 with SMTP id
 h6-20020a056a20430600b001875be467e2mr16406256pzk.53.1700588920073; Tue, 21
 Nov 2023 09:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 21 Nov 2023 11:48:29 -0600
Message-ID: 
 <CAPLW+4nkrMwc9GiQyn7ojaPz_50NQ3vAcMt9+tOzpHfq7G7+Tg@mail.gmail.com>
Subject: Re: [PATCH 16/17] arm64: dts: exynos850: add specific compatibles to
 several blocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: semen.protsenko@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DEDWYHLVYVMAFAPYVHMJCNMWJBNVSXL5
X-Message-ID-Hash: DEDWYHLVYVMAFAPYVHMJCNMWJBNVSXL5
X-Mailman-Approved-At: Thu, 23 Nov 2023 14:39:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEDWYHLVYVMAFAPYVHMJCNMWJBNVSXL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 8, 2023 at 4:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Exynos850 reuses several devices from older designs, thus historically
> we kept the old (block's) compatible only.  This works fine and there is
> no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>
> Add compatibles specific to Exynos850 in front of all old-SoC-like
> compatibles.  This will also help reviews of new code using existing
> DTS as template.  No functional impact on Linux drivers behavior.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 34 +++++++++++++----------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 53104e65b9c6..df5ea43ebcad 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -396,7 +396,7 @@ pinctrl_aud: pinctrl@14a60000 {
>                 };
>
>                 rtc: rtc@11a30000 {
> -                       compatible =3D "samsung,s3c6410-rtc";
> +                       compatible =3D "samsung,exynos850-rtc", "samsung,=
s3c6410-rtc";
>                         reg =3D <0x11a30000 0x100>;
>                         interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> @@ -406,7 +406,8 @@ rtc: rtc@11a30000 {
>                 };
>
>                 mmc_0: mmc@12100000 {
> -                       compatible =3D "samsung,exynos7-dw-mshc-smu";
> +                       compatible =3D "samsung,exynos850-dw-mshc-smu",
> +                                    "samsung,exynos7-dw-mshc-smu";
>                         reg =3D <0x12100000 0x2000>;
>                         interrupts =3D <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -419,7 +420,7 @@ mmc_0: mmc@12100000 {
>                 };
>
>                 i2c_0: i2c@13830000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13830000 0x100>;
>                         interrupts =3D <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -432,7 +433,7 @@ i2c_0: i2c@13830000 {
>                 };
>
>                 i2c_1: i2c@13840000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13840000 0x100>;
>                         interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -445,7 +446,7 @@ i2c_1: i2c@13840000 {
>                 };
>
>                 i2c_2: i2c@13850000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13850000 0x100>;
>                         interrupts =3D <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -458,7 +459,7 @@ i2c_2: i2c@13850000 {
>                 };
>
>                 i2c_3: i2c@13860000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13860000 0x100>;
>                         interrupts =3D <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -471,7 +472,7 @@ i2c_3: i2c@13860000 {
>                 };
>
>                 i2c_4: i2c@13870000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13870000 0x100>;
>                         interrupts =3D <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -485,7 +486,7 @@ i2c_4: i2c@13870000 {
>
>                 /* I2C_5 (also called CAM_PMIC_I2C in TRM) */
>                 i2c_5: i2c@13880000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13880000 0x100>;
>                         interrupts =3D <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -499,7 +500,7 @@ i2c_5: i2c@13880000 {
>
>                 /* I2C_6 (also called MOTOR_I2C in TRM) */
>                 i2c_6: i2c@13890000 {
> -                       compatible =3D "samsung,s3c2440-i2c";
> +                       compatible =3D "samsung,exynos850-i2c", "samsung,=
s3c2440-i2c";
>                         reg =3D <0x13890000 0x100>;
>                         interrupts =3D <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
>                         #address-cells =3D <1>;
> @@ -640,7 +641,8 @@ usi_hsi2c_0: usi@138a00c0 {
>                         status =3D "disabled";
>
>                         hsi2c_0: i2c@138a0000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x138a0000 0xc0>;
>                                 interrupts =3D <GIC_SPI 193 IRQ_TYPE_LEVE=
L_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -668,7 +670,8 @@ usi_hsi2c_1: usi@138b00c0 {
>                         status =3D "disabled";
>
>                         hsi2c_1: i2c@138b0000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x138b0000 0xc0>;
>                                 interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVE=
L_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -696,7 +699,8 @@ usi_hsi2c_2: usi@138c00c0 {
>                         status =3D "disabled";
>
>                         hsi2c_2: i2c@138c0000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x138c0000 0xc0>;
>                                 interrupts =3D <GIC_SPI 195 IRQ_TYPE_LEVE=
L_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -738,7 +742,8 @@ usi_cmgp0: usi@11d000c0 {
>                         status =3D "disabled";
>
>                         hsi2c_3: i2c@11d00000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x11d00000 0xc0>;
>                                 interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 #address-cells =3D <1>;
> @@ -778,7 +783,8 @@ usi_cmgp1: usi@11d200c0 {
>                         status =3D "disabled";
>
>                         hsi2c_4: i2c@11d20000 {
> -                               compatible =3D "samsung,exynosautov9-hsi2=
c";
> +                               compatible =3D "samsung,exynos850-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
>                                 reg =3D <0x11d20000 0xc0>;
>                                 interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL=
_HIGH>;
>                                 #address-cells =3D <1>;
> --
> 2.34.1
>
