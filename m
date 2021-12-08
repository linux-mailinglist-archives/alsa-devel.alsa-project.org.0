Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A2471943
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 09:25:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D20A193A;
	Sun, 12 Dec 2021 09:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D20A193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639297517;
	bh=QY8sgz94Wa9kckSiAu6WJa+g/P7YpX4ms7BAVFB52Bw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKeAjGHULdtMefx2fXRDrU6CePQplvomOZ8chOM+aHFg8xbFxbLRRMoLDxqwLDQFu
	 qE3Tzyz1DUv4nhD3TXfPbFZ6f0a833ljEhkn8N69FHah3ZOEVeHHaTqb+35CL8JLGe
	 In4xA3HdS98yWIvReVzeoWv4P95bathBqHEv05vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8FC4F80510;
	Sun, 12 Dec 2021 09:23:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 335AFF804E5; Wed,  8 Dec 2021 14:35:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C02F800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 14:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C02F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="aqZItg83"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B8Cclne025876;
 Wed, 8 Dec 2021 14:34:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=b7J60CZ4uwTeJQ0u5OzpaoMz6M8+x9zjkJxexO30IRk=;
 b=aqZItg83GMtGbnmFwvW3j9qQlBHBWfz89uoHpa3RKpGiGAZxvkJqUgASz+ScwILbEC7f
 ntYoJu0dkoYnO5KHKjgpQsqp0NPg3p2PrhQs+R9zI+rYBZSIiF2KOFTs0M7n9jNgj8+O
 NmqXVZN3sOed36SWRtAnm/aIeclCteG93wkeG7ZAV/YOFqjJDv9LbZJ00firjJ3UNoMP
 +z3RzL7M6+9CwD7gU+INJNrUKNZYgSq5A9l5k9s6oojWTxMeKc5yai/g8dJp9YUcVLP0
 qy+wijSFYVhj544GiCPycClbS1Sjo8xo6TyMOfCUPjGE2LUPgY4AWRW6R/RgYHSEuvJZ 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ctrpq9x0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 14:34:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5C4A10002A;
 Wed,  8 Dec 2021 14:34:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2C1B2107EE;
 Wed,  8 Dec 2021 14:34:49 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec
 2021 14:34:48 +0100
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Ahmad
 Fatoum" <a.fatoum@pengutronix.de>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
 <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
 <YbCgSeA1++U82jtn@google.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <fea38140-42be-ece3-b8ea-875ee63f8618@foss.st.com>
Date: Wed, 8 Dec 2021 14:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbCgSeA1++U82jtn@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_05,2021-12-08_01,2021-12-02_01
X-Mailman-Approved-At: Sun, 12 Dec 2021 09:23:26 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>, alain.volmat@foss.st.com,
 arnaud.pouliquen@foss.st.com, Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 12/8/21 1:08 PM, Lee Jones wrote:
