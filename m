Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCAB6899F7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 14:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B784C7F1;
	Fri,  3 Feb 2023 14:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B784C7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675431870;
	bh=hPsY8aCZasv9t9B1xk6z24UjKT5ajybwZsEwPLgvmZQ=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MaGQNKDHpj/9twSX3ECEEiDiVvd3S43IRy2Z/rOornUADJ1ajanUMib5WD9kf6Use
	 8vcZIU/nSBjBztSEstmBGEO9LfHP7mr4mGDxHFcOYcbvRcsbsEwl4KmBL/CUX+DNBe
	 BJ8VA0C0mvlbyfaTBdvCqxHZlWIAivmIsy2xGXxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5361F800E3;
	Fri,  3 Feb 2023 14:43:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8354AF8032B; Fri,  3 Feb 2023 14:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D28F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 14:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D28F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=SoaciP0t
Received: by mail-wm1-x329.google.com with SMTP id q8so3893339wmo.5
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 05:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=Ugc/Mf7gmptS4sxRo47lha6Z1ILO8fTg7LLtEjNneFs=;
 b=SoaciP0tiX4p1fUCbCA4vQIOtc0ihsGJTT654jpN5I372gNWZquSKEnF2CuI6cRwhq
 O1ng6H23VGd9bpb+EHMYvbITmdN/tTM32EOPdec5fCgN5jtTTGjpZFEQwX5h1+CpnPV/
 dH/zwHOilwFzcJ+JZ+O0QkfFZkzLjMZmLiku2NEaVcAZwLmi+t78q1ywLpRcWvSSIfQT
 fhOFCLQAqThE+0Ob/clHdDUTd5ObPn6UvMapgCuMk0zReCXPUZ38yqAk8eyd7/KMks42
 8b2elC8bGFWgi4aPZJVNNUIR5zzCDNVS4pSlCJDRhgqQgWG/akslxJEgDm0lRX2x99DN
 NF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ugc/Mf7gmptS4sxRo47lha6Z1ILO8fTg7LLtEjNneFs=;
 b=5bO7t5WjckRoAXjqkOce5nC0d8mWxqQVSJ66y1p48npITU3J8bgJYmsXIF2Y/EQqFD
 RmOE+KWU3JYY6Ubdq6yEcsIJ2b+3WxkEJ0gu4hyiDDqeco/UoJBfWrylWYF78nbbL2K0
 ZJrg4R/a1JQCAk+0PSfYGMK0YrR94HgK1enYK3B/Z12PxITfOIaMG/N27+2Pb2iaNN3Z
 nW6pA5dgeqlI+xCa+4srDnOkwDsPSCn54WLi+lmDlywcWXMFRrsZN3Ed2hEQlTfomms8
 KAPHEzMHMzycBL2YLGDCm7mkA5BDvkuLtNBIgJ9/T5BOi7JkfMbUbqKMq5FQcmog8qaZ
 Je1A==
X-Gm-Message-State: AO0yUKXpAvrghfW6iuy8Q2dWda6Sw8IhNS1MQTo0T+4FQdgQpVcZWt/g
 JrmgbY19TNBGkIBSG3ulNB/Jdg==
X-Google-Smtp-Source: AK7set9drg9MA5H07h22uzZUlBFGRMcQpErN2uGMh/pn7M4dkwP/6Oix641g7LbENbXJC+E4TYujVw==
X-Received: by 2002:a05:600c:cca:b0:3db:bc5:b2ae with SMTP id
 fk10-20020a05600c0cca00b003db0bc5b2aemr8940843wmb.41.1675431796833; 
 Fri, 03 Feb 2023 05:43:16 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003dd1bd66e0dsm3127550wmo.3.2023.02.03.05.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 05:43:16 -0800 (PST)
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-7-jbrunet@baylibre.com>
 <6e6ed493-4748-46ca-7a26-fe9cf6e2377a@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 6/9] ASoC: dt-bindings: meson: convert axg fifo to schema
