Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71256887C27
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Mar 2024 10:47:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C0BF50;
	Sun, 24 Mar 2024 10:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C0BF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711273663;
	bh=FJDfFUiyTJXJm+o9DzdVsd9q4EWWb/PQk1TE73FXUGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OHEtTK6MYUQCzo24fLI8ELxF0fk2bSr5c1fQGI5svyRL0To/IMtpKDN4dcTs/LEUZ
	 ZRXozRhpzfUd0YbOxDShlCP3QlPFWfnpDVZViefefy0oeXYxyRBJcwBX+l5nPzg4Gz
	 pKJ7uIQfrJ0Qb0a4swM+k3gK3o6VN3xThdKalM6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA900F805F7; Sun, 24 Mar 2024 10:46:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE11F805F6;
	Sun, 24 Mar 2024 10:46:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49A79F804E7; Thu, 21 Mar 2024 16:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8FDBF8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 16:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FDBF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YbLWQ2wj
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE8911BF20C;
	Thu, 21 Mar 2024 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711034045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0SqObXdIaAiz8b63yEz0WL2gHCtn7ExtuiZ1KSSPzM=;
	b=YbLWQ2wjXQHGg1G42dbskBhClkYaOV309PxaBzoEypCb5JhC1qla6nnH+L6aebMZVNT1E4
	f9PKSYDrJEs/v2rc1gGgXYmcTlL6nHXibcDXg6s4ugoMA8PzC32JsqjnXjW4xIFgUMlNYX
	DZxXFhQhEQ0cjKK5NBqogEER1Hp5a4FqF734sbxWDKeZ/7l8Afta8H2fbhLrOGeCqD9lkf
	P583S/uZz6CFhwHnkLo2M+X+ucHr/lhBnymoQ1dq9P0/xFrv+boXJ/aSbltIcbK0OmaVCZ
	49abQzySFOE4rcqUXevHhfVY8JPJVgF8dRgwn6qslcP+mFIGg44dso9PZpOn0Q==
Message-ID: <5467add6-0099-4e54-a4f7-12aa149d03c7@bootlin.com>
Date: Thu, 21 Mar 2024 16:14:04 +0100
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
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <d20dc37c-13fa-43d1-af52-dce8d8dcdd75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BWX6TSYWNPI265KGWVEPV6DKJC6ROOAG
X-Message-ID-Hash: BWX6TSYWNPI265KGWVEPV6DKJC6ROOAG
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:45:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWX6TSYWNPI265KGWVEPV6DKJC6ROOAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Péter,

On 3/20/24 21:30, Péter Ujfalusi wrote:
> 
> 
> On 20/03/2024 17:42, Péter Ujfalusi wrote:
>>>> On 15/03/2024 13:27, Bastien Curutchet wrote:
>>>>> The McBSP's DX pin that outputs serial data during playback streams can
>>>>> be used during capture streams to repeatedly output a chosen pattern.
>>>>> For instance, this can be useful to drive an active-low signal during
>>>>> captures (by choosing <0> as output pattern).
>>>>
>>>> Are there really any other use of this than to pull down or up the DX
>>>> pin (0 or 0xffff)
>>>
>>> I don't know, indeed today I can only think about these two patterns.
>>> I tried to do something in a 'generic' way so it can evolve if needed.
>>
>> I think the definition of the 'ti,drive-dx' is somehow odd. It allows
>> you to set it to 0x1234 and the DX pin will show 0x1234 when you capture
>> 32bit. If you capture 16bit then it will transmit 0x12 (or 0x34?), no?
>> If you have 4 channel capture then I won't speculate what will be on the
>> DX pin ;)
>>
>> Would not be better to say that the DX pin will be driven low or high
>> during capture _and_ disable the playback support?
> 
> After some thinking, it might be still better to use the DX pin as GPIO
> and either have a custom machine driver which would handle it (set low
> when a capture trigger happens) or connect it in DAPM as a supply, bias
> or something and ASoC would handle it automagically.
> 
> I think that would be cleaner in many ways. What do you think?
> 
I agree, that would be cleaner. I ran a few tests to see if that would
work on my hardware. It doesn't ... So I looked back to the schematics
and found two reasons :
  * the DX pin needs to be in sync with the clock.
  * the DX pin needs to be in a high-impedance state between two frames
    so a pull-up can drive it back up. Actually, the DX pin is also
    linked to the FSR pin so it provides the frame clock to the capture
    stream.

Bast regards,
Bastien
