Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982F92985A8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 03:51:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235901704;
	Mon, 26 Oct 2020 03:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235901704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603680713;
	bh=O8lQDkG39v01fF/PFS/IiVu2LfD5QFrqkKGKbIKWN+s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uMBrGaolaNF5VoJ0LGHD/tt38JmnNZiLpDPm3QthVKAZqYjhD+LlO+2pAZu4u3X9h
	 LcjriDjFwgVOMnpLYRKCVQllmYc8Mrsgxb4w8LGWXkSv2rjGFU74p+cwnUDmDsPqhJ
	 Ge5ew8OE9FiGIWC+mdFCK+1aZAlPdC19Y5msp210=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2C7F80249;
	Mon, 26 Oct 2020 03:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393BFF80212; Mon, 26 Oct 2020 03:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35311F801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 03:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35311F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LI+KaAzR"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9639660000>; Sun, 25 Oct 2020 19:50:14 -0700
Received: from [10.25.99.37] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 02:50:03 +0000
Subject: Re: [PATCH v3 1/3] ASoC: dt-bindings: audio-graph-card: switch to
 yaml base Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87a6wfay7t.wl-kuninori.morimoto.gx@renesas.com>
 <878sbzay6u.wl-kuninori.morimoto.gx@renesas.com>
 <92de1324-7845-a0ee-7962-aa297c0dced7@nvidia.com>
 <873621lxhv.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <963ea81c-f1c4-580c-f336-f9e5a98d2cae@nvidia.com>
Date: Mon, 26 Oct 2020 08:19:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <873621lxhv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603680614; bh=zKZTot2/ISiwJLh0SmshmGOmB4SjDhX7s9gyIaaFHZ0=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=LI+KaAzR+A9nwBZJEvTdpkXPO26bpAG410S9xa4ubSnpVtDE5Aqx7PqIrzGF0MK0G
 pexAiCnW48FFvJiDmQHW7iQW8SKSVr7aeMquEoRQGgsWsiRyEHF7IvajjEZ6h5h2Fu
 Kjkfmv01hlU7Fn3YkRZRO1eHRddU5Y4f3fEcVlIHnKIw378WnN+48gd/riKRoQ1+Vv
 lEKvLSGXxxBabiQOO8xpX7LY03jzw7rZFe7VKSYu4sg6ojepfl8UOdVPkgStbFdUlf
 Z1+z8aQiCUDDDN9m9Z8WEYpPrkQixAwBC8uUTjS9nF0LMtvrDxnYP5QmEBT4q3+ayy
 E7iljS8VPfK+A==
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org
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

Hi Morimoto-san,

>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> This patch switches from .txt base to .yaml base Document.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>    .../bindings/sound/audio-graph-card.txt       | 337 ------------------
>>>    .../bindings/sound/audio-graph-card.yaml      | 165 +++++++++
>>>    .../devicetree/bindings/vendor-prefixes.yaml  |   2 +-
>>>    3 files changed, 166 insertions(+), 338 deletions(-)
>>>    delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
>>>    create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml
>> ...
>>
>>> +
>>> +  port:
>>> +    description: single OF-Graph subnode
>>> +    type: object
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 1
>>> +      prefix:
>>> +        description: "device name prefix"
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +      convert-rate:
>>> +        description: CPU to Codec rate convert.
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +      convert-channels:
>>> +        description: CPU to Codec rate channels.
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +    patternProperties:
>>> +      "^endpoint(@[0-9a-f]+)?":
>>> +        $ref: "#/properties/endpoint"
>>> +
>>> +  ports:
>>> +    description: multi OF-Graph subnode
>>> +    type: object
>>> +    patternProperties:
>>> +      "^port(@[0-9a-f]+)?":
>>> +        $ref: "#/properties/port"
>>> +
>> Can these be referenced from graph.yaml (port and ports properties)
>> and only additonal properties (specific to audio-graph) could be
>> populated here?
> Yes of course.
> In such case, I need to wait graph.yaml first I think.

Yes we first need to add graph.yaml, which I started to add in series 
https://lkml.org/lkml/2020/10/16/645
Since there is cyclic dependency between your patch and my series, I 
could probably pull out graph.yaml out of my series and independently 
submit that first.
