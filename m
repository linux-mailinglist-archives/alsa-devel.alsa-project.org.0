Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C326532A6
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 15:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E110D16E8;
	Wed, 21 Dec 2022 15:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E110D16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671634133;
	bh=HCz7/TbeoP/ZRnF4uBv1nGBwJh7+YSX6TfljxW3esUw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FwEHR2fk9VETPqZGzaUYByoUcAKBMb2ByYtjEjnAy2dcYMVMJhrVpIP7gQSEPlYii
	 mCIaCVbsIgEy5qgryeCqZsIp6LVS4UBxmz5lkH+W5Er+d5GzhkyS6q+J75+nwBNf5O
	 tJqbZX0Q714mQ7dZswRUc1tqIC2+j5jRDgSDeyC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D57AF801C1;
	Wed, 21 Dec 2022 15:47:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F912F804AD; Wed, 21 Dec 2022 15:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72DEAF80423
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 15:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72DEAF80423
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Yskd+gfJ
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BLElmVs003165;
 Wed, 21 Dec 2022 08:47:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1671634068;
 bh=0SV7rckhRHv0WBtu/IDbv415PqTSdn2P6qJM5WCHvX4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Yskd+gfJAp0pGHq+Al9avZRoaQWfPpyr910dBCF8koSfLWFflrRgY2PQzmoxxcZzA
 GvHhYt3O2AlWwIg8JjpLwiyak7RK/HOBk7R9BLThScufVCLCPzb5jeD7sAXAdnC254
 Zdwm9RpID7OzCiay5QHBe+3BL61MhsdlJkDUPewg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BLElmge015618
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Dec 2022 08:47:48 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 21
 Dec 2022 08:47:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 21 Dec 2022 08:47:48 -0600
Received: from [172.24.145.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BLElj2C067434;
 Wed, 21 Dec 2022 08:47:46 -0600
Message-ID: <a45e09ad-41e3-7e09-bab1-5f8c42417b9a@ti.com>
Date: Wed, 21 Dec 2022 20:17:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221220123951.29959-1-j-luthra@ti.com>
 <aa8a2251-b7e7-9c03-fcd4-9875302981e4@linaro.org>
From: Jai Luthra <j-luthra@ti.com>
In-Reply-To: <aa8a2251-b7e7-9c03-fcd4-9875302981e4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 21/12/22 14:03, Krzysztof Kozlowski wrote:
> On 20/12/2022 13:39, Jai Luthra wrote:
>> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
>>
>> The following properties are still found in some old dts files, but will
>> be ignored by the driver:
>> - adc-settle-ms
>> - assigned-clock-paranets, assigned-clock-rates, assigned-clocks
>> - port
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> ---
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      tlv320aic3x_i2c: tlv320aic3x@1b {
> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 

Thanks Krzysztof, will fix in v4.

>> +        compatible = "ti,tlv320aic3x";
>> +        reg = <0x1b>;
>> +
>> +        reset-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
>> +
>> +        AVDD-supply = <&regulator>;
>> +        IOVDD-supply = <&regulator>;
>> +        DRVDD-supply = <&regulator>;
>> +        DVDD-supply = <&regulator>;
>> +      };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    spi {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      tlv320aic3x_spi: codec@0 {
>> +        compatible = "ti,tlv320aic3x";
>> +        reg = <0>; /* CS number */
>> +        #sound-dai-cells = <0>;
>> +
>> +        AVDD-supply = <&regulator>;
>> +        IOVDD-supply = <&regulator>;
>> +        DRVDD-supply = <&regulator>;
>> +        DVDD-supply = <&regulator>;
>> +        ai3x-ocmv = <0>;
>> +      };
>> +    };
>> +
>> +...
> 
> Best regards,
> Krzysztof
> 
