Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1E729D67
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A93E0E;
	Fri,  9 Jun 2023 16:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A93E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322461;
	bh=NuHvjjOphHtk5LXhRzfQMfjjf8MLO3yrQi3e6idKuVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cORnpmTtqGAxfNDSChBEYnfWPx0Ba0WN7HAJY6W7rF6z1KtIQNG08PGZWCkf7jRLu
	 Pn0et1Vx0inAN5/MqkTW4SYUZ23WtrLrBq9R/0oqgALloN2eBv5AoqsKjU9FAJ4LMR
	 u5AgVRZUDTeRqF/sdXmDTXw/TNPb7YzLCuqjjufo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C11AEF8067A; Fri,  9 Jun 2023 16:49:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01461F80675;
	Fri,  9 Jun 2023 16:49:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A39E2F80199; Fri,  9 Jun 2023 05:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id F043EF80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 05:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F043EF80130
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Ax3eo9o4JkTOEAAA--.2741S3;
	Fri, 09 Jun 2023 11:57:50 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxK8o9o4Jk_bMJAA--.21398S3;
	Fri, 09 Jun 2023 11:57:49 +0800 (CST)
Message-ID: <9854871e-2345-d82e-4e4e-d5bf492c2296@loongson.cn>
Date: Fri, 9 Jun 2023 11:57:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] ASoC: loongson: Add Loongson Generic ASoC Sound Card
 Support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-2-mengyingkun@loongson.cn>
 <aa8381b5-0a3b-4a64-8c92-333ad751956b@sirena.org.uk>
From: YingKun Meng <mengyingkun@loongson.cn>
In-Reply-To: <aa8381b5-0a3b-4a64-8c92-333ad751956b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxK8o9o4Jk_bMJAA--.21398S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQARDGSBxQEP2gABsp
X-Coremail-Antispam: 1Uk129KBj93XoWrKw4rXr1kWrWxKF1UAr1kWFX_yoW8Jr1xpF
	WjyFyjyF9xWF1qyrn5Ww4UZa4vyrWavw15Jw18GF1ag3s5ZFyfKr4fKFyYqayrCr92yFW2
	vF4jgrZ5AryDWFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeq2NUUU
	UU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EQ4A2ZKMLC2H3KQDMP5URM62XF5GXC36
X-Message-ID-Hash: EQ4A2ZKMLC2H3KQDMP5URM62XF5GXC36
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:48:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQ4A2ZKMLC2H3KQDMP5URM62XF5GXC36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Brown,

Thanks for your kindly work.

On 2023/6/5 20:47, Mark Brown wrote:
> On Mon, Jun 05, 2023 at 08:09:33PM +0800, YingKun Meng wrote:
>
>> The driver supports the use of ACPI table to describe device resources.
>> On loongson 7axxx platforms, the audio device is an ACPI device.
> I'm not seeing any ACPI IDs added here, this is all DT other than this:

I use the special ACPI ID "PRP0001", it provides a means to use the existing

DT-compatible device identification in ACPI.

As described in the document "ACPI Based Device Enumeration".

>> +	if (has_acpi_companion(&pdev->dev)) {
>> +		device_property_read_string(&pdev->dev, "codec-name",
>> +						&codec_name);
>> +		for (i = 0; i < card->num_links; i++)
>> +			loongson_dai_links[i].codecs->name = codec_name;
>> +
>> +		device_property_read_string(&pdev->dev, "codec-dai-name",
>> +						&codec_dai_name);
>> +		for (i = 0; i < card->num_links; i++)
>> +			loongson_dai_links[i].codecs->dai_name = codec_dai_name;
>> +	} else {
> which doesn't look *great* from an ACPI point of view TBH.  I thought
> there were now some (semi?) standard ACPI bindings these days to support
> referencing other devices better?
Got it! I will rewrite this part.

