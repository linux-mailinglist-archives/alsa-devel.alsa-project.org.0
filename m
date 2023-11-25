Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 538337F8F37
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Nov 2023 21:51:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8374E844;
	Sat, 25 Nov 2023 21:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8374E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700945493;
	bh=MP615DG3faCXFei6ez6/qbJ2Qn+AxlK3zXjwrEKNgcs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JyXcaWg8DmW0/edR5I+V5bIVl8B4rOHVjcyNa++9qeCi+r/3HR66oq0r1DaVTYndR
	 cUm2Yo5kTDKmtLSI3Ehms3pipnChgV/IHC8FSynYtTNWdzGIjp2WWCKnUO78SPjUEg
	 aJ2KjXqKX6X+4RaWZ0ttWrbDBh5Cszgc6TuxjD4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 891F2F80551; Sat, 25 Nov 2023 21:51:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BF3F80551;
	Sat, 25 Nov 2023 21:51:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29BE1F802E8; Sat, 25 Nov 2023 21:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A51EBF80249
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 21:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A51EBF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V3H6UDq7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 87E12B83459;
	Sat, 25 Nov 2023 20:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487CBC433C8;
	Sat, 25 Nov 2023 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700945313;
	bh=MP615DG3faCXFei6ez6/qbJ2Qn+AxlK3zXjwrEKNgcs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V3H6UDq7A3kCMLfHpZpSX7FXfzHuWMOtsplTH0sNtXsZgArz+P0U4eBCtxi3NSFFd
	 /Qh78hVGqFA0WqXtaEMTLiv8fodY0nCNwQemnzy2nkPIc8A948DHrbP8ShAHXs9JEh
	 DZSd65o2b/ffSmFfCaSmhQJlMgtpbBWoxv52RCHkCAWexYJeYwHrGLN9suMTTHOnuk
	 DdSGqivh1nxdaSurglxzzB29rEdm+mzoC6D5xHsCr4gfSyRMDlvOZaKdKmw5u63wzf
	 fjwHu1uh7qGvuEyyEExZqT+BueoGfafWluF3pHxDvInU7XHZpnYl45oF6XMQNbYQcP
	 bHLD2kxsjKD7g==
Date: Sat, 25 Nov 2023 20:48:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaehoon
 Chung <jh80.chung@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add
 specific compatibles for existing SoC
Message-ID: <20231125204814.10fe16fa@jic23-huawei>
In-Reply-To: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
	<20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: T2CN3JROQYHXRWPS2ULGKARV2QGRCVPK
X-Message-ID-Hash: T2CN3JROQYHXRWPS2ULGKARV2QGRCVPK
X-MailFrom: jic23@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2CN3JROQYHXRWPS2ULGKARV2QGRCVPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed,  8 Nov 2023 11:43:36 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 582d0a03b814..4e40f6bed5db 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -11,18 +11,23 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - samsung,exynos-adc-v1                 # Exynos5250
> -      - samsung,exynos-adc-v2
> -      - samsung,exynos3250-adc
> -      - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
> -      - samsung,exynos7-adc
> -      - samsung,s3c2410-adc
> -      - samsung,s3c2416-adc
> -      - samsung,s3c2440-adc
> -      - samsung,s3c2443-adc
> -      - samsung,s3c6410-adc
> -      - samsung,s5pv210-adc
> +    oneOf:
> +      - enum:
> +          - samsung,exynos-adc-v1                 # Exynos5250
> +          - samsung,exynos-adc-v2
> +          - samsung,exynos3250-adc
> +          - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
> +          - samsung,exynos7-adc
> +          - samsung,s3c2410-adc
> +          - samsung,s3c2416-adc
> +          - samsung,s3c2440-adc
> +          - samsung,s3c2443-adc
> +          - samsung,s3c6410-adc
> +          - samsung,s5pv210-adc
> +      - items:
> +          - enum:
> +              - samsung,exynos5433-adc
> +          - const: samsung,exynos7-adc
>  
>    reg:
>      maxItems: 1

