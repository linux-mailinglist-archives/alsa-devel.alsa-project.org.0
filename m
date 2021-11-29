Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D74613CE
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 12:23:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD7B18CD;
	Mon, 29 Nov 2021 12:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD7B18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638185004;
	bh=j1+77rRnsKGxP8kWG18GYxfEOaE7NfYbjlm0ZwHN5bc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCvs7UDYesaCrQ8Cdgq5B5RkF8X4cbCMxjuO3Iax6xKwoosRfBmZTb4MLN67oZG4o
	 cX9Wq6ow9/44CnnPRDlxVhpnHwykfSDOJ76iEBXIXdsIDKYVuweEShb3p1/+W+Gw4S
	 l01t+ZVb8/JBQig0mmfsG6Ke8t5ENLy7aOIRnVw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98EE2F800EE;
	Mon, 29 Nov 2021 12:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1593F80240; Mon, 29 Nov 2021 12:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFAA9F800EE
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 12:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFAA9F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v5vpszX2"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ATBLtEF088375;
 Mon, 29 Nov 2021 05:21:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638184915;
 bh=I850Fwk6rJ1lSUMvUiIQorbs6z7UwCYX7CIjOR2dyug=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=v5vpszX2ujnSw96JrkT1pYMol3jXMy+vLaPKOgaiJztWNvkUIXPPJgW2JmYhKJ4Aq
 J/arWDeepqQ48TlSXeVYOVMadgjJhLo42UExpzfaXjVoHU9XYIkQQApl6a4sV0XeFd
 8yVmhRKokq2993JjDhowFiiQDaPnqk9rQne4H/1k=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ATBLtHM061645
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Nov 2021 05:21:55 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 29
 Nov 2021 05:21:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 29 Nov 2021 05:21:54 -0600
Received: from [172.24.145.91] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ATBLp5O046651;
 Mon, 29 Nov 2021 05:21:52 -0600
Subject: Re: [PATCH v3] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
References: <20211126050228.6257-1-j-choudhary@ti.com>
 <64426bc9-1160-97c6-4714-4201b8f7a81c@gmail.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <a7bc460f-abf4-1d64-6416-5b50dc15d184@ti.com>
Date: Mon, 29 Nov 2021 16:51:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <64426bc9-1160-97c6-4714-4201b8f7a81c@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, "Yadav,
 Pratyush" <p.yadav@ti.com>
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



On 29/11/21 12:23 pm, Péter Ujfalusi wrote:
> 
> 
> On 26/11/2021 07:02, Jayesh Choudhary wrote:
>> Convert the bindings for McASP controllers for TI SOCs
>> from txt to YAML schema.
> 
> Can you CC the sound/soc/ti/ maintainer next time, I have found this
> patch in my Spam folder...

Okay. Also, I will add this file in the MAINTAINERS file under the 
heading 'TEXAS INSTRUMENTS ASoC DRIVERS'

> 
>> Adds additional properties 'clocks', 'clock-names', 'power-domains',
>> '#sound-dai-cells',
> 
>> 'num-serializer'
> 
> Which use was removed by 1427e660b49e87cd842dba94158b0fc73030c17e

The dts file of arm SOCs is not updated and was generating an error in 
dtbs_check. I will remove this property.

> 
>> and 'port'
> 
> And what this "port" is?

The mcasp node in the file 'arch/arm/boot/dts/am335x-sl50.dts' has this 
as child node.

> 
>> which were not there in the txt file.
> 
> Most likely for a reason?
> 
>> Adds 'dmas' and 'dma-names' in the example which were not there in
>> the txt file.
>> Changes 'interrupts' and 'interrupt-names' from optional to
>> required properties.
> 
> My biggest problem with the davinci-mcasp-audio.txt is that it was done
> in a wrong way and it just documented the pdata parameters as DT binding.
> If we convert it to yaml, this is going to be 'written in stone'.
> 
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---


>> +
>> +  tdm-slots:
> 
> description?

I will add description.

> 
>> +    maxItems: 1
>> +
>> +  serial-dir:
>> +    description:
>> +      A list of serializer configuration
>> +      Entry is indication for serializer pin direction
>> +      0 - Inactive, 1 - TX, 2 - RX
> 
> You should mention that _all_ AXR pins should be present in the array,
> even if they are no in use.
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 16
> 
> a McASP could have up to 25 AXR pins...
> 

Will update the description and the maximum.

>> +    items:
>> +      minimum: 0
>> +      maximum: 2
>> +      default: 0
>> +


>> +
>> +  tx-num-evt:
> 
> description?
> 
>> +    maxItems: 1
>> +
>> +  rx-num-evt:
> 
> description?
> 
>> +    maxItems: 1
>> +
>> +  dismod:
> 
> description?
> 

For the above three properties, is the description in the txt file 
sufficient?



>> +
>> +  sram-size-playback:
>> +    maxItems: 1
> 
> should be dropped, not used
> 
>> +
>> +  sram-size-capture:
>> +    maxItems: 1
> 
> not used, please drop
> 

Okay.

>> +
>> +  interrupts:
>> +    minItems: 1
>> +    items:
>> +      - description: TX FIFO interrupt
>> +      - description: RX FIFO interrupt
> 
> The 'common' does not deserve a description?
> 

Will add this.


>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  function-gpios:
>> +    maxItems: 1
> 
> This is not McASP property, it was an example on how to use a pin as
> GPIO from the outside...
> 

Okay. will remove function-gpios.

>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: fck
>> +      - const: ahclkx
>> +      - const: ahclkr
> 
> I can not find any use in the code for ahclkx/r?
> 

Some arm SOCs had additional clocks in the DT nodes.


>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - dmas
>> +  - dma-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - serial-dir
>> +  - op-mode
>> +  - tdm-slots
> 
> The last three is not needed if the McASP is used only as GPIO.
> The dmas and interrupts should not be needed in this case, but I think
> it is not taken care of atm.
> 
> The tdm-slots is ignored for DIT mode
> 

These were mentioned in txt file as required.
In light of this new knowledge, I will remove 'serial-dir', 'op-mode' 
and 'tdm-slots'.

> 

