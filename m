Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44049B10DD1
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 16:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F7E86018B;
	Thu, 24 Jul 2025 16:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F7E86018B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753367970;
	bh=ncTMLajBYxZe+QgujVjoQ1Yx2NREDRb8+AeanyHqDP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aoNHeV3KO0UC84115IYLOexh52w//evXPamQf4VSfrIxYIk3S8yUpg+MZjIpV0Unm
	 oG4EopQSLV6qJzzaYXFPEzKNmgBudl/Q98fTMJeTBO07s2JgWAM0GIaxEFfooBamNs
	 vP0LktXJA5Cv8ks5s+NEKsN0ZY9e+xSKhTZ3tOpY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A8B3F805BA; Thu, 24 Jul 2025 16:38:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A9BBF805C5;
	Thu, 24 Jul 2025 16:38:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D8FF804E5; Thu, 24 Jul 2025 16:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39FF9F8007E
	for <alsa-devel@alsa-project.org>; Thu, 24 Jul 2025 16:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39FF9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=cef5Tn5K;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CnF+BMOS
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7B30C1400104;
	Thu, 24 Jul 2025 10:38:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 24 Jul 2025 10:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1753367897; x=1753454297; bh=BsKeYvQIcKuXcKkr3BdRf/lRvIoaiuZu
	EzL1jw2LjXA=; b=cef5Tn5K6jG2I9VbMEwBUn2VlhDDvz2kF9I/Y1TfVzA2yz2x
	1NQ7je2NxlAijVm/SiavGVasW3PSBPMKKYhgJljYwWbqo7bTdNaRtowEDeucZ8Bm
	DI+54r4jV3IWa3wq9UoQo4q7pNw5Ky3mnWdwjyLK3MyXe/j+Yp2jKB/tVXc86Fom
	yryJ/mJ1eyC7nAH85/P0d9263ixnMmclpPYd4eXufPF8gkQh8kCN6dVOfLpoGTYL
	T+VNchHmuEZAa665vfJI7BNy+35kxHO9nNZnW+of21lJ2uXelgmnVa4DgbNKgeSS
	3WHKDmt3hlpy6WaO18r/Ylh4RcOAJJ1aGJ0IJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753367897; x=
	1753454297; bh=BsKeYvQIcKuXcKkr3BdRf/lRvIoaiuZuEzL1jw2LjXA=; b=C
	nF+BMOSeuh7nQDoaD+aKvSo0Bh0EAM3NzFk8Vqe2UK4i3naaCf1BLBLNutkzhz79
	w1FnaMK3x5H5keDSyut7mNf40EXX2cyToj84uvvrz+Ijl8OQV/82ToVhAZIvLtqI
	r7bGHQNQFS/DjQ+f53mz5WND4vz+csXKKSWwA89CtguRZxsTezDWCHSzjuHs+sE0
	3WrbUxIdMirBGc4mM6YOhquyt5eQwMCXTB2h8x+MsTjK3fR6/bmbhbvNPmn0mdFC
	PF9BlCvnmyaFo1EwB65ylx9s4Lj0O0N7Z/ZH5xsbovLaF7rGSINLjUrltRL0lBd4
	a9rLS+AG9duMtNWAQr11A==
X-ME-Sender: <xms:WUWCaNGvXHaQUIyZUWhHePxbdZhfL_Pc6lTcHorIUWZYBEDvRWitog>
    <xme:WUWCaHmrFw2XDVmYCdBBhsYqTh8-1jrLKGfgWDqnFSmzCSauZ9cFnxzKtXOMfQYxU
    tj58VjSJhvwmcMwi8Y>
X-ME-Received: 
 <xmr:WUWCaA1YQrHAOez4gVJ06exjaRJmUpSXbRk9B2pJ5zIY4Z-_24I6jE9z7c5waHJlU9t7fjAvkaLAWfoUgEUau6ITOpFbK2Snzg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertd
    dttddunecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffgfehueffhe
    ektdegvddtvdefhfffgeeuvdffgeejvddvfffggeevieelgfekgeenucffohhmrghinhep
    rghlshgrqdhprhhojhgvtghtrdhorhhgpdgtohgtkhhoshdrtghomhdpfhhrvggvuggvsh
    hkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrdgrrhhmshgshies
    ghhmgidruggvpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvg
    gtthdrohhrgh
