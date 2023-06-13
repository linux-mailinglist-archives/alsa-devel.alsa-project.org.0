Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EF72DCA9
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 10:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC36823;
	Tue, 13 Jun 2023 10:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC36823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686645482;
	bh=ZaWtsTNFvwI3G/fUim/IlTWoqvLUHHc1fECCX7zme0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mEPwtFjxmyycf1izTX/ApCrc26plS6tlL+NjsilU/WGmkz+PDPxoU5Edg0ha63KGa
	 bdSfPPZDIJzwZH+hJltJV2rvI7H++77uQEaAVDgkBSIacpFykd6+A07VcB/TzDYTYm
	 nwV+B06uQEfU6B9frMHlfe2D8iCdfzjS4OY6BHHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 654C9F80301; Tue, 13 Jun 2023 10:36:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF48F80132;
	Tue, 13 Jun 2023 10:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3EE6F80149; Tue, 13 Jun 2023 10:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F23BF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 10:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F23BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y4CDzclI
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5187aa14e3bso55889a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645395; x=1689237395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rV8ssDQGynZC36t/0HgyiA06amNZ3IQmsZzAzsNY8U=;
        b=y4CDzclIQZShatWDsU4g3lX8SH6bhNFHPgveih8ze7Kc9XmzuzDL+ivOWMe2eRYY4n
         SHynu8bdnfsmsbFlk4+XCv5Wpbg9kKHzPiT/1j1d4MGxedsAFbxwRaZsJzsTkg7qWRvf
         zEt9kuTsIr8II9NnplGrk2BhQpS08Pi/MuQ+wFZAzZm6ivTIL4xsFCX+I9xF+Pv1iXm6
         CRhSQWqsAtktRmbIBe55zz+xSOqqywiySXJ4d7NNX2hbcQS3lut+iQYUrUyhjCwCa6xL
         C7LzI/Fh3kXECrU/hTkW0CUPk78AkZG2g7wJoWN/rKYqPl3Mg6RE36gwKU4JTRY9N0Il
         dHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645395; x=1689237395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rV8ssDQGynZC36t/0HgyiA06amNZ3IQmsZzAzsNY8U=;
        b=QMohSnOWAVASpNRSntz1Ql7PVQxGyy+CeouOp3Ma2jdvzp96G4B5Kvzw2CO9kTkruX
         hvnDU9bGPTxzSVLNUvM17ch2bIEMDwvJUNpUcZGeK4MJpP0BkDkbDX0qHvvPsDzaIaRL
         /O08JN29x0QvL4U/zV5PJqmmTRm9h1LKBZJ9e+3zmN44bSviEEd30jUnIKK77+ExUGv2
         KGU4D08Ulk5TdkldnNTglqByBBnA7ku4fAn3hyWmnA+o4b0DrW/LVNw38qevS2G5K4GC
         bbcqcNCOGDp8cQRkJ2CCk350/Q9szfbJFL2gZkY8saw88x6vdr6U2sUWrBaxelpBUFmZ
         jCAA==
X-Gm-Message-State: AC+VfDx3MYEPlXbeRSKx1ZX57hfo/riL4RI5Ow999Wfq43GKPJS9McfR
	Or+MqXEoIay3J7rTZ03ndquPKQ==
X-Google-Smtp-Source: 
 ACHHUZ5/yWvyHNJu5kdJjggeTbrrp8iqM6D5sLzGgr3NFThPesILUShQHdYNem5UzxF8lccohUMkDw==
X-Received: by 2002:a17:907:25c4:b0:969:9fd0:7ce7 with SMTP id
 ae4-20020a17090725c400b009699fd07ce7mr10932258ejc.11.1686645395135;
        Tue, 13 Jun 2023 01:36:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 gv19-20020a170906f11300b0097812e2b66csm6305158ejb.111.2023.06.13.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:36:34 -0700 (PDT)
Message-ID: <4f1c934c-5a68-a2cd-10d1-568d61865755@linaro.org>
Date: Tue, 13 Jun 2023 10:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: YingKun Meng <mengyingkun@loongson.cn>,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612090058.3039546-1-mengyingkun@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612090058.3039546-1-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XX44HNHYWCEE2OTPDBSUJP74QSVG3EO6
X-Message-ID-Hash: XX44HNHYWCEE2OTPDBSUJP74QSVG3EO6
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XX44HNHYWCEE2OTPDBSUJP74QSVG3EO6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2023 11:00, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
> 
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
> 
> On loongson platform, the chip has only one I2S controller.
> 
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> new file mode 100644
> index 000000000000..61e8babed402
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
> +
> +maintainers:
> +  - Yingkun Meng <mengyingkun@loongson.cn>
> +
> +description:
> +  The binding describes the sound card present in loongson
> +  7axxx/2kxxx platform. The sound card is an ASoC component
> +  which uses Loongson I2S controller to transfer the audio data.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls-audio-card

Generic compatible does not allow you to add any quirks or differences
if one board is a bit different.



Best regards,
Krzysztof

