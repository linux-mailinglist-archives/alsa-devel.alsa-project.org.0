Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8134F69D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 04:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BFF81681;
	Wed, 31 Mar 2021 04:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BFF81681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617157655;
	bh=yrijpe3I5JUEisDcMIAo+GnengBiqYL+0RKgwu1vpYA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EkuotDcTuJW2WR3Nzo9ppe4y3rFxAa381Kk2D4ALAY3+r5pipGIxPyC/tI2huhL7e
	 LMis3Z/cOKEJg7QYtyJmI+aaP/Co29Ibs5h2k/hyfbXbVEU7A6UbWbcGzLfEJuQYwm
	 VNfw41UGr7cxTaJvpesIVho/EMFxx27caqvzptUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ED3AF8013F;
	Wed, 31 Mar 2021 04:26:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7FC0F80166; Wed, 31 Mar 2021 04:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16998F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 04:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16998F8014E
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F999P4n6Hz1BFdn;
 Wed, 31 Mar 2021 10:23:53 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 31 Mar 2021 10:25:52 +0800
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'dais' is a required property
To: Rob Herring <robh@kernel.org>
References: <20210330030631.2253-1-thunder.leizhen@huawei.com>
 <20210330030631.2253-2-thunder.leizhen@huawei.com>
 <20210330224551.GA842101@robh.at.kernel.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2460067e-5358-3e00-0a06-010b2a3736fb@huawei.com>
Date: Wed, 31 Mar 2021 10:25:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210330224551.GA842101@robh.at.kernel.org>
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



On 2021/3/31 6:45, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 11:06:30AM +0800, Zhen Lei wrote:
>> When I do dt_binding_check, below warning is reported:
>> Documentation/devicetree/bindings/sound/renesas,rsnd.example.dt.yaml: \
>> sound@ec500000: 'dais' is a required property
>>
>> I looked at all the dts files in the "arch/arm64/boot/dts/renesas/"
>> directory, I found that all nodes that contain the "dais" property have
>> compatible string: "audio-graph-card". So I can be sure that the
>> "$ref: audio-graph.yaml#" should be corrected to
>> "$ref: audio-graph-card.yaml#".
>>
>> In addition, not all nodes have compatible string "audio-graph-card", so
>> the "$ref: audio-graph-card.yaml#" should be described as "anyOf". To
>> ensure the validation of "anyOf" always passes, group it with the "if"
>> statement, because the result of the "if" statement is always not empty.
> 
> 'anyOf' is probably not right here.

Oh, yes, I think I should use "if" statement to enumerate cases where
"audio-graph-card.yaml" is required.

> 
> In any case, the is going to conflict with my series[1].

OK, I'll rework my patch based on your series.

> 
> Rob
> 
> [1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
> 
> .
> 

