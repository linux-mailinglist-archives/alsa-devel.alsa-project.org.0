Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283122B8E6F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 10:13:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54D31704;
	Thu, 19 Nov 2020 10:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54D31704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605777185;
	bh=xvHMyTUN4hXE0Vp8Id7WlQZmZA2LVUdJOOLo/OZvUWc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L86SlnsxxDCWjmzDfhHe0ps6SMNcqh67G2HQhT6qDAcFtOjZUvsjVJgeHtwQuDY1F
	 v8ek0rDj8hRIOgC7oSN2h5iZm/vM3FyCnc64le1LfXCYKLXW6UyIizsQ3+8FYgD4sc
	 Q+PLIKAyOKexfeUtdywCPQNCvQ6+sOMyC6/zYDiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB9B2F801F5;
	Thu, 19 Nov 2020 10:11:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03CA5F801ED; Thu, 19 Nov 2020 10:10:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9349EF800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 10:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9349EF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LCPMoJEa"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb636760002>; Thu, 19 Nov 2020 01:10:14 -0800
Received: from [10.25.102.126] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 09:10:20 +0000
Subject: Re: [PATCH v5 1/6] ASoC: dt-bindings: tegra: Add graph bindings
To: Rob Herring <robh@kernel.org>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
 <1605119676-32273-2-git-send-email-spujar@nvidia.com>
 <20201112143855.GA3553055@bogus>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <bfac9d56-7cb5-6c75-6f1b-48f8ab43fa1c@nvidia.com>
Date: Thu, 19 Nov 2020 14:40:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112143855.GA3553055@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605777014; bh=utlwG7nu71X3qIUCNZ88e7I6oHNRaiQbemkseQHnGtM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=LCPMoJEay/B07UbKTKJ7s0fDXmJl0skB1I4MjEijOeUVHpdnQXbgAi4stdGZJG2zR
 uMG8K5NwzXuBeIoZx6nMmfbp5vbNhsQuqxG7nLh04LLJFOb6e3yyDBVfZgXjrIjCu0
 Iq66N5LIyX4aFoj1GyvG65kMYL5wFiaBkWezf+c0+WK+X3cDralim8KETTze1X0//+
 yc1M1U9hxk8J3AeKj+/lmXp5pjIFKWy5Xq1cZeM1XREtZtRgjzXWW25VFQDhCPmzX1
 A3TqPg/kc0iGNGR1fjs5BefmJiXBnhmaWj0KxM6MWAUb98KvgVvZPdC7PKbmSzChU6
 bd9svJgRQNtQA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

>> Add device tree binding properties of generic graph to ASoC component
>> devices. This allows to define audio ports out of these components or
>> DAIs and audio graph based sound card can be realised with this.
> This is all dependent on graph.yaml being applied which hasn't happened
> yet. I guess I'll need to provide a branch as there's multiple
> subsystems needing it.
>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml     |  6 ++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml   |  6 ++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 13 +++++++++++--
>>   .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml     |  6 ++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      |  6 ++++++
>>   5 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> index ed2fb32..3c9364d 100644
>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> @@ -55,6 +55,12 @@ properties:
>>         The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>>         available instances on a Tegra SoC.

>>
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> If you have 'ports', then that means you have multiple ports and you
> have to enumerate what each port is.
>
>> +
>> +  port:
>> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> If you only have 1 port then, you can use 'port'.
>
>
> So listing both is an error.

Since "ASoC: graph card schema rework" series is merged now, referencing 
"audio-graph-port.yaml" should be sufficient here?

...
