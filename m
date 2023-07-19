Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB9758E81
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 09:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D651F3;
	Wed, 19 Jul 2023 09:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D651F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689750854;
	bh=8MuIWZRxNWHP9l/0O/zijMrYt/R4yoKMoecsRnbpVzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=srNgQ3P2M/H0UCdZEwLkOpduYgakkRH8eVly5PT8WHpUjZIHfB3mG8t8UCh4qTeL0
	 b8OZ3d9LKwm94OB2xOnMlepIY/sNAZYr3uQ/YVuhrDh9Eu6/hY5YqgOD6LlrfGdIHw
	 rXSsWjJGDzx7jtwf/jFXsWBkmUDYxfPijd3Qtsk8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E0AAF80494; Wed, 19 Jul 2023 09:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D50F8032D;
	Wed, 19 Jul 2023 09:13:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BA8F8047D; Wed, 19 Jul 2023 09:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02794F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 09:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02794F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=eLVtcBGE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=fH++TWJtjIxjGX5EhbifPIIL4W8rrEuOP0ikLJnLDss=;
	t=1689750793;x=1689840793;
	b=eLVtcBGEq25i2MlPGu4a9NwUPGPK1/zmtrU/jDJKVwHsU7Upv6jbG+Yev37DJlzzFsUF67pLzR0yBQ2IJAZ5IrH0vDmXCR5fQqyhW08E22HPiDHI2A7xLRg4guKs78Zb9XIV0tfehG1C1aM6mmghhkEhvum/8RLHmSitR4ebhYNgdUf4ebkdpMzpiZNZmkZEDgMsuylW7Yw3j2TlksjMTMzvwRjwkWUV/ZTd43yHPL4AKfpoGYN+I6tPEVCjDvB+23Qchl2oiTKCkWu241Sg6PL6hbNbeDw6VZ+MuPYtKRYzxAkaf8p+NowQO8c1aVzsnY1eWJhWHcLtXoEH2BBxqg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qM1Mz-0006vr-AQ; Wed, 19 Jul 2023 10:13:10 +0300
Message-ID: <78fdef90-6841-b7c6-198b-5902cdc06298@inbox.ru>
Date: Wed, 19 Jul 2023 10:13:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: simple-card: add triggers
 properties
To: Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Astrid Rost <astrid.rost@axis.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230715083046.108674-1-fido_max@inbox.ru>
 <20230715083046.108674-3-fido_max@inbox.ru>
 <20230718220843.GA1944897-robh@kernel.org>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230718220843.GA1944897-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD9260BFC270D398E26256A1388358BCC2ABA9A4E6A75BB68CE182A05F5380850404C228DA9ACA6FE2760339751B026D2C514D29B42FC712A19F66A526C91EEE5FEF0631C29E6E4FBBB
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D950999244A4B2E6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637976142D429C486548638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82BD5945AB679A852F55F44EC11A897846F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BA2C6A0109559C168A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C468D16C903838CAB43847C11F186F3C59DAA53EE0834AAEE
X-87b9d050: 1
X-C1DE0DAB: 
 0D63561A33F958A5CE618E196A538662FA342655A6BBEC0F492C14056082EDCBF87CCE6106E1FC07E67D4AC08A07B9B0B355ED1E20F5346ACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8B78B62552CEFB988F7579A3A6137389BB8945F48FC4F62BB28AC2747C34186B182FB9261F6240E87A512D943FCE53BFB310A82119D837DB70531D70938160D56A5887467130CEBC4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojg78zLelqjbYh46SMB2AQ2A==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B0E58DE3008AEF620C23C1C26EEFFDDBF98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: ENNO4DQKX7QAY45QOBE4YPX6DXADUMJI
X-Message-ID-Hash: ENNO4DQKX7QAY45QOBE4YPX6DXADUMJI
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENNO4DQKX7QAY45QOBE4YPX6DXADUMJI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 19.07.2023 01:08, Rob Herring wrote:
> On Sat, Jul 15, 2023 at 11:30:43AM +0300, Maxim Kochetkov wrote:
>> The trigger-start/stop properties allows to specify DAI link
>> trigger ordering method.
> 
> Obviously. Why do you need these? What problem does it solve?

It allows using simple card for some DMA-based CPU component which 
requires different start/stop sequence (stop DMA before CPU component, 
start DMA after CPU component).
There are a lot of boards which have no audio codec on board. It has 
only I2S/TDM/etc... and you can attach any external codec on its pins. 
It looks like simple audio card is enough for this cases. It is much 
better than to copy-paste simple audio card code to the new custom 
driver with new combination of CPU/codec.

> 
> I don't think these belong in simple-card. What's next? What if you need
> delays between each step? This is the problem with 'simple' or 'generic'
> bindings. It's a never ending addition of properties which are not well
> thought out.

Can you please suggest the better way to specify start/stop trigger 
order via DT?

>> +  trigger-start:
>> +    description: |-
>> +      Start trigger ordering method:
>> +      default: Link->Component->DAI
>> +      ldc: Link->DAI->Component
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    items:
>> +      enum:
>> +        - default
> 
> Why do you need a value of 'default'? What's the default when the
> property is not present?
It comes from
enum snd_soc_trigger_order {
	SND_SOC_TRIGGER_ORDER_DEFAULT	= 0,	
	SND_SOC_TRIGGER_ORDER_LDC,		
	SND_SOC_TRIGGER_ORDER_MAX,
};
default value is 0 (SND_SOC_TRIGGER_ORDER_DEFAULT)

>>     format:
>>       description: audio format.
>>       items:
>> @@ -210,6 +232,10 @@ properties:
>>       maxItems: 1
>>     simple-audio-card,mic-det-gpio:
>>       maxItems: 1
>> +  simple-audio-card,trigger-start:
>> +    $ref: "#/definitions/trigger-start"
>> +  simple-audio-card,trigger-stop:
>> +    $ref: "#/definitions/trigger-stop"
> 
> Don't continue this 'simple-audio-card,' prefix pattern. With it, no
> other binding can use these properties.

Ok.

> 
>>   
>>   patternProperties:
>>     "^simple-audio-card,cpu(@[0-9a-f]+)?$":
>> @@ -259,6 +285,11 @@ patternProperties:
>>           maxItems: 1
>>         mic-det-gpio:
>>           maxItems: 1
>> +      trigger-start:
>> +        $ref: "#/definitions/trigger-start"
>> +      trigger-stop:
>> +        $ref: "#/definitions/trigger-stop"
>> +

Should I keep only this section?

