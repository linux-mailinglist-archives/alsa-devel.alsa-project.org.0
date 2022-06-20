Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B589D554F7C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A782332;
	Wed, 22 Jun 2022 17:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A782332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912266;
	bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXTfHEicD2Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fp2HMGhJH/Nwce3og7Gvf3WT5RmSJu7Hj1Ufs2ZhwyOcP8P5G6bmSNJXEFaYzpV4B
	 2O/Ljlk7NwsAYnxAgtpDLsY5t5kn2uzWhVYjQEyVS2uLt30mYUs1kOCin6vhlSEKZx
	 lgXisret16/vg6JAOKnHqMhTVBbefYvAM0i/HEcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 303B7F80683;
	Wed, 22 Jun 2022 17:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57948F800E3; Tue, 21 Jun 2022 00:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44735F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 00:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44735F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="qZgOZM0s"; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.b="lZTYwlSH"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655765202; x=1687301202;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXTfHEicD2Q=;
 b=qZgOZM0sOmTVbXWtUcE7JA/shiLtS7x25yIY5cRVmiUhnBkZJKrm+3YH
 SRbI6zOrzLUSz8G2Koje38up8dA8jR9Ur3ydjeMb8mSRjLM03+3SF4UVc
 0XpVPB/zqYfaVUyU43QSkLEWdelyiTXZUDecqXHu8pm7AIlZyCN+lB2jB
 +Vg4c83lCqC6BJw5QRARX/tKcOaER4yI1Yi6TTXUWRLcFdDV+rrZayOc1
 6qxc6qWgI5CLyHolt3Wd4xZEijDmf2Nrw0uUnlXb2dumw8uAYCjw48AuA
 CRgZ6HAoOxopjjN9WsUGEpZg9NCoU0MAtt+Y45lTlZowbsDjvLzfvR1mE w==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650902400"; d="scan'208";a="203659825"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2022 06:46:37 +0800
IronPort-SDR: /nNILaztcxzLR+34IgM0ZjfZlYywSo+Wxp+xKn2ebYVVfESIaVo7zDpp2gcgOf/kkw9hT65Vlq
 tIebmkjf2nI1uOM2p9J1/dyCldNtnECEECjQilfCd0P3gVGWZ1R7czmygCT/blF/FHl5BnDGN+
 xDsnWae817hdNaU/nd5//EYUgwsvFo+0bWL1dXQbKtyxBx0Qbx0G60QU+/skzneNyy7efQ74LH
 0tM8abj57gpJUabrGLuCta/6Ij9ex4NAAQPjZdTvKTnBMdJZOfmZ2W0qDzpzUCNoOMSdybm9li
 9rtDs/XHGAsJZbmKzrViumrH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 15:04:45 -0700
IronPort-SDR: Mr6dHxlv2kNNtUlqTIjKIrNw6nboR/a9CpVSN47ufD/elsKomynla8nrewdeg7Stf12XNQsyAY
 /9MBnMkPl6B9MH5setiir/Iflum4VGu7BgXvQx8fwwgufyQPdqEuS7gSsbRjSaUPaTbL4VKBuo
 T2GMI6HN1QANbOjxK8HM35sKs0QkBt2X3tCbjeSzpKKXD5HFVo/f+Kw5SgHypoycqFdnk9jlB7
 67owAwUkiFSeZvrFkMaPCNIH9x2CEcNAqxgwDlnrcy+JaQnBqcXx4z86JfD4vYqngXOqu7mjOy
 yXI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 15:46:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRlBN3HJkz1SVp3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 15:46:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655765194; x=1658357195; bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXT
 fHEicD2Q=; b=lZTYwlSHXsQwoRQtDodDyL+wElQHKqJlNu9N1pwIoMMJ/qfSbS9
 wifvSb26JLnh3ToctO5eJi3ZCgybVZNgPDPntDHmoz/rR2Pjzi4Ck7bUKQfc2erX
 z3YrBI7Oj/tY/3bLixhQWjn9at6/vGT2XBmaQxhqysi6b3yQTXnjEPFKrEP4/p99
 NpGmZsmmm+75JItD7peWMdx5JKs04RjtpaXy7driP1Hbv2H7G+hXVMNgTyr81mxJ
 j4omPKZLqiMp4vh3bOzFpzQ0tqXBOYgmMTIDvDihUwZ4QyHoYSyIcF/fznSr1Mqe
 FihJIN/VoDU2j7JRnWUTBZoY3yTryhxqQ0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 0QPndIChy_t3 for <alsa-devel@alsa-project.org>;
 Mon, 20 Jun 2022 15:46:34 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRlBG25pSz1Rvlc;
 Mon, 20 Jun 2022 15:46:30 -0700 (PDT)
Message-ID: <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
Date: Tue, 21 Jun 2022 07:46:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Conor.Dooley@microchip.com, fancer.lancer@gmail.com, mail@conchuod.ie
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, masahiroy@kernel.org, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, daniel@ffwll.ch, dmaengine@vger.kernel.org
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

On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 21:56, Serge Semin wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>> this.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> index e25d44c218f2..f2b9e3f062cd 100644
>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> @@ -135,19 +135,41 @@ properties:
>>>        of the designware controller, and the upper limit is also subject to
>>>        controller configuration.
>>>
>>> -patternProperties:
>>> -  "^.*@[0-9a-f]+$":
>>> -    type: object
>>> -    properties:
>>> -      reg:
>>> -        minimum: 0
>>> -        maximum: 3
>>> -
>>> -      spi-rx-bus-width:
>>> -        const: 1
>>> -
>>> -      spi-tx-bus-width:
>>> -        const: 1
>>> +if:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: snps,dwc-ssi-1.01a
>>> +
>>> +then:
>>> +  patternProperties:
>>> +    "^.*@[0-9a-f]+$":
>>> +      type: object
>>> +      properties:
>>> +        reg:
>>> +          minimum: 0
>>> +          maximum: 3
>>> +
>>> +        spi-rx-bus-width:
>>> +          const: 4
>>> +
>>> +        spi-tx-bus-width:
>>> +          const: 4
>>> +
>>> +else:
>>> +  patternProperties:
>>> +    "^.*@[0-9a-f]+$":
>>> +      type: object
>>> +      properties:
>>> +        reg:
>>> +          minimum: 0
>>> +          maximum: 3
>>> +
>>> +        spi-rx-bus-width:
>>> +          const: 1
>>> +
>>> +        spi-tx-bus-width:
>>> +          const: 1
>>
>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> 
> 8 too? sure.
> 
>> irrespective from the compatible string. The modern DW APB SSI
>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>> run-time there is no way to create a DT-schema correctly constraining
>> the Rx/Tx SPI bus widths. So let's keep the
>> compatible-string-independent "patternProperties" here but just extend
>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>> properties values.
> 
> SGTM!
> 
>>
>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>> activated by means of the corresponding CSR. So most likely the DW AHB
>> SSI controllers need some specific setups too.
> 
> hmm, well I'll leave that up to people that have Canaan hardware!

I will test this series.

> Thanks,
> Conor.
> 
>>
>> -Sergey
>>
>>>
>>>  unevaluatedProperties: false
>>>
>>> --
>>> 2.36.1
>>>
> 


-- 
Damien Le Moal
Western Digital Research
