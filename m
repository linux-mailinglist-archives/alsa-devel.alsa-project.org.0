Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910557A2EF9
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 11:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED569F6;
	Sat, 16 Sep 2023 11:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED569F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694855996;
	bh=iJMvvw/a7OGSOHFpbLgS/8/Pr6kMydnAtnwVab0gxYg=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MpIFKQKVV2gW+b3Po6RQnjoxgLO8MIOVbhlITOhRrQPZp0gPE/huf/3AoG1N3kIre
	 cPYDADzTycbmoTFwDLhbJ6ni3QcYUMr6dRzjKaBNUl6njjxSEZWu9AWmd25pbjG2qv
	 zE1L1Ry3AwohvLH2y1FCFbOzOZltUPjU2eXBVlwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD4E0F80431; Sat, 16 Sep 2023 11:19:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D50F80246;
	Sat, 16 Sep 2023 11:19:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C10DEF80425; Sat, 16 Sep 2023 11:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave01.hostfactory.ch (asave01.hostfactory.ch [185.117.170.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 300DFF80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 11:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 300DFF80141
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave01.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qhRRp-006Osi-NP; Sat, 16 Sep 2023 11:18:46 +0200
Received: from [192.168.188.55] (mob-194-230-161-90.cgn.sunrise.net
 [194.230.161.90])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id BD9CA41105520;
	Sat, 16 Sep 2023 11:18:39 +0200 (CEST)
Message-ID: <a5b63c37-7f6f-46f3-a87f-e4e7c0c9b5c8@weiss.ch>
Date: Sat, 16 Sep 2023 11:18:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: INT203 and DAC1 (Re: [PATCH] ALSA: dice: add stream format
 parameters for Weiss devices)
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230905235441.GA24829@workstation.local>
Content-Language: en-US
From: Michele Perrone <michele.perrone@weiss.ch>
Cc: Rolf Anderegg <rolf.anderegg@weiss.ch>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230905235441.GA24829@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <169485592029.30775.122610818392893879@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9aYjCtA/1mKjFgXUuBimsZPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDljPyzCxIJm7qFlTroi9VKv/7Rl0Dd5eFQ0eM8i42SsSUGlz8CJSOMrvzx9
 TVg3RkXSj0+W2YrtLO1tJ/GYeG3Bp8jZ4AoGBlDR94YkH0RjFcsS2wyX4wFvfD5xwAerAR9lOVrL
 YTpDlVt2LhrK2BfEQs6EgGedxeuvfrMrARjFPGdDtN/2cBsaR8p7RVNO0vXk/agSvtgte2zCXW1J
 lwXnVmkAHwHuPWE1+MMVWSY/DErqhy+tapdwJ8uKml1tG0Pt3JsC5e/DlYVV9jqBtc/t9a3fvBg8
 I7q5hFKojyxxcVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRu
 xdeJD5/Wl4aBF+CY0mxh2pSR7yU2QIWCTCd5A9CNaN6pRWtLR0Mn2ASypXTCTfApisVZPVE5xgLw
 XEbnvqUcIYd16SviU/hmLrTy1VycMwgpTs2BZNjhN1NaK5LAGwujj33UzKaibcXCMztdU5OxbHAz
 rxMg36Jn7L4UIiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdsez2hboJ1sHD93yk
 U2WEJHrlCtbEguydx7+/OTtKDkewxR44LixI64AeEKOsZv7li+V8n6keo/2ef0bGZ0Uisg8CbZVN
 4NTBUrEDj1SPmTBxtOQ7idC564HPQBiw1dCeYtfXE+I53wZSkstgjzhKtDrtgcxVxWy4b2kTdalQ
 jRLp2SyiUF2AJZ1QrWKEE58+XwcOfbJW78YDsInJzM64ZIe8zIpuE/2OnZ0JEcLzAx9jAeC1LXbN
 jyFcag1clVEejgbdjKzPlwftnaBy0ehO99jiTPI3niUsrRv1n/PK9pAbm6Tr3pQZv6RcTO7z7Tdv
 sMgnJXsrAoZkwMikWJbAJWw03jR5NeVaJQBh0uawl0Cg8sRZ+ATCUj4u0XmPDtAfhCkr94ZlIK28
 jWwYXvNEsJFM21XLIJAOtNbl33sd4Q7NgbK8077bKr8r1UF38Pkt1hgrBnzcyz4YpNRToixck2YU
 MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: E4HSDJBHAOMPT5E46D6OOSCNN4FANCMH
X-Message-ID-Hash: E4HSDJBHAOMPT5E46D6OOSCNN4FANCMH
X-MailFrom: michele.perrone@weiss.ch
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4HSDJBHAOMPT5E46D6OOSCNN4FANCMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

sorry for our late reply.

1. INT203

Yes, we can confirm that the latest INT203 firmware has the model ID 0x6,
same like the INT202. Older INT203 firmware has the model ID 0xa.

At the snd-dice module level, there is obviously no difference, because
the hardcoded capabilities (modes/rates) are the same.

The only drawback is that when connecting the INT202, users see two
channels of input. But maybe this could be easily solved with an alsa
card profile.

2. DAC1

The DAC1 with model ID 0x5 that you found in the libffado configuration
file is not same the DAC1 that you found on our website.
That was an experimental device which included an embedded computing
board, connected via FireWire to an internal DICE-based soundcard.
This device was never released to the market, so I suggest discarding
this entry.

On the other hand, the DAC1 from our website was indeed sold with a
FireWire option. However, this is just and INT203 embedded inside the
DAC1, with no special ROM. This means that when connecting the DAC1 via
FireWire, it will present itself like an INT203.

I hope this answers all your question, otherwise let us know!

Kind regards,
Michele Perrone


On 06/09/23 01:54, Takashi Sakamoto wrote:
> Hi Rolf and Michele,
>
> I'm working to fulfill hardware database of systemd project[1] for Weiss models with received
> collection of configuration ROM, then have some issues. I would ask you to provide information
> to solve them.
>
> This is the table of the value of model ID field and model name.
>
>                  snd-dice    am-config-roms  systemd hwdb
> DAC202          0x000007    0x000007        0x000007
> DAC202(Maya)    0x000008    not yet         not yet
> MAN301          0x00000b    0x00000b        not yet
> INT202          0x000006    0x000006        0x000006
> INT203          0x00000a    0x000006 (?)    not yet
> ADC2            0x000001    0x000001        0x000001
> DAC2/Minerva    0x000003    0x000003        0x000003
> Vesta           0x000002    0x000002        0x000002
> AFI1            0x000004    0x000004        0x000004
> DAC1            not yet (?) not yet (?)     0x000005
>
> I have two issues.
>
> 1. INT203
>
> The modalias table in ALSA dice driver[2] includes 0x00000a for the model, while the configuration
> ROM includes 0x000006. Michele wrote commit comment for it[3]:
>
> ```
> Note: the INT203 presents itself as INT202, because the firmware
>        running on the two devices is the same.
>        The difference between the two lies in a jumper setting
>        inside the device.
> ```
>
> In my opinion, there are multiple hardawre revisions for the model.
>
> 2. DAC1
>
> When committing to hardware database of systemd project[4], I referred to libffado2 configuration
> file[5]. It includes `DAC1` with model ID 0x000005, while it is neither found in ALSA dice driver
> nor the collection of configuration ROM. As long as searching DAC1 in website of Weiss Engineering,
> I can see DAC1-mk3 has option card for IEEE 1394 connection[6]. Would I request you to provide
> information about the model?
>
> [1] `hwdb.d/80-ieee1394-unit-function.hwdb` in systemd project
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/firewire/dice/dice.c?id=4fb0dacb78c6a041bbd38ddd998df806af5c2c69#n395
> [3] https://github.com/takaswie/am-config-roms/commit/e6717b3cbb4a
> [4] https://github.com/systemd/systemd/commit/ff1cb7b9393ac
> [5] http://subversion.ffado.org/browser/trunk/libffado/configuration
> [6] https://weiss.ch/products/pro-audio/dac1-mk3/
>
>
> Regards
>
> Takashi Sakamoto
