Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE091643F95
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 10:17:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F2641740;
	Tue,  6 Dec 2022 10:16:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F2641740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670318236;
	bh=K4JlnXTyZc7ANIrM2XjOy0isfMgbzX9qEt6WNEu1vLs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOK2YcRhjZx1soGXbmNcMw1Sw62yblMbrWCpsR9t1GmfqeeqoBMumIPGBUDBif1ek
	 u4sHwL/c/MCnN4bvePFh9NJr7xMzkiBBQpHWlGx3jf6g0H54QtKnIQJC5C2Yqvzb1o
	 cE+C3nU1lr0FUPjRYqb4ATELJkPSY/XYR9RMlBwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C54CBF80121;
	Tue,  6 Dec 2022 10:16:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E56CF8014C; Tue,  6 Dec 2022 10:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCDC6F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 10:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDC6F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bF7aDatV"
Received: by mail-lj1-x22a.google.com with SMTP id a19so16560466ljk.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Dec 2022 01:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSz8+pdzVOvO17mmGP1PwKitaiaqBA0sMFckD9UpIz8=;
 b=bF7aDatVUWwwHFmYq8p+W4TB9+kDOfdUJgkLUAEalM21QMbDFEPI1W1nnH+5/Y/jKH
 zHjgOiwFTzniV9CrNh1lMlnmhL4Vuo9XhdXvJnBwX91UmAI9DeX1ket72WcxUYyxBD+N
 2rMaYpDsSEVHHbYj1x57wfg4bUwPFFEK0yrWD3MZTiaZgKfsXKZv/uw0j3eXg7VsvP35
 aLL1meaCDJdkEgFOn2al3FRv3Mo63jXDIGbiy3o4MghtDitEuFV4iAvFjsEcdeqnp/bg
 VVfW/IyQ2oIph+wPv4fgyDExBk1aMzJMqO4H0ZFDE/WnXMfMAlZl/9fr9pJpIHtue+0K
 5xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nSz8+pdzVOvO17mmGP1PwKitaiaqBA0sMFckD9UpIz8=;
 b=Tw//HsUp15yn6yHau6E0l8ZjoM5SphkxLWfKaQxkPwtwTKZ+ETOI+/SEHzj44Vqk1m
 f5zfHVcn2X10n2a7v/fwld8c1zYDgi8fcEgQ1w8E4GrVZMJtHaMLoWC58CS8xa0Tq3PC
 0puR2v9k096M9nnmTHYt8dXpIVAIpIeDKPpChBHoHn3wdBEdrOC+rSu3jqJGOKeVIe37
 UfrSZMRfm2dQ8S4g1Z72u9YcmCgQGy2G9YVsrivQjV4ckHoz4+/M1NpBvlFefmZVyLkI
 KWGeb3AKNxee7DTvgiyAoeYVLB62gVzaU0wfsNZC18IH7qWdmw98Z1dUqmZSu0CspEVY
 QvcQ==
X-Gm-Message-State: ANoB5pkNWHHHsAj4mDUqjGFxUDzdKnBDEygbRx/sOsCVMYAhk9ZFkFhx
 Dzy4Vzb40FfpHNqUQ5S7rdOBFA==
X-Google-Smtp-Source: AA0mqf52hPel6Y7yp0GvQe24wYR3MQwPfgyyDGxL0XTTjSrgY2kcLkcne0d6WDnxB9zk3iTNPDFRlw==
X-Received: by 2002:a2e:c52:0:b0:277:9bf:9411 with SMTP id
 o18-20020a2e0c52000000b0027709bf9411mr19869694ljd.504.1670318168431; 
 Tue, 06 Dec 2022 01:16:08 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a2e895a000000b00279e0b8bae7sm1077010ljk.65.2022.12.06.01.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 01:16:07 -0800 (PST)
Message-ID: <0565a333-3bb7-89db-735d-56006405bda4@linaro.org>
Date: Tue, 6 Dec 2022 10:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: sound: ti,pcm3168a: Convert to
 json-schema
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1669980383.git.geert+renesas@glider.be>
 <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
 <b105572c-96fe-dbad-c435-43233cfb25a7@linaro.org>
 <CAMuHMdXG39BoMScDpH_Cxc-BXBKZHxyQqe6MJMEhnerN3yU6Uw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdXG39BoMScDpH_Cxc-BXBKZHxyQqe6MJMEhnerN3yU6Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 05/12/2022 09:00, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> Thanks for your comments!
> 
> On Sat, Dec 3, 2022 at 1:13 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 02/12/2022 13:55, Geert Uytterhoeven wrote:
>>> Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
>>> documentation to json-schema.
>>>
>>> Add missing properties.
>>> Drop unneeded pinctrl properties from example.
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +description:
>>> +  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
>>> +  96/192kHz sampling rate, supporting both SPI and I2C bus access.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ti,pcm3168a
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: System clock input
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: scki
>>> +
>>> +  reset-gpios:
>>> +    items:
>>> +      - description: |
>>> +          GPIO line connected to the active-low RST pin of the codec.
>>> +            RST = low: device power-down
>>> +            RST = high: device is enabled
>>> +
>>> +  "#sound-dai-cells":
>>> +    enum: [0, 1]
>>
>> This is a bit unexpected. Looking at DTSes:
>> 1. I see in ulcb-kf.dtsi with cells==0, but two endpoints. The dai cells
>> seem unused? In such case shall dai-cells be skipped if we have endpoints?
>>
>> 2. in k3-j721e-common-proc-board.dts has cells=1, but user's phandle
>> does not have an argument, so practically it is ==0? The user -
>> sound/soc/ti/j721e-evm.c - just gets the node and does not use cells,
>> right? So even though dai-cells==1, it does not matter, because user
>> gets its own parsing?
>>
>> 3. The pcm3168a driver also does not have any xlate function, but it
>> registers to DAIs, so all uses should be with cells==1 to select proper
>> DAI...
> 
> I have no idea (DAI is magic to me), and hope the audio experts
> can provide some input...

It is a bit of magic to me too. Yet I think the correct usage of this is
with dai-cells=1. I think we can skip the choice here between
sound-dai-cells and endpoints (to allow only one) and only fix the value
here to =1.

This would also require changing
arch/arm64/boot/dts/renesas/ulcb-kf.dtsi to dai-cells=1.

Best regards,
Krzysztof

