Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEE72E421
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:30:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9DFE12;
	Tue, 13 Jun 2023 15:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9DFE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686663050;
	bh=2NmbXsBuDmGEfrvDWU/BoLX/yRmbLKx0kk1xwWwrynk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GtbnjB5Blv+Ugb9MbokLUZ1kGME3WVZ/oFmVdr/FR9BHMLIRUEFFyPQctNd5h0yGw
	 rs4CkV9Vo6EpjFZPUQQ5ICmK0PZYTarFB7UGpVQKpd7OQKz3EZ38qAk+LfLTClr+aE
	 Xj0+ODQC1RRVFfXMnhXnSEecstExya8bR2yb4hk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D1AF8057F; Tue, 13 Jun 2023 15:29:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B61F8057F;
	Tue, 13 Jun 2023 15:29:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8503AF80149; Tue, 13 Jun 2023 14:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F62EF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 14:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F62EF80093
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Cx_ep9Y4hkiKQEAA--.10048S3;
	Tue, 13 Jun 2023 20:39:25 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxFOR8Y4hkTigZAA--.6345S3;
	Tue, 13 Jun 2023 20:39:24 +0800 (CST)
Message-ID: <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
Date: Tue, 13 Jun 2023 20:38:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <20230613-zoologist-panorama-a87858bba075@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxFOR8Y4hkTigZAA--.6345S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQABDGSIXIIARQADs4
X-Coremail-Antispam: 1Uk129KBj93XoWxZrW3Zw1UAr4DZF4xJw15Jrc_yoW5WFWkpF
	WrCa47KF4xtw17Cr9Iv3WfJr4avrWftanrXr42qw1UCr98tFy3Ww42yF15uF92yr18JrW2
	vFyFk3WxG3Z8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QLSFOCQQUTCEJ7S3IONXCYSTA7VLCOMB
X-Message-ID-Hash: QLSFOCQQUTCEJ7S3IONXCYSTA7VLCOMB
X-Mailman-Approved-At: Tue, 13 Jun 2023 13:29:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLSFOCQQUTCEJ7S3IONXCYSTA7VLCOMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/13 20:28, Conor Dooley wrote:
> On Tue, Jun 13, 2023 at 08:23:58PM +0800, Yingkun Meng wrote:
>> On 2023/6/13 01:24, Conor Dooley wrote:
>>> Hey!
>>>
>>> On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
>>>> From: Yingkun Meng <mengyingkun@loongson.cn>
>>>>
>>>> The audio card uses loongson I2S controller present in
>>>> 7axxx/2kxxx chips to transfer audio data.
>>>>
>>>> On loongson platform, the chip has only one I2S controller.
>>>>
>>>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
>>> I got 2 copies of this patch, but none of the rest of the series appears
>>> to be threaded with it.
>>>
>>>>    .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
>>>>    1 file changed, 70 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>>>> new file mode 100644
>>>> index 000000000000..61e8babed402
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>>>> @@ -0,0 +1,70 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
>>>> +
>>>> +maintainers:
>>>> +  - Yingkun Meng <mengyingkun@loongson.cn>
>>>> +
>>>> +description:
>>>> +  The binding describes the sound card present in loongson
>>>> +  7axxx/2kxxx platform. The sound card is an ASoC component
>>>> +  which uses Loongson I2S controller to transfer the audio data.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: loongson,ls-audio-card
>>> Reviewing sound stuff is beyond my pay grade, so forgive me if I am off
>>> the rails here, but this (and the "x"s in the description) look a bit
>>> odd. Recently, we've noticed quite a few loongson dt-bindings attempting
>>> to use a single compatible for many different chips.
>>> Usually you have individual compatibles for the various SoCs with this
>>> core, which can fall back to a generic one, rather than just adding a
>>> generic compatible for all devices.
>>> As far as I know, there's several SoCs fitting 2kxxx, and the format
>>> being used elsewhere is "loongson,ls2k1000" etc.
>>
>> Currently, Loongson has 2K0500/2K1000LA/2K1500/2K2000 chips.
>>
>> Here, its' possible to use a single compatible for different chips,
>>
>> as the audio device is a logical device, not dependent on chip model.
> What, may I ask, is a "logical device"?


I means it's not a physical one, like "platform bus".

