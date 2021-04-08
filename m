Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625F358348
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 14:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF49C1662;
	Thu,  8 Apr 2021 14:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF49C1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617885013;
	bh=I2Pu6767lUQHrWaA8yQGY9b14KgvUkSN1iUXerPoMHo=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vtASQqz7cr7oQExttwo0It4a3SC4HosuzEKRBmuWDn7IPeQdkSIJkt5N9fubTQOOq
	 t+lZxSLOjdD2+j51im5nAvknivosSmAsZMaOMwhAzACY/BX36dRaa6gjNwS/RTCyQC
	 vqbqb2i8i3Ga9P9G+iHrq4gBWmYDvwKZaPtSDioE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B87BCF80162;
	Thu,  8 Apr 2021 14:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 585C1F8020B; Thu,  8 Apr 2021 14:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7320F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 14:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7320F800BD
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGL8S4DC9z7tyl;
 Thu,  8 Apr 2021 20:26:00 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 8 Apr 2021 20:28:09 +0800
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'ports' does not match any of the regexes
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To: Rob Herring <robh@kernel.org>
References: <20210331091616.2306-1-thunder.leizhen@huawei.com>
 <20210331091616.2306-3-thunder.leizhen@huawei.com>
 <20210401202056.GA947212@robh.at.kernel.org>
 <a1aed23d-a9d2-5e05-b1f5-3b48ac8d17f1@huawei.com>
Message-ID: <15a406ba-b288-c98c-46f1-36933c11fb11@huawei.com>
Date: Thu, 8 Apr 2021 20:28:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a1aed23d-a9d2-5e05-b1f5-3b48ac8d17f1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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



On 2021/4/7 10:04, Leizhen (ThunderTown) wrote:
> 
> 
> On 2021/4/2 4:20, Rob Herring wrote:
>> On Wed, Mar 31, 2021 at 05:16:16PM +0800, Zhen Lei wrote:
>>> Currently, if there are more than two ports, or if there is only one port
>>> but other properties(such as "#address-cells") is required, these ports
>>> are placed under the "ports" node. So add the schema of property "ports".
>>
>> A given binding should just use 'ports' or 'port' depending on it's 
>> need. Supporting both forms is needless complexity.

Hi Rob:
I don't think of a good way to avoid "port" and "ports" to be used at the same time.
Should I disable the use of "port"? Convert the two usages of "port" into "ports".
But usually no one will use both of them in one dts file. And even if it's used at
the same time, it's not a big mistake. So I decided not to test it.

> 
> Right, I'll adjust this patch again.
> 
>>
>>> Otherwise, warnings similar to the following will be reported:
>>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: \
>>> sound@ec500000: 'ports' does not match any of the regexes: \
>>> '^rcar_sound,ctu$', '^rcar_sound,dai$', '^rcar_sound,dvc$', ...
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
>>> index 384191ee497f534..a42992fa687d3f3 100644
>>> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
>>> @@ -115,6 +115,11 @@ properties:
>>>      $ref: audio-graph-port.yaml#
>>>      unevaluatedProperties: false
>>>  
>>> +  ports:
>>
>>        $ref: /schemas/graph.yaml#/properties/ports
> 
> OK, thanks
> 
>>
>>> +    patternProperties:
>>> +      '^port@[0-9]':
>>> +        $ref: "#/properties/port"
>>
>> Then this should be: $ref: audio-graph-port.yaml#
> 
> OK, thanks
> 
>>
>> Also, what each port is should be defined, but that's a separate 
>> problem.
>>
>>> +
>>>  # use patternProperties to avoid naming "xxx,yyy" issue
>>>  patternProperties:
>>>    "^rcar_sound,dvc$":
>>> -- 
>>> 1.8.3
>>>
>>>
>>
>> .
>>

