Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8C7B3EDF
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 09:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75CCEDED;
	Sat, 30 Sep 2023 09:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75CCEDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696060430;
	bh=92ZRot/gVcdhuraFtCDxnMeqfHDkJ8wBxGPDGT4b+xo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qp6v2n/sD4NfLEJC8Eipu7La8621Wour1y0qJeeKNJ0nTDfCpgqYhqZ3aGcIKd0up
	 YXj4opc9TO5GVDKFkjWGqor0T0HJq2STC5CbWYpuCh11CwwiYi+DhtXD1AXqJItKZr
	 sVwWmgchS+QzrsXQbC1GL8j6wvyAjL6fXGFfKnOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AC4DF80549; Sat, 30 Sep 2023 09:52:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C20AF8016A;
	Sat, 30 Sep 2023 09:52:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 313AEF80125; Fri, 22 Sep 2023 19:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 831EDF80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 19:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 831EDF80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=en2XOQAi
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68cbbff84f6so2804385b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Sep 2023 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695403392; x=1696008192;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Q8CChFA1gPR0oSMAjUHL0l/N1n5hJouJgvhk0SX0HM=;
        b=en2XOQAieaaADtqBQaDkhH7f5/shR5FyNGgaxE47ogkd0i2n3g87SXipB2+HtdGGa+
         n6pmn4xuS5eOkQlWSBSHzhMNWECL17ywQhIohuFODs/CMJCxjoELtbyJu655UjRuNrdu
         hHb9ZIeIBEWNLSv7oVYQwRmZP4y99VFSzLOj1sazyZoEQE22uoSDMqCw4CBFkdi//1ws
         LgyMHR4ZJe2LZY9EfrmABgpWr5d8lyffHnx5QuMtXoDG9cjN+NRsSVhQnwppSegzORf3
         icScvwluSE/pbZmoDrCRekmvkI+kxKtFOALsSEI/4qF9KO84imZZpV11v4vY9qQvm7MA
         Vw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403392; x=1696008192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q8CChFA1gPR0oSMAjUHL0l/N1n5hJouJgvhk0SX0HM=;
        b=plJjIRNRksKFVbDdx2UVHniY8+DTm0AnCIBw4bxMW3ldrbccVc60p10uBAwU67azSM
         hljUpw7W0QSSx+sm3mxrFYchCffF7AGXXNCnCQ+YydGIu8cNW+HZdxIbp6HhkXz5dL+D
         aP4k/E2fqWivjJ2ipjocEVECVrpuWzDGwLaKaPd7GK4edZL6YsTDv9bGmb/MeohrijwN
         s/u0p5Ic3gK2CKoNILvH5qlqGmT+38MUF8UjV1heuHICmlb3lKuEw4r2M+wmHaBS/73V
         bKyFQHD9G66PyyXZf0zBFVKo3LZNIMQVXk7XwTNW+8aUk9Nd0BlgoHU73ArE0CaxYYs+
         VAJw==
X-Gm-Message-State: AOJu0YwI129k2gBDpmGnAAJTGyE/u+adcA94CSxqhfxwTsM6qXjSznbB
	Dwshk+U9SyLqCimdu3C2X7w=
X-Google-Smtp-Source: 
 AGHT+IFKqNHWSe5J9acMcbHNulonofEyqJ5zlmXdE1wEO/aZhwCZU1j3TahVjUV/1V+3hFwkBQvtVw==
X-Received: by 2002:a17:90a:be07:b0:273:e090:6096 with SMTP id
 a7-20020a17090abe0700b00273e0906096mr448684pjs.11.1695403391984;
        Fri, 22 Sep 2023 10:23:11 -0700 (PDT)
Received: from [192.168.31.134] ([122.172.81.240])
        by smtp.gmail.com with ESMTPSA id
 25-20020a17090a019900b0026b70d2a8a2sm3834224pjc.29.2023.09.22.10.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 10:23:11 -0700 (PDT)
Message-ID: <c6f795f1-2832-c282-5819-f8f402a312bd@gmail.com>
Date: Fri, 22 Sep 2023 22:53:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] ASoC: dt-bindings: tfa9879: Convert to dtschema
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230921183313.54112-1-bragathemanick0908@gmail.com>
 <20230922-unmindful-anyplace-f1da73ab168c@spud>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <20230922-unmindful-anyplace-f1da73ab168c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: bragathemanick0908@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2R3BQP4SAROKDQJV5NFDPHJ6J3LB3EYY
X-Message-ID-Hash: 2R3BQP4SAROKDQJV5NFDPHJ6J3LB3EYY
X-Mailman-Approved-At: Sat, 30 Sep 2023 07:52:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2R3BQP4SAROKDQJV5NFDPHJ6J3LB3EYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 22/09/23 20:56, Conor Dooley wrote:
> On Fri, Sep 22, 2023 at 12:03:13AM +0530, Bragatheswaran Manickavel wrote:
>> Convert the tfa9879 audio CODEC bindings to DT schema
>> No error/warning seen when running make dt_binding_check
>>
>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
>> Changes:
>> V1 -> V2: Fixed DT syntax errors and doc warning
> These should be under the --- line, not above it.
> Perhaps Mark will change it on application.
> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.

Hi Conor,
Thanks for reviewing it.
Do I need to send a new patch by addressing the above comments ?

>
>> ---
>>   .../bindings/sound/nxp,tfa9879.yaml           | 44 +++++++++++++++++++
>>   .../devicetree/bindings/sound/tfa9879.txt     | 23 ----------
>>   MAINTAINERS                                   |  2 +-
>>   3 files changed, 45 insertions(+), 24 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/sound/tfa9879.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
>> new file mode 100644
>> index 000000000000..df26248573ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nxp,tfa9879.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP TFA9879 class-D audio amplifier
>> +
>> +maintainers:
>> +  - Peter Rosin <peda@axentia.se>
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,tfa9879
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#sound-dai-cells'
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c1 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       amplifier@6c {
>> +          compatible = "nxp,tfa9879";
>> +          reg = <0x6c>;
>> +          pinctrl-names = "default";
>> +          pinctrl-0 = <&pinctrl_i2c1>;
>> +          #sound-dai-cells = <0>;
>> +       };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/sound/tfa9879.txt b/Documentation/devicetree/bindings/sound/tfa9879.txt
>> deleted file mode 100644
>> index 1620e6848436..000000000000
>> --- a/Documentation/devicetree/bindings/sound/tfa9879.txt
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -NXP TFA9879 class-D audio amplifier
>> -
>> -Required properties:
>> -
>> -- compatible : "nxp,tfa9879"
>> -
>> -- reg : the I2C address of the device
>> -
>> -- #sound-dai-cells : must be 0.
>> -
>> -Example:
>> -
>> -&i2c1 {
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&pinctrl_i2c1>;
>> -
>> -	amp: amp@6c {
>> -		#sound-dai-cells = <0>;
>> -		compatible = "nxp,tfa9879";
>> -		reg = <0x6c>;
>> -	};
>> -};
>> -
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a4c30221eb30..569303daf9b4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15476,7 +15476,7 @@ NXP TFA9879 DRIVER
>>   M:	Peter Rosin <peda@axentia.se>
>>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>>   S:	Maintained
>> -F:	Documentation/devicetree/bindings/sound/tfa9879.txt
>> +F:	Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
>>   F:	sound/soc/codecs/tfa9879*
>>   
>>   NXP-NCI NFC DRIVER
>> -- 
>> 2.34.1
>>
