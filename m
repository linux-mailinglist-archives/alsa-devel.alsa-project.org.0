Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EC1229EFD
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 20:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 718A31660;
	Wed, 22 Jul 2020 20:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 718A31660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595441427;
	bh=uNF+dYcfmDHAAVhW5wcLoyKx0RpsmtjZb4J/+gEOJqk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bXQIeLH4uKqH966g9fCIKe9hvPn/TDIm/O84RetjJcdM0A7yTdLtyTQIQlIRAWbVd
	 I0n+yEJMwYOI7uOdqHfKz1xWd8xkP6uJdevFXPppBQWuxsj7nNsCu/25pgHoOlYEKQ
	 eolaPinoBE9V5XApj9NX/YqDHogOc2O59TrdPBF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362E4F80087;
	Wed, 22 Jul 2020 20:08:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56B4F8014C; Wed, 22 Jul 2020 20:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CD7BF800CE
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 20:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CD7BF800CE
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06MI7mBv038876;
 Thu, 23 Jul 2020 03:07:48 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Thu, 23 Jul 2020 03:07:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from [192.168.1.2] (121.252.232.153.ap.dti.ne.jp [153.232.252.121])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06MI7lJ8038871
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 23 Jul 2020 03:07:48 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Subject: Re: [PATCH] dt-bindings: sound: convert ROHM BD28623 amplifier
 binding to yaml
To: Rob Herring <robh@kernel.org>
References: <20200714081000.177914-1-katsuhiro@katsuster.net>
 <20200721021211.GA3388250@bogus>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <b6ecd278-d085-ad1a-03b7-5a15164c85bd@katsuster.net>
Date: Thu, 23 Jul 2020 03:07:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721021211.GA3388250@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

Hello Rob,

Thanks a lot for your review!

Best Regards,
Katsuhiro Suzuki

On 2020/07/21 11:12, Rob Herring wrote:
> On Tue, Jul 14, 2020 at 05:09:59PM +0900, Katsuhiro Suzuki wrote:
>> This patch converts ROHM BD28623UMV class D speaker amplifier binding
>> to DT schema.
>>
>> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
>> ---
>>   .../bindings/sound/rohm,bd28623.txt           | 29 ---------
>>   .../bindings/sound/rohm,bd28623.yaml          | 65 +++++++++++++++++++
>>   2 files changed, 65 insertions(+), 29 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.txt b/Documentation/devicetree/bindings/sound/rohm,bd28623.txt
>> deleted file mode 100644
>> index d84557c2686e..000000000000
>> --- a/Documentation/devicetree/bindings/sound/rohm,bd28623.txt
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -ROHM BD28623MUV Class D speaker amplifier for digital input
>> -
>> -This codec does not have any control buses such as I2C, it detect format and
>> -rate of I2S signal automatically. It has two signals that can be connected
>> -to GPIOs: reset and mute.
>> -
>> -Required properties:
>> -- compatible      : should be "rohm,bd28623"
>> -- #sound-dai-cells: should be 0.
>> -- VCCA-supply     : regulator phandle for the VCCA supply
>> -- VCCP1-supply    : regulator phandle for the VCCP1 supply
>> -- VCCP2-supply    : regulator phandle for the VCCP2 supply
>> -
>> -Optional properties:
>> -- reset-gpios     : GPIO specifier for the active low reset line
>> -- mute-gpios      : GPIO specifier for the active low mute line
>> -
>> -Example:
>> -
>> -	codec {
>> -		compatible = "rohm,bd28623";
>> -		#sound-dai-cells = <0>;
>> -
>> -		VCCA-supply = <&vcc_reg>;
>> -		VCCP1-supply = <&vcc_reg>;
>> -		VCCP2-supply = <&vcc_reg>;
>> -		reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
>> -		mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
>> new file mode 100644
>> index 000000000000..acd8609252b4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/rohm,bd28623.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/rohm,bd28623.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ROHM BD28623MUV Class D speaker amplifier for digital input
>> +
>> +description:
>> +  This codec does not have any control buses such as I2C, it detect
>> +  format and rate of I2S signal automatically. It has two signals
>> +  that can be connected to GPIOs reset and mute.
>> +
>> +maintainers:
>> +  - Katsuhiro Suzuki <katsuhiro@katsuster.net>
>> +
>> +properties:
>> +  compatible:
>> +    const: rohm,bd28623
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  VCCA-supply:
>> +    description:
>> +      regulator phandle for the VCCA (for analog) power supply
>> +
>> +  VCCP1-supply:
>> +    description:
>> +      regulator phandle for the VCCP1 (for ch1) power supply
>> +
>> +  VCCP2-supply:
>> +    description:
>> +      regulator phandle for the VCCP2 (for ch2) power supply
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO specifier for the active low reset line
>> +
>> +  mute-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO specifier for the active low mute line
>> +
>> +required:
>> +  - compatible
>> +  - VCCA-supply
>> +  - VCCP1-supply
>> +  - VCCP2-supply
>> +  - "#sound-dai-cells"
> 
> Needs an:
> 
> additionalProperties: false
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    codec {
>> +      compatible = "rohm,bd28623";
>> +      #sound-dai-cells = <0>;
>> +
>> +      VCCA-supply = <&vcc_reg>;
>> +      VCCP1-supply = <&vcc_reg>;
>> +      VCCP2-supply = <&vcc_reg>;
>> +      reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
>> +      mute-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
>> +    };
>> -- 
>> 2.27.0
>>

