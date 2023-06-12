Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3572CA2A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04C983E;
	Mon, 12 Jun 2023 17:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04C983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686583967;
	bh=c9+ZZVOMKaxDpHE5Ev3gh6uzOD0RQPFDozUwPZcLRCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gdUdOcH+Yr8Ug/ROcbpYPpe+iloTHfR2jxh7habaoTNlOLqiyCtRFDAGa7ltrenRI
	 6Ogfj148GEzZpTRO05f7g3f1+xkiNrdk7kVAsc6StFIi7X/uOc7NIzhnhni+5xLhG5
	 3vFULnBaasTPWofSMCZBSJS4ZAGLNZwbOPDZZFkk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DCB8F80578; Mon, 12 Jun 2023 17:31:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 160E9F80570;
	Mon, 12 Jun 2023 17:31:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B49DDF80149; Mon, 12 Jun 2023 04:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E383F800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 04:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E383F800ED
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Bx4Oh5g4ZkpWIDAA--.5425S3;
	Mon, 12 Jun 2023 10:31:21 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx+OR4g4ZkrcMUAA--.59923S3;
	Mon, 12 Jun 2023 10:31:20 +0800 (CST)
Message-ID: <78ba489e-9391-ac05-2c25-c0210f61b7ed@loongson.cn>
Date: Mon, 12 Jun 2023 10:30:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-3-mengyingkun@loongson.cn>
 <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx+OR4g4ZkrcMUAA--.59923S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAADGSFuYED8wABsl
X-Coremail-Antispam: 1Uk129KBj93XoWxZw43CF4rtF48tw18uF13KFX_yoW5Zw1xpa
	s5Ca12kFW8t3W7C3yrZ3W8Aw45X39ayanxtF42qw1UGFZ093WFgw4ak3Wj9a4Yyrn5Kay7
	Za45Wa4xGa1qyagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8
	yCJUUUUU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TFZN2HGWV5EMEEMPCPF2E56FLBGGSEYF
X-Message-ID-Hash: TFZN2HGWV5EMEEMPCPF2E56FLBGGSEYF
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:31:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFZN2HGWV5EMEEMPCPF2E56FLBGGSEYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

Thanks for your kindly work.


On 2023/6/5 22:45, Krzysztof Kozlowski wrote:
> On 05/06/2023 14:09, YingKun Meng wrote:
>> From: Yingkun Meng <mengyingkun@loongson.cn>
>>
>> The audio card uses loongson I2S controller present in 7axxx/2kxxx chips
>> to transfer audio data.
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You missed at least DT list (maybe more), so this won't be tested.
> Please resend and include all necessary entries.
>

Sorry for my mistake. Fixed in new version.

>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
>> ---
>>   .../sound/loongson,ls-audio-card.yaml         | 64 +++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>> new file mode 100644
>> index 000000000000..f1d6ee346bb3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/loongson-audio-card.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson generic ASoC audio sound card.
> What is a "generic audio card"? Does it even match hardware? Bindings
> are supposed to describe hardware, which is usually very specific.
>
> Also: Drop full stop. It's a title.
>
On loongson platform, the I2S controllers connect different codecs to
form different audio devices that can be driven by the same machine driver.
The "generic audio card" refers to these audio devices.

Currently, it can match some specific hardware, such as
2k2000 + es8323: the 2k2000 is a loogson SoC with a I2S controller
7a2000 + es8288: the 7a2000 is a bridge chip with a I2S controller


>> +
>> +maintainers:
>> +  - Yingkun Meng <mengyingkun@loongson.cn>
>> +
>> +description:
>> +  Generic ASoC audio device for loongson platform.
>> +
>> +properties:
>> +  compatible:
>> +    const: loongson,ls-audio-card
>> +
>> +  model:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: User specified audio sound card name
>> +
>> +  mclk-fs:
>> +    $ref: simple-card.yaml#/definitions/mclk-fs
>> +
>> +  cpu:
>> +    description: Holds subnode which indicates cpu dai.
>> +    type: object
>> +    additionalProperties: false
>> +    properties:
>> +      sound-dai:
>> +        maxItems: 1
> In the cpu: required with sound-dai


OK.

>> +
>> +  codec:
>> +    description: Holds subnode which indicates codec dai.
>> +    type: object
>> +    additionalProperties: false
>> +    properties:
>> +      sound-dai:
>> +        maxItems: 1
> In the codec: required with sound-dai
>
> No multiple dai links? Are you sure this card is so limited?


Yes.  The audio device has only one channel.

>
> Best regards,
> Krzysztof


Thanks,

Yingkun Meng

