Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C165A781FE3
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 22:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FB1D844;
	Sun, 20 Aug 2023 22:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FB1D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692563657;
	bh=DGObkH0Hf2W2STuTGFJtChxAJNFW/3mNS3O8U24hleY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JCeGP67yNFCLdm+g92nRhGXNqEH9AHKn/dIMdBbp4noKJFslRM5t3PsvUg2T6/AY/
	 DkuiP80F/UJenXNB6XAfOr9msxZko4YwrosqMHSm8wt4xN5lV/QspxJAAxFWUaup49
	 BM5pVodZ8B73b5Ur+4RZzr4AViSbMcxaXMDGL4GA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFB92F80551; Sun, 20 Aug 2023 22:33:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EA88F80199;
	Sun, 20 Aug 2023 22:33:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7B6DF8025E; Sun, 20 Aug 2023 22:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29ACDF800F8
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 22:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29ACDF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PNFR65hf
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so360080166b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 13:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692563595; x=1693168395;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEeP1FBLnBDJFadl/8z1r2UI/A7lTke2Ykdg5ppE0XU=;
        b=PNFR65hfsIQJDEu2NTLTCWm8XJzLbb4fr4XQ2ED41tQBAYa70iS50JSCXDRbcimtoN
         nw1/bqB78snJNI2XNAAQ8sPnRi4NAIRvTo9JozB4EanTVAeR2MqlC3SHdYlRfggyxuw0
         V8MEdAvxp0oe+dUeETYp7HvhgbezsAg9wqlrlaeAtBcXe7Ef430Khz1GJioLWto/17Un
         CxUdPdNMUhfnwjHB/DjWkzOXggTgVIOuAfxhkXRKK8uokuEj5JsxSO5fCV6rZfltLLAl
         9QLoxbB6V4czj0xHmmw2ER8FYYdGuXCy5DbYFl1Hn+z39xBXg7MUWITiR0JFt7xQC5GH
         beZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692563595; x=1693168395;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEeP1FBLnBDJFadl/8z1r2UI/A7lTke2Ykdg5ppE0XU=;
        b=QhELgfrVlGjEFwP4356mTvQAyt/1OaRRGtZf7miD3u8lL+OlCpRBL6QOgsrrSZhwSQ
         hxIsscjGYYzTg0x1nzEsN2M1qsQlP7T1QzHiT5Sg4sq6Ppoptnho+XUEGOpMhiFj36EW
         MR/rtA3OB/5U1clfkIRdSHCQorem1blvcxXolDBYgbdBdnYQpf3PzosU/7n3oi61uhoc
         yLRKZekr6qTnN3A+eL9xtcqBSgzEWmt6pf15Ag7r7W28Cle7UA0L2Ke7i4k5mTN6HGjG
         drBy/Z7hnngRla1b71x/0+RD5kv3lHcfzri/1abXchMwUZwtq8+ZTVc1YH6svuF1QUIS
         usng==
X-Gm-Message-State: AOJu0YwZwyaPDHntLw4peKfDN/A0QlDngzf8/0k6MycvhaEoIvwe4swp
	JNnO43SxDXyL5r+ntiLFz5MP0A==
X-Google-Smtp-Source: 
 AGHT+IE+vcupZ0WTHAPVWiHnLpzPaCRcD2vfiaEE9k6DuD3H4k5UJj/l+1dARFQGX9/QEHdMwHeY+A==
X-Received: by 2002:a17:906:319a:b0:9a1:697e:4bb2 with SMTP id
 26-20020a170906319a00b009a1697e4bb2mr3940826ejy.69.1692563595025;
        Sun, 20 Aug 2023 13:33:15 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 x6-20020a170906134600b00992d70f8078sm5241599ejb.106.2023.08.20.13.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 13:33:14 -0700 (PDT)
Message-ID: <6089b46d-a580-af52-0cac-84b46fe11e6c@linaro.org>
Date: Sun, 20 Aug 2023 22:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230820175655.206723-1-aford173@gmail.com>
 <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
In-Reply-To: <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TQSU3PEACHTT42ZWJASLWLW6EUO2P4IN
X-Message-ID-Hash: TQSU3PEACHTT42ZWJASLWLW6EUO2P4IN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQSU3PEACHTT42ZWJASLWLW6EUO2P4IN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/08/2023 22:32, Krzysztof Kozlowski wrote:
> On 20/08/2023 19:56, Adam Ford wrote:
>> The i.MX8MP appears to have the same easrc support as the Nano, so
>> add imx8mp as an option with a fallback to imx8mn.
>>
>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>
>> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
>> index bdde68a1059c..2d53b3b10f2c 100644
>> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
>> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
>> @@ -14,7 +14,11 @@ properties:
>>      pattern: "^easrc@.*"
>>  
>>    compatible:
>> -    const: fsl,imx8mn-easrc
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - fsl,imx8mp-easrc
>> +          - const: fsl,imx8mn-easrc
> 
> You need here also const for fsl,imx8mn-easrc, otherwise you do not
> allow it alone. Test it for fsl,imx8mn-easrc DTS - you will notice warnings.

Actually, I see now Rob's report... you did not have to test DTS even.
It was enough to test your change and this test was missing :(. Please
test your changes before sending.

Best regards,
Krzysztof

