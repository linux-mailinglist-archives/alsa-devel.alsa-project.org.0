Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1977554F80
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FDD620DC;
	Wed, 22 Jun 2022 17:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FDD620DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912297;
	bh=8Iz6YFZtbcFYcwcjopjjArKVT0IuGvxeSilsHzUbATU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxM8nLDFtmlgAqojLTyTI6U91jESbpQTXDJPieaH7kLlSse5xWFRtEYhu4Wi8XhBV
	 u1qGetGQybTEpXoY8KXkMBExGk+KO5oKfdhrViGXxWVC4SenaQt1gA4KUt8DfqDtbQ
	 Bx4eo0ZzjCCXtxrTvGiW7xrsgE5UxXthx481MKg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C346F806E5;
	Wed, 22 Jun 2022 17:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9991CF804D8; Tue, 21 Jun 2022 01:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476F0F800FB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 01:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476F0F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.b="jQZPfX+V"; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.b="hxA78rQu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655767056; x=1687303056;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8Iz6YFZtbcFYcwcjopjjArKVT0IuGvxeSilsHzUbATU=;
 b=jQZPfX+V9lFpgLz1Fhs5aFFE9NaHjsQs59Z2bKRWSHZXYrG8j/VnfIH6
 Yw8DiaGYLArnWET7yKAZTIEXvshe8z255aLgaccUV8gCdWk0wR+ChrkAw
 1053dstWgqw+J7SsowymUTG5wY78TOm4+THd2CJJpvfxSGYsrj7pphL2o
 7YJhjzTVtfH/7RxdESChKQRpZB2HXm/dl/cG7DaSEBQwmsECP8C10gnhE
 928k4ODH5scoqmn26ZacZZu7wXWRXMIOorMbOBiiCikWd73yET/QnZQQX
 xc3lcc1Rvd3z/yAfw2SVj5AuUl0Y2zoY3PPJ4TIIBQCy7itsyDC4JE9wI g==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650902400"; d="scan'208";a="204421095"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2022 07:17:29 +0800
IronPort-SDR: KF0DkFBb22oqwgOXHw8NQSTZOcNZUIe4uclomDYbfOJatlnSNtRArZNV4rdfdVFnqmtO2H97k8
 0wAE8yDxj1yiw44dZupMIuwyIqSWgtYt+fHUWyjNXaR7N0DJwaDsiXlpIebzhIPGyPLai8RHK7
 1WqGRgrFDYdWdlFUdsSDz7NaLj/byswoE4PjezzZsYuqUi5UPPoXXdyg3xk1H9k5VnDcrimJEX
 nMp26Bou8yZSqlaPkEfywaOtmg9ncXbmdoOvJO/jBNLwMPeR4HXTu0mCQf3HaYXoEum0fWpkY7
 MKSujXjRC2qs12TcZxjsYuUx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 15:39:59 -0700
IronPort-SDR: Ftfp+InLy642hpI17o5o9Fdg8OmDRRvXpGe7Y03XaM3H1WnCbocgIIENj8XYwj0cXsxuNwOsOG
 v3CiaKPrQIDfL7f4MoAUUzm9e0u9fV+L7i88Lq163JvhM4GWvR38VztOKxRKjPC3+JImgXfc87
 ILJr+s04N46IRS0NoA3Wa2zP0BW8alC22q1W7IqkQClxpD7a/JYsvnTtIzfl0qSvcJpfe889Gd
 giftFR5QEO5RhyqMiAUcT0Fv0dfhAC+hw1aKUxvgrEUb25Wh5kyR5omidS2t8f2qlRdUxudQji
 sEk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 16:17:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRlsy61dgz1Rwrw
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 16:17:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655767045; x=1658359046; bh=8Iz6YFZtbcFYcwcjopjjArKVT0IuGvxeSil
 sHzUbATU=; b=hxA78rQubCx2+MdMVg2KuSsA5Wur/BrsDtFWVBEPO76TUNTt9r6
 B8DFjM51NT1og7K3GRvyFaf3EMqTVY7uJX3vof6PazRKwXEoqfI51+OkbQGiD05g
 OV7dVk3pcZelGsVP1/owGVxUmhnxBZQduf9NrGtZec3PA/X2TgUtDT4ZIa6ebpBd
 XA1pXvz7dv1AUZakW8jK5gtBwJbm9ikOSnNznomqeXwmI3eQ/blRRHDrjllm/eW3
 uxsKi4nyOVNf1G/bNSlH636SrEbqkUqTAeJ5mHEEJkvZrgdGsgtDRce94fwBbDha
 7ZI4AOq3awaIcOlkXeyO9C1tgnGW9g9ZEvg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id WRnDoO7ZgW7C for <alsa-devel@alsa-project.org>;
 Mon, 20 Jun 2022 16:17:25 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRlss3Tsdz1Rvlc;
 Mon, 20 Jun 2022 16:17:21 -0700 (PDT)
