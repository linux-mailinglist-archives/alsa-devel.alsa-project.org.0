Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091034905AF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 11:08:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75AF41775;
	Mon, 17 Jan 2022 11:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75AF41775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642414114;
	bh=PSiAv/LAx7P8SM8LkP3VNptAdeZF8IrQQZytG6Rd+N4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUocXd3qq/4HhdLa6sxDOnT6mNEbVfiV36uAzUonZikt6eU5bEN0cSstxuIAbwBGH
	 RRyqdjYyFr1F4PnEF4UzoJxjQOexuFLZ1vEGF1A6nQXaJW76vsNBpmKY+/y9JcD8jq
	 DBd7KbrbmA7OlY44mzUU+CXfhZQcu8jR8F5fGm+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DAAF800CE;
	Mon, 17 Jan 2022 11:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CE79F800EB; Mon, 17 Jan 2022 11:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06090F800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 11:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06090F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yLhkLEzT"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20HA7K2b071091;
 Mon, 17 Jan 2022 04:07:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1642414040;
 bh=Fg9d7SP6oJUUs8o0vbqNNWj1E4/jFlFzFyWcDOMfxfw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yLhkLEzTv/l9A5JMLCBuQU8R8NhHITfw4yuj9BgqifTy+gaZsku3g3hZCZ7Ir0nTN
 IsUsopQxtHk9ONJYe8QrEkX85prqzHvS1nuOwKaqk2yWXe0UA3jvIktlEEbf5d0YTR
 52SKMB+Hc5Zw8WeIIOnLgv9o4nWe9Y1p7Rxslc4s=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20HA7KP9105516
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 Jan 2022 04:07:20 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 17
 Jan 2022 04:07:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 17 Jan 2022 04:07:19 -0600
Received: from [172.24.145.56] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20HA7GdN001504;
 Mon, 17 Jan 2022 04:07:17 -0600
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 <robh+dt@kernel.org>
References: <20220103074427.4233-1-j-choudhary@ti.com>
 <2cf3c89c-169f-3421-25d4-c80a6c9737ae@gmail.com>
 <83c51ee4-ac10-0e44-d1cc-f69cebcbf0b8@gmail.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <f2bf4959-af15-04ad-78c3-aca883173d65@ti.com>
Date: Mon, 17 Jan 2022 15:37:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <83c51ee4-ac10-0e44-d1cc-f69cebcbf0b8@gmail.com>
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



On 12/01/22 1:13 am, Péter Ujfalusi wrote:
> 
> 
> On 1/11/22 21:21, Péter Ujfalusi wrote:
>> Hi Javesh,
>>
>> On 03/01/2022 09:44, Jayesh Choudhary wrote:
>>> Convert the bindings for McASP controllers for TI SOCs from txt
>>> to YAML schema.
>>>
>>> Adds additional properties 'clocks', 'clock-names', 'power-domains',
>>> '#sound-dai-cells' and 'port' which were missing from the txt file.
>>> Removes properties 'sram-size-playback' and 'sram-size-capture'
>>> since they are not used.
>>> Adds 'dmas' and 'dma-names' in the example which were missing from
>>> the txt file.
>>> Changes 'interrupts' and 'interrupt-names' from optional to
>>> required properties.
>>> Changes 'op-modes', 'serial-dir' to optional properties as they are
>>> not needed if the McASP is used only as GPIO.
>>> Changes 'tdm-slots' to required property only for I2S operation mode.
>>>
>>> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
>>> INSTRUMENTS ASoC DRIVERS'
>>
>> I would have added description for the GPIO support as it is not obvious
>> that 2 is going to be for AXR2 or 29 is for ACLKR pin.
>> But I don't think this functionality is going to be used apart from the
>> one dra7 evm.
>>
>> Thank you for the updates and the nice work!
>>
>> Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
>>
> ...
> 
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ti,dm646x-mcasp-audio
>>> +      - ti,da830-mcasp-audio
>>> +      - ti,am33xx-mcasp-audio
>>> +      - ti,dra7-mcasp-audio
>>> +      - ti,omap4-mcasp-audio
> 
> This is the only thing which bugs me: the pointless '-audio' postfix for
> the compatible string...
> 

Removing the postfix would also require a lot of dts changes which might 
be backward incompatible. So it is probably not a good idea.
Should we still consider this?

