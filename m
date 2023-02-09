Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814AE6910A4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F98083D;
	Thu,  9 Feb 2023 19:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F98083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675968506;
	bh=d63iRJWOdS7dprxJvaMZDkB9M+DKxugWNdmHqG86+4s=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vhUrAwKRPSRO5rEBtoFStmKEy0RtqjWfbdrqbw5IDBSB5r+UPC/V+ad6Os1Z7J4Zb
	 Ka9aHWj2S6tf2I6F+xyDE7KAg3CaNDYRbbA7LC4AT4tAFc9XsfBbg+2D1RgXeVZCO/
	 36HfgM/Ws51IJKqC9DezdRohakN/6pMKy9iNFKL0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC16DF800E4;
	Thu,  9 Feb 2023 19:47:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E10F800E4; Thu,  9 Feb 2023 19:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0A21F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A21F80086
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-1636eae256cso3855287fac.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 10:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNaA54ncyf5PWWN1fTCkDz/pbo/DWHHSJveDPsBxHU4=;
        b=EFTnB2N7JdUBN5jzg47ARy88ef2xfjKDh0ZrPz5ycmnwFzlcHC6H0XzL5oww4nQI4u
         2tfjA+ML3yggv8nPMweF70yW2ZyvFXRXT074s/Q4tlghIJa5muSWLnzSTvZKxg7WTcnv
         73MtwrmnVrQYb7q0fBhk2qUCWHFw+GRMrNHAGmahH+Q/nnrPWFKA5YizBeAfdIut5ld1
         M1MzfxFUdJY+OrSVoDILODP4mV12lEEX2RM46g5rXHYbAS8xVNNXGywvxiWNtWeZqUcO
         zMSUAJOb2Z+RoavqVXxdbmNTSZAe6Un89wGnDR5jSpAu+WgB5c1UB2izwr1B7nB3F59P
         Ymqg==
X-Gm-Message-State: AO0yUKVYHkKxXbiCmdjXyPC1EwUXUG1DKKqKcWeD/0GC75KMbCvS8SH8
	+ItH6VqPHRlByUkzlWN+jA==
X-Google-Smtp-Source: 
 AK7set+LpAAQrdDi21BmP35c4QuiXWbAckRokthyKVqKkwsAlsFerd9xp/Vfd28aqzRs2F+J01ZqkQ==
X-Received: by 2002:a05:6870:428f:b0:163:3f73:b0fc with SMTP id
 y15-20020a056870428f00b001633f73b0fcmr6970166oah.18.1675968446460;
        Thu, 09 Feb 2023 10:47:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 u36-20020a056870b0e400b0014ff15936casm1008335oag.40.2023.02.09.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:47:26 -0800 (PST)
Received: (nullmailer pid 622962 invoked by uid 1000);
	Thu, 09 Feb 2023 18:47:25 -0000
Date: Thu, 9 Feb 2023 12:47:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Message-ID: <167596844504.622906.11149464288778013778.robh@kernel.org>
References: <20230208195235.453774-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208195235.453774-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: NNDGGX6SKCGGLMQ7JZJWXNQGSBF64GSQ
X-Message-ID-Hash: NNDGGX6SKCGGLMQ7JZJWXNQGSBF64GSQ
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, - <patches@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNDGGX6SKCGGLMQ7JZJWXNQGSBF64GSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Feb 2023 20:52:35 +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
> schema.
> 
> Changes against original binding:
> 1. Add missing LDO1VDD-supply and LDO2VDD-supply.
> 2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
>    gpiolib already looks for both variants).
> 3. Do not require AVDD1-supply and DCVDD-supply, because at least on
>    Arndale board with Exynos5250 these are being supplied by internal
>    LDOs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Add LDO2VDD-supply.
> 2. Do not require AVDD1-supply on WM8994.
> 3. Move requiring of common supplies to top-level "required:".
> 
> DTS is being corrected here:
> https://lore.kernel.org/linux-samsung-soc/20230208172634.404452-1-krzysztof.kozlowski@linaro.org/T/#t
> ---
>  .../devicetree/bindings/sound/wlf,wm8994.yaml | 194 ++++++++++++++++++
>  .../devicetree/bindings/sound/wm8994.txt      | 112 ----------
>  2 files changed, 194 insertions(+), 112 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8994.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