Message-ID: <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
Date: Tue, 21 Jun 2022 08:17:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Conor.Dooley@microchip.com,
 fancer.lancer@gmail.com
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
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

On 6/21/22 07:49, Conor Dooley wrote:
> 
> 
> On 20/06/2022 23:46, Damien Le Moal wrote:
>> On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
>>> On 20/06/2022 21:56, Serge Semin wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>>>> this.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>>> index e25d44c218f2..f2b9e3f062cd 100644
>>>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>>> @@ -135,19 +135,41 @@ properties:
>>>>>        of the designware controller, and the upper limit is also subject to
>>>>>        controller configuration.
>>>>>
>>>>> -patternProperties:
>>>>> -  "^.*@[0-9a-f]+$":
>>>>> -    type: object
>>>>> -    properties:
>>>>> -      reg:
>>>>> -        minimum: 0
>>>>> -        maximum: 3
>>>>> -
>>>>> -      spi-rx-bus-width:
>>>>> -        const: 1
>>>>> -
>>>>> -      spi-tx-bus-width:
>>>>> -        const: 1
>>>>> +if:
>>>>> +  properties:
>>>>> +    compatible:
>>>>> +      contains:
>>>>> +        const: snps,dwc-ssi-1.01a
>>>>> +
>>>>> +then:
>>>>> +  patternProperties:
>>>>> +    "^.*@[0-9a-f]+$":
>>>>> +      type: object
>>>>> +      properties:
>>>>> +        reg:
>>>>> +          minimum: 0
>>>>> +          maximum: 3
>>>>> +
>>>>> +        spi-rx-bus-width:
>>>>> +          const: 4
>>>>> +
>>>>> +        spi-tx-bus-width:
>>>>> +          const: 4
>>>>> +
>>>>> +else:
>>>>> +  patternProperties:
>>>>> +    "^.*@[0-9a-f]+$":
>>>>> +      type: object
>>>>> +      properties:
>>>>> +        reg:
>>>>> +          minimum: 0
>>>>> +          maximum: 3
>>>>> +
>>>>> +        spi-rx-bus-width:
>>>>> +          const: 1
>>>>> +
>>>>> +        spi-tx-bus-width:
>>>>> +          const: 1
>>>>
>>>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
>>>
>>> 8 too? sure.
>>>
>>>> irrespective from the compatible string. The modern DW APB SSI
>>>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>>>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>>>> run-time there is no way to create a DT-schema correctly constraining
>>>> the Rx/Tx SPI bus widths. So let's keep the
>>>> compatible-string-independent "patternProperties" here but just extend
>>>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>>>> properties values.
>>>
>>> SGTM!
>>>
>>>>
>>>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>>>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>>>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>>>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>>>> activated by means of the corresponding CSR. So most likely the DW AHB
>>>> SSI controllers need some specific setups too.
>>>
>>> hmm, well I'll leave that up to people that have Canaan hardware!
>>
>> I will test this series.
>>
> 
> Cool, thanks.
> I'll try to get a respin out tomorrow w/ the memory node "unfixed".

OK. I will test that then :)

> Conor.
> 
>>> Thanks,
>>> Conor.
>>>
>>>>
>>>> -Sergey
>>>>
>>>>>
>>>>>  unevaluatedProperties: false
>>>>>
>>>>> --
>>>>> 2.36.1
>>>>>
>>>
>>
>>


-- 
Damien Le Moal
Western Digital Research
