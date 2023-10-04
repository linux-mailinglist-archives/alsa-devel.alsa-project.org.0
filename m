Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCA7B98A1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 01:17:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F764A4A;
	Thu,  5 Oct 2023 01:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F764A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696461467;
	bh=bNYCeV4+N3kFQbj/JIQgj/UbJ4NBwFqR13AJBx9EryI=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z40zZoc8w54NtS10S5Ge9jhO9vJa18q4PcA5/vJ6UUVGV0/J70yjlNksIzMZaB6Ue
	 0MCGxH9LFoOqOGNpJv6aAmQUjFWAoVzmmF5UQFXizTRT+r7qGZxN5Lq3aNBXIVSj3M
	 xbMqgCvlDdZQjgHLGnTEvO1TCh7h1pmbJvQaoFz4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72DCEF80551; Thu,  5 Oct 2023 01:16:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C43FAF80310;
	Thu,  5 Oct 2023 01:16:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 229B1F8047D; Thu,  5 Oct 2023 01:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12366F80166
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 01:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12366F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net
 header.a=rsa-sha256 header.s=fm2 header.b=BWHzOQwB;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rqSMR/lQ
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CAE943200A28;
	Wed,  4 Oct 2023 19:15:54 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Wed, 04 Oct 2023 19:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1696461354; x=1696547754; bh=uUkiegyyK/lntvNpIzWSoeP6zNCwtt1mOVQ
	cmRDl8d4=; b=BWHzOQwBznU8UH44SRtcDi2DThbGciN63DklNG1jHjohzglnqdF
	GxDHQclCOyVmMpVn8lY9qRNp0U8t1pkQkwB94efwa+ZGD7IuFQ7VtBrm5fJRx/q/
	n3GikvpX4LIIOj19rUohf4pyZ3L0JYHnOiIpqEkof/ILeZ3O2YPiohZDN+6ZcR9u
	Ww5pYXmqFtOi9icHoHduisU8yVmv037Qh9X5bzusMSDpiO8tOPmfpY2FJs+BC72f
	798SaLiZ2pF+fTXHzLAtfbZFZ05kdndxkq7qEygL/9e5dYtjOsNY/xeBJ6v5aH5L
	PSh3GvcnpprncaeciHR/M/hw7Hb7r4XwtRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696461354; x=1696547754; bh=uUkiegyyK/lnt
	vNpIzWSoeP6zNCwtt1mOVQcmRDl8d4=; b=rqSMR/lQmAIEwAvMaD1NffKs/jMO4
	juNPYcvu0UQhnE9BU3N4EVokWl6mK7t//mhfa3uiFA4WBrM4wdc4qiYGbklRQZYl
	3w/joKanSETqZUWObnuJK2zmYdji12zcgl05NMivlE5ZWJg+GZNp+hKE615eXsdr
	U6Tc8W+WlmziQopT9ijuS+wTWHkVEDDBE6HaNJsHsCNeNnY11KGTIfRlZnnqUHP0
	qVjamOORc8rBJwjCAoNkrqlgDPUcSHpqTE/xuIvlgOV7Co6NvdOepNuUtZnS1zMS
	kWnNdxG4Bhbx43LQJBKlwu/zXSPV2U/J+JRs4CAHFWfleSIO9C/JAntEQ==
X-ME-Sender: <xms:KfIdZfKbt-Bhzug4GtTSx9N3fHSCtEHNnUZtmPJmRnRNJbCP81Pq4A>
    <xme:KfIdZTLuVouye-7F6rQnGopnbVPtVX_CCyJ6CWoCkhVQoANhuLb9OBJ7GknkEe79h
    HHCX_-jTWKcGSoqSQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrgeefgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhu
    nhcutfgrghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqe
    enucggtffrrghtthgvrhhnpeevfeegiedvhfeuffdtffdufedtkeehuedujefgleettdei
    tdektdegjeehjeekheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvght
X-ME-Proxy: <xmx:KfIdZXuvfFecj9ByS32MZdu-ikbOz2HpkW3p4lEXZFeeR7QxLDo0zQ>
    <xmx:KfIdZYalBvpZfMUFbD7WDWvI-LMPpW5oXdHGycDTnC9Z4PjleIfrpg>
    <xmx:KfIdZWaiVnVRSkJ40IEXQIQkJfQsngILLQvqZWNQgABTVOf7b7FZQA>
    <xmx:KvIdZdz_qcCPebgpg9VyZg9LzvCvXMPY71cw5YQCxezBOjCMy66XLw>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F193A234007E; Wed,  4 Oct 2023 19:15:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <2504b014-08b2-4f39-83f6-5072b5ec4ea8@app.fastmail.com>
