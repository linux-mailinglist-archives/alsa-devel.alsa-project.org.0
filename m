Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBA69DBE9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 09:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0714E92;
	Tue, 21 Feb 2023 09:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0714E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676968194;
	bh=qvlPvbGuS79LYZs3TMErx3YgQ/aZCqV4xqqYZO7kqnM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f9ub2Jqz2yIx9nsZNZnDMf9ZjIfVmeNVlcHsQjSF03QLDqjkl+9IAmnE7v4eDfkIm
	 zgvl6QCCWjHz8jHPKXGKnQti7PyRCL97VcTdJiU6zJ/5CKfxnyjwPngOmrs+MADE24
	 nCumSDbbF3Cs6Z8Er0xYL+R35JKKH60C6twYYs0M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07393F8025A;
	Tue, 21 Feb 2023 09:29:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26F40F80266; Tue, 21 Feb 2023 09:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04541F800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 09:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04541F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ZcTrCmVC
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 35A9666021BD;
	Tue, 21 Feb 2023 08:28:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676968125;
	bh=qvlPvbGuS79LYZs3TMErx3YgQ/aZCqV4xqqYZO7kqnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZcTrCmVC/tO+2g+9Z06OVyUlnLUbNCJzXA/O231hNqMjB/Vi0fUawgwSI8FLuJE8w
	 qSqow9BjZNHGa1s8YmU7Z9alJbNaYnNUi9aarl8a9qymLFnIMLrh6Iv7pqYQKrBNtZ
	 uqLZE66RmhLKOfCRf2yVwMK8p3zT59YeXW2rs6L9Ldpvau5FSv6gEcFO+g0tw08N6X
	 ISPbZee+G46kMWTrnTelGhCF6A0JFfBxov+Ga9QULxoWLMVgETY5VtSSniLifJuuVo
	 TB8d+HPSlt20XjOdDFOpTL1CyUdlley5f0N9hwUW1DHdJ7b3rffd1BryIHp8k+YQIo
	 S+4vUh/HTkB6w==
Message-ID: <09bf8e07-6275-654f-4a70-d46b54e9b853@collabora.com>
Date: Tue, 21 Feb 2023 08:28:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/4] ALSA: cs35l41: Add shared boost feature
To: David Rhodes <drhodes@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230210091942.10866-1-lucas.tanure@collabora.com>
 <20230210091942.10866-4-lucas.tanure@collabora.com>
 <20230210134341.GF68926@ediswmail.ad.cirrus.com>
 <cfacc3d6-2daa-6aa3-ba19-281b7e48bb47@collabora.com>
 <20230211170638.GG68926@ediswmail.ad.cirrus.com>
 <1e3ef067-9b39-dc19-5fbc-75436c67f206@collabora.com>
 <d86d989b-0d82-74b3-a5da-9972324e9477@opensource.cirrus.com>
Content-Language: en-US
From: Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <d86d989b-0d82-74b3-a5da-9972324e9477@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A7RAPDN3UWN6SBCD762ANPHESLEJVLWW
X-Message-ID-Hash: A7RAPDN3UWN6SBCD762ANPHESLEJVLWW
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7RAPDN3UWN6SBCD762ANPHESLEJVLWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20-02-2023 19:25, David Rhodes wrote:
> 
> On 2/12/23 03:28, Lucas Tanure wrote:
>> On 11-02-2023 17:06, Charles Keepax wrote:
>>> On Fri, Feb 10, 2023 at 02:39:56PM +0000, Lucas Tanure wrote:
>>>> On 10-02-2023 13:43, Charles Keepax wrote:
>>>>> On Fri, Feb 10, 2023 at 09:19:41AM +0000, Lucas Tanure wrote:
>>>>>> + {CS35L41_MDSYNC_EN,        0x00001000},
>>>>> David's internal patch appears to set 0x3000 on the active side,
>>>>> not sure where that difference snuck in, or which is the correct
>>>>> value. Your settings appear to make logical sense to me though, TX
>>>>> on the active side, RX on the passive side.
>>>> And as the patch sets TX and RX in the same chip I changed to follow
>>>> the documentation.
>>>
>>> Yeah I mean I suspect this is sensible, unless there is some
>>> reason the controller side also needs to have RX enabled. Perhaps
>>> for feedback or something from the passive side, but I imagine
>>> this is just a typo in the original patch.
>>
>> Ok, but the other side doesn't have both RX and TX enabled.
>> If the active side needed RX to receive information for the other 
>> side, the passive one would need TX enabled too.
>> So if a feedback is necessary, both channels on both sides would be 
>> enabled, not one channel in one side and both on the other.
>>
> Both amps need to transmit their boost targets to the MDSYNC bus. The 
> active amp needs to receive the combined boost target from the MDSYNC 
> bus. That is why the active amp should enable both RX and TX, and the 
> passive amp only needs to enable TX. It is not simply a unidirectional 
> flow of data from one amp to the other.
> 
> Sorry if the documentation has been mismatched or confusing at times. 
> It's taken me a while to gather the right understanding of how this all 
> works.
> 
> 
> On 2/10/23 03:19, Lucas Tanure wrote:
>> +      Shared boost allows two amplifiers to share a single boost circuit by
>> +      communicating on the MDSYNC bus. The passive amplifier does not control
>> +      the boost and receives data from the active amplifier. GPIO1 should be
> 
> Not quite correct. I would suggest: "Shared boost allows two amplifiers 
> to share a single boost circuit by communicating on the MDSYNC bus. The 
> active amplifier controls the boost circuit using combined data from 
> both amplifiers."
Ok

> 
> 
> On 2/10/23 08:39, Lucas Tanure wrote:
>>
>> This write here is to select the boost control source, which for the 
>> active should be "Class H tracking value". 
> 
> Active should use the MDSYNC value. Otherwise it will not provide boost 
> to the passive amp when there is only audio on the passive amp's channel.
David can you confirm that both sides should use MDSYNC for boost 
control source?


> 
> 
> I believe there is another change needed for the Deck, to handle the 
> 'legacy' property names instead of bst-type?
I am working with valve to update their bios.

> 
> Other than the changes needed to the reg_sequences this looks good.
> 
> 
> Thanks,
> 
> David
> 

