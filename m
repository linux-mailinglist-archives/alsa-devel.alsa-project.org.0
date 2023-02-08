Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7268F761
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 19:48:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B8D3E8;
	Wed,  8 Feb 2023 19:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B8D3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675882092;
	bh=6h/7nBVcDprjd3pFLzYdO97Pk/KgFGqIWehTfhYq1/M=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yom75/sNlt6SFiFOdfPXTzON+xQVrO/L4VQJxbOPdiHE+h/QJ4m5sHYz2jvTjOpzR
	 S5SYPv/Aej1hIkxw9LBjdWyvqkYnIs4obZBVstB7PNAfWWrYT+tJjAdydRITHhtOyG
	 nWEvRvIPQ5PlPVtzTjUkOKu6HQi+AcvrRvsBD+mQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC73F8010B;
	Wed,  8 Feb 2023 19:47:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10D80F8012B; Wed,  8 Feb 2023 19:47:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BECE0F80017
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 19:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BECE0F80017
Received: by mail-oi1-f174.google.com with SMTP id 20so15544058oix.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 10:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FQR2OeB8GdBCvZmYBsmELI/in0H1BRjqllMiTjr8o4E=;
        b=ZFBodIXdwD6dRl7lMccBb3CAUdT0m+5fl6KU2jRtjlImU+4PMgKRo8P1m6uL5Xe2OE
         pRAGeDWOOiomeb/AVQ8VzAxB0qXXCS2JoqkPkN60F49W64JEQGj7303J7d62BFs7kM99
         MipqcgmD1xItpLzbbg7SMcM/8vSvQroVpyyAwK9I8Hpiq17aDkI6j5pK3NZjq+HQvRsZ
         ZPliqVMpor6sql8DlFk358I7JdvaaZapc+zVAExOZHcKiBrPHo1YdXiVTZnZ4n1ZqeC8
         TQTiTD5CS5Cqll+vJqwkLkt2CfwyCbuaUaUWEch8jR2qo+4y8+6j96lPlqr/maVN2z5m
         u8/w==
X-Gm-Message-State: AO0yUKXYYNHm5BSJ41yoGgObSC4W0yXoIoqxEhmcZixqQxvScrvbF9ou
	fFp0l5jHQct1KgFHLaPZWw==
X-Google-Smtp-Source: 
 AK7set/Wmm4AaqO3KoD2uZ7O0ObyLfRs5KnmQKQ6NcHQ157U89avSKm6u1QJkXXi9mhxHe/O3HQtOQ==
X-Received: by 2002:a05:6808:92:b0:364:98ca:efb0 with SMTP id
 s18-20020a056808009200b0036498caefb0mr3423802oic.6.1675882022184;
        Wed, 08 Feb 2023 10:47:02 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm7371066oie.47.2023.02.08.10.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:47:01 -0800 (PST)
Received: (nullmailer pid 2296664 invoked by uid 1000);
	Wed, 08 Feb 2023 18:46:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
Message-Id: <167588125123.2283195.8694738903913228349.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Date: Wed, 08 Feb 2023 12:46:59 -0600
Message-ID-Hash: QNWKKD3N3PC62RPROXAKUIAA6CALJLM2
X-Message-ID-Hash: QNWKKD3N3PC62RPROXAKUIAA6CALJLM2
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, - <patches@opensource.cirrus.com>,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNWKKD3N3PC62RPROXAKUIAA6CALJLM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Feb 2023 18:25:52 +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
> schema.
> 
> Changes against original binding:
> 1. Add missing LDO1VDD-supply for WM1811.
> 2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
>    gpiolib already looks for both variants).
> 3. Do not require AVDD1-supply and DCVDD-supply, because at least on
>    Arndale board with Exynos5250 these are grounded.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/wlf,wm8994.yaml | 203 ++++++++++++++++++
>  .../devicetree/bindings/sound/wm8994.txt      | 112 ----------
>  2 files changed, 203 insertions(+), 112 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8994.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230208172552.404324-1-krzysztof.kozlowski@linaro.org


audio-codec@1a: 'AVDD1-supply' is a required property
	arch/arm/boot/dts/exynos5250-smdk5250.dtb
	arch/arm/boot/dts/s5pv210-fascinate4g.dtb
	arch/arm/boot/dts/s5pv210-galaxys.dtb

audio-codec@1a: 'DCVDD-supply' is a required property
	arch/arm/boot/dts/exynos5250-smdk5250.dtb
	arch/arm/boot/dts/s5pv210-fascinate4g.dtb
	arch/arm/boot/dts/s5pv210-galaxys.dtb

audio-codec@1a: Unevaluated properties are not allowed ('wlf,ldo1ena', 'wlf,ldo2ena' were unexpected)
	arch/arm/boot/dts/exynos4412-i9300.dtb
	arch/arm/boot/dts/exynos4412-i9305.dtb
	arch/arm/boot/dts/exynos4412-n710x.dtb
	arch/arm/boot/dts/exynos4412-trats2.dtb
	arch/arm/boot/dts/exynos5250-arndale.dtb
	arch/arm/boot/dts/s5pv210-fascinate4g.dtb
	arch/arm/boot/dts/s5pv210-galaxys.dtb

