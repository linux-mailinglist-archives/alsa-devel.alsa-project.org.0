Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE8A4ADE37
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 17:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4504D169D;
	Tue,  8 Feb 2022 17:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4504D169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644337375;
	bh=7J8reoIsbqXpMOmW6ZAV4xdRcyCXHWmix9vNtWHkC4Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hf1lgQV6KAD+9Ru1P6v3qwPj1GygkowaKrRYJEMAJn6JxDrmqqqAvnubpJnqsPwxw
	 dDyQzenU0ERDy2l2VF5mVhHIbaWU8eUJvi6AX/GyH6o+b6AXsApuQFPNexSVdyj77i
	 808ZNFxdILpi8DYLP4BzA9hmXVM+33fBL9w3naYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC91F800EB;
	Tue,  8 Feb 2022 17:21:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4344F800EB; Tue,  8 Feb 2022 17:21:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 276B1F800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 17:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276B1F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GpDKsn9r"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 218GLaqt094798;
 Tue, 8 Feb 2022 10:21:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644337296;
 bh=pUuWQr+L14zdI+Vc3J1KTPWgbWU9dWvEhXxZKxw3cCk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=GpDKsn9r44cfaqqMWKNvTVOHoo3C3VZt8oW0UDJ2JEBWbPRyZ1TR2HJO5SBr6FAnV
 EX5QzWSZdUuaP/HrM7XA4PQX5Ry1D26Ch9V1cs2wpBjtZ6UdnwoYzzAqVlPV4IFBoW
 Z7CS7ifGsDiyPmlwXT/LNnTr2hAC/ipthtcHSF8U=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 218GLa2k116010
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Feb 2022 10:21:36 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Feb 2022 10:20:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Feb 2022 10:20:24 -0600
Received: from [10.250.233.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 218GKLAD068450;
 Tue, 8 Feb 2022 10:20:22 -0600
Message-ID: <93916792-67f6-9018-e93b-4bdc8987af20@ti.com>
Date: Tue, 8 Feb 2022 21:50:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 <robh+dt@kernel.org>
References: <20220103074427.4233-1-j-choudhary@ti.com>
 <2cf3c89c-169f-3421-25d4-c80a6c9737ae@gmail.com>
 <83c51ee4-ac10-0e44-d1cc-f69cebcbf0b8@gmail.com>
 <f2bf4959-af15-04ad-78c3-aca883173d65@ti.com>
 <609b03e1-66e0-9bfd-cbe1-810d816df659@gmail.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <609b03e1-66e0-9bfd-cbe1-810d816df659@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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



On 29/01/22 01:48, Péter Ujfalusi wrote:
> 
> On 1/17/22 12:07, Jayesh Choudhary wrote:
> 
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - ti,dm646x-mcasp-audio
>>>>> +      - ti,da830-mcasp-audio
>>>>> +      - ti,am33xx-mcasp-audio
>>>>> +      - ti,dra7-mcasp-audio
>>>>> +      - ti,omap4-mcasp-audio
>>>
>>> This is the only thing which bugs me: the pointless '-audio' postfix for
>>> the compatible string...
>>>
>>
>> Removing the postfix would also require a lot of dts changes which might
>> be backward incompatible. So it is probably not a good idea.
> 
> My plan was to not convert the ti,*-mcasp-audio txt file to yaml in the
> first place, but do it right with as ti,*-mcasp
> 
> One of the outstanding issue is the multiple serializer support. It
> should be in core as things are just working by luck atm when more than
> one serializer is in use (via the card node).
> 
>> Should we still consider this?
> 
> Since we are officially documenting the -mcasp-audio, I don't think it
> would be a good idea to introduce different binding for the very same IP
> just for the sake of it.
> 
> The new (and imho correct) binding would require quite a bit of work in
> the driver and in the core level (plus the simple-card family), but I'm
> afraid, I will not have time for it.
> 

Peter,

I think all the new changes can be picked up later on.
For now, to support the current device tree and binding, I am posting a
v6 patch with 'acked-by' and 'reviewed-by' so that they are not lost in
this thread and this patch could be merged.
