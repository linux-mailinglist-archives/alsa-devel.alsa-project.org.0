Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF7599CAA
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 15:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024BA16BA;
	Fri, 19 Aug 2022 15:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024BA16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660914610;
	bh=vTseEbtAtNd2yoK8qglnnYffuGg96JyefBR31cQ4SVA=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZbGE+QwZbbKxUTINfGtzNc1vyvjrduFV3ZRcgHheH7RuTWdnZTUmcEvtHPFtuI+pj
	 IBxuQd+3bp6KMQhjumC757rZS5G2Z5wKxZ5AjdScRxm0FkiEy8xTgrtnJtMJzbIPTG
	 h5f3A3iPdzZGqzY0fgPrNgWCFWkEYQuAaYBfMnGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99841F800B5;
	Fri, 19 Aug 2022 15:09:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D81FF8016C; Fri, 19 Aug 2022 15:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B9D1F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 15:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9D1F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zSosWE6F"
Received: by mail-lj1-x232.google.com with SMTP id v10so4466443ljh.9
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=qtEXJInjg9AFO4KrF4iF5IYDoud9mgq+2joPRuKRKwQ=;
 b=zSosWE6Fk9lzdU5AiO5w3sspobz6PAzipoaeARXLjett4QPv1/ghHJMksJJr8o81SK
 pOFcXKNj+Yz0PALhWgRf2AbPUWoN0MPPNwfiItkbD2DxAofGkzyFcihZroUSX+X33mlh
 +OKBJuld2cAJFQUAD2L2Kf8kmG7M3CDQr7+lrd6BaR1BSZi0BTwXAMeKnfvha1QUGUv8
 swZp9RQDOY1U01rzZ7mrmDUZXgXCeRkR0mz3NWFMu3c3W3t5ZWxg8quhO66D2riljfmb
 gG64EmtvV7aKPlwqJedJon7zQ/U1Z3hh+oS3UOU4/13hcSV9g3q3Gw9cLmk1ebAXxFbK
 acoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=qtEXJInjg9AFO4KrF4iF5IYDoud9mgq+2joPRuKRKwQ=;
 b=bm+AW+VcYvRC66mzKsyxQo57dz5RbEDzmv+3110FPiT+V1CyJx1YwsNw3qrHQzWaqS
 S6WbEL0K4XUvs4+CxFRXsGHdpBD/yk0az1LxMxBm+B14bdwdY+s7vCnadJtU0PAJtG7U
 L32BJITNUzHZlsYHDb8WtB+Bikm+XjG+LIikVbpoutUSUS6izcUyJqq1CvXwDsSZmHEF
 42nJPjPKejmUmTkEdBOWcri45G6plBoNe97A7SspqgTlPxRiC3KqBbqd6w5P91bLc8Es
 7eeuk1ejkZ2bfPUgoR+OScYwBwuG4AQgjxanQsg+JBztzj0N31dN+0Xx3+2tuFfoGHV5
 f0Qw==
X-Gm-Message-State: ACgBeo0nKmRdYgFKNWuqMJfeOCqXL0ukE7wDBuMepjBCpTG5OuD7tviB
 ibNZb71QKNkdPS/ihQl0/DBjjA==
X-Google-Smtp-Source: AA6agR6m/i2xLG4QBLSt4m/5F9loCr2QITqu6PDI/uMHTHktKw6yWdG3PvaU+TivoW57d0NlvhS9lg==
X-Received: by 2002:a2e:9348:0:b0:261:890d:b19c with SMTP id
 m8-20020a2e9348000000b00261890db19cmr2088492ljh.441.1660914548297; 
 Fri, 19 Aug 2022 06:09:08 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5?
 (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi.
 [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05651c033200b002618dae9fe8sm609476ljp.73.2022.08.19.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 06:09:07 -0700 (PDT)
Message-ID: <4ff71939-d366-4949-755b-f251168c9aa7@linaro.org>
Date: Fri, 19 Aug 2022 16:09:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
 <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
 <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
In-Reply-To: <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
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

On 19/08/2022 16:08, Krzysztof Kozlowski wrote:
> On 19/08/2022 15:58, Martin Povišer wrote:
>>
>>> On 19. 8. 2022, at 14:54, Martin Povišer <povik+lin@cutebit.org> wrote:
>>>
>>> Add binding schema for MCA I2S transceiver found on Apple M1 and other
>>> chips.
>>>
>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>>> ---
>>> .../devicetree/bindings/sound/apple,mca.yaml  | 131 ++++++++++++++++++
>>> 1 file changed, 131 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
>>> new file mode 100644
>>> index 000000000000..7b4f348c2be3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
>>> @@ -0,0 +1,131 @@
>>
>>
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - apple,t8103-mca
>>> +          - apple,t6000-mca
>>
>> Since it was brought up last time but I didn’t respond: the
>> nonalphabetical order is as the chips were introduced (and
>> matches other schemas).
> 
> Sure, just keep that order for future compatibles as well - so always
> put them according to verifiable time of market introduction...
> 
> This is very poor reason, instead of alphabetical order. Even worse
> reason is repeating wrong pattern just because someone else did it.

Ah, and the alphabetical order has clear advantage - reduces conflicts.
"Time" has clear disadvantage - increases conflicts.

So switch to alphabetical order.

Best regards,
Krzysztof
