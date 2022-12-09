Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B9648A3E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 22:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827A123BD;
	Fri,  9 Dec 2022 22:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827A123BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670622354;
	bh=yqiKsjF4B5Vp8k5sm91LIKie0+GOMiEppiXwOgSF+64=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n4MRefvXUbgebko9ZJrObsiXAeNjCdcWfEOzI4BqZ4d8tgVMK5ah55Kl6dPU+OWXb
	 mLjMKyVVYRwGvNDhlsdMD501WZvvahDRWGQs9EQ3Mg29/6Zij4RvNIVcwKddLN02Ht
	 Tkg3/9WxaTwfY0LjMeIVNQRqkxMEeZSUePhK4KC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F028F8022D;
	Fri,  9 Dec 2022 22:44:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF50F8024D; Fri,  9 Dec 2022 22:44:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45A31F8022D
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 22:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A31F8022D
Received: by mail-oi1-f180.google.com with SMTP id r11so5699810oie.13
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 13:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nd9e73YWcyDbpy8iNaJn59EprL8nmhryJLwX1qEN9Eo=;
 b=s5SZ1FxlsaOJBnX6MP4aDGPdaHXPe2NOKg4MHli7QmBnFx8G+G+g9fal/Lq3/sJDBA
 69z+28HswgGWqzFeequgP5joHxPvkCo4jFiFpiSReXSrW9KEZZAYpNEbHGCjOVnSFoSW
 /Qh7Y0+vLT+YEhDB6knFcaamQOmY63FPJAzREheKcim3p8ciHCS7R1HDF1TFFNnqDG1T
 98P/3hGpM9QzZlgibPEqP+D8630UHvm1QPcS8ZKoNp6ZMSwHv4ojSO6ThjF8oBqIzXcz
 zB2mo/LuRQS39wQ+/lIE6AlsJ3wP/H3sjb/Ojznd3CTEoqTw6Vyqh9JYW1CX637MGe1A
 icLA==
X-Gm-Message-State: ANoB5pkKOqjQunPHlZmlFsP2ltgnpMay2FF4G/cYzaLbL18s3n77JLJ0
 i/RNAJjOWRP5Qyx+obCcnQ==
X-Google-Smtp-Source: AA0mqf4zxCpKeyR01HFGIasFt7sfhYOSMetLDwOipuBLFYhevP/VhTMYOe44Q7JQXfvLVLr+yQUR+A==
X-Received: by 2002:a54:438d:0:b0:35e:1ca6:ff6d with SMTP id
 u13-20020a54438d000000b0035e1ca6ff6dmr3103306oiv.5.1670622291324; 
 Fri, 09 Dec 2022 13:44:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b25-20020aca1b19000000b00342eade43d4sm923502oib.13.2022.12.09.13.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 13:44:50 -0800 (PST)
Received: (nullmailer pid 3899706 invoked by uid 1000);
 Fri, 09 Dec 2022 21:44:50 -0000
Date: Fri, 9 Dec 2022 15:44:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: adi,adau7002: Convert to DT schema
Message-ID: <167062228971.3899662.7192332013668197294.robh@kernel.org>
References: <20221209175947.335319-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209175947.335319-1-krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 09 Dec 2022 18:59:46 +0100, Krzysztof Kozlowski wrote:
> Convert the Analog Devices ADAU7002 Stereo PDM-to-I2S/TDM Converter
> bindings to DT schema.  During the conversion, add properties already
> used by DTS (sc7180-trogdor-coachz.dts) and Linux driver:
> 1. wakeup-delay-ms,
> 2. sound-dai-cells (via referencing dai-common.yaml).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/adi,adau7002.txt           | 19 ---------
>  .../bindings/sound/adi,adau7002.yaml          | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau7002.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau7002.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
