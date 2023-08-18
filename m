Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3964780C79
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 15:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B4DE72;
	Fri, 18 Aug 2023 15:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B4DE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692365086;
	bh=OxZpckKCVC+LInJLGtXEJh4K/fQ9d9bpWMUKk6bzDx4=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DBUM5v0cvjukchhgQ0O1UyxfpqFP4hEiIhOWit+r0Ch9uqwuNQOInELfAUnvzcIWQ
	 W36lv+wJJf0O+ZK2VDdJ1gx23GJlMIuwJI7EB8OZ+4khHXGxHr/QNJOjV+7xGPYUy9
	 fkWajEs7xkLTnsm/Agn0OxLTSwogEzaqF7WMCfbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52AACF80254; Fri, 18 Aug 2023 15:23:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08BC9F8016D;
	Fri, 18 Aug 2023 15:23:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19531F801EB; Fri, 18 Aug 2023 15:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave01.hostfactory.ch (asave01.hostfactory.ch [185.117.170.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63CBAF800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 15:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CBAF800D1
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave01.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qWzS4-003fwq-EF; Fri, 18 Aug 2023 15:23:46 +0200
Received: from [192.168.0.84]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id 6402B43E422BE;
	Fri, 18 Aug 2023 15:23:43 +0200 (CEST)
Message-ID: <0c1d4eaf-b554-4ab6-9519-6173c3b89f01@weiss.ch>
Date: Fri, 18 Aug 2023 15:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA: dice: improve support for Weiss devices
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
 <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
 <20230818131338.GA397874@workstation.local>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
From: Michele Perrone <michele.perrone@weiss.ch>
In-Reply-To: <20230818131338.GA397874@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <169236502368.21774.14725663404432963175@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+e3w8V7WryV9c4pC769+R2PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDl1CmCG4MXmWFl9KMUaH9XX58fMnqZUTt7CyKlJUh+zhtvtJf6L2wiBWsOb
 dXUys/+DJYXE4Dl0gs/Km8rE1WFZib4c+8u03zgcPIi1BNOnFPiovdiMNMKaOo4Dx5PVJ7yZn7S9
 PqmI7CxqPRD6uYFuoeEA50uKT1YmNQ2DvAHx0II9SfYN0aBss3KI3DngazDFDSd8x4mvXr9SxC63
 O7uDYsS6bGduFax79ZwOlDcJsct4QGHh8z4JwntNZcENOTyB/XXeZlhRtdWlq12+IWgwmQe0NR41
 Q9AG+69OB6hwB6O1G7ls8LzOXkY85X1GAzFhYDivIFvoWs4fOKAXjLRhjFuf4WPrajHp59bHW7Tl
 Bk5sFyZCCKyQ/k+e9zBhOBhIsKDbCcElRJKYxQF4OhLdO16QjsEYeg42J7ak274f2+4cBKp6T12C
 LGXmAnuBrE287L+pOM+0/tNr7IsS5IMjobsZ9+My2AC4mR5ccG6aT64Dt0gTEK9vOlOvpFXXjOyu
 cj735mFcFqoc4yysvQM8ASJFC/49WOPBr5nlEUI4xCt5iUJT/z8lye7KSXayjLB61/pco8xTx3df
 E/RPFMfwv2cm5qxBpgKVM91kHbVkV5fOwaqLFCCS9XCFAivhVnG+2/Y3iC0yOiwsaVCcWrnB93wG
 SEFHjCmk2dux8tzSTKd7Rmxfs4ILxAJFVcQ/5Xb/yoaQOiMB7ZonIORAzSkLgCiMGTCTvDSRAoQA
 K/A0J+TdiyZLwJzIAJ8OHQ1qo+J5Gwk2XhzRW1DIVdBB+eXxloMKJlkXBiCTmD6N6o7ifIa+6T/z
 PdRUeNaWpSUdKA3DqcigOvSxdRnthmhn8Zn6uu3zsy2HWa01VCJlF37T+8b+yU156XkjK+YxHYcT
 0IBbSA6U/PExIgJ14JdFndotryNCh0sMXXeuXmotCoWhkxSj8rS+aoLPhLJzbnRZjOcnMDkGIqtX
 9wv/CDPO9I7KeNW0qU4GFuWhP2np9THNGLxl+IRxtooIbZZkii79MO4xL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: 6WFJESFKCFULIQRFTV6VBVO2WUA5NXLU
X-Message-ID-Hash: 6WFJESFKCFULIQRFTV6VBVO2WUA5NXLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WFJESFKCFULIQRFTV6VBVO2WUA5NXLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear Mr. Sakamoto,

no problem at all -- have a nice vacation.

Kind regards,
Michele Perrone

On 18/08/23 15:13, Takashi Sakamoto wrote:
> Hi,
>
> Sorry for my late reply, but I'm in short summer vacation in my country
> side (less connections to internet). Would you please wait for any
> reaction within a few days.
>
>
> Regards
>
> Takashi Sakamoto
>
> On Wed, Aug 16, 2023 at 03:05:36PM +0200, Michele Perrone wrote:
>>     Dear Mr. Sakamoto,
>>
>>     since we are not discussing about the patch anymore, let me reply to
>>     our
>>     open threads in a separate message.
>>
>>     On 08/08/23 17:25, Takashi Sakamoto wrote:
>>
>> As a policy to maintain current ALSA firewire stack, any code for control
>> function is out of kernel land, thus your AVC function can not to be
>> merged to Linux upstream as is.
>>
>> I think the most convenient way is to provide source code for the
>> AVC function to me. Then I re-implement it by Rust language for
>> snd-dice-ctl-service program. As long as interpreting original code, we
>> have no license issue for the new code.
>>
>>     That is very kind of you. You can now find our current AVC code in the
>>     following public repository (branch 'avc'):
>>     [1]https://github.com/weiss-engineering/snd-dice/tree/avc
>>     If you have questions about the code, also on the firmware side of
>>     things,
>>     feel free to ask.
>>
>> But As a first step, I would like you to assist my support for DICE common
>> controls in your models.
>> I need the `clock caps` and `clock source names` fields to implement the
>> common controls for your device in snd-firewire-ctl-services.
>>
>>     You can find the `clock caps` and `clock source names` fields for all
>>     our Firewire devices below. As I currently do not have access to our
>>     Firewire hardware except for MAN301, DAC202, and INT202, for the
>>     remaining devices I copied the fields from their latest firmware source
>>     code. -- MAN301 -- clock caps: 44100 48000 88200 96000 176400 192000
>>     aes1 aes2 aes3 wc internal clock source names: AES/EBU (XLR)\S/PDIF
>>     (RCA)\S/PDIF (TOS)\Unused\Unused\Unused\Unused\Word Clock
>>     (BNC)\Unused\Unused\Unused\Unused\Internal\\ -- DAC202 -- clock caps:
>>     44100 48000 88200 96000 176400 192000 aes1 aes2 aes3 wc arx1 internal
>>     clock source names: AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF
>>     (TOSLINK)\Unused\Unused\Unused\Unused\Word
>>     Clock\Unused\Unused\Unused\Unused\Internal\\ -- INT202 -- clock caps:
>>     44100 48000 88200 96000 176400 192000 arx1 internal clock source names:
>>     Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\U
>>     nused\Unused\Internal\\ -- INT203 -- clock caps: 44100 48000 88200
>>     96000 176400 192000 aes1 aes2 arx1 internal clock source names: AES/EBU
>>     (XLR)\S/PDIF
>>     (RCA)\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Un
>>     used\Internal\\ -- ADC2 -- clock caps: 44100 48000 88200 96000 176400
>>     192000 aes1 clock source names:
>>     AES12\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Un
>>     used\Unused\Unused\\ -- DAC2/Minerva -- clock caps: 44100 48000 88200
>>     96000 176400 192000 aes1 aes2 aes3 arx1 internal clock source names:
>>     AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF
>>     (TOSLINK)\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unuse
>>     d\Internal\\ -- Vesta -- clock caps: 44100 48000 88200 96000 176400
>>     192000 aes1 aes2 aes3 arx1 internal clock source names: AES/EBU
>>     (XLR)\S/PDIF (RCA)\S/PDIF
>>     (TOSLINK)\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unuse
>>     d\Internal\\ -- AFI1 -- clock caps: 44100 48000 88200 96000 176400
>>     192000 aes1 aes2 aes3 aes4 adat wc internal clock source names:
>>     AES12\AES34\AES56\AES78\Unused\ADAT\Unused\Word
>>     Clock\Unused\Unused\Unused\Unused\Internal\\
>>
>> In my point of view, we need to decide license under which the file of
>> configuration ROM image is public. I think CC0[0] is bette for our case.
>>
>>     I have created a pull request in takaswie/am-config-roms with three ROM
>>     images: MAN301, DAC202, INT202. I cannot extract the remaining images
>>     at
>>     the moment, because I do not have all Firewire devices available. I
>>     will
>>     add the remaining images as soon as I can get my hands on them.
>>
>>     Kind regards,
>>     Michele Perrone
>>
>> 参照
>>
>>     1. https://github.com/weiss-engineering/snd-dice/tree/avc
