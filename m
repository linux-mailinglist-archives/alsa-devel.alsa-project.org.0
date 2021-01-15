Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8B2F76CA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 11:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D0E17A4;
	Fri, 15 Jan 2021 11:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D0E17A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610707030;
	bh=0Oa4lUUsm0IaNdRLtmw3BworrGoOtUPc0YfVkqwD7xc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfnSV9pjP9qHDpAI/s0cvXV6eul0xdw1KxpC1g8ub8IH+Q0L6b+sKmW9kbex9mDd/
	 gkwlZqKvcORv64bOgJXtPTS9mRMqUXG8gZ1JQPdHnOUJG9h9XKAsHOsGOq0RMFBFdo
	 9jUW4JUkivhDdtMLMRVwBJxli3X9Z8VdfwFX7eMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C3FF80254;
	Fri, 15 Jan 2021 11:35:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFFCF801ED; Fri, 15 Jan 2021 11:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D12C5F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 11:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12C5F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pVCP/0Kn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FAWmHZ026898; Fri, 15 Jan 2021 04:35:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=LD+LiuwpWXTb1D5hCBKo7VpoiE2Ui0ocmHD3tcAefJc=;
 b=pVCP/0Kn6scEb6JF03auF0HVcxZ9dSUIjyQQz6HD/fCr/4xaiVxvqTeaykXMpo3s3K2d
 2dyCsSW3bEqQk3X9CzSqLpY+vIrLVkBsmw478dK/88QrPfD+jb47NAi6YTzJeJwdqQJt
 Xcwn24q1DOHffZPUsmrBsofU/tkmRfh8laM5pUWaHIpijNu2sUm7ehcXkBEgaejrB0eD
 hmCdIobPSkr1lZDFJbJUIviVrrTXKIWxVki2K8JiMhJhLHrx6rPhwwMNQBnEgf+xro76
 F1Ljzl8rCIYk5+n7wBvDeDBT5uvfCzUtT/ExL4no1LBG99CtrkCQu07QjsAQi4Hne6O0 ow== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35y9sryh9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Jan 2021 04:35:25 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 15 Jan
 2021 10:35:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 15 Jan 2021 10:35:23 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.57])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A48445;
 Fri, 15 Jan 2021 10:35:23 +0000 (UTC)
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
 <20210113152225.GA2334778@robh.at.kernel.org>
 <20210113160917.GF4641@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <ee3d0b75-dc2f-9994-19a4-a3c3f21a2c65@opensource.cirrus.com>
Date: Fri, 15 Jan 2021 10:35:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113160917.GF4641@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150063
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 kuninori.morimoto.gx@renesas.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, nsaenzjulienne@suse.de
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

On 13/01/2021 16:09, Mark Brown wrote:
> On Wed, Jan 13, 2021 at 09:22:25AM -0600, Rob Herring wrote:
> 
>> I'm not sure this makes sense to be generic, but if so, we already have
>> the clock binding and should use (and possibly extend) that.
> 
>> This appears to all be configuration of clocks within the codec, so
>> these properties belong in the codec or cpu nodes.
> 
> Right, I think this should just be the clock binding.
> 

Ok, so if the idea is to do this:

sound {
	clocks = <&audio_mclk>, <&pll>;
	clock-names = "mclk", "pll";
}

some_codec {
	pll: pll {
		compatible = "fixed-clock";
		clocks = <&audio_mclk>;
		clock-frequency = <98304000>;
	}
};

For this to work the clock binding must be a real clock object (so needs
a valid compatible=). But I need to somehow specify the PLL ID and
source pin for the PLL configuration. The schema for "fixed-clock" has
"additionalProperties: false" so I can't add extra custom properties to
the clock node.

Of course if we were able to use the clock framework to provide real
clock drivers for the plls and sysclks, the ID would be inherent in
the binding, and it can define a custom property for the source pin.

Some options:

1) Remove "additionalProperties: false" from the "fixed-clock" binding.

2) Add new core clock properties. Well, source-pin might legitimately be
meaningful, but for a real clock provider the clock ID is implicit.

3) Use 'reg' as fixed-clock doesn't use it. This works, but I suspect it
will be seen as an abuse of reg.

4) Put some extra properties in the sound node to define the <id,source>
pair for each clock. But that's clumsy to have some of the config in a
clock binding and a couple of extra elsewhere.

5) Use a bare clock binding that isn't a real clock provider, like:

sound {
	plls = <&pll>;
}

some_codec {
	pll: pll {
		reg = <1>; /* PLL ID */
	 	audio-graph-card,source-pin = <4>;
		clocks = <&audio_mclk>;
		clock-frequency = <98304000>;
		
	}
};


>>> +      The PLL id and clock source id are specific to the particular component
>>> +      so see the relevant component driver for the ids. Typically the
> 
> This should refer to the bindings for components, not to their drivers.
> 
>>> +      clock source id indicates the pin the source clock is connected to.
>>> +      The same phandle can appear in multiple entries so that several plls
>>> +      can be set in the same component.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +
>>> +  plls-clocks:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description: |
>>> +      A list of clock names giving the source clock for each setting
>>> +      in the plls property.
>>> +
>>> +  sysclks:
>>> +    description: |
>>> +      A list of component sysclk settings. There are 4 cells per sysclk
>>> +      setting:
>>> +        - phandle to the node of the codec or cpu component,
>>> +        - component sysclk id,
>>> +        - component clock source id,
>>> +        - direction of the clock: 0 if the clock is an input to the component,
>>> +          1 if it is an output.
>>
>> A clock provider and consumer would provide the direction.
>>
>>> +      The sysclk id and clock source id are specific to the particular
>>> +      component so see the relevant component driver for the ids. Typically
>>> +      the clock source id indicates the pin the source clock is connected to.
>>> +      The same phandle can appear in multiple entries so that several sysclks
>>> +      can be set in the same component.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +
>>> +  sysclks-clocks:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description: |
>>> +      A list of clock names giving the source clock for each setting
>>> +      in the sysclks property.
>>> +
>>> +dependencies:
>>> +  plls: [ plls-clocks ]
>>> +  sysclks: [ sysclks-clocks ]
>>> +
>>>   required:
>>>     - dais
>>>   
>>> -- 
>>> 2.20.1
>>>
