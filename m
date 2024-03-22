Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB45887C28
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Mar 2024 10:49:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2E414E6;
	Sun, 24 Mar 2024 10:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2E414E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711273788;
	bh=P0dr0dBCvvvUpslvPwKlG6vn+eNquMJf7JhYBVBNQQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d49eO5tWzkspB1ade46C7VpTQZ563dlt7pJKXhH7z/A7dLFv9kDd8OyOyEDLtu2/W
	 A9aATsBj1MNaRKhvh7H1k/O6oOOxb7Z6E/W8xZCinF1V5g0R/J+a3meklZ+Z1xnUs3
	 ZaSoU3DoY9ijJKI9b7wKjdDzQxdQraBLfgxsiNvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E1AF8057E; Sun, 24 Mar 2024 10:49:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD7AF80588;
	Sun, 24 Mar 2024 10:49:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D01F0F804E7; Fri, 22 Mar 2024 09:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A0FAF8010B
	for <alsa-devel@alsa-project.org>; Fri, 22 Mar 2024 09:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0FAF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yo8VsMbD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32255FF807;
	Fri, 22 Mar 2024 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711097934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/uxx5AdFXNV6za9HAZhGhTPRrtGXUVryUFqmL6/+ic=;
	b=Yo8VsMbDGjdd/vpgx8agJbI6GMKOf/aAiUzJqOH05A/UxeYb0EdRvZ6bR7TGTVa5Sj3c4E
	JbRrqP9lz61Fzh9YZAlk5lBWWv2e/8eoDOtQDnCGZ8BK+lzTP/5gaymkYvzhY1Lsb+AUUJ
	vL12A2FJdmkYaZQYmYKu187UJ0qhck87rmYMjW2yF4wmj1PVGuEXy0tvhB7oaPqqqUqDb6
	FFfVf1eK1ZhU/o2zs5uo8gXueHSUkRnL4FZkm8AdNZMgTHeaOHZpOJ9tAgT+Ro/VmaRrFI
	0n5nUtONT8KkK+wqRct6I6W99vFEHtgFFY+cbdAudMkkI0Lc1JnJnHnd3Gtz8Q==
Message-ID: <16e6cded-33c1-408c-9bfc-b0b9a8da4cbf@bootlin.com>
Date: Fri, 22 Mar 2024 09:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] ASoC: ti: davinci-i2s: Opitonally drive DX pin
 during capture streams
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-14-bastien.curutchet@bootlin.com>
 <00182d1d-ef29-457f-9e3e-6e9b57592118@gmail.com>
 <0bb26153-8bcb-475f-8892-5eb925fec538@bootlin.com>
 <7925bbe5-17e8-42cb-a5f0-4f3e06810a90@gmail.com>
 <d20dc37c-13fa-43d1-af52-dce8d8dcdd75@gmail.com>
 <5467add6-0099-4e54-a4f7-12aa149d03c7@bootlin.com>
 <e6994ff1-6c32-4dac-846a-5f4f18b2f996@gmail.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <e6994ff1-6c32-4dac-846a-5f4f18b2f996@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TXE5J4RTZHMTCBUKONC7KGB372FXFDXH
X-Message-ID-Hash: TXE5J4RTZHMTCBUKONC7KGB372FXFDXH
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:46:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXE5J4RTZHMTCBUKONC7KGB372FXFDXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Péter,

On 3/21/24 19:31, Péter Ujfalusi wrote:
> Hi Bastien,
> 
> On 3/21/24 17:14, Bastien Curutchet wrote:
>>>> I think the definition of the 'ti,drive-dx' is somehow odd. It allows
>>>> you to set it to 0x1234 and the DX pin will show 0x1234 when you capture
>>>> 32bit. If you capture 16bit then it will transmit 0x12 (or 0x34?), no?
>>>> If you have 4 channel capture then I won't speculate what will be on the
>>>> DX pin ;)
>>>>
>>>> Would not be better to say that the DX pin will be driven low or high
>>>> during capture _and_ disable the playback support?
>>>
>>> After some thinking, it might be still better to use the DX pin as GPIO
>>> and either have a custom machine driver which would handle it (set low
>>> when a capture trigger happens) or connect it in DAPM as a supply, bias
>>> or something and ASoC would handle it automagically.
>>>
>>> I think that would be cleaner in many ways. What do you think?
>>>
>> I agree, that would be cleaner. I ran a few tests to see if that would
>> work on my hardware. It doesn't ... So I looked back to the schematics
>> and found two reasons :
>>   * the DX pin needs to be in sync with the clock.
> 
> I'm not sure what this means, sync with which clock?
> 

Sorry, that was not very clear, I meant sync with the bit block that is
output on McBSP.CLKR pin.

>>   * the DX pin needs to be in a high-impedance state between two frames
>>     so a pull-up can drive it back up. Actually, the DX pin is also
>>     linked to the FSR pin so it provides the frame clock to the capture
>>     stream.
> 
> Hrm, you are using the DX pin as FSR for the capture? Why not McBSP.FSR pin >

The McBSP.FSR pin is used for the capture but is driven by the McBSP.DX
pin. Both pins are linked together.

> Looking back to the patch, one thing stood out: you are setting the
> XDATDLY to 2.
> You have some sort of T1 framing on the bus? The pullup will make the DX
> line high in for the framing bit, right? > Or you simulate another FSR line with T1 framing DX?
> 

Yes the goal is to simulate an FSR.

> The 'ti,drive-dx' sounds like a bad property for sure, you have T1
> framing and driving the DX to certain level.
> It is like DSP_A (1 bit delay) playing constant 0x2 ?
> 
> Can you use aplay /dev/zero and a DT property to select T1 framing for
> the playback? Or that would be too coarse for timing the start of
> playback and capture?
> 

That's a good idea, thank you. I'll try this and come back to you.


Best regards,
Bastien

