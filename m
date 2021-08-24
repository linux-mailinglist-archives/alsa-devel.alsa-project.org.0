Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE73F55F4
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 04:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F28886F;
	Tue, 24 Aug 2021 04:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F28886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629773389;
	bh=0/Erl36zjc/Eoq2PwDLGiOmiBIDg7jsNBWg4Icw2BVo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b+teY/HY/MBB1qoHzL1bsWiogn0k4vHnAvW5s29K41vJlY2n4oW/cV+lGAO4MfrL8
	 y5+8UOvDPzR+4J+9SUrDtl+Omt0tW2F/zCxiJKG/AVU8QDxjZ/ssrJ4+TOnDXp5kRl
	 aDOm9mY53mAKfREBfLtvk25k//wMZ6KEczyAqJ8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58407F80224;
	Tue, 24 Aug 2021 04:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C14F1F801D8; Tue, 24 Aug 2021 04:48:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49A30F800AE
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 04:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A30F800AE
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id EE3B6808;
 Tue, 24 Aug 2021 10:48:08 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.19] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32762T139760316184320S1629773288152537_; 
 Tue, 24 Aug 2021 10:48:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d93d28eb9fc7cd6118c5e0f95ce892d3>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: alsa-devel@alsa-project.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_15/15=5d_ASoC=3a_dt-bindings=3a_rockchip?=
 =?UTF-8?B?OiBpMnM6IERvY3VtZW50IHByb3BlcnR5ICdjbGstdHJjbSfjgJDor7fms6jmhI8=?=
 =?UTF-8?B?77yM6YKu5Lu255Sxcm9iaGVycmluZzJAZ21haWwuY29t5Luj5Y+R44CR?=
To: Rob Herring <robh@kernel.org>
References: <1629715710-21137-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629716132-21544-1-git-send-email-sugar.zhang@rock-chips.com>
 <YSPckWacS4kk270r@robh.at.kernel.org>
From: sugar zhang <sugar.zhang@rock-chips.com>
Message-ID: <068b1fdc-3f93-6bcd-247b-95e68e1ba8e7@rock-chips.com>
Date: Tue, 24 Aug 2021 10:48:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSPckWacS4kk270r@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org
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


On 2021/8/24 1:36, Rob Herring wrote:
> On Mon, Aug 23, 2021 at 06:55:32PM +0800, Sugar Zhang wrote:
>> This patch documents property 'rockchip,clk-trcm' which is used
>> to specify the lrck.
>>
>> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
>> Change-Id: I648142c57c568bbed209f2b9188b1f539a3285b2
> Drop this.
okay, will do in v2.
>> ---
>>   Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
>> index 11e911a..8d9dfed 100644
>> --- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
>> +++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
>> @@ -72,6 +72,15 @@ properties:
>>     resets:
>>       maxItems: 2
>>   
>> +  rockchip,clk-trcm:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 0
>> +    description:
>> +      tx and rx lrck/bclk common use.
>> +      0: both tx_lrck/bclk and rx_lrck/bclk are used
>> +      1: only tx_lrck/bclk is used
>> +      2: only rx_lrck/bclk is used
> Sounds like constraints. Make a schema.
will split into two properties: rockchip,trcm-sync-tx-only, 
rockchip,trcm-sync-rx-only.
>> +
>>     rockchip,capture-channels:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       default: 2
>> -- 
>> 2.7.4
>>
>>
>>
>>
>
>
-- 
Best Regards!
张学广/Sugar
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.