Date: Fri, 03 Feb 2023 14:27:50 +0100
In-reply-to: <6e6ed493-4748-46ca-7a26-fe9cf6e2377a@linaro.org>
Message-ID: <1jmt5un9u4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri 03 Feb 2023 at 09:02, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 02/02/2023 19:36, Jerome Brunet wrote:
>> Convert the DT binding documentation for the Amlogic axg audio FIFOs to
>> schema.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../bindings/sound/amlogic,axg-fifo.txt       |  34 -----
>>  .../bindings/sound/amlogic,axg-fifo.yaml      | 116 ++++++++++++++++++
>>  2 files changed, 116 insertions(+), 34 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>> deleted file mode 100644
>> index fa4545ed81ca..000000000000
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -* Amlogic Audio FIFO controllers
>> -
>> -Required properties:
>> -- compatible: 'amlogic,axg-toddr' or
>> -	      'amlogic,axg-toddr' or
>> -	      'amlogic,g12a-frddr' or
>> -	      'amlogic,g12a-toddr' or
>> -	      'amlogic,sm1-frddr' or
>> -	      'amlogic,sm1-toddr'
>> -- reg: physical base address of the controller and length of memory
>> -       mapped region.
>> -- interrupts: interrupt specifier for the fifo.
>> -- clocks: phandle to the fifo peripheral clock provided by the audio
>> -	  clock controller.
>> -- resets: list of reset phandle, one for each entry reset-names.
>> -- reset-names: should contain the following:
>> -  * "arb" : memory ARB line (required)
>> -  * "rst" : dedicated device reset line (optional)
>> -- #sound-dai-cells: must be 0.
>> -- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
>> -  		      is useful for determining certain configuration such
>> -		      as the flush threshold of the fifo
>> -
>> -Example of FRDDR A on the A113 SoC:
>> -
>> -frddr_a: audio-controller@1c0 {
>> -	compatible = "amlogic,axg-frddr";
>> -	reg = <0x0 0x1c0 0x0 0x1c>;
>> -	#sound-dai-cells = <0>;
>> -	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
>> -	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
>> -	resets = <&arb AXG_ARB_FRDDR_A>;
>> -	fifo-depth = <512>;
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
>> new file mode 100644
>> index 000000000000..f6222ad08880
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
>> @@ -0,0 +1,116 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic AXG Audio FIFO controllers
>> +
>> +maintainers:
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^audio-controller@.*"
>> +
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - amlogic,axg-toddr
>> +              - amlogic,axg-frddr
>> +      - items:
>> +          - enum:
>> +              - amlogic,g12a-toddr
>> +              - amlogic,sm1-toddr
>> +          - const:
>> +              amlogic,axg-toddr
>> +      - items:
>> +          - enum:
>> +              - amlogic,g12a-frddr
>> +              - amlogic,sm1-frddr
>> +          - const:
>> +              amlogic,axg-frddr
>> +
>
> All usual comments apply.
>
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: Peripheral clock
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: Memory ARB line
>> +      - description: Dedicated device reset line
>
> This won't work without minItems and you should see errors on your DTS
> or in dt_binding_check
>

The example provided here worked but there is indeed a warning with the
axg-frddr variant.

I'm adding a 2nd example so it does not happen again.

>> +
>> +  reset-names: true
>
> minItems
> maxItems

Adding this causes troubles with the reset-names definitions in the 'if'
clause. If I put min: 1, max: 2 and min: 2 in the 'then' clause I get:

> Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml: allOf:1:then:properties:reset-names: 'oneOf' conditional failed, one must be fixed:
>        [{'const': 'arb'}, {'const': 'rst'}] is too long
>        [{'const': 'arb'}, {'const': 'rst'}] is too short
>        False schema does not allow 2
>        1 was expected
>        hint: "minItems" is only needed if less than the "items" list length
>        from schema $id: http://devicetree.org/meta-schemas/items.yaml#

The older devices just have the 'arb' reset.
Newer devices have a 2nd reset line (called rst here)

If I just restrict the min and max, it would be valid for the older
devices to have 'rst' only - but it is not valid.

With just 'true', it works as expected (throw errors if an incorrect
name or number of names is passed). Min and Max comes from the items list.

Any suggestions ?

>
>> +
>> +  amlogic,fifo-depth:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Size of the controller's fifo in bytes
>> +
>> +required:
>
> Best regards,
> Krzysztof

