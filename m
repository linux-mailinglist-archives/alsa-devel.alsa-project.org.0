Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C3621384
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 14:51:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FCF846;
	Tue,  8 Nov 2022 14:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FCF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667915463;
	bh=5qcqA6NHImHUDP/+WUO/waSJ/L9UqaIPRy8i03dEEE0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzxVij1T88MDKnpPgowHcMQHyx5+KcoNFs7mEMUQjJIkZ+TNDiBb8Ib2hoLoKmCuO
	 EQl4tRe6/rTWsqK1aALlCPF7r9vqDDt2QTgqvJofYpJzEo56aytyDV3TAbVf4faE5i
	 dqoLU9DHuFvE77E0nyRcdrSncw4Yzjs4hO33Qqj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2C4F8020D;
	Tue,  8 Nov 2022 14:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F159FF8016A; Tue,  8 Nov 2022 14:50:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49E05F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 14:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E05F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VlACUCZj"
Received: by mail-lf1-x12c.google.com with SMTP id r12so21330207lfp.1
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UOTLJIJjlKyMFsd4bjanGUmZl8YyXauAhu1BAnXo0k=;
 b=VlACUCZj5v6rL3K9IrtTakH0zJT4XXALH/f5eC4uaMyl4GCs28MQKq/ys/EZ8E16QU
 DExi4+RdcDQ6W+97Ur/sL7Do7Rx/qjo198KUCzxH0jcAsIU+JrAB6SmeMaNes/I/T3w3
 MBNY/4KNZKAlOhzyFLTIcUhO4p1VwqngwiAZAltPGg44OWXXS2+Grg3MnniQXc6RppeY
 s5FUuoAwWz0jwmEEenLLNw9jbdZm9S0C+8JK8jJS4SFzPVx1x1IaZkYt719levAbr2mj
 uvXXgW+tsTCogDm/fzlqRhJ9l/dYahIdUAaL9jcHYg2+EPZZo0g1LCuGd7L9SA9wayId
 Ys0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2UOTLJIJjlKyMFsd4bjanGUmZl8YyXauAhu1BAnXo0k=;
 b=ccqNGE/Ef+QEAn0qadDRTt4xTYlJhA/rLbjNxYsOmz9Azc0ykQFF/fFNJShLdl/w/H
 tvlIyzAluhthaN8TJRBUUbrHhrZmLXjEQ+QvfdmJKhRcixhLTrGyqTgwQNS7xitVHa1q
 UPhHOrTmzVEpgc9Z7cjLJqRYVj1S5GKDCfyjQ4cf02YHLOLOEdrC3o21HgI0XuhFkyYO
 E240vowIkL6z33r8Xm4VKhEUQ4PAvaloBKIgZ8fwhGHHBRRYCbF8IPDxdHUPVMEZXTAt
 lWiezzozPPHsJ9vRnJhTJrfE9kAhof1H0VRKuwlyj1EvuQVfOm8GqK6L/uqRhp+7/x2m
 pcVQ==
X-Gm-Message-State: ANoB5pku7gQYqXS+R6r/UU3BIhOuaBCsj7qQF5cbtbD8L9bYWcv3mcR6
 87FdT27BEDnD58qT8ELd3jF7Ew==
X-Google-Smtp-Source: AA0mqf7uG7BBXftt8g/nQ97DInOy3cCUyJC9Dq/me1lOdWMWoc2EK7UGJ1E8I7haQZUQqmrsgVKiCw==
X-Received: by 2002:a19:6758:0:b0:4b4:c0c:8c64 with SMTP id
 e24-20020a196758000000b004b40c0c8c64mr801216lfj.122.1667915401027; 
 Tue, 08 Nov 2022 05:50:01 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a056512029d00b004ac980a1ba1sm1794354lfp.24.2022.11.08.05.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 05:50:00 -0800 (PST)
Message-ID: <2a2385a0-0055-aeff-cd7c-71270dd4e561@linaro.org>
Date: Tue, 8 Nov 2022 14:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 4/4] dt-bindings: soundwire: Convert text bindings to
 DT Schema
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
 <1667911156-19238-5-git-send-email-quic_srivasam@quicinc.com>
 <ec87eaa6-2e76-db16-f300-686a92e4f324@linaro.org>
 <b8175f2a-0096-80d4-5733-26ce9f7fd437@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b8175f2a-0096-80d4-5733-26ce9f7fd437@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On 08/11/2022 14:29, Srinivasa Rao Mandadapu wrote:
>>> +  qcom,ports-block-pack-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Indicate the block packing mode.
>>> +                 0 to indicate Blocks are per Channel
>>> +                 1 to indicate Blocks are per Port.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 8
>>> +
>>> +  qcom,ports-hstart:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Identifying lowerst numbered coloum in
>>> +                 SoundWire Frame, i.e. left edge of the Transport sub-frame
>>> +                 for each port. Values between 0 and 15 are valid.
>> minimum: 0
>> maximum: 15
>> and drop that one sentence.
>>
>> The same in other places.
> 
> As below mentioned it will also have 0xFF value. I think we can't 
> restrict with minimum and maximum values.
> 
> Please suggest if my understanding is wrong.

Then (and it is actually an array):
minItems: 3
maxItems: 5
items:
  oneOf:
    - minimum: 0
      maximum: 15
    - const: 0xff

> 
>>
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  qcom,ports-hstop:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Identifying highest numbered coloum in
>>> +                 SoundWire Frame, i.e. the right edge of the Transport
>>> +                 sub-frame for each port. Values between 0 and 15 are valid.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  qcom,ports-block-group-count:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: In range 1 to 4 to indicate how many sample
>>> +                 intervals are combined into a payload.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  label:
>>> +    maxItems: 1
>>> +
>>> +patternProperties:
>>> +  "^.*@[0-9a-f],[0-9a-f]$":
>>> +    type: object
>>> +    description: Child nodes for a standalone audio codec or speaker amplifier IC.
>>> +                 It has RX and TX Soundwire slave devices.
>> s/slave/secondary/
>>
>> This is some odd indentation. Please use standard, like example-schema
>> is showing, so:
>>
>>      description:
>>        Child nodes for a standalone audio codec or speaker amplifier IC.
>>        RX and TX Soundwire slave devices.
>>
>> It looks you used such pattern in other places here - they should also
>> be corrected.
> Okay. Will change accordingly.
>>
>>> +    properties:
>>> +      compatible:
>>> +        pattern: "^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
>>> +
>>
>> Best regards,
>> Krzysztof
>>

Best regards,
Krzysztof

