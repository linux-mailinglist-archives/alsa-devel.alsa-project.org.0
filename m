Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B56FF010
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 12:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1187C6C0;
	Thu, 11 May 2023 12:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1187C6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683801843;
	bh=p9+3+pJk3ats7QZZyKgWI9odq3Nh0cz+BhWYHLzEXhQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y5E8/b7ekDDEl4qcJoiwTQfglDVs92ZzjQc0esvr/oluw0kcYVYAyXzN5cgR0rIBE
	 /DH/7xefk70VvKUOhRUdPZlxcBpTaq65S2h7K5SndsshS2fyHk1A5/LGW63mxc9GnE
	 ehvsLndM7MzSQxj+3xVuasqI7SngR6xfPw6eToYE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8D9F80310;
	Thu, 11 May 2023 12:43:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF096F8032D; Thu, 11 May 2023 12:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C46C0F80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 12:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C46C0F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=iQPaLyl/
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so5637687f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683801776; x=1686393776;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=PrLfI/6EF+lP+FmpMuOvP8uhLGdhvalpprKj2cFd/lA=;
        b=iQPaLyl/16gHXplnypDmmplXN8cK9AUkOoCh1217AYWB50gSLr5daJsYPcWDAVAs7w
         RWy1f7RPnZkr+xDDDhuNHYrgTeKqnIXTVwEW7Y74jPCSW90WrBzOh+DTy6xLyOfCD+3N
         y/dRrW4l+VwusPY7BDDgE08yQaWAxF5hHunkuGrrrQ4+jhNY+SkV8IFCBUeUuxY2euzu
         QO6h/kSlsOcDI4t+P7AV+0xVKBy35K+a0fv2wb8gRNRaZBxwMn5oY2aPQT2oOBU1Tbkt
         Ugi+N4Kn7IcaawyH/STzUmQ1hCEFzighxHukX1AyMWlSAnXDDo0uDRMZac1ib8e0vGZD
         auuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683801776; x=1686393776;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrLfI/6EF+lP+FmpMuOvP8uhLGdhvalpprKj2cFd/lA=;
        b=B8iDDC9oMkICtHDCmoA0UBecwzbfDHixO4YtLHCo5XkZ4KhD3ceVJHMUbnaAIjN8h3
         5lV3U7ZsRtpMdghAo4sbFKlxE1eZBX1jRJ3qHyf7WNp77yVwCF8XOr13D96SgraaNO+9
         ymaFBQPny5+hgUpTz1wyfElPXHYvNSbu2KfU3zbF9tLKLN7V1/eJYMRTCbwEev+KICBO
         g8ni3lmgZndOmbqFKK19kJBqxwImiMcsY3yBTNJLIl/5obUwEdDGyyk97KaN0w/ro7VT
         69c7JtsZ4f8+gwbS0OyatYsiLrolY7FHnJuSFus/V+6NBT+suDri98nej/1Quoig/y6p
         bf+g==
X-Gm-Message-State: AC+VfDxqVcsKzyA2vhzXukbxORkwX+k1Rf52yayCO9wwb9n56OBOJydM
	7idvOAzX5Vzb75us3SkptaI=
X-Google-Smtp-Source: 
 ACHHUZ47rYP1ziytFCzBKE9uLcP9fev839NJloS4WCDCBjc6Jf1ncpn+PmAdYQmPZjV4fw3ayrmxNg==
X-Received: by 2002:adf:eac9:0:b0:2f7:c224:cd32 with SMTP id
 o9-20020adfeac9000000b002f7c224cd32mr15575438wrn.10.1683801775603;
        Thu, 11 May 2023 03:42:55 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 10-20020a05600c024a00b003f423dfc686sm12591622wmj.45.2023.05.11.03.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 03:42:55 -0700 (PDT)
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
 <20230510112349.939991-3-aidanmacdonald.0x0@gmail.com>
 <7b3a37e8-0210-c539-5b5b-bf8e587707ea@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: ASoC: Add ESS ES9218P codec bindings
Date: Thu, 11 May 2023 11:15:38 +0100
In-reply-to: <7b3a37e8-0210-c539-5b5b-bf8e587707ea@linaro.org>
Message-ID: <7Zga7RBqLNcaG5ylTIY4Qn7CUdE1IJsW@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 75ZEJVUWMVLG63BBAO2NZLZMBVRBUUVD
X-Message-ID-Hash: 75ZEJVUWMVLG63BBAO2NZLZMBVRBUUVD
X-MailFrom: aidanmacdonald.0x0@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75ZEJVUWMVLG63BBAO2NZLZMBVRBUUVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 10/05/2023 13:23, Aidan MacDonald wrote:
>> ...
>> +  ess,max-clock-div:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Sets the maximum MCLK divider for generating the internal CLK.
>> +      CLK must be at least 20x the I2C bus speed or I2C transactions
>> +      will fail. The maximum divider should be chosen to ensure that
>> +      CLK will not fall below the limit.
>> +    enum:
>> +      - 1
>> +      - 2
>> +      - 4
>> +      - 8
>> +    default: 1
>
> Why do you need to customize it per board?
>

There's no generic API to read or change the bus speed (SCL frequency)
for I2C adapters, so it's impossible to calculate a limit on the MCLK
divider automatically.

Defaulting to 1 is always safe, but means wasting power at lower sample
rates. If you know what the bus speed is you can use a higher divider
limit to save power, and it has to be done at the board/firmware level
because that's the only place where the bus speed is known.

>> +
>> +  ess,oscillator-pad-bias:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Sets the oscillator pad drive bias. 0 - full bias, 15 - disabled.
>> +    minimum: 0
>> +    maximum: 15
>> +    default: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#sound-dai-cells"
>> +  - avdd-supply
>> +  - vcca-supply
>> +  - avcc3v3-supply
>> +  - avcc1v8-supply
>> +  - clocks
>> +  - clock-names
>> +  - reset-gpios
>> +
>> +additionalProperties: false
>
> Instead: unevaluatedProperties: false
>
>
>> +
>> +examples:
>
> Best regards,
> Krzysztof

Everything else agreed, I'll send v2 later today.

Regards,
Aidan
