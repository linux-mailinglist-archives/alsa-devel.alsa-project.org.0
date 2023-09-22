Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A97AA9D4
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 09:11:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E606DDF4;
	Fri, 22 Sep 2023 09:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E606DDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695366706;
	bh=E7qTeQvG+VsEQSWTs5jOYmqzdrkrv2hPDom7F2xtE1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LRfauWwgauSSaqRSAjndBRCVdUMQDhWvdg6mHNsMVViS76RM3GIrosVxWKox360lJ
	 mRCn2n1iXtsB9efDgpEWxEPyIyOFOlZkPKY9vVE7a5nbpSg3JH1uYY2BwUdgElWzXm
	 kcKUDcVzBL5aghbbuXKxnN8crHPfx64PnqQrPvwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87A6FF801F5; Fri, 22 Sep 2023 09:10:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 794CBF80125;
	Fri, 22 Sep 2023 09:10:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EDFCF801F5; Fri, 22 Sep 2023 09:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.insite.cz (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11DF9F800AA
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 09:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11DF9F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=qIayzXgj;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=NpZ3RoSV
Received: from localhost (localhost [127.0.0.1])
	by mail.insite.cz (Postfix) with ESMTP id 4B1F5A1A32301;
	Fri, 22 Sep 2023 09:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1695366815; bh=E7qTeQvG+VsEQSWTs5jOYmqzdrkrv2hPDom7F2xtE1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qIayzXgj6sOs1eqqd7CwhZd7Ub+mNTJ7gqT3+pd4eHX5bMJu5J/wtmKprwZU29R0T
	 YE+lTczG2m9T2JDTvYNLOkhTImF1zRXByFrPKJflTYlMgb2hqPhqRSfDlfnsV3IQAh
	 h8JZd1dGuKmifdckYctokzvaM+Nyk270doKOemgI=
Received: from mail.insite.cz ([10.0.1.254])
	by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEf46MNYUTBv; Fri, 22 Sep 2023 09:13:29 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by mail.insite.cz (Postfix) with ESMTPSA id 31565A1A32300;
	Fri, 22 Sep 2023 09:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1695366808; bh=E7qTeQvG+VsEQSWTs5jOYmqzdrkrv2hPDom7F2xtE1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NpZ3RoSVIG+BBzyN1rKpTn+GFKa3gBzh/5d6n4gWaN4xQd5cfyiVQyoRutSZV1Cum
	 6M32Uex9HvS0IHQt2bAJmXwPgVrnzu7UwvQNdG7+BF7kDB1QuNQjXcs23ydD0JMEyC
	 gNBXwohLRPwE0wkjFBYGRXijUodOJLELOmLgqiHI=
Message-ID: <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
Date: Fri, 22 Sep 2023 09:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
Content-Language: en-US
To: Arun Raghavan <arun@arunraghavan.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Julian Scheel <julian@jusst.de>, Takashi Iwai <tiwai@suse.de>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
 <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4QWN6LTPSEJ5DQTDYFKNAS4VYAOXDX5F
X-Message-ID-Hash: 4QWN6LTPSEJ5DQTDYFKNAS4VYAOXDX5F
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QWN6LTPSEJ5DQTDYFKNAS4VYAOXDX5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Dne 21. 09. 23 v 3:30 Arun Raghavan napsal(a):
> Hi folks,
> 
> On Fri, 1 Oct 2021, at 8:38 AM, Pavel Hofman wrote:
>> Hi,
>>
>> Dne 08. 09. 21 v 10:21 Pavel Hofman napsal(a):
>>> Hi,
>>>
>>> The current audio gadget has no way to inform the gadget side that the
>>> host side has started playback/capture and that gadget-side alsa
>>> processes should be started.
>>>
>>> Playback/capture processes on the host side do not get stuck without the
>>> gadget side consuming/producing data (OUT requests are ignored in
>>> u_audio_iso_complete, IN ones send initial zeros in their req->buf).
>>>
>>> However, playback/capture processes on the gadget side get stuck without
>>> the host side sending playback OUT packets or capture IN requests and
>>> time out with error. If there was a way to inform the gadget side that
>>> playback/capture has started on the host side, the gadget clients could
>>> react accordingly.
>>>
>>
>> I drafted a simple patch for u_audio.c which defines read-only boolean
>> ctl elems "Capture Requested" and "Playback Requested". Their values are
>> set/reset in methods u_audio_start_capture/playback and
>> u_audio_stop_capture/playback, i.e. at changes of respective altsettings
>> from 0 to 1 and back. Every ctl elem value change sends notification via
>> snd_ctl_notify. The principle works OK for capture/playback start/stop
>> on the host, as monitored by alsactl:
>>
>> pi@raspberrypi:~ $ alsactl monitor hw:UAC2Gadget
>> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
>> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
>> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>>
>> However at enumeration the USB host switches both playback and capture
>> altsettings repeatedly, generating "fake" events from the gadget side
>> POW. The host even sends regular-sized EP-OUT packets filled with zeros
>> during enumeration (tested on linux only for now).
>>
>> Please is there any way to "detect" the enumeration stage to mask out
>> the "fake" playback/capture start/stop events?
>>
>> The attached patch does not apply cleanly to mainline u_audio.c because
>> it's rebased on other patches not submitted yet but it's only a
>> discussion inducer for now.
> 
> Resurrecting this one -- is there any input on how we want to deal wit letting UAC gadgets know when the host is sending/receiving data?

The current version uses the Playback/Capture Rate alsa ctls with 
notifications 
https://lore.kernel.org/all/20220121155308.48794-8-pavel.hofman@ivitera.com/

Example of handling is e.g. https://github.com/pavhofman/gaudio_ctl , 
the controller is being used in a number of projects, mostly DIY.

Recently Qualcomm devs have submitted patches for alternative approach 
using uevents 
https://lore.kernel.org/lkml/2023050801-handshake-refusing-0367@gregkh/T/#mcd6b346f3ddab6ab34792be0141633bb362d168f 
and later versions. The detection is identical, monitoring change in 
altsetting from 0 to non zero and back (methods 
u_audio_[start/stop]_[capture/playback]), just a different means of 
communicating the events to userspace.

Both methods (using the same principle) suffer from not knowing what's 
going on the host side and cannot differentiate between player really 
starting playback vs. UAC2 host driver or Pulseaudio shortly checking 
device availability. That's why the gaudio_ctl controller can debounce 
the playback/capture start 
https://github.com/pavhofman/gaudio_ctl#debouncing . But that is just an 
ugly workaround...

With regards,

Pavel.
