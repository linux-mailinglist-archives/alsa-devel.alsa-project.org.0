Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA272E423
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06CAE85;
	Tue, 13 Jun 2023 15:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06CAE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686663062;
	bh=h0pvIfhIy8k81rsLxRRiTrTOTgnsK64w6JBgAyfvPxc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OMqpii7l+QcAeW0aOaLyQKatedVeMzP3hKdeJzPsvSg5vv39KsHQEW1WsDyLR6Eib
	 b/hDfvr/O2rB30Gi2gYxfgGJLK9uJfpsjKfga30pMnTp9Q2XBGOA72kWNbZ3tFmKlL
	 uxFHgqZklcX3dZMID5a5JTtdS/k1PQjbN6TLimig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E97F805BB; Tue, 13 Jun 2023 15:29:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C89F80132;
	Tue, 13 Jun 2023 15:29:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57C2FF80149; Tue, 13 Jun 2023 15:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id C59D7F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 15:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59D7F80093
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Cxd+k0aYhkgKYEAA--.7905S3;
	Tue, 13 Jun 2023 21:03:49 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axfco0aYhkZTEZAA--.63228S3;
	Tue, 13 Jun 2023 21:03:48 +0800 (CST)
Message-ID: <58b70e1b-d292-ec45-2309-e237a4a43d0d@loongson.cn>
Date: Tue, 13 Jun 2023 21:03:23 +0800
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
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
 <20230613-depletion-garnet-ccc2009111c3@wendy>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <20230613-depletion-garnet-ccc2009111c3@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axfco0aYhkZTEZAA--.63228S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQABDGSIXIIBbgABsQ
X-Coremail-Antispam: 1Uk129KBj93XoW7tF1kWF1DKr4DAF47uFykZwc_yoW8uw1fpF
	W8Ja47KFn5Kw15Cr9Yvw18Jr42vFWftFZxXr4DXr17G390gry3Gr13tF1Fk3srCr18X342
	vFWFka47J3Z8JagCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8XocUUU
	UU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4BTCYVBLB6YIEXWU7BKL4E36ZKL2RHYE
X-Message-ID-Hash: 4BTCYVBLB6YIEXWU7BKL4E36ZKL2RHYE
X-Mailman-Approved-At: Tue, 13 Jun 2023 13:29:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BTCYVBLB6YIEXWU7BKL4E36ZKL2RHYE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/13 20:46, Conor Dooley wrote:
> On Tue, Jun 13, 2023 at 08:38:59PM +0800, Yingkun Meng wrote:
>> On 2023/6/13 20:28, Conor Dooley wrote:
>>> On Tue, Jun 13, 2023 at 08:23:58PM +0800, Yingkun Meng wrote:
>>>> On 2023/6/13 01:24, Conor Dooley wrote:
>>>>> On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
>>>>>> From: Yingkun Meng <mengyingkun@loongson.cn>
>>>>>>
>>>>>> The audio card uses loongson I2S controller present in
>>>>>> 7axxx/2kxxx chips to transfer audio data.
>>>>>>
>>>>>> On loongson platform, the chip has only one I2S controller.
>>>>>> +description:
>>>>>> +  The binding describes the sound card present in loongson
>>>>>> +  7axxx/2kxxx platform. The sound card is an ASoC component
>>>>>> +  which uses Loongson I2S controller to transfer the audio data.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: loongson,ls-audio-card
>>>>> Reviewing sound stuff is beyond my pay grade, so forgive me if I am off
>>>>> the rails here, but this (and the "x"s in the description) look a bit
>>>>> odd. Recently, we've noticed quite a few loongson dt-bindings attempting
>>>>> to use a single compatible for many different chips.
>>>>> Usually you have individual compatibles for the various SoCs with this
>>>>> core, which can fall back to a generic one, rather than just adding a
>>>>> generic compatible for all devices.
>>>>> As far as I know, there's several SoCs fitting 2kxxx, and the format
>>>>> being used elsewhere is "loongson,ls2k1000" etc.
>>>> Currently, Loongson has 2K0500/2K1000LA/2K1500/2K2000 chips.
>>>>
>>>> Here, its' possible to use a single compatible for different chips,
>>>>
>>>> as the audio device is a logical device, not dependent on chip model.
>>> What, may I ask, is a "logical device"?
>>
>> I means it's not a physical one, like "platform bus".
> So it is entirely a software construct? Why does it need a dt-binding
> then? Your commit message says the controller is present on the device!

It's not. The audio device consists of an i2s controller and codec.

The dt-binding is for the audio device, not for i2s controller.

> Confused,
> Conor.

