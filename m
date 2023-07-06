Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D51749FD5
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 16:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BFE220C;
	Thu,  6 Jul 2023 16:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BFE220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688655140;
	bh=HogdfjeyRrsSb5AdnJ4AIZ3BX9pEwFg85WxrXdDP9Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WcfXuk6AMGrLnSFCo/6yYb3bgXx0ocx3oWsJ5iQwvpXUH4Aqfe391L4DoLPO2pJ8F
	 lgdTjsqwNSUA41Yqpo9+4E/ZNnUWOZ0ii5VXk66WbbgFy16eMAT9jg/RK5WmCbtC9p
	 n3PT8lsnhv8DqDl0rwml9eM1BqbkDUoj/cqR5jas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E67A4F80093; Thu,  6 Jul 2023 16:51:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AD61F80124;
	Thu,  6 Jul 2023 16:51:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82CBDF80125; Thu,  6 Jul 2023 16:51:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4C47F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 16:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C47F80093
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-345f4a3ff76so2672325ab.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 07:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688655073; x=1691247073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgnDkKPeeJQpJAr8Igz1bUHZ3qFXqLqwtv/vw0h6laQ=;
        b=PrKrGTYgyJFvDxUrJ5EG/cjX3ULyRJ5mbaM3BkjsttI9ZyDq07mENrzHwx1es5szE3
         0iB/yWNCnRNqJ0oG2hHtpGPcXghRiYI8qtPG0Tj2/SV/cVFY6/6aBR6kHzhKOEekiQuC
         JBIlbm9i4mzrAzxg/ntwyQgMjf8Y8bvc9Rb5xc4duZclsbMe5z5C2xkTFg3b3CqJrpbR
         pwsf/399CuxTgJYbYKYco20hFw8/0TGgEVXweU42dl4voK3svXW7HzAd12ZS1hZWeg+o
         bDybolQ++1Iff2239NAyosic2YKnPCqkKPzKNpE9P9j0I2kgU6m9Hi+YYar3orqRXiOT
         88WA==
X-Gm-Message-State: ABy/qLaYjnCpKVW8H8fYctfe2EXgeyams1TbXW9fuBvazzbo7bjBxPK4
	25d7anRYhbHjqZHicudifA==
X-Google-Smtp-Source: 
 APBJJlF67lR6D5NqnrBz/z/xaj4p5WF0VZl589v9nUuz7XC/TU588WYs6w03reMlD4UBeRhzLPXgQw==
X-Received: by 2002:a92:c52c:0:b0:345:d458:d227 with SMTP id
 m12-20020a92c52c000000b00345d458d227mr2368778ili.7.1688655072884;
        Thu, 06 Jul 2023 07:51:12 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a0566380bd100b0042b3e2e5ca1sm569170jad.122.2023.07.06.07.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 07:51:12 -0700 (PDT)
Received: (nullmailer pid 3861827 invoked by uid 1000);
	Thu, 06 Jul 2023 14:51:08 -0000
Date: Thu, 6 Jul 2023 08:51:08 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org, ulf.hansson@linaro.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	hugues.fruchet@foss.st.com, lee@kernel.org, will@kernel.org,
	catalin.marinas@arm.com, arnd@kernel.org, richardcochran@gmail.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230706145108.GA3858320-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
Message-ID-Hash: HOF6AKKJXPXGMWF55B3AQ4SHJGQ72KGT
X-Message-ID-Hash: HOF6AKKJXPXGMWF55B3AQ4SHJGQ72KGT
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOF6AKKJXPXGMWF55B3AQ4SHJGQ72KGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Disclaimer: Some error with dtbs_check will be observed as I've
> considered the property to be generic, as Rob asked
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>  24 files changed, 97 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index b767ec72a999..daf8dcaef627 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -50,6 +50,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3

What are the 3 entries?

Rob
