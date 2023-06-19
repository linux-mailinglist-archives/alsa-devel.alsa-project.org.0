Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11473828C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C61836;
	Wed, 21 Jun 2023 14:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C61836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687348930;
	bh=4nZAUJpuw54IxEET1Chgwp2wAZspz5jwEiSMbWB8XlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gqV+052mHfO22eA2fvcWgJZT1uFD28lU77KWPmf25KXHaTISOkyAs8VgmfxSR8eFK
	 nNg0HJQpGkFL0TxScaLVp2IxtCxOwnz0IYIC+7LttuPzVNqJRRki22OVCQuucRqZZs
	 iauAiXdvSVSatPnsSPj7211aTuP0rm1UmSkH2Q5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6051BF805D4; Wed, 21 Jun 2023 13:59:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 733E7F805C7;
	Wed, 21 Jun 2023 13:59:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334D5F80217; Mon, 19 Jun 2023 09:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 4464DF800BA
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 09:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4464DF800BA
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8AxX+uQCJBkqsgGAA--.14030S3;
	Mon, 19 Jun 2023 15:49:37 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax6OSPCJBk5P8fAA--.24411S3;
	Mon, 19 Jun 2023 15:49:35 +0800 (CST)
Message-ID: <ae880c97-e38d-0f01-f349-a427ab4afd41@loongson.cn>
Date: Mon, 19 Jun 2023 15:49:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] ASoC: Add support for Loongson I2S controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, broonie@kernel.org,
 lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
 Dan Carpenter <dan.carpenter@linaro.org>, Dan Carpenter <error27@gmail.com>,
 kernel-janitors@vger.kernel.org
References: <20230615122718.3412942-1-mengyingkun@loongson.cn>
 <cf2f3bc9-3141-8d7b-b57d-73eac70a21d2@oracle.com>
 <6901166d-387f-24de-6ffd-1c8eea724718@oracle.com>
 <325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn>
 <bd4da934-72b7-67f3-0c9c-c18d3af16e7d@linaro.org>
Content-Language: en-US
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <bd4da934-72b7-67f3-0c9c-c18d3af16e7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax6OSPCJBk5P8fAA--.24411S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAHDGSO9AIDRgAHsU
X-Coremail-Antispam: 1Uk129KBj9xXoW7JrW5Ww15CrWUJF13Ar1rZrc_yoWkGFg_Xw
	4q9wn8XFyUJay5Jrs7Kr9FvFyDXr13trn8Jw4rZF1UXwnrJF95Wr15Gwn3JrZrGrWUGr1U
	Xrn8Wa43u3WUWosvyTuYvTs0mTUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8XocUUU
	UU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H3IRQTQJGTDPPBEGXRXNO7HJE6PZCA2M
X-Message-ID-Hash: H3IRQTQJGTDPPBEGXRXNO7HJE6PZCA2M
X-Mailman-Approved-At: Wed, 21 Jun 2023 11:59:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3IRQTQJGTDPPBEGXRXNO7HJE6PZCA2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/19 15:00, Krzysztof Kozlowski wrote:
> On 19/06/2023 03:45, Yingkun Meng wrote:
>>>>> +    tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
>>>> Smatch detects that tx_data->irq and rx_data->irq are of type
>>>> u32(unsigned) so they can never be negative.
>>>>
>>>>> +    if (tx_data->irq < 0) {
>>>>               ^^^^^^^^ This can never be true.
>>>>
>>>> Should irq be of type 'int' instead?
>>>>
>>>>> +        dev_err(&pdev->dev, "dma tx irq invalid\n");
>>>>> +        return tx_data->irq;
>>>>> +    }
>>>>> +
>>>>> +    rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
>>>>> +    if (rx_data->irq < 0) {
>>>>               ^^^ Same problem here.
>>>>
>>>> Should irq
>>> Should 'irq' be of type int instead?
>>>
>>> As fwnode_irq_get_byname() returns a integer.
>>>
>> Yes, you are right. I will add a patch to fix the type of 'irq' to int.
> Run smatch and sparse on your code before posting. It would find such
> trivial mistakes.

Thanks, got it.

Thanks,
Yingkun

>
> Best regards,
> Krzysztof

