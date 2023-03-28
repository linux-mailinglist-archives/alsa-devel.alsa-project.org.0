Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A58166CB912
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 10:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E17D1EB;
	Tue, 28 Mar 2023 10:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E17D1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679990883;
	bh=4aU5YsDQVuPNXUfEODsG5OYhMvrBMofnFamF1POnBPs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kmOyKhWhLlm9xYEOvP8qEURlN1amDz+U7JvXZ3ucJD+GTpR4i4wwDFQZyLIZGv6G/
	 bDtiAu1SWKAMcQ7TufHLrWkDfOSXYue6fue+5clyFMGWkhUqBPQrHSC3RZO4xJU8IL
	 yWOuINtv9+dHkAFzMvTNjcrJqy9oVzoTygl3CJFg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8005F8024E;
	Tue, 28 Mar 2023 10:07:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BB86F80272; Tue, 28 Mar 2023 10:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3D3EF80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 10:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D3EF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j6ycI3Kt
Received: by mail-ed1-x530.google.com with SMTP id w9so46124120edc.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679990805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyF2OqvnXBD6NyaUZpw1o6ca+S8z8pOJepbtCtI7p8Y=;
        b=j6ycI3Kt6mgu6WTquTNZrmOtTP2SlDHhUefx7XNEJFAlllQuZWc5EylnPFsbis9QdP
         9iW3epMZlPtkh4aUU1EOO3CsFtptDflNyjbydK7KWdnyUkTRa0wMQen2RqN5M886UJzJ
         BcwKGnTNalL+PnnyRB8Iw7B7laorNNQgalMam7vbAjhSTVCEyxgzP2ygJNGcBIwL8rrl
         Nsqv8b/aHGvTeaqwlVAuyVt5/DLV2gbk42fQOzfGC7CcxFP+gjHjvZqVQvGD8UCpZofj
         0KRI+JV1itZiBvKXN6D5kySI0KFuaAKzy/1Ug52ouicKxvU+ncG9elCk51/xIr0jtpy/
         355Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679990805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyF2OqvnXBD6NyaUZpw1o6ca+S8z8pOJepbtCtI7p8Y=;
        b=z25iGJWPj/ZsOyDuGKdFVzL5QjPfJiVY6BQcUetZ3OJ3kt1T9sBtbsF8iMiKFlG66A
         Y4SKEa+tWkXIDUjIpumqUhLqGnJfozOqEbsPKk+4Ek+D2PhZoZAodSn6Dvtl9rPzJxfP
         fCyVT+UPbqwlv/UdIVkfH8upIPDzvylGaNpygS1eWFi3LoWIYUPmPNT2d/NVO2uEU42d
         HT2VwGN7nN2eEVAN1KME2rkNjkvyzWTsI8CeUKfDvCzc5HuiVtKWdD5Y83OgouQHF/Oj
         TFMMS62oRtppDDix3ieXZZghkDrtKsG32nFvxZYYX4iuQrvk9fVM4LjCyFCqbjwvv74C
         PewQ==
X-Gm-Message-State: AAQBX9e3VadJU6niYgj6uhqqX0QlslE1UL+1nX5ScxEK1rqlvVnffzf4
	8MQLRAmGb6kwfw6WN70OeaHPEA==
X-Google-Smtp-Source: 
 AKy350Y6GOi3awN4oHd3MDvKCOcYgqq2rVYVRnK9rFawD570hz6iS9fbvtK4Yq5LHDk6d8WEcNcH0A==
X-Received: by 2002:aa7:c1ce:0:b0:502:1f0d:140b with SMTP id
 d14-20020aa7c1ce000000b005021f0d140bmr14733894edp.11.1679990805474;
        Tue, 28 Mar 2023 01:06:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 c25-20020a50f619000000b004bd6e3ed196sm15751194edn.86.2023.03.28.01.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:06:45 -0700 (PDT)
Message-ID: <ddd7bc0b-7ec0-ee4b-7872-fe03dcf69b86@linaro.org>
Date: Tue, 28 Mar 2023 10:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: Add the Lantiq PEF2256 E1/T1/J1
 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230328074811.594361-1-herve.codina@bootlin.com>
 <20230328074811.594361-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328074811.594361-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OALR24VNRJJUFBVBSKZS47JNNNBDFYY2
X-Message-ID-Hash: OALR24VNRJJUFBVBSKZS47JNNNBDFYY2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OALR24VNRJJUFBVBSKZS47JNNNBDFYY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 09:48, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/mfd/lantiq,pef2256.yaml          | 270 ++++++++++++++++++
>  1 file changed, 270 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml


> +  pinctrl:
> +    $ref: /schemas/pinctrl/pinctrl.yaml#
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +
> +        properties:
> +          pins:
> +            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
> +
> +          function:
> +            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS,
> +                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
> +                    GPI, GPOH, GPOL ]
> +
> +        additionalProperties: false

