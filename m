Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9967FD9F
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 09:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D4ADF2;
	Sun, 29 Jan 2023 09:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D4ADF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674980723;
	bh=9p78P6cXR1b4UU7LmDHxucqXQwLRZGC/wmG/lLypzGo=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KzBw2lq84448VJKEdktgn1Q8H1/GN5PVgrL9PO3ZzXTCv590aXbgYVgMjXCdw3wXW
	 STDZadKn/cQU9rrvHjrVYfBay242ZqU0Lov0Dk69cb/69/R+kzyFMLpF40bVMWJ0Rj
	 nC9WZryOJit4/J1iyYqQt694xsk0TU6iCraXQVWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846E9F80557;
	Sun, 29 Jan 2023 09:23:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60363F8027D; Sat, 28 Jan 2023 16:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A13D6F8007C
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 16:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13D6F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Sy0kkDvx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 004CC60C1E;
 Sat, 28 Jan 2023 15:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3AFC433D2;
 Sat, 28 Jan 2023 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674920078;
 bh=9p78P6cXR1b4UU7LmDHxucqXQwLRZGC/wmG/lLypzGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sy0kkDvx7E1gVGfY9fcdg6jg5BXRuQjvDhZ65C8k3WA9gemy6YC6wX3Gx8hJ6J27H
 8x4NyS2i9dc7yo7IjeKLfkJbdrwJvnmDYjTa4VHC3ZyoFewAW5vk21MiodWH4XZwsX
 hne0KUqKUSiitaWQeznzMa5EsGNKQWvl+kY3QxWw+anNiuYxGsLpiX903y2CKtuGcp
 1fpsi44mIXd51SeVfoW/J74LAmTLYdVHs6Gm3e4i8FSUlAL+oM3JvIYVMzXpMO2fFv
 E1feNPP7OEIcUHmrswPBcbUTonWBEPjeef08rq4yiie66P9WWGcsokUtwiNIK3F1g9
 /JHmxQiRyr/aQ==
Date: Sat, 28 Jan 2023 15:48:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: bus: add STM32 System Bus
Message-ID: <20230128154827.4f23534e@jic23-huawei>
In-Reply-To: <20230127164040.1047583-4-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-4-gatien.chevallier@foss.st.com>
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
 Loic PALLARDY <loic.pallardy@st.com>, olivier.moysan@foss.st.com,
 kuba@kernel.org, arnaud.pouliquen@foss.st.com, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, fabrice.gasnier@foss.st.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, linux-i2c@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 27 Jan 2023 17:40:37 +0100
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

> Document STM32 System Bus. This bus is intended to control firewall
> access for the peripherals connected to it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
Trivial comment on formatting.

> +
> +examples:
> +  - |
> +    // In this example, the rng1 device refers to etzpc as its domain controller.
> +    // Same goes for fmc.
> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +
> +    etzpc: bus@5c007000 {
> +        compatible = "st,stm32mp15-sys-bus";
> +        reg = <0x5c007000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        feature-domain-controller;
> +        #feature-domain-cells = <1>;
> +
> +        rng1: rng@54003000 {

Odd mixture of 4 spacing and 2 spacing in this example.
I'd suggest one or the other (slight preference for 4 space indents).


> +          compatible = "st,stm32-rng";
> +          reg = <0x54003000 0x400>;
> +          clocks = <&rcc RNG1_K>;
> +          resets = <&rcc RNG1_R>;
> +          feature-domains = <&etzpc 7>;
> +          status = "disabled";
> +        };
