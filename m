Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C350568BE67
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ADFB83A;
	Mon,  6 Feb 2023 14:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ADFB83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690672;
	bh=06llItq3OgrONTHisa13nIfm5l9ZtJLDr8aom1oC+R0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EcSDG+4BFVNQdR60daNnUc8DhD/YfRae+tbLDzq4AliSKnKjgodd35gycAksnG7UH
	 IK2KhiePReB6ajUM9H/aKvYvYdgx3Zi/XAWfumVpYs3MTj4cy+KmcIBnjxcJU9+8tN
	 qDihFOfLooWrhMikkCXlSatU2+c4OQ9p9gks0BOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5BBF80568;
	Mon,  6 Feb 2023 14:35:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 713CDF80169; Fri,  3 Feb 2023 21:57:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D697F8001D
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 21:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D697F8001D
Received: by mail-ot1-f52.google.com with SMTP id
 g21-20020a9d6495000000b0068bb336141dso1737690otl.11
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 12:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTUpcYkNxPIlJHACYCYR7pDb1Buy+e4lFP4bk5Zgp34=;
 b=NyVKYchIRv3ha/CLOAGt3R6mUbUM9V7sT99EsF6fLvnSrHI8zgFeii63jf3rHt7nv6
 8x+pfyR84Cr5R45mSslbyOiwlbThhpdv74jw1XPl0ppxo9x3OLWNPtEQEPpihE1VoVUw
 P4iLFUvy6pREY+5Lf4OIdtNwUuXQl9sBV06uoGAB83fcjgrQe1J+zr4dFTpq4qINi/xU
 NptxWX9ddQulWdzkLp4cK/EF2713rFiheUeSUft8BZaPNhi/pVV+QXkFIHA0Yazl2xBU
 +i5c1JpVmsULw/RMHQOvwqbSj8v/v389OKJ7Htget/Gd2O0v9lZxcwECd08z2QocF5GJ
 ckIw==
X-Gm-Message-State: AO0yUKUN3ET4hlZWVG3+q1qb0pK7WLDMdrvpKihNei9OxWvokygryd5E
 6h5Dq96jLHQVAs3oBGKFlA==
X-Google-Smtp-Source: AK7set/idxy63+ygBDyPnMqtJWkCkCzx9MyU4A+nT1Br4FymPkR4Z0JILK7N/Htqiz/3btTinW8cgQ==
X-Received: by 2002:a05:6830:1e57:b0:68b:b721:8f1c with SMTP id
 e23-20020a0568301e5700b0068bb7218f1cmr6718583otj.27.1675457869992; 
 Fri, 03 Feb 2023 12:57:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c22-20020a9d6856000000b0068bd5af9b82sm1611458oto.43.2023.02.03.12.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 12:57:49 -0800 (PST)
Received: (nullmailer pid 873929 invoked by uid 1000);
 Fri, 03 Feb 2023 20:57:48 -0000
Date: Fri, 3 Feb 2023 14:57:48 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230203205748.GA860175-robh@kernel.org>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:03 +0100
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
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, herbert@gondor.apana.org.au,
 olivier.moysan@foss.st.com, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 fabrice.gasnier@foss.st.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
 linux-i2c@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 27, 2023 at 05:40:36PM +0100, Gatien Chevallier wrote:
> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 System Bus. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Patch not present in V1 and V2.
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml | 5 +++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml     | 5 +++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml  | 5 +++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml     | 5 +++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 5 +++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml     | 5 +++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml | 5 +++++
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml   | 5 +++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml  | 5 +++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml      | 5 +++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 5 +++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml  | 6 ++++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml        | 5 +++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml      | 5 +++++
>  .../devicetree/bindings/phy/phy-stm32-usbphyc.yaml          | 5 +++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml     | 5 +++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml     | 5 +++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 5 +++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml   | 5 +++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml   | 5 +++++
>  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml         | 5 +++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml    | 5 +++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml     | 5 +++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml             | 5 +++++
>  24 files changed, 121 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index 4ccb335e8063..cb2ad7d5fdb5 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -41,6 +41,11 @@ properties:
>      maximum: 2
>      default: 0
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains

Not how common properties work. Consumer properties should be in a 
schema with 'select: true' (the one you are referencing) and here you 
just need to define the entries. Like clocks, power-domains, etc.

> +    minItems: 1
> +    maxItems: 3

Why is this variable and what is each entry?

I still don't like the naming. Everything is a feature and a domain... 

It might be a bit easier to come up with a name with multiple users of 
this binding presented. I'm hesistant to define any new common binding 
with only 1 user as I've said multiple times on this binding.

Rob