Move it up (Put it after $ref: /schemas/pinctrl/pincfg-node.yaml#)

> +
> +        required:
> +          - pins
> +          - function
> +
> +    additionalProperties: false

Put it after $ref


> +
> +  lantiq,line-interface:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [e1, t1j1]
> +    default: e1
> +    description: |
> +      The line interface type
> +        - e1: E1 line
> +        - t1j1: T1/J1 line
> +
> +  lantiq,frame-format:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The line interface frame format.
> +
> +  lantiq,data-rate-bps:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2048000, 4096000, 8192000, 16384000]
> +    default: 2048000
> +    description:
> +      Data rate (bit per seconds) on the system highway.
> +
> +  lantiq,clock-falling-edge:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Data is sent on falling edge of the clock (and received on the rising
> +      edge). If 'clock-falling-edge' is not present, data is sent on the
> +      rising edge (and received on the falling edge).
> +
> +  lantiq,channel-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +    default: 0
> +    description:
> +      The pef2256 delivers a full frame (32 8bit time-slots in E1 and 24 8bit
> +      time-slots 8 8bit signaling in E1/J1) every 125us. This lead to a data
> +      rate of 2048000 bit/s. When lantiq,data-rate-bps is more than 2048000
> +      bit/s, the data (all 32 8bit) present in the frame are interleave with
> +      unused time-slots. The lantiq,channel-phase property allows to set the
> +      correct alignment of the interleave mechanism.
> +      For instance, suppose lantiq,data-rate-bps = 8192000 (ie 4*2048000), and
> +      lantiq,channel-phase = 2, the interleave schema with unused time-slots
> +      (nu) and used time-slots (XX) for TSi is
> +        nu nu XX nu nu nu XX nu nu nu XX nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps = 8192000, and lantiq,channel-phase = 1, the
> +      interleave schema is
> +        nu XX nu nu nu XX nu nu nu XX nu nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps = 4096000 (ie 2*2048000), and
> +      lantiq,channel-phase = 1, the interleave schema is
> +        nu    XX    nu    XX    nu    XX
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +
> +  lantiq,subordinate:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present, the pef2256 works in subordinate mode. In this mode it
> +      synchronizes on line interface clock signals. Otherwise, it synchronizes
> +      on internal clocks.
> +
> +patternProperties:
> +  '^codec([0-9]|[1-2][0-9]|3[0-1])?$':

Missing '-' before suffix numbers.

> +    type: object
> +    $ref: /schemas/sound/dai-common.yaml
> +    description:
> +      Codec provided by the pef2256. This codec allows to use some of the PCM
> +      system highway time-slots as audio channels to transport audio data over
> +      the E1/T1/J1 lines.
> +      The time-slots used by the codec must be set and so, the properties
> +      'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> +      'dai-tdm-slot-rx-mask' must be present in the sound card node for
> +      sub-nodes that involve the codec. The codec uses 8bit time-slots.
> +      'dai-tdm-tdm-slot-with' must be set to 8.
> +      The tx and rx masks define the pef2256 time-slots assigned to the codec.
> +
> +    properties:
> +      compatible:
> +        const: lantiq,pef2256-codec
> +
> +      '#sound-dai-cells':
> +        const: 0
> +
> +    required:
> +      - compatible
> +      - '#sound-dai-cells'
> +
> +    unevaluatedProperties: false

Put it after $ref

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        lantiq,line-interface:
> +          contains:
> +            const: e1
> +    then:
> +      properties:
> +        lantiq,frame-format:
> +          enum: [doubleframe, crc4-multiframe, auto-multiframe]
> +          default: doubleframe
> +          description: |
> +            The E1 line interface frame format
> +              - doubleframe: Doubleframe format
> +              - crc4-multiframe: CRC4 multiframe format
> +              - auto-multiframe: CRC4 multiframe format with interworking
> +                                 capabilities (ITU-T G.706 Annex B)
> +
> +    else:
> +      # T1/J1 line
> +      properties:
> +        lantiq,frame-format:
> +          enum: [4frame, 12frame, 24frame, 72frame]
> +          default: 12frame
> +          description: |
> +            The T1/J1 line interface frame format
> +              - 4frame: 4-frame multiframe format (F4)
> +              - 12frame: 12-frame multiframe format (F12, D3/4)
> +              - 24frame: 24-frame multiframe format (ESF)
> +              - 72frame: 72-frame multiframe format (F72, remote switch mode)
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    framer@2000000 {
> +      compatible = "lantiq,pef2256", "simple-mfd";
> +      reg = <0x2000000 0x100>;
> +      interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +      interrupt-parent = <&intc>;
> +      clocks = <&clk_mclk>, <&clk_sclkr>, <&clk_sclkx>;
> +      clock-names = "mclk", "sclkr", "sclkx";
> +      reset-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
> +      lantiq,data-rate-bps = <4096000>;
> +
> +      pinctrl {
> +        pef2256_rpa_sypr: rpa-pins {
> +          pins = "RPA";
> +          function = "SYPR";
> +        };
> +        pef2256_xpa_sypx: xpa-pins {
> +          pins = "XPA";
> +          function = "SYPX";
> +        };
> +      };
> +
> +      pef2256_codec0: codec0 {

codec-0

> +        compatible = "lantiq,pef2256-codec";
> +        #sound-dai-cells = <0>;
> +        sound-name-prefix = "PEF2256_0";
> +      };
> +
> +      pef2256_codec1: codec1 {

codec-1

> +        compatible = "lantiq,pef2256-codec";
> +        #sound-dai-cells = <0>;
> +        sound-name-prefix = "PEF2256_1";
> +      };
> +    };
> +


Best regards,
Krzysztof

