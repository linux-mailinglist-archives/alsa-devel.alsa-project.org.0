Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD71A1CAC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720FF844;
	Thu, 29 Aug 2019 16:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720FF844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088851;
	bh=8AOxcy7fqP61FUpinxcJuzUVMfSfZJyVrnyfSZTFFp8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0MoWSqGd/Xek78ujeYBZRrMbsISDpqxXuo/y1h7BasHXBZc+hidjwB8OfAuE9MZ1
	 OEwPKCUJ6fEr7LbcOXZkgoWLVvBynRhtr6BoZthHfQgk26c6As8hLW+qf7LmLIy4m4
	 3WxaeEYB2K2TE8MyjL3zfimRe6ltXYOgoa6RRnBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5DDF8085A;
	Tue, 27 Aug 2019 22:29:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69471F8085B; Tue, 27 Aug 2019 22:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D73B9F807C3
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 22:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73B9F807C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="b7P2GhkD"
Received: by mail-wr1-x444.google.com with SMTP id y19so156028wrd.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 13:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MNtgMowNOziQU04tj21QpB7UTHF+CQydh5Mx2MU8eSk=;
 b=b7P2GhkDgx27DNyq0sjWmuBd2+u9U15lHb46pibNLi+dCp5bNz8y514//rUZKUKu3D
 dEILlf0Wbax4H4GnSa4lJmq8ZfTQ+hKIMqsaZ81JcO6yxwfihGNrCEvPZ1aImRMxOlTZ
 SM5y9YmLxdtZgLpfSIfttP4GJDF1h7yAtUxsC0lFevA9F2/p26MkBVD6sxbjFe8MAmHt
 GMIqg7qCRfCdR2Zv2jRBTfNtUTTG9FBzNRiWfz0N/GCKAe+CXSQPX2FcIN/O2KsdXs9A
 DaxIPLCqNlsuOY6IR400wVJAL1YgF24eO3+gVdzlljq/RE0W+c9TDI/segUAdJ7t15D4
 v+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNtgMowNOziQU04tj21QpB7UTHF+CQydh5Mx2MU8eSk=;
 b=TNSyLn40wonCzgEOQVE7Pdtx4rLD2db8CIj8J9bffa/CZulxpTEnS4dHUgV3Vn7+j2
 d+idK1YEGaUhD0JSoA6HkYLu+J+Us9FbSfVv+zdxRoidx4D5WVGZLTEQc8tN4OzVZNXI
 Jo6P8lyNjPckFkd4WV7jysG+jd03hLSaBjXceA/y1dAXog+cqbLPk4RdPK3x9IC7505n
 6aq5eWenIpPMXYhTyBKAd3THI8KYb9l/8yB6T4euG6CPD1Zu/ngrQKTwDDSS3DoMHWKQ
 HaddG2zrzy8JjxbKTXMnM/F9KF5V4rbV8p3O1P3JHA5YCg2bjPX07Wrb6l18iXI9usjw
 5V+w==
X-Gm-Message-State: APjAAAUrfMw2VAhDGoJ1E9ilAw3xm5iHXQ2Nh6L8ZXgIc3lwDL6b5AOo
 662eqmti6AcpjXYdIGsBbAGIGQ==
X-Google-Smtp-Source: APXvYqyqCKkUfNCobT49Kq8m/ke+WZcPuDoTmO1DYlDvMjvIx4arhT/4wdztPrpeCEQna1wLRCKfmQ==
X-Received: by 2002:a05:6000:1186:: with SMTP id g6mr66120wrx.17.1566937738779; 
 Tue, 27 Aug 2019 13:28:58 -0700 (PDT)
Received: from [192.168.86.29]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n14sm227060wra.75.2019.08.27.13.28.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 13:28:57 -0700 (PDT)
To: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
 <20190823065340.GD2672@vkoul-mobl> <20190827202022.GA7783@bogus>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ccc90c56-f776-0c1c-df6b-cb661aa5ea97@linaro.org>
Date: Tue, 27 Aug 2019 21:28:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827202022.GA7783@bogus>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
	slave bindings
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

thanks for reviewing the patch!

On 27/08/2019 21:20, Rob Herring wrote:
> On Fri, Aug 23, 2019 at 12:23:40PM +0530, Vinod Koul wrote:
>> On 23-08-19, 00:37, Srinivas Kandagatla wrote:
>>> This patch adds bindings for Soundwire Slave devices that includes how
>>> SoundWire enumeration address and Link ID are used to represented in
>>> SoundWire slave device tree nodes.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>   .../soundwire/soundwire-controller.yaml       | 75 +++++++++++++++++++
>>>   1 file changed, 75 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>>> new file mode 100644
>>> index 000000000000..91aa6c6d6266
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: SoundWire Controller Generic Binding
>>
>> Controller does not make sense here, why not use spec terminology and
>> say "SoundWire Slave Generic Binding"
> 
> It's both IMO. It's describing the structure of child devices of a
> controller (aka a bus).
> 
>>
>>> +
>>> +maintainers:
>>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> +
>>> +description: |
>>> +  SoundWire busses can be described with a node for the SoundWire controller
>>> +  device and a set of child nodes for each SoundWire slave on the bus.
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^soundwire(@.*|-[0-9a-f])*$"
> 
> '-[0-9a-f]' was to handle cases like spi-gpio or i2c-gpio. Would a
> bit banged interface be possible here?

Highly unlikely!


> 
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^.*@[0-9a-f]+$":
> 
> If there are distinct fields in the address, they are typically comma
> separated in the unit-address.

okay, will fix that in next version!


> 
>>> +    type: object
>>> +
>>> +    properties:
>>> +      compatible:
>>> +      pattern: "^sdw[0-9][0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
>>> +      description:
>>> +	  Is the textual representation of SoundWire Enumeration
>>> +	  address. compatible string should contain SoundWire Version ID,
>>> +	  Manufacturer ID, Part ID and Class ID in order and shall be in
>>> +	  lower-case hexadecimal with leading zeroes.
>>> +	  Valid sizes of these fields are
>>> +	  Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
>>> +	  and '0x2' represents SoundWire 1.1 and so on.
>>> +	  MFD is 4 nibbles
>>> +	  PID is 4 nibbles
>>> +	  CID is 2 nibbles
>>> +	  More Information on detail of encoding of these fields can be
>>> +	  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
>>> +
>>> +      reg:
>>> +        maxItems: 1
>>> +        description:
>>> +          Instance ID and Link ID of SoundWire Device Address.
>>
>> This looks better :) Thanks.
>>
>> Apart from the minor nit above this looks good to me, I can merge the
>> sdw parts if Rob is fine with them.
>>
>> Thanks
>>
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +examples:
>>> +  - |
>>> +    soundwire@c2d0000 {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <0>;
>>> +        compatible = "qcom,soundwire-v1.5.0";
> 
> This will probably change once I review it. :)

:-)

thanks,
srini
> 
>>> +        reg = <0x0c2d0000 0x2000>;
>>> +
>>> +        speaker@1 {
>>> +            compatible = "sdw10217201000";
>>> +            reg = <1 0>;
>>> +        };
>>> +
>>> +        speaker@2 {
>>> +            compatible = "sdw10217201000";
>>> +            reg = <2 0>;
>>> +        };
>>> +    };
>>> +
>>> +...
>>> -- 
>>> 2.21.0
>>
>> -- 
>> ~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
