Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2AA1FAB
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CBBE16BA;
	Thu, 29 Aug 2019 17:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CBBE16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567093762;
	bh=vSfYSZeWbCD231iDU4KH8ZH9yKEjdvyaq05nSHAOXCw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QOUQMuTy1ajsA7Hegtz9uWckY/xM3zgnhOYMuOldFrHkpFMeW1jbG32TcfJS422KC
	 /s+tyPj92tZh2JbW82NRaTMi7uaHg1d27yeKlUgBWqEaksMZDCHerQ3IxuJGdVDJL2
	 W9gTer+c/8qAY3KQTf5egH78U4bxY7rgMWWozWNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09AFAF802A1;
	Thu, 29 Aug 2019 17:47:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1464F80274; Thu, 29 Aug 2019 17:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF557F80148
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 17:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF557F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rT/NyY7c"
Received: by mail-wm1-x342.google.com with SMTP id p13so4388434wmh.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Aaw5MPLGPnpP7hqH6Z404TXcUkGBN8Qiv1+S+/xAVYs=;
 b=rT/NyY7coIzUv343vYFq7wWdbCT9F36sX/Fd6Rlbe3nR1U5cXovKf3nwRpsN5ymTP2
 7LMZIqiDpQFCLumf+0JpXoro1S2r6fH0v1306RPD20/tJ8mvLQYSjJOIfIQaY0Y3pQPr
 99W6gR6/jLWLGvDDofIljq356uA1jBGBJALq80cVFTyJukUm99qydHoHvRilQORJWXgW
 nGPJffv85OVoJjJyNuK4IFfnJ1C+f+zhmkaXcjFUWvaK6Q7Elr/jeRKFlvAmZHYWytVl
 k1IG+USz73jXlWv1q7KEsmxB7qQvTpWLp2zmZnGgOp2kCP7UHZSa3Uir1Pp9NkmphXpb
 27EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aaw5MPLGPnpP7hqH6Z404TXcUkGBN8Qiv1+S+/xAVYs=;
 b=Tn+lJ58PZD+SnQ5P982aGAXf+DauEd3Jt0SmQPqS1XWoR7NrFH09ihSD0seJipn45U
 DqMmbDpGapdHVL87ke2PzZ/sq+2JgcZXL0bDeU+dIGft31xVe5FvLK9ZAQwBv+PGlccJ
 M/sd42kMfW8Fn2T0i+sTBqXgMUxHVAP6bTxOpSIHWvmA08FZEuwQksW/lLBFqxEguv8a
 pm/EWjwJkLODB2yWHXZel99HUDw622NjSyEkwZ3AjVmRL3jvSJZxETzMgIBA7FP8og87
 tnmG/kUUTGGzcr7PGGFMryPAR2qKFrZ+5H3ayT4WtYWmNfFhoTNvQx0a3b4n+1fxbA0t
 cGnA==
X-Gm-Message-State: APjAAAVXuMm8xp+shSKzE7wkDRFCnRnWWOyuLVN7Kf9oYd67mM7Twc+1
 BYMDJ0mhEhYIICALzn4wzkFKnw==
X-Google-Smtp-Source: APXvYqyQZXgC/DaNfrLvmAO/M3j3aa3a7nj3YJJVohAxA+7UE0VyCZXo9XbqRn1ojGqTnKl1laLJuw==
X-Received: by 2002:a05:600c:386:: with SMTP id
 w6mr791462wmd.152.1567093623775; 
 Thu, 29 Aug 2019 08:47:03 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n9sm3284805wrp.54.2019.08.29.08.47.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 08:47:03 -0700 (PDT)
To: Rob Herring <robh+dt@kernel.org>
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
 <20190829144442.6210-2-srinivas.kandagatla@linaro.org>
 <CAL_JsqLwbz5eiBEw8PmXsJrxzXffNc7rRON-wQ0KviVW8JVv5A@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b00f653f-7337-f475-1696-a94c51aa22ba@linaro.org>
Date: Thu, 29 Aug 2019 16:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLwbz5eiBEw8PmXsJrxzXffNc7rRON-wQ0KviVW8JVv5A@mail.gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v5 1/4] dt-bindings: soundwire: add slave
	bindings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 29/08/2019 16:42, Rob Herring wrote:
> On Thu, Aug 29, 2019 at 9:45 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> This patch adds bindings for Soundwire Slave devices that includes how
>> SoundWire enumeration address and Link ID are used to represented in
>> SoundWire slave device tree nodes.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../soundwire/soundwire-controller.yaml       | 72 +++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>> new file mode 100644
>> index 000000000000..449b6130ce63
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> (GPL-2.0-only OR BSD-2-Clause) for new bindings.
> 
Okay Sure will do that!
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SoundWire Controller Generic Binding
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +  - Vinod Koul <vkoul@kernel.org>
>> +
>> +description: |
>> +  SoundWire busses can be described with a node for the SoundWire controller
>> +  device and a set of child nodes for each SoundWire slave on the bus.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^soundwire(@.*)?$"
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f],[0-9a-f]$":
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        pattern: "^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
>> +        description: Is the textual representation of SoundWire Enumeration
>> +          address. compatible string should contain SoundWire Version ID,
>> +          Manufacturer ID, Part ID and Class ID in order and shall be in
>> +          lower-case hexadecimal with leading zeroes.
>> +          Valid sizes of these fields are
>> +          Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
>> +          and '0x2' represents SoundWire 1.1 and so on.
>> +          MFD is 4 nibbles
>> +          PID is 4 nibbles
>> +          CID is 2 nibbles
>> +          More Information on detail of encoding of these fields can be
>> +          found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
>> +
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Link ID followed by Instance ID of SoundWire Device Address.
>> +
>> +    additionalProperties: false
> 
> I'm pretty sure you'll want nodes with other properties. If not, then
> why are they in DT? So drop this.

will do!
> 
> Both the controller and child nodes need to list required properties.
> 
Okay, will spin that in next version!
Thanks,
srini

>> +
>> +examples:
>> +  - |
>> +    soundwire@c2d0000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x0c2d0000 0x2000>;
>> +
>> +        speaker@0,1 {
>> +            compatible = "sdw10217201000";
>> +            reg = <0 1>;
>> +        };
>> +
>> +        speaker@0,2 {
>> +            compatible = "sdw10217201000";
>> +            reg = <0 2>;
>> +        };
>> +    };
>> +
>> +...
>> --
>> 2.21.0
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
