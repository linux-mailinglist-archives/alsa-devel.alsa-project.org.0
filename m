Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F216046B210
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 06:04:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659AE21C1;
	Tue,  7 Dec 2021 06:03:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659AE21C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638853473;
	bh=LqWhjEL0TxrR0dEInQAnGRlkcx2rwO0T+sl2uMd7Q7A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAWv4jY/fRguZvDV59/yZLetaxLHi4Q+QSfy4W9/g/S6Eta3R+ss3C6pJwBPyv7D3
	 CA1Uga4EGx660MtmUAA7X2U5eKqGDHaOz9RTSRw8NsV9olYzUL8sUFhntWrUErw/kx
	 N9Vv2ptUwcnXj83Kjw6YlP+udGUuWfHVf6BA91qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A57DAF80103;
	Tue,  7 Dec 2021 06:03:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58CD5F8028D; Tue,  7 Dec 2021 06:03:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45BB9F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 06:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45BB9F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pz2Snm26"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B7535He028160;
 Mon, 6 Dec 2021 23:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638853385;
 bh=gS5qRRdJFapqcyUi0/EkgP/aZO8T3aw4DbK7IE3Zxc0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Pz2Snm2610uopRqDqLRpN5SKVdG5MH/jaWAGz2NteDWtPRBkZO0QLedjCjBQ51gWT
 B6+OSjTZXDzzXQy0lkGph7eppOO7FfN4QV4y1P/lQ84QuD6qvP7Y/YnWaP1mrlWbuf
 TFWo9US/oTwib6iI7Ajz5odxyAonSyHiOj1W+k+8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B75359M069532
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Dec 2021 23:03:05 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 23:03:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 23:03:04 -0600
Received: from [172.24.145.75] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B7532JM129163;
 Mon, 6 Dec 2021 23:03:02 -0600
Subject: Re: [PATCH v4] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 <robh+dt@kernel.org>
References: <20211203120243.24173-1-j-choudhary@ti.com>
 <ed6c9be9-32d3-719a-ee0d-608b228f36b3@gmail.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <20449d7b-0524-a8df-7852-a4c495157682@ti.com>
Date: Tue, 7 Dec 2021 10:33:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ed6c9be9-32d3-719a-ee0d-608b228f36b3@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

Hi,

On 04/12/21 1:50 pm, Péter Ujfalusi wrote:
> Hi,
> 
> On 03/12/2021 14:02, Jayesh Choudhary wrote:
>> Convert the bindings for McASP controllers for TI SOCs from txt
>> to YAML schema.
>>
>> Adds additional properties 'clocks', 'clock-names', 'power-domains',
>> '#sound-dai-cells' and 'port' which were missing from txt file.
>> Removes properties 'sram-size-playback' and 'sram-size-capture'
>> since they are not used.
>> Adds 'dmas' and 'dma-names' in the example which were missing from
>> the txt file.
>> Changes 'interrupts' and 'interrupt-names' from optional to
>> required properties.
>> Changes 'op-mode', 'serial-dir' and 'tdm-slots' to optional properties
>> as they are not needed if the McASP is used only as GPIO.
>>
>> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
>> INSTRUMENTS ASoC DRIVERS'
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>> Changelog:
>> v4:
>> - changes the commit message
>> - adds type and description to relevant properties
>> - changes maxItems for 'serial-dir'
>> - removes properties 'sram-size-playback' and 'sram-size-capture'
>>    as they are not used
>> - removes 'function-gpios'
>> - removes 'num-serializer'
>> - marks 'tdm-slots', 'serial-dir' and 'op-mode' as optional properties
>> - adds the yaml file in MAINTAINERS
>>
> 
> ...
> 
>> +  reg:
>> +    minItems: 1
>> +    items:
>> +      - description: main registers
> 
> The TRM refers to this area as CFG registers
> 
>> +      - description: data port register
> 
> Data registers
> 
>> +
>> +  op-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: I2S - 0 or DIT - 1 operation mode
> 
> 0 - I2S, or 1 - DIT operation mode
> 

I will change the description for 'reg' and 'op-mode'.

>> +    enum:
>> +      - 0
>> +      - 1
>> +
>> +  tdm-slots:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: number of channels over one serializer
>> +    maxItems: 1
> 
> and it has to be between 2 and 32, ignored in DIT mode (384 slots)
> 

Will add minimum and maximum. Should this be added as a conditional
property when op-mode is 0 (I2S mode) and mark it as required?

>> +
>> +  serial-dir:
>> +    description:
>> +      A list of serializer configuration
>> +      Entry is indication for serializer pin direction
>> +      0 - Inactive, 1 - TX, 2 - RX
>> +      All AXR pins should be present in the array even if inactive
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 25
>> +    items:
>> +      minimum: 0
>> +      maximum: 2
>> +      default: 0
> 
> There is no default as all pins must be accounted for.
> 

Okay. Will remove it.

>> +
>> +  tx-num-evt:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: configures WFIFO threshold
> 
> 0 disables the FIFO use
> If the property is missing, it also disables the FIFO use.
> 

Will mention this in the description of both tx/rx-num-evt.

>> +    maxItems: 1
>> +
>> +  rx-num-evt:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: configures RFIFO threshold
>> +    maxItems: 1

>> +
>> +  interrupts:
>> +    anyOf:
>> +      - minItems: 1
>> +        items:
>> +          - description: TX FIFO interrupt
>> +          - description: RX FIFO interrupt
>> +      - items:
>> +          - description: common FIFO interrupt
> 
> These has nothing to do with FIFO, they are just transmit, receive and
> common or combined
> 

Okay.

>> +
>> +  port:
>> +    description: connection for when McASP is used via graph card
>> +    type: object
> 
> I understand that it can be present under the mcasp node as it is part
> of the graph card binding (or a card binding using graph).
> I mean if a new card binding comes around then we need to document it
> here as well?
> 

Specific properties are not marked for the port. So it should not be an
issue. Other alternative is to mark the additional properties as true
but that is not preferred.

Peter,
Any other changes I should make?

>> +
> 
