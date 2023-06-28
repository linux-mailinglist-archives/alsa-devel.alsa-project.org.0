Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC37416A7
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 18:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4147822;
	Wed, 28 Jun 2023 18:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4147822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687970708;
	bh=vNTiSnB5Ta5vcPGfJ1iIcKbVb3cu9wiEntujh0uJrAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hyLEqLvz0rNiyPvKkv0oVSPLLzq2kG7SUnbeRk2NqFkF1PKJ/ocxjJ4AY/DP0pEUC
	 aa8rnKH0iXf8UTGTMFZidlmjllrGUHZG8n8DU2bIKqitDvSWrnDDUJzizMTDMtNhAY
	 f3GdrppjtuZjqpW0z/XsrV3gewJlkPcos4bwSd1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED94EF8051E; Wed, 28 Jun 2023 18:43:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE0EF80212;
	Wed, 28 Jun 2023 18:43:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBA52F80246; Wed, 28 Jun 2023 18:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B8E3F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 18:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B8E3F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ClbNoVea
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbab489490so1589145e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687970614; x=1690562614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wj1y9GfoRe5AkEfUiZaVmCTZXorfAIcagWCYFOl60QA=;
        b=ClbNoVeaJG7dp+YPPc4pjAvljPWJKY8BQVzCRsr4AXdW1jDBGzc8Hrb631QbUOPe/p
         YyHkgLRT8PkSmaDsxTszEDD2R8InsafKzyF872IUbC2239GXZVaMdmYPmmdDRmqmd0VO
         1IVKsAEQ93yCapzsDQDr9fqjuoXirKeekaXE7GNaskeO+ID5CRSbYcIhayG766DB0b04
         GE823axjyfyQAL5B52DV7wJxT3O7xpxlDG4Drb/IdAmm821S3uj4W4jE5NTwa4rW6Qi3
         kM5f8a0JE6Rk3/dHEWxKKOfjP4726QZXBAFD+u/60FoWvs72TfX6RbAshJr9OS1eWw9H
         1FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687970614; x=1690562614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wj1y9GfoRe5AkEfUiZaVmCTZXorfAIcagWCYFOl60QA=;
        b=d/krXvvs+vdgsP4fxbUhxO3Lbs9vspSLthbHzRidfBjemJ0weR1khmyaOQn69Hz6Oh
         v5E52uwY68Dsy3DcNkZzOLdcHB6iOP/coLIE4JExRTzeyDjZKOUMjTFx4ZgiSOmWw0uB
         glOrbHHW7MsB5XgVHjquoIQt9aBmycvR7YPHrSpAJpBrfMHu5TAyMbbDD+izj7083DhV
         0kT65qNtZ+wUCW1R4Y9On0o0KK4m8FLfYvhXdU18WvEUXRw26/ySQC21bBjHTzY1OPOV
         CXHQQ1qmEl54C15z+xCbXaySyyFFj3TMoZboVJhL9NMbyP0g+KqGnTr96ThYSYCcvbon
         pEJw==
X-Gm-Message-State: AC+VfDwm7YAaV48W7Ni2z3liY3BWWutECFhu1aCjyKiJ4yDEzKayINSa
	pgPHCPBLFBAyDBtKsxuOliskqg==
X-Google-Smtp-Source: 
 ACHHUZ5y4fpvcnbacCe53RDMiaqa1l8uth1slQyrWOIlpMDUZLIJjBUGmfOf8GS3+Lm0BEwR54z0nw==
X-Received: by 2002:a1c:e90d:0:b0:3f8:fc2a:c7eb with SMTP id
 q13-20020a1ce90d000000b003f8fc2ac7ebmr25716224wmc.5.1687970614284;
        Wed, 28 Jun 2023 09:43:34 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 z10-20020a7bc7ca000000b003f8f8fc3c32sm14353307wmk.31.2023.06.28.09.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 09:43:33 -0700 (PDT)
Message-ID: <9f5b205a-c5d5-e66b-8ba8-57823486eaef@linaro.org>
Date: Wed, 28 Jun 2023 17:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: q6apm: add firmware-name bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-2-srinivas.kandagatla@linaro.org>
 <20230628155453.GA537917-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230628155453.GA537917-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V5BL3AR4TQ65CDWMDC6V7RIRTPCXJ5EM
X-Message-ID-Hash: V5BL3AR4TQ65CDWMDC6V7RIRTPCXJ5EM
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5BL3AR4TQ65CDWMDC6V7RIRTPCXJ5EM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 28/06/2023 16:54, Rob Herring wrote:
> On Wed, Jun 28, 2023 at 11:26:19AM +0100, Srinivas Kandagatla wrote:
>> Add bindings to get firmare-name from DT, this will provide more flexibility
>> to specify platform specific firmware file name and location. Also this brings
>> tplg firmware name inline with other board specific firmware locations.
> 
> tplg?
Topology, will update this in next version.

> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,q6apm.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> index ef1965aca254..c783451145ef 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> @@ -31,6 +31,10 @@ properties:
>>       unevaluatedProperties: false
>>       description: Qualcomm DSP audio ports
>>   
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
> 
> Already has a type, so you can drop.
thankyou removed this now, but all the existing yaml still have this.

> 
> No default? Or pattern it should match?

no, its going to be hard to come up with a pattern to match file name or 
path for firmware.

> 
>> +    description: Audio Topology Firmware name
>> +
>>     '#sound-dai-cells':
>>       const: 0
>>   
>> @@ -38,6 +42,7 @@ required:
>>     - compatible
>>     - bedais
>>     - dais
>> +  - firmware-name
> 
> Causes warnings. Test you bindings.

yes, examples need updating, will do that in next spin.

--srini
> 
>>   
>>   unevaluatedProperties: false
>>   
>> -- 
>> 2.21.0
>>
