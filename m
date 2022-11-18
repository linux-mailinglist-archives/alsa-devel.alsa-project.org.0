Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C739D630D81
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:49:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C2D1705;
	Sat, 19 Nov 2022 09:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C2D1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847745;
	bh=XWcRUV744AyFTur3H2/PtkitoTY2jrnu2d7R7y3/obI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTi30IVjvUmmGzEKbtgNpDimbEiABoU8yabASh15eq9LNgh1Q6Gi1zuCd86Bdt57h
	 mNAhKU7mIkiK5YEEL688MFMJdWI7IwC00H20kSbm6JHP/fyvfYJO4Cl0wyyQbg3MQe
	 UVgiNLxbCyuU1vHdlrROdESoHKes5+OqMgjknzOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCDFCF80607;
	Sat, 19 Nov 2022 09:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC1DF801D8; Fri, 18 Nov 2022 09:28:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6FC3F800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 09:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6FC3F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c0DwlSGG"
Received: by mail-lj1-x231.google.com with SMTP id u11so5885588ljk.6
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 00:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DZabo7ibEwOOw8J7VwUfivpQWJQQOqpTQOP6qmrwcFs=;
 b=c0DwlSGGZnpMt70g7cvHCqqLtClo+HqnYC/KDMQT/2C4Kgme2ED6Ajko4OIXpmbeXS
 m5SIke4QdtVszOu65Cv1AnF200xxc1a/iy1cj+W/4WPUi1idnzCq3jL3rOCyXQ/Sy7Xo
 FhxYYZmL7CP0ofdSTlNio6J4qvL4Gb4QE7SbMbyvGwdcz0q2lnaiEphLSDGuz3cWY979
 gQT9VdBtzdRs59dL/dUgCq5BV84WRT+Q7ok8jIBAq5G8XWvjz6kIifP/efd7/+/UMkZu
 +qzJPaRvsSeqy/GGhmsAycmFzituYnYzJUATh2BkazIz98eeuD3Eq9fkv2cSDtBNQpLB
 eqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DZabo7ibEwOOw8J7VwUfivpQWJQQOqpTQOP6qmrwcFs=;
 b=jvIdnJINJL5Dzb5C3j/QI3Wfizgdq0Gq/XAe5bGet0d8uKw5d+x6MPsqy+76l4BOIl
 YQmuEefrqcOW/Xrkluhhk6voVP0JLiiqbnTXbsfoZpQ9aaLBKvD3qM8UIVjja636kB8/
 qsproVIECFCjqN9eKKUti4hINWo7ZpKNdRGS1PZKyvzquWqXuV03N5fi8CDWT1orZ5/b
 1CRJFdwphDuaxcUXmVJh028VNRlgiP5AAGe1ArmcK1Hn3UuINkIUdM5Hkm4J0R70lxJ8
 TCSVzEFDvcm1uggw0n9YGSIdAmuTzeA7dImpRoTSqm4f/JSRKR8+WtNs1yuSbmqg1jgX
 1qpA==
X-Gm-Message-State: ANoB5pkV31NK5/Cqmtc+YqjqyjpVQYR1nHj911xVwSAz91jU/Q5V220k
 sJmYnrTcRqbLNQJqv/OeJnbW/g==
X-Google-Smtp-Source: AA0mqf5FUU/an0yPckwGnu0iJ8FLtTfHewcyaiyp5w+c6ymGf8LMkNj5Lkw1yXdUuHVX3l3x9IvIFA==
X-Received: by 2002:a2e:a5c7:0:b0:277:8d48:27dd with SMTP id
 n7-20020a2ea5c7000000b002778d4827ddmr2207144ljp.192.1668760111721; 
 Fri, 18 Nov 2022 00:28:31 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a056512369800b0049b8c0571e5sm564273lfs.113.2022.11.18.00.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 00:28:31 -0800 (PST)
Message-ID: <578b686e-8461-a959-86c5-83a8be1dc981@linaro.org>
Date: Fri, 18 Nov 2022 09:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
 <20221117220756.7a1bf734@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117220756.7a1bf734@xps-13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:30 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 17/11/2022 22:07, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> krzysztof.kozlowski@linaro.org wrote on Thu, 17 Nov 2022 13:38:42 +0100:
> 
>> The Devicetree bindings document does not have to say in the title that
>> it is a "binding", but instead just describe the hardware.  For shared
>> (re-usable) schemas, name them all as "common properties".
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml         | 2 +-
>>  Documentation/devicetree/bindings/dma/dma-common.yaml         | 2 +-
>>  Documentation/devicetree/bindings/dma/dma-controller.yaml     | 4 ++--
>>  Documentation/devicetree/bindings/dma/dma-router.yaml         | 4 ++--
>>  Documentation/devicetree/bindings/iio/adc/adc.yaml            | 2 +-
>>  .../devicetree/bindings/media/video-interface-devices.yaml    | 2 +-
>>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
>>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml     | 2 +-
>>  Documentation/devicetree/bindings/mtd/nand-chip.yaml          | 2 +-
>>  Documentation/devicetree/bindings/mtd/nand-controller.yaml    | 2 +-
>>  .../bindings/net/bluetooth/bluetooth-controller.yaml          | 2 +-
>>  Documentation/devicetree/bindings/net/can/can-controller.yaml | 2 +-
>>  .../devicetree/bindings/net/ethernet-controller.yaml          | 2 +-
>>  Documentation/devicetree/bindings/net/ethernet-phy.yaml       | 2 +-
>>  Documentation/devicetree/bindings/net/mdio.yaml               | 2 +-
>>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml        | 2 +-
>>  .../devicetree/bindings/power/reset/restart-handler.yaml      | 2 +-
>>  Documentation/devicetree/bindings/rtc/rtc.yaml                | 2 +-
>>  .../devicetree/bindings/soundwire/soundwire-controller.yaml   | 2 +-
>>  Documentation/devicetree/bindings/spi/spi-controller.yaml     | 2 +-
>>  Documentation/devicetree/bindings/watchdog/watchdog.yaml      | 2 +-
>>  21 files changed, 23 insertions(+), 23 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
>> index 97ac3a3fbb52..20b195ef9b70 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: NAND Chip and NAND Controller Generic Binding
>> +title: NAND Chip and NAND Controller common properties
> 
> I only see this now but the title should be
> 
> 	"NAND chip common properties"
> 
>>  
>>  maintainers:
>>    - Miquel Raynal <miquel.raynal@bootlin.com>
>> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> index 359a015d4e5a..a004efc42842 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: NAND Chip and NAND Controller Generic Binding
>> +title: NAND Chip and NAND Controller common properties
> 
> And here just "NAND controller..."
> 
> Of course the original purpose of your series is more to clean those
> titles rather than fixing them and if you disagree I am fine doing it
> myself aside, but if you could at the same time make the title more
> accurate that would be perfect.
> 
> Either ways:
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks, I update these manually, so I can correct the names to ones you
mentioned. Thanks.

Best regards,
Krzysztof

