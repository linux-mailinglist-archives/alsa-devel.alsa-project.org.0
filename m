Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3E554F7D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5FBA1FC5;
	Wed, 22 Jun 2022 17:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5FBA1FC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912282;
	bh=vEQY7t10/bQQko8sOk6JR/hsHAiRPE/bFtSMYWLVW/8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrFVbI+BaaIfETVoAnnAP18qzkilY2Mv7xdrf9szT0mJdNXPjF21wN3qYMWbtdNWC
	 5EinQgHc3/mBVu+hYQm/meDSNcR12X3kzCGmheIuMgN3UHwm4PUSlU+sX3zXApYGWv
	 P//CRKO4/zMpSjZb7QIObaeXE8gagEIKGfKOIOVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FE7F80687;
	Wed, 22 Jun 2022 17:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50140F804D8; Tue, 21 Jun 2022 00:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D31B2F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 00:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D31B2F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="ZYwDRlfK"
Received: by mail-wm1-x335.google.com with SMTP id
 i81-20020a1c3b54000000b0039c76434147so8433451wma.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hy0Xdesz3zE5Os2cbPhgUWle+TPKNOoLmrTtPiHUQEo=;
 b=ZYwDRlfKOOYKL+WIoMVmcZBHfH2hZEk5UjfT4f00kyzA1TsSsZ+LLvooOGasTgLcId
 /NSAyz9yGyNuvDaS+3NY3LrQJux2Kre3iqsxIzfjtaHz8yP2JPfiqTY0iIx54VZsLF75
 Bzqxx5NujcXuLdNFG/rKZtgfRcfumIOzcQjIFXgkYjJoapiB7NEOxkt7XIo+thbkpsDZ
 AXPYAD+vnORi81F2kP1c7A3xKDez+YBlJvfQsHH8b+VCDdx2BVjR6HFF0zFQyv0Thecj
 nsZQUG8VQSsn6ub9nbGGdLWLOvXLQCQP14tjSUiP3G3d/xo+501S04egjJ0MAwRhGLpS
 4+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hy0Xdesz3zE5Os2cbPhgUWle+TPKNOoLmrTtPiHUQEo=;
 b=UK0P8CzNh7Lv4Wrra/pBxKhg/p4U5cdjLrsgFHt2CCdHdh5Ouzfojy8BIzjL5oKPmG
 XyYov6apc7EW7mTOuizl1T67fSlbZQiCWg6HUi+4WCT93vbZBP9rJy1LChHG0V/zTtUV
 V+yt1FRHdE7ufHEig/MH9/afzMFsO5wS8/+XuKheEdKD6fUA2YLRP0WP5I2/JQLKeSbg
 Ou0lGkfpim7E89g7mHGf7yNCzodFCGj47ZtBBvyJbupVLNQAEDttpR0RFZ3Yr2TESNi6
 2+u7oAwU5+ptq4v/vsX9mSp3utwSYS1jIzYD6bF+OX4HynCchuo80k+/4C40Mn/uoe6A
 FLSg==
X-Gm-Message-State: AJIora+OMpAbbXCVx1oonPBfMj5aBfrh/KH6kWQ5NiNfbif0u0IrPmeK
 A2eYN2zQasAJzdZyVJz8209rUQ==
X-Google-Smtp-Source: AGRyM1sWkC5yVB3Vh70iYg5zpUyg3STH8l29UNOqYvK+YL6zEEjsIRVCZulowHoh/WC9YX4xPFr8HA==
X-Received: by 2002:a05:600c:4f51:b0:39c:7f6c:a8d6 with SMTP id
 m17-20020a05600c4f5100b0039c7f6ca8d6mr26961636wmq.143.1655765344601; 
 Mon, 20 Jun 2022 15:49:04 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d6989000000b0020c5253d8dcsm14187651wru.40.2022.06.20.15.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 15:49:03 -0700 (PDT)
Message-ID: <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
Date: Mon, 20 Jun 2022 23:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Conor.Dooley@microchip.com, fancer.lancer@gmail.com
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, masahiroy@kernel.org, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, daniel@ffwll.ch, dmaengine@vger.kernel.org
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



On 20/06/2022 23:46, Damien Le Moal wrote:
> On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
>> On 20/06/2022 21:56, Serge Semin wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>>> this.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> index e25d44c218f2..f2b9e3f062cd 100644
>>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> @@ -135,19 +135,41 @@ properties:
>>>>        of the designware controller, and the upper limit is also subject to
>>>>        controller configuration.
>>>>
>>>> -patternProperties:
>>>> -  "^.*@[0-9a-f]+$":
>>>> -    type: object
>>>> -    properties:
>>>> -      reg:
>>>> -        minimum: 0
>>>> -        maximum: 3
>>>> -
>>>> -      spi-rx-bus-width:
>>>> -        const: 1
>>>> -
>>>> -      spi-tx-bus-width:
>>>> -        const: 1
>>>> +if:
>>>> +  properties:
>>>> +    compatible:
>>>> +      contains:
>>>> +        const: snps,dwc-ssi-1.01a
>>>> +
>>>> +then:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +else:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 1
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 1
>>>
>>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
>>
>> 8 too? sure.
>>
>>> irrespective from the compatible string. The modern DW APB SSI
>>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>>> run-time there is no way to create a DT-schema correctly constraining
>>> the Rx/Tx SPI bus widths. So let's keep the
>>> compatible-string-independent "patternProperties" here but just extend
>>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>>> properties values.
>>
>> SGTM!
>>
>>>
>>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>>> activated by means of the corresponding CSR. So most likely the DW AHB
>>> SSI controllers need some specific setups too.
>>
>> hmm, well I'll leave that up to people that have Canaan hardware!
> 
> I will test this series.
> 

Cool, thanks.
I'll try to get a respin out tomorrow w/ the memory node "unfixed".
Conor.

>> Thanks,
>> Conor.
>>
>>>
>>> -Sergey
>>>
>>>>
>>>>  unevaluatedProperties: false
>>>>
>>>> --
>>>> 2.36.1
>>>>
>>
> 
> 
