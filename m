Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5853471941
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 09:24:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9631921;
	Sun, 12 Dec 2021 09:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9631921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639297475;
	bh=gV4Rl0SLGbqGFEuygKYKfgnuDrJ+A2FQ1SCdyInLBwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTocSUSgMUh1pZRrHbyLgiZcz2EBGeONdi7ljTNf5sVU4SxbhVMxI0ApZ8tToYXdW
	 1U2g7hAo9bLvS9ealP53BYeCPWM5slM+HPFoTjpwz08U7PoFi9qDRF0+2cygI54JM7
	 8JOtM66Lb1ENqbGA5hvB3gO0XIfNZ1PpnY6KGg3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 739C9F800BC;
	Sun, 12 Dec 2021 09:23:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B884DF804EC; Wed,  8 Dec 2021 10:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8758DF80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 10:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8758DF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="QsNAjIL9"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B83PgUK015911;
 Wed, 8 Dec 2021 10:55:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TyAvxbW9AUw+fp0lLnm8rh6Mts5UvlpDwToo1N9WL3M=;
 b=QsNAjIL9gWzh2LxtdywE0Iduw0i4x8rwbTEOtjDnC9sAAp892JBLEswJwOWLIIedPV07
 U3Gl3cJiDw1KCiSM8YIqyBd12765x10brSZHOzRLBQD0Wh3J6C1EPAgMaeXXIyuniSpe
 8pbrN14ZxPtUEw664MuG4Safds5bgItPP0L1QCexvqL9p2MLr0vXm7Vw3j5UDohUSE+j
 6n9vjFC5CS7r8xQPUoDdHyW6Y9RZ9V1H11QmNTjbdjUfA6SbPZUzP3GSjMo4uDZ3bViE
 iY7Jbutdg8f7qvfTqBvBmEAXkk4RlDn/3NVl+I+7VoiRHDf0Kia8VSrqg0KguZ/38JSM aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ctmsrhq7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 10:55:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB5A210002A;
 Wed,  8 Dec 2021 10:55:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8BC02259A3;
 Wed,  8 Dec 2021 10:55:21 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec
 2021 10:55:20 +0100
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Fabrice GASNIER <fabrice.gasnier@st.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
Date: Wed, 8 Dec 2021 10:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_03,2021-12-06_02,2021-12-02_01
X-Mailman-Approved-At: Sun, 12 Dec 2021 09:23:26 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 alain.volmat@foss.st.com, arnaud.pouliquen@foss.st.com,
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

Hi Ahmad

On 12/7/21 2:59 PM, Ahmad Fatoum wrote:
> Hello Alex,
> 
> On 07.12.21 14:52, Alexandre TORGUE wrote:
>> Hi Rob
>>
>> On 12/1/21 11:34 PM, Rob Herring wrote:
>>> On Fri, Nov 26, 2021 at 11:25:27AM +0100, Olivier MOYSAN wrote:
>>>> Hi Rob,
>>>>
>>>> On 11/25/21 10:26 PM, Rob Herring wrote:
>>>>> On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
>>>>>> The STM2 I2S DAI can be connected via the audio-graph-card.
>>>>>> Add port entry into the bindings.
>>>>>>
>>>>>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>>>>>> ---
>>>>>>     Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
>>>>>>     1 file changed, 5 insertions(+)
>>>>>>
>>>>>
>>>>> Running 'make dtbs_check' with the schema in this patch gives the
>>>>> following warnings. Consider if they are expected or the schema is
>>>>> incorrect. These may not be new warnings.
>>>>>
>>>>> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
>>>>> This will change in the future.
>>>>>
>>>>> Full log is available here: https://patchwork.ozlabs.org/patch/1559750
>>>>>
>>>>>
>>>>> audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
>>>>>      arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
>>>>>      arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
>>>>>
>>>>
>>>> This warning is not a new one.
>>>>
>>>> The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
>>>> port:
>>>>      $ref: audio-graph-port.yaml#
>>>>      unevaluatedProperties: false
>>>>
>>>> However the spi binding requires to introduce a unit address:
>>>> patternProperties:
>>>>     '^port@[0-9]':
>>>>       $ref: audio-graph-port.yaml#
>>>>       unevaluatedProperties: false
>>>>
>>>> The warning can be removed by re-ordering the bindings patches in the serie,
>>>> as "additionalProperties: true" makes the check more tolerant on extra
>>>> properties.
>>>
>>> That's never right.
>>>
>>>> The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can
>>>> even be merely dropped.
>>>> So, I suggest to resend the serie without audio-graph-card patch.
>>>
>>> Only if you aren't using audio-graph-card.
>>>
>>>>
>>>> Does it sound too permissive to you ?
>>>
>>> I think perhaps you need to combine the schemas into 1. Or you need to
>>> restructure your dtsi files such that you only add spi specific
>>> properties when spi mode is enabled and only add i2s specific properties
>>> when i2s mode is enabled. Or use the /delete-property/ directive.
>>
>> Initially the aim of this series was to fix a "make W=1" warnings seen on spi and i2s nodes (duplicate unit-address). Moving both nodes in a common node + using a different compatible depending on SPI or I2S usage sounded good) but it is not enough. In this series the common node is named as following: "spi2s2: spi@4000b000". It is fine for a spi usage but if we want to use this "common node" with I2S compatible and specific bindings, the node name remains spi@... and then specific spi checks are done. For this with this series applied we got this issue reported by spi-controller.yaml:
>>
>> spi@4000b000: port@0: 'compatible' is a required property
>>
>> So, if we use two separates nodes we got W=1 warning and if we use a common node we got yaml check issue. One possibility would be to use a common node with a new node name (for example i2spi@...) but I think it is not acceptable.
>>
>> How to progress ?
> 
> Atmel Flexcom can be configured to be either UART, SPI or i2c. Functions
> are child nodes of the flexcom node and the MFD driver matching against it,
> just configure the operating mode and then calls of_platform_populate.
> 
> Would something along these lines fit here as well?

Yes it could but in my mind it was not a MFD as both feature cannot be 
used at the same time: it is either SPI or I2S and choice is done 
"statically" in device tree depending board usage.

Lee, what it is your feeling about that ? Will you accept to add a MFD 
driver for this SPI/I2S peripheral whose prurpose is only to populate 
child node (either SPI or I2S) ?

Cheers
Alex

> 
> Cheers,
> Ahmad
> 
>>
>> Thanks
>> Alex
>>
>>
>>> Rob
>>>
>>
>> _______________________________________________
>> Linux-stm32 mailing list
>> Linux-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
>>
> 
> 

