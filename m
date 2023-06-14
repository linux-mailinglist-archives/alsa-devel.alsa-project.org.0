Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914072FE46
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 14:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A7B827;
	Wed, 14 Jun 2023 14:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A7B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686745088;
	bh=v27Rw9DPGIfi1ukWJXTso9FKGJiLdugUyTroISQrf0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oBIK7oAQPofU01EwE5qWLt5KZirqW/TAhVFtYF3WNHBzoXl8fGLspT54rOFEN1gVf
	 wxi826RRNXbg5lEL+F6XSl/9Ob0xL6da8QU+mVbotfVXqVvd69yx9CPSZnRRVD9uqd
	 tTPHihvab7YN3FE1dUxull7Y75ptfKJdkz13GGYk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75504F8059F; Wed, 14 Jun 2023 14:16:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B53CCF80533;
	Wed, 14 Jun 2023 14:16:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 352C2F80149; Wed, 14 Jun 2023 11:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id F03DFF800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 11:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F03DFF800BA
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8AxX+u0h4lkvxEFAA--.10772S3;
	Wed, 14 Jun 2023 17:26:12 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxJeSzh4lkDnEaAA--.10205S3;
	Wed, 14 Jun 2023 17:26:11 +0800 (CST)
Message-ID: <75be5e57-28a7-bf3f-8b2e-a0183e54e25c@loongson.cn>
Date: Wed, 14 Jun 2023 17:25:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612090058.3039546-1-mengyingkun@loongson.cn>
 <4f1c934c-5a68-a2cd-10d1-568d61865755@linaro.org>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <4f1c934c-5a68-a2cd-10d1-568d61865755@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxJeSzh4lkDnEaAA--.10205S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQACDGSIXIIX-wABsU
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr4xAryDCrW3WrW3AF48Zrc_yoW8CrWrpF
	s7CasrKFWxt3W7u39I9FyfJr45Z39ayanxJF42qw1UGF98K3Wru3yayF1UZanIyr1rGFW7
	ZFyF9w48GFn0yacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDG
	UUUUU
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FI623WN35IK63Z2NOSIRPHCQOO2QEGJV
X-Message-ID-Hash: FI623WN35IK63Z2NOSIRPHCQOO2QEGJV
X-Mailman-Approved-At: Wed, 14 Jun 2023 12:16:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FI623WN35IK63Z2NOSIRPHCQOO2QEGJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/13 16:36, Krzysztof Kozlowski wrote:
> On 12/06/2023 11:00, YingKun Meng wrote:
>> From: Yingkun Meng <mengyingkun@loongson.cn>
>>
>> The audio card uses loongson I2S controller present in
>> 7axxx/2kxxx chips to transfer audio data.
>>
>> On loongson platform, the chip has only one I2S controller.
>>
>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
>> ---
>>   .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>> new file mode 100644
>> index 000000000000..61e8babed402
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
>> +
>> +maintainers:
>> +  - Yingkun Meng <mengyingkun@loongson.cn>
>> +
>> +description:
>> +  The binding describes the sound card present in loongson
>> +  7axxx/2kxxx platform. The sound card is an ASoC component
>> +  which uses Loongson I2S controller to transfer the audio data.
>> +
>> +properties:
>> +  compatible:
>> +    const: loongson,ls-audio-card
> Generic compatible does not allow you to add any quirks or differences
> if one board is a bit different.
>

Yeah, i know. It's okay to use a generic compatible.

>
> Best regards,
> Krzysztof


Thanks,

Yingkun

