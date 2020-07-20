Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBD226E32
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 20:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83B21607;
	Mon, 20 Jul 2020 20:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83B21607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595269480;
	bh=Jp4Pey2aEnDHUzbS0UU3nc/WN0Apvy/ZUvVIa6u84Y8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+C8qTCTEc2IGIFiXX5zO25TJrvsg65y3wprgwrweVcaV+3jHzuBAFQsHQXGKBRPY
	 92RwNiTLiyH+Llfuq/9yCDGjuFIEHWcCkVwq7GObIHE+FZENS1goinuz3Z6Uo0LsZl
	 bwnquiyAhj+n5dtoRo1vqtMZaquINQuKknrxypWo=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC1BF800E0;
	Mon, 20 Jul 2020 20:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3A68F800F5; Mon, 20 Jul 2020 20:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FCB1F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 20:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FCB1F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="knABtIz/"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06KIMUOE102100;
 Mon, 20 Jul 2020 13:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1595269350;
 bh=Sd5hnnt4GxFptLwg5tfzZnZe3N/CSbSSNwGUNJiJjGg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=knABtIz/jmMhBngJ8jfzuvoe4eXBXcBKN9jwGnl956ycWLGE3iCkivm5pbdn7z7EI
 bUagy0Zdls//uoybpGBdhCDWIQgjneSVPXgxA23XPixpPAjFgX9+2jzSIRc7ltuLl2
 h9dwtNHeUQ5T7iOfp0qRJ+8rjAkLemRu0JNemaz8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KIMU0x103198;
 Mon, 20 Jul 2020 13:22:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 13:22:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 13:22:30 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KIMUVZ080357;
 Mon, 20 Jul 2020 13:22:30 -0500
Subject: Re: [PATCH 4/4] dt-bindings: tas2562: Convert the tas2562 binding to
 yaml
To: Rob Herring <robh@kernel.org>
References: <20200626154143.20351-1-dmurphy@ti.com>
 <20200626154143.20351-4-dmurphy@ti.com> <20200715201522.GA740682@bogus>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <e61b54bf-f77c-cb4d-c256-fb0c15f18993@ti.com>
Date: Mon, 20 Jul 2020 13:22:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715201522.GA740682@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

Rob

On 7/15/20 3:15 PM, Rob Herring wrote:
> On Fri, Jun 26, 2020 at 10:41:43AM -0500, Dan Murphy wrote:
>> Convert the TAS2562 text file to yaml format.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/sound/tas2562.txt     | 37 ---------
>>   .../devicetree/bindings/sound/tas2562.yaml    | 77 +++++++++++++++++++
>>   2 files changed, 77 insertions(+), 37 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/tas2562.txt b/Documentation/devicetree/bindings/sound/tas2562.txt
>> deleted file mode 100644
>> index dc6d7362ded7..000000000000
>> --- a/Documentation/devicetree/bindings/sound/tas2562.txt
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -Texas Instruments TAS2562 Smart PA
>> -
>> -The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
>> -efficiently driving high peak power into small loudspeakers.
>> -Integrated speaker voltage and current sense provides for
>> -real time monitoring of loudspeaker behavior.
>> -
>> -Required properties:
>> - - #address-cells  - Should be <1>.
>> - - #size-cells     - Should be <0>.
>> - - compatible:	   - Should contain "ti,tas2562", "ti,tas2563".
>> - - reg:		   - The i2c address. Should be 0x4c, 0x4d, 0x4e or 0x4f.
>> - - ti,imon-slot-no:- TDM TX current sense time slot.
>> - - ti,vmon-slot-no:- TDM TX voltage sense time slot. This slot must always be
>> -		     greater then ti,imon-slot-no.
>> -
>> -Optional properties:
>> -- interrupt-parent: phandle to the interrupt controller which provides
>> -                    the interrupt.
>> -- interrupts: (GPIO) interrupt to which the chip is connected.
>> -- shut-down-gpio: GPIO used to control the state of the device.
>> -
>> -Examples:
>> -tas2562@4c {
>> -        #address-cells = <1>;
>> -        #size-cells = <0>;
>> -        compatible = "ti,tas2562";
>> -        reg = <0x4c>;
>> -
>> -        interrupt-parent = <&gpio1>;
>> -        interrupts = <14>;
>> -
>> -	shut-down-gpio = <&gpio1 15 0>;
>> -        ti,imon-slot-no = <0>;
>> -        ti,vmon-slot-no = <1>;
>> -};
>> -
>> diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
>> new file mode 100644
>> index 000000000000..1fb467e14d4c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> Same licensing comment here as tas2770

OK I will fix it like I did with the other TAS2770 patches


>> +# Copyright (C) 2019 Texas Instruments Incorporated
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/sound/tas2562.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Texas Instruments TAS2562 Smart PA
>> +
>> +maintainers:
>> +  - Dan Murphy <dmurphy@ti.com>
>> +
>> +description: |
>> +  The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
>> +  efficiently driving high peak power into small loudspeakers.
>> +  Integrated speaker voltage and current sense provides for
>> +  real time monitoring of loudspeaker behavior.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,tas2562
>> +      - ti,tas2563
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: |
>> +       I2C address of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
>> +
>> +  shut-down-gpio:
>> +    description: GPIO used to control the state of the device.
>> +    deprecated: true
> Why do we need this as the driver never worked?

Not sure what you are asking.

Driver has been fixed for this specific binding in sound for-next.

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/codecs/tas2562.c?h=for-next&id=bc07b54459cbb3a572a78b5c200ff79ef11b8158

>
>> +
>> +  shutdown-gpio:
>> +    description: GPIO used to control the state of the device.
> -gpios is the preferred form: shutdown-gpios

So the plural form of gpio is preferred even if the gpio is singular?  I 
would think gpio would be plural if this was an array of gpios.

I am waiting for the yaml to be accepted before adding this shutdown 
property to the driver.

Dan

