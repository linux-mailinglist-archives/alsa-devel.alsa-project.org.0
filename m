Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6ED4731C6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 17:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A3F17D1;
	Mon, 13 Dec 2021 17:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A3F17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639412878;
	bh=RFhI+L8i+t93yOqz4XuA4XqQL1OmoTn9yrviB4mBhT0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TEkGuibizg3yBrvy8d+c6bnCdrJ6VXmrGUxj15Ur1TH3Ipeylhh4tLxrKdkpnDFm4
	 9ucxRb0i+Q5ogaMp+BCSytm+zvKjormr3Wn9a4mFGfBLqvr+LARoyqqmcJzbkHMhMF
	 pb9XNfexfvjy9zb5fP/pStlzXbVRXVm+H5bp691Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 419FEF8025F;
	Mon, 13 Dec 2021 17:26:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3031CF8025D; Mon, 13 Dec 2021 17:26:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A047F8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 17:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A047F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="Wl66NFXf"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BDDUOdp007349;
 Mon, 13 Dec 2021 17:26:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AMqCiIRkWtkqrv1nskqNq6Hf7G/bZt9G2AkpY5HjNks=;
 b=Wl66NFXfLdXhQCTHLMeLPXIqvpRZTvpvrF/7+ZOyTWqdAc1vjChDZPsyf3p46wp1jJtR
 rse78LD+loSiakgKOkROH/mjztGisSuG2sizK0GYj2Z8fnikIrXScArGxh1y4NqYHZSK
 Fl/16adJaGjldWs8zEAKNRndRgankgPHHMSbqmbOIqEBCIbOLMsuqV7V39Z2hpiuw2Mp
 VTkwA99rMdwKEaYdcUTW7WhKdg5ZHOG3N8wxVDfN9DuCDuiJ6k1xmaNzFyopddElU2eb
 JG+8PNar5q1UHGG3hxuIcszwX7GzpoTNHTWiwqo4eB1eyTJwtJU92EQ5/hViceS5JkgI hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cx2c72gy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 17:26:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA8EF10002A;
 Mon, 13 Dec 2021 17:26:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3AA8209F5E;
 Mon, 13 Dec 2021 17:26:38 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 13 Dec
 2021 17:26:37 +0100
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
To: Rob Herring <robh@kernel.org>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <CAL_Jsq+ZVU=DR0vXq6YOsrK9-MoUp5DJ6RKHmtL-ZGSxQ7qyJQ@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <47efb431-6e75-40ac-484c-d84cf4157a04@foss.st.com>
Date: Mon, 13 Dec 2021 17:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+ZVU=DR0vXq6YOsrK9-MoUp5DJ6RKHmtL-ZGSxQ7qyJQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_08,2021-12-13_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Rob,

On 12/11/21 9:05 PM, Rob Herring wrote:
> On Tue, Dec 7, 2021 at 7:52 AM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
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
>>>>>>     Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
>>>>>>     1 file changed, 5 insertions(+)
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
>>>>>      arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
>>>>>      arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
>>>>>
>>>>
>>>> This warning is not a new one.
>>>>
>>>> The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
>>>> port:
>>>>       $ref: audio-graph-port.yaml#
>>>>       unevaluatedProperties: false
>>>>
>>>> However the spi binding requires to introduce a unit address:
>>>> patternProperties:
>>>>     '^port@[0-9]':
>>>>       $ref: audio-graph-port.yaml#
>>>>       unevaluatedProperties: false
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
>> Initially the aim of this series was to fix a "make W=1" warnings seen
>> on spi and i2s nodes (duplicate unit-address). Moving both nodes in a
>> common node + using a different compatible depending on SPI or I2S usage
>> sounded good) but it is not enough. In this series the common node is
>> named as following: "spi2s2: spi@4000b000". It is fine for a spi usage
>> but if we want to use this "common node" with I2S compatible and
>> specific bindings, the node name remains spi@... and then specific spi
>> checks are done. For this with this series applied we got this issue
>> reported by spi-controller.yaml:
>>
>> spi@4000b000: port@0: 'compatible' is a required property
>>
>> So, if we use two separates nodes we got W=1 warning and if we use a
>> common node we got yaml check issue. One possibility would be to use a
>> common node with a new node name (for example i2spi@...) but I think it
>> is not acceptable.
> 
> It is acceptable, see this thread[1].
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20211203183517.11390-1-semen.protsenko@linaro.org/

Perfect! So we can abandon this series. Do you know if a patch has been 
sent to also update scripts/Makefile.lib ?

Regards
Alex


> 

