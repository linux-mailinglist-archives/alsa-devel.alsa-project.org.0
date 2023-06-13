Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC49772E422
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E4B9AEA;
	Tue, 13 Jun 2023 15:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E4B9AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686663058;
	bh=gVf21vWAqYR/oBIjZlyTC6LhYg5Ad++CLg/158gC6AQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CZHLRMn0A8c/XBJkOCB7ZYwOuaeEmoWgh1dXbPmgsKiBmj6+i/Ow9jDEv0uJHfheY
	 6vdUaxgVdepHK8IZhnQ6tya+CRFOoGDL5FLCl6bNh+du4Hf6wIT9iiMMUrowd69vqq
	 ySoOAmCiqNXzVdn1gFfZ0uNJfZ3RNPS3FnaqRSv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB49F805A9; Tue, 13 Jun 2023 15:29:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C3B1F805AC;
	Tue, 13 Jun 2023 15:29:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FB82F80149; Tue, 13 Jun 2023 14:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B89F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 14:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B89F800ED
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Bx4OgOZYhkA6UEAA--.7945S3;
	Tue, 13 Jun 2023 20:46:06 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax6OQNZYhkhyoZAA--.6327S3;
	Tue, 13 Jun 2023 20:46:05 +0800 (CST)
Message-ID: <de2b71d8-9204-a8cc-2e82-9a9e2c04ee9e@loongson.cn>
Date: Tue, 13 Jun 2023 20:45:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 0/3] Add Loongson I2S controller support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612085048.3039471-1-mengyingkun@loongson.cn>
 <31bd1de1-feb7-4544-aca6-cfb983722057@sirena.org.uk>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <31bd1de1-feb7-4544-aca6-cfb983722057@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Ax6OQNZYhkhyoZAA--.6327S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQABDGSIXIIAvwACsD
X-Coremail-Antispam: 1Uk129KBj9xXoWrKF4rWw18ZFWxJr1UKF4rWFX_yoWfZFXE9r
	ya9Fn5ZrykArykZ395trW5XF9I9a4jv34UK345tF1vqasYgryFgrWqkrZI9a4rGF4DK3Zx
	Xr4DGr4jy347GosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUq
	UUUUU
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7VMDZIU76X5BZSIJFJQNQPD3UTQ5NTYP
X-Message-ID-Hash: 7VMDZIU76X5BZSIJFJQNQPD3UTQ5NTYP
X-Mailman-Approved-At: Tue, 13 Jun 2023 13:29:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/6/13 03:07, Mark Brown wrote:
> On Mon, Jun 12, 2023 at 04:50:48PM +0800, YingKun Meng wrote:
>> Hi all,
>>
>> This patchset adds support for Loongson I2S controller, and
>> introduce a ASoC machine driver for loongson platform.
>>
>> The Loongson I2S controller is available on Loongson
>> 7a2000/2k2000 chips, works as a PCI device. It has two
>> private DMA controllers used to playback and capture.
>> Each DMA controller has one channel.
>>
>> The ASoC machine driver adds support for audio device which
>> using loongson I2S controller to tranfser the audio data.
>> The audio device uses "PRP0001" as its ACPI device ID, which
>> provides a means to use the existing DT-compatible device
>> identification in ACPI.
> The code here all looks broadly good - I did have a few review comments
> that I sent in reply to the individual patches but they're more
> stylistic than anything too substantial.


Thanks