X-ME-Proxy: <xmx:WUWCaLQhoLpskvn7PjqvBnq3ataFtvQJHdMihiZNNKjGq72YPUyrhQ>
    <xmx:WUWCaKtaQKY8eG5U0pQQhERx-ht-JzAYIHrTX4seBIcAHWABUl2eOQ>
    <xmx:WUWCaIa6RmTdUtbrx-ifwTtQNZu7Df2ewMEs3Hs8D1YNj4mdBZSuqA>
    <xmx:WUWCaHu60QINAkeNGHsJZq9ku41hA4P38pjADIAzli3EdkBVGcXLWg>
    <xmx:WUWCaK7eJKf0biFEKCtO2uSpvNooOUyqg_D6BgNQVMPy96IDGBdyH_AQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Jul 2025 10:38:16 -0400 (EDT)
Date: Thu, 24 Jul 2025 23:38:13 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: m.armsby@gmx.de
Cc: alsa-devel@alsa-project.org
Subject: Re: ALSAfirewire broken
Message-ID: <20250724143813.GA23616@workstation.local>
Mail-Followup-To: m.armsby@gmx.de, alsa-devel@alsa-project.org
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
Message-ID-Hash: 2ZECLYFH4VR4GSYZIEQ24YZHSQUILYQP
X-Message-ID-Hash: 2ZECLYFH4VR4GSYZIEQ24YZHSQUILYQP
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZECLYFH4VR4GSYZIEQ24YZHSQUILYQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Thanks for your report and I'm sorry for your inconveniences.

On Thu, Jul 24, 2025 at 12:37:48PM +0200, M. Armsby wrote:
> 1.
> Firewire Midi was working fine with kernel 5.10 with Reaper. Then obviously a lot changed with the Firewire Stack. 
> 
> The midi output from Reaper has not changed according to it's developer - Justin. The problem is direct ALSA-Midi.
> 
> We tested the midi app from www.alsa-project.org/alsa-doc/alsa-lib/_2test_2rawmidi_8c-example.html#a0  yesterday and it freezes Debian and just breaks Arch with kernel 6.15
> 
> 
> Thread at Reaper Bugs forum:
> 
> https://forum.cockos.com/showthread.php?t=300278 
> 
> Has low level ALSA-Midi API changed? 
 
As long as briefly testing with the 'test/rawmidi.c' in alsa-lib and my
Tascam FireOne (handled by snd-oxfw) in Ubuntu 25.04 (6.14.0-24-generic), 
I face no issue addressed in the above thread.

I think it depends on the type of device (and driver). Would I ask you
the devices you used when facing the issue? I would regenerate the issue
with the same device.

Additionally, it is preferable to share the purpose of your kernel
configuration, especially to linux-realtime or so.

(I realized that test/rawmidi.c in alsa-lib includes a bug that read(2)
system call in internal snd_rawmidi_hw_tread() does not return even if
receiving SIGINT signal. The careless installation of signal handler
may causes the bug...)

> 2.
> If using Pipewire-Jack with ALSAfirewire the Reaper midi output works fine but unfortunately Pipewire adds 90ms delay when playing back through any Firewire interface compared with an onboard soundcard. 
> 
> 
> The pipewire dev Wim Tayman, says it's ALSAfirewire fault but I proved it is not - see thread: 
> 
> https://gitlab.freedesktop.org/pipewire/pipewire/-/issues?show=eyJpaWQiOiI0Nzg1IiwiZnVsbF9wYXRoIjoicGlwZXdpcmUvcGlwZXdpcmUiLCJpZCI6MTM0OTgyfQ%3D%3D
> 
> The ALSA recording and playback is confirmed by my tests to be working under 10ms RTT with Echo, Motu and Bebop interfaces. 
> 
> 
> Is this problem related to first?  
> Low level communication error? 

The 90ms delay is reasonable..., depending on the PCM buffer
configuration.

At present, all of drivers in ALSA firewire stack works with such delay
due to queued initial packet. Therefore PipeWire computes the delay
as expected. We would need to reeinvent the packet streaming engine if
reducing the delay.


Thanks

Takashi Sakamoto
