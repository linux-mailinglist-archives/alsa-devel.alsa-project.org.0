Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87FF67FD9D
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 09:25:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA846EAE;
	Sun, 29 Jan 2023 09:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA846EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674980704;
	bh=6bUIRH8u5Cxb143fKnG2xu5Mame0Rqrt7wtVXi/pBI0=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WLl9KIAsladqoW6RHykgqueSffWIgovfgiI6GjnC6sWr3iL9Gsg42Htc++RaOy94/
	 fn0dT7eH+mnla9ZaaLTmBMLBRCqf+qYyzQCwey2k9lamblnRrX+TDIztfTnlpXG8l6
	 +kmfmuPfhrYmdSqZN2Ku9rjtaxwWsB5jIj+YSqMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB690F80544;
	Sun, 29 Jan 2023 09:23:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD364F8027D; Sat, 28 Jan 2023 16:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D76F80171
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 16:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D76F80171
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B/UHPiLa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4F9B60C21;
 Sat, 28 Jan 2023 15:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C1EC433EF;
 Sat, 28 Jan 2023 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674919937;
 bh=6bUIRH8u5Cxb143fKnG2xu5Mame0Rqrt7wtVXi/pBI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B/UHPiLasadsoRWpYuGJDp1GLMSeZmlfVRTmB/u7+euzi1jGnfanl6/0d+JYc2Anh
 w7UO6aa2RsLgUjI1TkHXjO36kqVYHhfXz/NCtaRI8OBIp/Q2pEZFlv4mub7gKuB0qI
 1Mc7qpLn6KKILoT9rYANmy7LzgbATjPALJjEwNQejFsO1M7vRDp0lv6AF9qG6JMfUy
 5lpHy0ZUkiHDj2il7+hETu3TJKnGEz59b4YBLnwu8O8u6aCEuUKLoI0SiudsfUi4Fr
 1BAyerZrGeDn7mhab+7xjaNDPuPf2DsSywJWmBDFLs9BxgUuYRquba0R/ZzEBRsQJE
 Hlj1/II1JU4cQ==
Date: Sat, 28 Jan 2023 15:46:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230128154606.18b70629@jic23-huawei>
In-Reply-To: <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-3-gatien.chevallier@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 29 Jan 2023 09:23:11 +0100
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
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, fabrice.gasnier@foss.st.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, linux-i2c@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 27 Jan 2023 17:40:36 +0100
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

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

There was probably a cleaner way to ensure that this could go via the various
subsystem trees, but hopefully there won't be any clashes with other work going in
and if there is, the resolution should be simple. Hence I'm fine with
this going via the dt tree.

So for the IIO ones below,

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 1c340c95df16..c68b7b0e1903 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -93,6 +93,11 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
> +    minItems: 1
> +    maxItems: 3
> +
>  allOf:
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 1970503389aa..d01f60765e48 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -59,6 +59,11 @@ properties:
>        If not, SPI CLKOUT frequency will not be accurate.
>      maximum: 20000000
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> index 0f1bf1110122..f6fe58d2f9b8 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> @@ -45,6 +45,11 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  feature-domains:
> +    $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains
> +    minItems: 1
> +    maxItems: 3
> +
>  additionalProperties: false