In-Reply-To: <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
 <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
 <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
Date: Wed, 04 Oct 2023 19:15:32 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Pavel Hofman" <pavel.hofman@ivitera.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "Julian Scheel" <julian@jusst.de>, "Takashi Iwai" <tiwai@suse.de>,
 "Ruslan Bilovol" <ruslan.bilovol@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
Content-Type: text/plain
Message-ID-Hash: DCXBGB4AXXNBCOX456THLO76I23CKKSP
X-Message-ID-Hash: DCXBGB4AXXNBCOX456THLO76I23CKKSP
X-MailFrom: arun@arunraghavan.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCXBGB4AXXNBCOX456THLO76I23CKKSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023, at 3:09 AM, Pavel Hofman wrote:
> Dne 21. 09. 23 v 3:30 Arun Raghavan napsal(a):
>> Hi folks,
>> 
>> On Fri, 1 Oct 2021, at 8:38 AM, Pavel Hofman wrote:
>>> Hi,
>>>
>>> Dne 08. 09. 21 v 10:21 Pavel Hofman napsal(a):
>>>> Hi,
>>>>
>>>> The current audio gadget has no way to inform the gadget side that the
>>>> host side has started playback/capture and that gadget-side alsa
>>>> processes should be started.
>>>>
>>>> Playback/capture processes on the host side do not get stuck without the
>>>> gadget side consuming/producing data (OUT requests are ignored in
>>>> u_audio_iso_complete, IN ones send initial zeros in their req->buf).
>>>>
>>>> However, playback/capture processes on the gadget side get stuck without
>>>> the host side sending playback OUT packets or capture IN requests and
>>>> time out with error. If there was a way to inform the gadget side that
>>>> playback/capture has started on the host side, the gadget clients could
>>>> react accordingly.
>>>>
>>>
>>> I drafted a simple patch for u_audio.c which defines read-only boolean
>>> ctl elems "Capture Requested" and "Playback Requested". Their values are
>>> set/reset in methods u_audio_start_capture/playback and
>>> u_audio_stop_capture/playback, i.e. at changes of respective altsettings
>>> from 0 to 1 and back. Every ctl elem value change sends notification via
>>> snd_ctl_notify. The principle works OK for capture/playback start/stop
>>> on the host, as monitored by alsactl:
>>>
>>> pi@raspberrypi:~ $ alsactl monitor hw:UAC2Gadget
>>> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
>>> node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
>>> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>>> node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
>>>
>>> However at enumeration the USB host switches both playback and capture
>>> altsettings repeatedly, generating "fake" events from the gadget side
>>> POW. The host even sends regular-sized EP-OUT packets filled with zeros
>>> during enumeration (tested on linux only for now).
>>>
>>> Please is there any way to "detect" the enumeration stage to mask out
>>> the "fake" playback/capture start/stop events?
>>>
>>> The attached patch does not apply cleanly to mainline u_audio.c because
>>> it's rebased on other patches not submitted yet but it's only a
>>> discussion inducer for now.
>> 
>> Resurrecting this one -- is there any input on how we want to deal wit letting UAC gadgets know when the host is sending/receiving data?
>
> The current version uses the Playback/Capture Rate alsa ctls with 
> notifications 
> https://lore.kernel.org/all/20220121155308.48794-8-pavel.hofman@ivitera.com/
>
> Example of handling is e.g. https://github.com/pavhofman/gaudio_ctl , 
> the controller is being used in a number of projects, mostly DIY.
>
> Recently Qualcomm devs have submitted patches for alternative approach 
> using uevents 
> https://lore.kernel.org/lkml/2023050801-handshake-refusing-0367@gregkh/T/#mcd6b346f3ddab6ab34792be0141633bb362d168f 
> and later versions. The detection is identical, monitoring change in 
> altsetting from 0 to non zero and back (methods 
> u_audio_[start/stop]_[capture/playback]), just a different means of 
> communicating the events to userspace.
>
> Both methods (using the same principle) suffer from not knowing what's 
> going on the host side and cannot differentiate between player really 
> starting playback vs. UAC2 host driver or Pulseaudio shortly checking 
> device availability. That's why the gaudio_ctl controller can debounce 
> the playback/capture start 
> https://github.com/pavhofman/gaudio_ctl#debouncing . But that is just an 
> ugly workaround...

Thank you for the links, Pavel! This all makes sense.

I guess the uevent mechanism is more "general" than the ALSA ctl for clients that want to plug in, listen and do $something. Not sure if there are other pros/cons of either approach.

I wonder if it might not be good to have some debouncing in the kernel rather than having every client have to implement this.

Cheers,
Arun
