Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD3732892
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 09:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8704826;
	Fri, 16 Jun 2023 09:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8704826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686899745;
	bh=bfKCa4lhWiKG1JkHgXQQtlzjtP0rCABzcTIjkeuk89E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cWD51gimscB4nI78wiqWiG4H5R/urO4/kendXgZ2Ep4i4WkPC05ASZriyWg6qCFWS
	 PnNejAtuJD6DcZ4cUngkabQFvBoIr9ATnpacO6Vq/oMCwGxYgNRpWv0k5VzFTtRlPO
	 4IMe0iwKcKz3vQrtmwfLgamwh3Ois0e+fpVIAWCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9F19F80533; Fri, 16 Jun 2023 09:14:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D631F80132;
	Fri, 16 Jun 2023 09:14:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCF3DF80149; Thu, 15 Jun 2023 14:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 236C0F800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 14:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 236C0F800BA
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8AxnOrtAotknI0FAA--.11801S3;
	Thu, 15 Jun 2023 20:24:13 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxPMrsAotknPobAA--.4953S3;
	Thu, 15 Jun 2023 20:24:12 +0800 (CST)
Message-ID: <ecd99175-d9da-cecd-d165-e9bd3452f7cb@loongson.cn>
Date: Thu, 15 Jun 2023 20:23:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] ASoC: Add support for Loongson I2S controller
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, krzysztof.kozlowski@linaro.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230614122140.3402749-1-mengyingkun@loongson.cn>
 <89022514-9f99-4fdc-9eba-d428ad0bcbb6@sirena.org.uk>
Content-Language: en-US
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <89022514-9f99-4fdc-9eba-d428ad0bcbb6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxPMrsAotknPobAA--.4953S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQADDGSJrgIcngABsM
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF4kCF45trW8Xw15Gr4rJFc_yoW3WFXE93
	429F18C3yDWFy8Wr95Kr4kXryY9F9ru345Ga1ftrykJa4S9r93Xas7Cr929asIvFs2gFnI
	vr1qgF48Za4xuosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-
	UUUUU
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PVBZXD27BH333JSHNGUMGKK3ZKJQOZDM
X-Message-ID-Hash: PVBZXD27BH333JSHNGUMGKK3ZKJQOZDM
X-Mailman-Approved-At: Fri, 16 Jun 2023 07:14:28 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVBZXD27BH333JSHNGUMGKK3ZKJQOZDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/15 19:30, Mark Brown wrote:
> On Wed, Jun 14, 2023 at 08:21:40PM +0800, YingKun Meng wrote:
>> From: Yingkun Meng <mengyingkun@loongson.cn>
>>
>> Loongson I2S controller is found on 7axxx/2kxxx chips from loongson,
>> it is a PCI device with two private DMA controllers, one for playback,
>> the other for capture.
>>
>> The driver supports the use of DTS or ACPI to describe device resources.
> One minor thing which can be done as an incremental patch:
>
>> +/*
>> + * DMA registers descriptor.
>> + */
>> +struct loongson_dma_desc {
>> +	u32 order;		/* Next descriptor address register */
> This probably needs a __packed to ensure the layout doesn't get changed
> by the compiler (eg, with struct randomisation options).

OK, got it.

Thanks,

Yingkun

