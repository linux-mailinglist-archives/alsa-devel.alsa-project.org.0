Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74168E4B5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 01:02:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC255827;
	Wed,  8 Feb 2023 01:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC255827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675814551;
	bh=tt5lrHlIVInMq27wdZG33n5kYVhMCWLk9XkuAdem+b0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DSL1f/icueLmw5suuHCqmOprEtr6Jh7Ue5rmpV3BvEPdZ+hoCc0VT8WEbkp4zX61l
	 j4WQrqTVBWBX4tcJfwd5b9jV/NoNQUxd2ZnhTNKX5RFHoQ5+3w5LnLWTgxD2JfYiLZ
	 RADWoTwies5jLW8RZnQ3svdPErXlPROajusjwzMQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 662C7F8010B;
	Wed,  8 Feb 2023 01:01:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC032F8012B; Wed,  8 Feb 2023 01:01:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAFD5F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 01:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFD5F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=SFSUuLCr
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D0686602077;
	Tue,  7 Feb 2023 15:46:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675784768;
	bh=tt5lrHlIVInMq27wdZG33n5kYVhMCWLk9XkuAdem+b0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SFSUuLCrMTSOqxVXNcSnMi/bv6tL1Zrzdke2be//6XLQKUihpkqdmp+027ZFDz2sZ
	 AtmS/ua3flrVRaKtuN/U8HPiolzhl8xniuQ2gz4NfEhsikXX3TtgQu+F0pV100wDnI
	 yPHfIWGiFXNMbvx56QMNdSu+WdwPh78FQgEcQ+URT74uc+3ThHudOGt2zH2LIrp6Mb
	 k0Cwglw9oDerHuoldUOsuaFNC5WB7mtTNu8IvcAOlPGAGkSNDKj0D3vm22Xt6UqA0z
	 5vT+MmZ7q98eWQr41f9vBZaxi76qATAKa+MmcJOpMs69TmNJflZ5FvDprkt0Qk0pXa
	 OSX+K1mSR8Ysg==
Message-ID: <e7257f9a-86c5-74e8-c538-6f6d2ba13274@collabora.com>
Date: Tue, 7 Feb 2023 15:46:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] Documentation: cs35l41: Shared boost properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-3-lucas.tanure@collabora.com>
 <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
Content-Language: en-US
From: Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5VSHAAUGA4PHVZP7OVIHCGTSKCCG3SJ5
X-Message-ID-Hash: 5VSHAAUGA4PHVZP7OVIHCGTSKCCG3SJ5
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VSHAAUGA4PHVZP7OVIHCGTSKCCG3SJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07-02-2023 10:42, Krzysztof Kozlowski wrote:
> On 07/02/2023 11:40, Lucas Tanure wrote:
>> Describe the properties used for shared boost
>> configuration.
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
ack
> 
>>
>> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
>> ---
>>   .../devicetree/bindings/sound/cirrus,cs35l41.yaml     | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
>> index 18fb471aa891..6f5f01bec6f1 100644
>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
>> @@ -85,11 +85,20 @@ properties:
>>         boost-cap-microfarad.
>>         External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
>>         enable boost voltage.
>> +      Shared boost allows two amplifiers to share a single boost circuit by
>> +      communicating on the MDSYNC bus. The passive amplifier does not control
>> +      the boost and receives data from the active amplifier. GPIO1 should be
>> +      configured for Sync when shared boost is used. Shared boost is not
>> +      compatible with External boost. Active amplifier requires
>> +      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
>>         0 = Internal Boost
>>         1 = External Boost
>> +      2 = Reserved
> 
> How binding can be reserved? For what and why? Drop. 2 is shared active,
> 3 is shared passive.
2 Is shared boost without VSPK switch, a mode not supported for new 
system designs. But there is laptops using it, so we need to keep 
supporting in the driver.

> 
> Best regards,
> Krzysztof
> 

