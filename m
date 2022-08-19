Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C45599C95
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 15:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B6EF16AF;
	Fri, 19 Aug 2022 15:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B6EF16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660914554;
	bh=8A03Shgnm0e1v2rleLbTRiQIWrMAfXZA01JTNB5qkJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XCZt1ahaxRqVm8ZGsaNAHlPt+Gj2fFQuJWU1w80zivJ8dy5B0/lbOXCes/wCeKXe5
	 n7MRFL90bHG8vC/0kkhSufPosOG2C4ae8W96nGc++xaT3DGdNIiWvq+mr7bUctZ4wg
	 v54SEMfRNdfDz//p59vbAweqxx+fXQKoO3DJ1ru8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E72BF801F7;
	Fri, 19 Aug 2022 15:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 410A6F800B5; Fri, 19 Aug 2022 15:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16572F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 15:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16572F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XFHS0xP6"
Received: by mail-lf1-x12e.google.com with SMTP id s1so3262380lfp.6
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=DxUbL1u2TvCgqbMMq8b5Q8Jcv4hpOmVj7LVtiRDhqBM=;
 b=XFHS0xP6pzd1hzxev3TOYgtvPI55W/itopzKm0dvSDGy+6a7OvvL6KrvnD6lCEFa9H
 EQt8Cdm+9hmcb46qvWyULanaCBJmNbQBG2NgkC4SOCQ0lX+0q90G6hTbKc7BMhjsMvHV
 kw1AFxlZhDgAaOw8MsMn39uZoBagGabvZlY1HK0zpLDdo4U1JuUgA8nqPx3Pso45FtgZ
 IfQWiSi+k3z8Aqj81hf6hMtB15CYd0yZizfpL+zzVvgidbmKtRcDiNZCAtX1SoPQtD1u
 0evlGBqtt31yQ6UZU6jxrBNRPUXUmE/R2sNR7CWermmkhToxaTZrmHfgClMwYb+SYOT0
 dFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=DxUbL1u2TvCgqbMMq8b5Q8Jcv4hpOmVj7LVtiRDhqBM=;
 b=rI+Gq8qOouzeeiX5b7vOBdjaCbtFX/uE7Z1IYHgW6NLffo3zX30NYLyIUm8EQk5dq0
 /Xrv7dHyc7/YykE+0Gq2smCLGgnA7XzZboXS7neTPj3+2wxSZKUm/VbzngGxntTLhi0o
 pYGnh+C/cMUY0CMNKhKVWj7ebPD8YsBYi5LAXfiSdWLF2MLmjMAUzqp/YPxV7h52f9FN
 TyCs+FMxROpg1CZlnD/F21iGu/Tk4pySQ/MwNzhd5bpiCpz7vl64HLzdyuzPJitkNUf9
 hYsP0uFUHlSkB/5rp7QWc03uUMDCqMqGBsPsnfbmg1Fg/kSoCH66w3RQ5jcxxVI3orKv
 IZaQ==
X-Gm-Message-State: ACgBeo36THeLCAwtMmSGW7Zy2IEA+ckywYI2dZ70I1xaKt19KdqgbLOx
 Tc05bWNzTIXUGJX4urs7VIJIsFeKm0XkUEgl
X-Google-Smtp-Source: AA6agR7f+iFFzmMMAkNIIujsBnwTB5naNjGrtk1S4+hnAkCY2l6GkulULJahswJWGF1zJGKzS718dg==
X-Received: by 2002:a05:6512:2398:b0:48d:4ec:11c4 with SMTP id
 c24-20020a056512239800b0048d04ec11c4mr2353881lfv.583.1660914483914; 
 Fri, 19 Aug 2022 06:08:03 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5?
 (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi.
 [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056512324400b0048137a6486bsm632547lfr.228.2022.08.19.06.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 06:08:03 -0700 (PDT)
Message-ID: <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
Date: Fri, 19 Aug 2022 16:08:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
 <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
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

On 19/08/2022 15:58, Martin Povišer wrote:
> 
>> On 19. 8. 2022, at 14:54, Martin Povišer <povik+lin@cutebit.org> wrote:
>>
>> Add binding schema for MCA I2S transceiver found on Apple M1 and other
>> chips.
>>
>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>> ---
>> .../devicetree/bindings/sound/apple,mca.yaml  | 131 ++++++++++++++++++
>> 1 file changed, 131 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
>> new file mode 100644
>> index 000000000000..7b4f348c2be3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
>> @@ -0,0 +1,131 @@
> 
> 
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - apple,t8103-mca
>> +          - apple,t6000-mca
> 
> Since it was brought up last time but I didn’t respond: the
> nonalphabetical order is as the chips were introduced (and
> matches other schemas).

Sure, just keep that order for future compatibles as well - so always
put them according to verifiable time of market introduction...

This is very poor reason, instead of alphabetical order. Even worse
reason is repeating wrong pattern just because someone else did it.

Best regards,
Krzysztof
