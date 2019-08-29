Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A91A2014
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CFDF16C5;
	Thu, 29 Aug 2019 17:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CFDF16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567094045;
	bh=stu3pVznsEMyuY4XNNU5EsHc3iE564c7IPGmlNnjo8I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGQqjXAL9uRHyvLy1r7IiXobj5jkw0nMxvk3D/UYzFcDZdkdsenGA+Ff3YwqMJJTG
	 Ur50oK3Ek3cTXUIb9fgJQF8z87wRAy6H/Y1ASDM4lKn1o3luKnrg2f5oDoUREE1dep
	 gkK+/v9CoySIk8pYOvj+dMag409FzjxsNSYYlsCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF8B0F800F1;
	Thu, 29 Aug 2019 17:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA89F80142; Thu, 29 Aug 2019 17:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4015BF80096
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 17:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4015BF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s/BkU/Su"
Received: by mail-wm1-x341.google.com with SMTP id p13so4403711wmh.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LnH0w/K/K8vFf4T8B8Pk9QjQILA18r17IdgmbEo/xQc=;
 b=s/BkU/Sux2u6RPNlBX0IHCd6Nn145MOMsbJ5Qi37t6m5TOKh4CdzKB2nosIq2bP6Cw
 H7hhdrs2HTB+lXIFe3Y9StlYcNr1yJOfRagPoslen2GJeSBHPG5RUb+P7Qzd2697eJew
 kvXuvNsEBQpxN0TlS0I6avL2J6B9N1J8l8r+QzotEISe4dxMoEoGbm+nzjrS3myENM5K
 6cPT2stStZfhlJVbXS5tWHA2AGj30QefGul99ZQ3qRg7Fj0OIIC3ik4ih1yBUqL+3HQk
 6oiA12Bu1m5phpmbbYBtzO56be2D34bhGmW/gJDrpXc5MmomNzBpGkFzi0nlor6RRxrq
 GHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LnH0w/K/K8vFf4T8B8Pk9QjQILA18r17IdgmbEo/xQc=;
 b=L8OUt2ZAAzcEAAY8JYBh7zkF4SOlW9bkPOo7uE4UJO+YR3UAeQAHUWp7g2mQSUz8KH
 HedgVyIS+dq+b3jFiYWDnWJSGx5lMq7cgzgoOdMHfZHRppbEbqmooxDxZ3h69TZjH7mG
 TEsEH6ew9p7GwFETWW5ZVnZcaaTMSrXy+HpAt3XE3x5SMAztqvDhz0rj0SkfzbunpgAF
 1pVOhSawJf+/eu2uPLIf5VzhMKBNKJu7adGd3zQRSxhczEFUhDyiUsOFWezvt2VKKS5x
 nldwl5CvCVrUB2ji8V9USohx+zsqwlNl6h/eigGx60orqdQHzWAiMAnZCkgl/OqJzVTp
 /oxQ==
X-Gm-Message-State: APjAAAUwjc5EO+BHRqzf56VvYedkcZhFl5bkmr5qN8Bg0z6fR46Y+Zc6
 /OMRUW3rzr4LMD68j3RQnszWKw==
X-Google-Smtp-Source: APXvYqyqrcnzdUapgwZZmzywb2WvczjVj7DbtThNc0+7wpYTtqQcO97DJpeJRLSvqOSI+XQE7EsAnA==
X-Received: by 2002:a1c:810a:: with SMTP id c10mr11920180wmd.72.1567093934178; 
 Thu, 29 Aug 2019 08:52:14 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id g14sm5983745wrb.38.2019.08.29.08.52.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 08:52:13 -0700 (PDT)
To: Rob Herring <robh+dt@kernel.org>
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
 <20190829144442.6210-4-srinivas.kandagatla@linaro.org>
 <CAL_JsqLOHA+r9UCTwyvj+_BzWSrsVDZw5vp-1XhYYvQxncx0sw@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ef01465e-25d6-059c-1f5d-8e8ebd6b887d@linaro.org>
Date: Thu, 29 Aug 2019 16:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLOHA+r9UCTwyvj+_BzWSrsVDZw5vp-1XhYYvQxncx0sw@mail.gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v5 3/4] dt-bindings: ASoC: Add WSA881x
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

Thanks for the review!

On 29/08/2019 16:46, Rob Herring wrote:
> On Thu, Aug 29, 2019 at 9:45 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
>> Amplifier. This Amplifier also has a simple thermal sensor for
>> over temperature and speaker protection.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,wsa881x.yaml          | 41 +++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> new file mode 100644
>> index 000000000000..7a486c024732
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license please.
> 
Will do that!

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  WSA8810 is a class-D smart speaker amplifier and WSA8815
>> +  is a high-output power class-D smart speaker amplifier.
>> +  Their primary operating mode uses a SoundWire digital audio
>> +  interface. This binding is for SoundWire interface.
>> +
>> +properties:
>> +  compatible:
>> +    const: "sdw10217201000"
> 
> No need for quotes.

Did not knew that! Still getting used to yaml stuff :-)

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
> 
>> +  powerdown-gpios:
>> +    description: GPIO spec for Powerdown/Shutdown line to use
>> +    maxItems: 1
>> +
>> +  '#thermal-sensor-cells':
>> +    const: 0
> 
> Either of these required?
> 

"make dt_binding_check" was complaining when I added this! Let me retry it!

> Here you can put 'additionalProperties: false'
> 
>> +
>> +examples:
>> +  - |
>> +    speaker@0,1 {
> 
> This should be under a soundwire bus node.

okay..

> 
>> +        compatible = "sdw10217201000";
>> +        reg = <0 1>;
>> +        powerdown-gpios = <&wcdpinctrl 2 0>;
>> +        #thermal-sensor-cells = <0>;
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
