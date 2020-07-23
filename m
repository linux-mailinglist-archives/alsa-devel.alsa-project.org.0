Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A1122B7B2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84DA31698;
	Thu, 23 Jul 2020 22:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84DA31698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595536047;
	bh=i1YbbqKePdPpqfaxHrduOY9CBtgMToAxlYiZl54WGrQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BlVhQfCskk9pCyLXUoolcJfUzsH/CrK7CMkgsWEHdtT9PZy+lwuJLbrLy5DnLOlGl
	 c/gmmem5/ptRzx/W1guUlg5a4GePUkxBsOH/qg/JtatYF0dtissMGXZULxSVJI1sX/
	 yLlcKQEh/85ujWv5vo4Ea1oxyPOM6zwn2SKotG3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A43DBF8024A;
	Thu, 23 Jul 2020 22:21:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1555AF80212; Thu, 23 Jul 2020 22:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C84E4F8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C84E4F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iYzzOo8G"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NKLgZK084850;
 Thu, 23 Jul 2020 15:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1595535702;
 bh=naKINQHwgTfTwcoGIg76kJD+cU9DqhLGpIVd15pR0f8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=iYzzOo8GUGGFWmYY/m6Coie3vIM3HkiBZSaj3vzDhGUmEXqEcB0kPdpoS1OqJHcw+
 bbOBv+N3DLElGM4tk+ul7NUeXcjwinmTCvCfvaTYgQzSx9wPr8O/k2BL1EFLDnCZyq
 l3mhDB5CSaERR6gg1pMn0DVFLqCzhjnheB50ktPE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NKLgE5033503;
 Thu, 23 Jul 2020 15:21:42 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 15:21:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 15:21:41 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NKLeog013081;
 Thu, 23 Jul 2020 15:21:41 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: tas2562: Convert the tas2562 binding
 to yaml
To: Rob Herring <robh@kernel.org>
References: <20200722154706.9657-1-dmurphy@ti.com>
 <20200723201819.GA783613@bogus>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <74cf61e1-8e99-bd64-a588-bc1ff998efc6@ti.com>
Date: Thu, 23 Jul 2020 15:21:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723201819.GA783613@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
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

On 7/23/20 3:18 PM, Rob Herring wrote:
> On Wed, Jul 22, 2020 at 10:47:05AM -0500, Dan Murphy wrote:
>> Convert the TAS2562 text file to yaml format.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v2 - Updated the shutdown-gpio to shutdown-gpios and fixed licensing to be
>> GPL-2.0-only.
>>
>>   .../devicetree/bindings/sound/tas2562.yaml    | 69 +++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
>> new file mode 100644
>> index 000000000000..8d75a798740b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
>> +  shut-down-gpios:
>> +    description: GPIO used to control the state of the device.
>> +    deprecated: true
> I think you should just remove this given it never worked with any
> released kernel. Otherwise,
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
I would but I came to know that there are customer DTs out there that 
have this property already in their product.

Dan