> On Wed, 08 Dec 2021, Alexandre TORGUE wrote:
> 
>> Hi Ahmad
>>
>> On 12/7/21 2:59 PM, Ahmad Fatoum wrote:
>>> Hello Alex,
>>>
>>> On 07.12.21 14:52, Alexandre TORGUE wrote:
>>>> Hi Rob
>>>>
>>>> On 12/1/21 11:34 PM, Rob Herring wrote:
>>>>> On Fri, Nov 26, 2021 at 11:25:27AM +0100, Olivier MOYSAN wrote:
>>>>>> Hi Rob,
>>>>>>
>>>>>> On 11/25/21 10:26 PM, Rob Herring wrote:
>>>>>>> On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
>>>>>>>> The STM2 I2S DAI can be connected via the audio-graph-card.
>>>>>>>> Add port entry into the bindings.
>>>>>>>>
>>>>>>>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>>>>>>>> ---
>>>>>>>>      Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
>>>>>>>>      1 file changed, 5 insertions(+)
>>>>>>>>
>>>>>>>
>>>>>>> Running 'make dtbs_check' with the schema in this patch gives the
>>>>>>> following warnings. Consider if they are expected or the schema is
>>>>>>> incorrect. These may not be new warnings.
>>>>>>>
>>>>>>> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
>>>>>>> This will change in the future.
>>>>>>>
>>>>>>> Full log is available here: https://patchwork.ozlabs.org/patch/1559750
>>>>>>>
>>>>>>>
>>>>>>> audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
>>>>>>>       arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
>>>>>>>       arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
>>>>>>>
>>>>>>
>>>>>> This warning is not a new one.
>>>>>>
>>>>>> The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
>>>>>> port:
>>>>>>       $ref: audio-graph-port.yaml#
>>>>>>       unevaluatedProperties: false
>>>>>>
>>>>>> However the spi binding requires to introduce a unit address:
>>>>>> patternProperties:
>>>>>>      '^port@[0-9]':
>>>>>>        $ref: audio-graph-port.yaml#
>>>>>>        unevaluatedProperties: false
>>>>>>
>>>>>> The warning can be removed by re-ordering the bindings patches in the serie,
>>>>>> as "additionalProperties: true" makes the check more tolerant on extra
>>>>>> properties.
>>>>>
>>>>> That's never right.
>>>>>
>>>>>> The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can
>>>>>> even be merely dropped.
>>>>>> So, I suggest to resend the serie without audio-graph-card patch.
>>>>>
>>>>> Only if you aren't using audio-graph-card.
>>>>>
>>>>>>
>>>>>> Does it sound too permissive to you ?
>>>>>
>>>>> I think perhaps you need to combine the schemas into 1. Or you need to
>>>>> restructure your dtsi files such that you only add spi specific
>>>>> properties when spi mode is enabled and only add i2s specific properties
>>>>> when i2s mode is enabled. Or use the /delete-property/ directive.
>>>>
>>>> Initially the aim of this series was to fix a "make W=1" warnings seen on spi and i2s nodes (duplicate unit-address). Moving both nodes in a common node + using a different compatible depending on SPI or I2S usage sounded good) but it is not enough. In this series the common node is named as following: "spi2s2: spi@4000b000". It is fine for a spi usage but if we want to use this "common node" with I2S compatible and specific bindings, the node name remains spi@... and then specific spi checks are done. For this with this series applied we got this issue reported by spi-controller.yaml:
>>>>
>>>> spi@4000b000: port@0: 'compatible' is a required property
>>>>
>>>> So, if we use two separates nodes we got W=1 warning and if we use a common node we got yaml check issue. One possibility would be to use a common node with a new node name (for example i2spi@...) but I think it is not acceptable.
>>>>
>>>> How to progress ?
>>>
>>> Atmel Flexcom can be configured to be either UART, SPI or i2c. Functions
>>> are child nodes of the flexcom node and the MFD driver matching against it,
>>> just configure the operating mode and then calls of_platform_populate.
>>>
>>> Would something along these lines fit here as well?
>>
>> Yes it could but in my mind it was not a MFD as both feature cannot be used
>> at the same time: it is either SPI or I2S and choice is done "statically" in
>> device tree depending board usage.
>>
>> Lee, what it is your feeling about that ? Will you accept to add a MFD
>> driver for this SPI/I2S peripheral whose prurpose is only to populate child
>> node (either SPI or I2S) ?
> 
>  From your description, this doesn't sound like a good fit for MFD.

Thanks Lee for your quick answer. So rename the node frop spi@... to 
i2spi@... (or something else) looks like to be the only solution. 
Depending the compatible used the well schema will be used (if well 
referenced in each stm32 spi and i2s yaml files):

--> spi-controller.yaml in case of "st,stm32h7-spi"

-->audio-controller in case of "st,stm32h7-i2s"

Rob, do you agree?

regards
alex

> 

