Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B94D2BF5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 10:29:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937B017A9;
	Wed,  9 Mar 2022 10:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937B017A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646818182;
	bh=Fs0ThjMSJZQU36NqETn2nuCDbo1mizSwp+NMB8s3xKI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQ0PPIrBqQbvhHeghEBuoxctht1HiFJ3D9Xk6CaVyesjLOPTjPpo/Xm/sn8qkyi4J
	 btGVczq17BUltdNmQgern656HFQYb/+TRyk47PG4ViWJaED67StSCjGOdoSfURLy4p
	 tAqSPrHTUvZnb6sAu8HClvB9oMbrbE691tl/e8Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30986F8028D;
	Wed,  9 Mar 2022 10:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF807F80236; Wed,  9 Mar 2022 10:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B772F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 10:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B772F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qEDhi0fD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2297dkET010366;
 Wed, 9 Mar 2022 03:28:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=cnOds1P2HYMESzPFz39oF0gCUJHlgInu9tI0YBb37ME=;
 b=qEDhi0fDzrUDTtw6O9p55Ji32CEH4LBZ03lH9Jz3DuQq31Jm7rsOWLy+nkQqSnUeFRmz
 VQgPcnQZtrPHkugyrkCpKrG+Mp5gll9U+KbxCl+qHqy2D6NoExgzNjniS8oV2UJLVz/q
 eSMH1nTgu+9fals4bIxfEerV+sMe4jgU5MKeUyS2xO1kqt/0qk+Bv0hCxcD6SlRTVPHT
 nSz/JAGslfCSt3i8dft2XmDUa00PrKEU84XioTFrF8bkil49UOFBxXUKkTdSVsJ+jP1y
 7ecQ6rg7DlT3jNOrPnn2UTxBUqfkqjqyaaF5aQKr8TxzU15q4Igulv5e5ftNPIemkN0N Ig== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3em55swdv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Mar 2022 03:28:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 09:28:38 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 9 Mar 2022 09:28:38 +0000
Received: from [198.61.65.38] (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5956546C;
 Wed,  9 Mar 2022 09:28:38 +0000 (UTC)
Message-ID: <a5fe73dc-1126-0f46-cbc0-1ab864843ea6@opensource.cirrus.com>
Date: Wed, 9 Mar 2022 09:28:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
 <20220308171730.454587-16-tanureal@opensource.cirrus.com>
 <20220309012043.GA1694603@robh.at.kernel.org>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220309012043.GA1694603@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: howsFYvVvDI4cucQBfeq_h8T-Enuu5Fn
X-Proofpoint-GUID: howsFYvVvDI4cucQBfeq_h8T-Enuu5Fn
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On 3/9/22 01:20, Rob Herring wrote:
> On Tue, Mar 08, 2022 at 05:17:29PM +0000, Lucas Tanure wrote:
>> From: David Rhodes <drhodes@opensource.cirrus.com>
>>
>> Document internal and external boost feature for ASoC CS35L41.
>> For internal boost the following properties are required:
>> - cirrus,boost-peak-milliamp
>> - cirrus,boost-ind-nanohenry
>> - cirrus,boost-cap-microfarad
>>
>> For external boost, the GPIO1 must be configured as output,
>> so the following properties are required:
>> - cirrus,gpio1-src-select = <1>
>> - cirrus,gpio1-output-enable
>>
>> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>> ---
>>   .../bindings/sound/cirrus,cs35l41.yaml        | 44 +++++++++++++++++--
>>   1 file changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
>> index 3235702ce402..09b515924c59 100644
>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
>> @@ -75,6 +75,19 @@ properties:
>>       maximum: 3
>>       default: 2
>>   
>> +  cirrus,boost-type:
>> +    description:
>> +      Configures the type of Boost being used.
>> +      Internal boost requires boost-peak-milliamp, boost-ind-nanohenry and
>> +      boost-cap-microfarad.
>> +      External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
>> +      enable boost voltage.
>> +      0 = Internal Boost
>> +      1 = External Boost
>> +    $ref: "/schemas/types.yaml#/definitions/uint32"
>> +    minimum: 0
>> +    maximum: 1
> 
> What does not present mean? Might be better to make this boolean depending
> on what you are trying to accomplish.
Not present means Internal boost. There will be other types of boost in 
the future, so I would like to keep it as is.

> 
>> +
>>     cirrus,gpio1-polarity-invert:
>>       description:
>>         Boolean which specifies whether the GPIO1
>> @@ -131,9 +144,32 @@ required:
>>     - compatible
>>     - reg
>>     - "#sound-dai-cells"
>> -  - cirrus,boost-peak-milliamp
>> -  - cirrus,boost-ind-nanohenry
>> -  - cirrus,boost-cap-microfarad
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        cirrus,boost-type:
>> +            const: 0
> 
> Note that this will be true if cirrus,boost-type is not present. You
> probably want to add 'required'.
Yes, that's expected. We want to continue to support old device trees 
without boost type, and for that case it sets to internal boost.

> 
>> +    then:
>> +      required:
>> +        - cirrus,boost-peak-milliamp
>> +        - cirrus,boost-ind-nanohenry
>> +        - cirrus,boost-cap-microfarad
>> +    else:
>> +      if:
>> +        properties:
>> +          cirrus,boost-type:
>> +            const: 1
>> +      then:
>> +        required:
>> +          - cirrus,gpio1-output-enable
>> +          - cirrus,gpio1-src-select
>> +        properties:
>> +          cirrus,boost-peak-milliamp: false
>> +          cirrus,boost-ind-nanohenry: false
>> +          cirrus,boost-cap-microfarad: false
>> +          cirrus,gpio1-src-select:
>> +            enum: [1]
>>   
>>   additionalProperties: false
>>   
>> @@ -150,6 +186,8 @@ examples:
>>             VA-supply = <&dummy_vreg>;
>>             VP-supply = <&dummy_vreg>;
>>             reset-gpios = <&gpio 110 0>;
>> +
>> +          cirrus,boost-type = <0>;
>>             cirrus,boost-peak-milliamp = <4500>;
>>             cirrus,boost-ind-nanohenry = <1000>;
>>             cirrus,boost-cap-microfarad = <15>;
>> -- 
>> 2.35.1
>>
>>

