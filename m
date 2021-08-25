Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B506C3F71BE
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 11:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3006A1679;
	Wed, 25 Aug 2021 11:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3006A1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629883946;
	bh=orM08rGmb9EVe69OFqmYqyiVp+9TyGr75kwvrToy774=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mABW3dQJStIqRCU1t16dFQFGTautG0cXCBO3gMQ34o8Im/bHFfUlI86dGHH7t9lIe
	 QU8kqcSDv5IFYcOeXClnKp6XOUBlGgizglUJMZW4em0N+rscBtXvW4ZxONXPH3LcTS
	 nWowpL74QwjZcHj6yq2zlct1+Z25EkNdoLQN2Ssg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884DEF8020D;
	Wed, 25 Aug 2021 11:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22295F8003C; Wed, 25 Aug 2021 11:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CE6AF8003C
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 11:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CE6AF8003C
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 70121A13;
 Wed, 25 Aug 2021 17:30:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.19] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P4269T140595525805824S1629883826350068_; 
 Wed, 25 Aug 2021 17:30:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1de1da1e743f70d276baa9b3dbdfbda5>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: alsa-devel@alsa-project.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_10/15=5d_ASoC=3a_dt-bindings=3a_rockchi?=
 =?UTF-8?Q?p=3a_i2s=3a_Document_property_for_playback/capture=e3=80=90?=
 =?UTF-8?B?6K+35rOo5oSP77yM6YKu5Lu255Sxcm9iaGVycmluZzJAZ21haWwuY29t5Luj5Y+R?=
 =?UTF-8?B?44CR?=
To: Rob Herring <robh@kernel.org>
References: <1629796561-4025-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629796682-4170-5-git-send-email-sugar.zhang@rock-chips.com>
 <YSUnL4xISXIPLdRv@robh.at.kernel.org>
From: sugar zhang <sugar.zhang@rock-chips.com>
Message-ID: <eceed26d-6d29-17b7-2996-5fe479676a83@rock-chips.com>
Date: Wed, 25 Aug 2021 17:30:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSUnL4xISXIPLdRv@robh.at.kernel.org>
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

Hi Rob,

On 2021/8/25 1:06, Rob Herring wrote:
> On Tue, Aug 24, 2021 at 05:17:57PM +0800, Sugar Zhang wrote:
>> This patch documents property for playback-only and capture-only.
>>
>> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
>> ---
>>
>> Changes in v2: None
>>
>>   Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
>> index 9f9cc48..005b6e6 100644
>> --- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
>> +++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
>> @@ -81,6 +81,16 @@ properties:
>>       description:
>>         Max playback channels, if not set, 8 channels default.
>>   
>> +  rockchip,capture-only:
>> +    type: boolean
>> +    description:
>> +      Specify that the controller has capture only capability.
>> +
>> +  rockchip,playback-only:
>> +    type: boolean
>> +    description:
>> +      Specify that the controller has playback only capability.
> In the Rockchip TDM-I2S binding[1], these were dropped. Perhaps comment
> there why they are needed.

It was used to specify the controller capatiblity, some controller has 
capture or playback only.

maybe we can implement it by judge property 'dma-names'.  such as:

of_property_for_each_string(np, "dma-names", dma_names, name)

if (!strcmp(name, "tx"))

     has capture capability...

if (!strcmp(name, "rx"))

     has capture capability...

will do in v3.

>
> Rob
>
> [1] https://lore.kernel.org/lkml/20210820182731.29370-1-frattaroli.nicolas@gmail.com/
>
>
>
-- 
Best Regards!
张学广/Sugar
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.



