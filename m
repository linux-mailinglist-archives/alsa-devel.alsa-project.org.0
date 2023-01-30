Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61A680EAA
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 14:20:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3470ADFA;
	Mon, 30 Jan 2023 14:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3470ADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675084831;
	bh=QcQlqZHKk4qDtuJOPV+15pv+69eXptoI8toP/4GFGUY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=twanMXZrWvcgTS+s5ZVkYiEq+ulR7RpbvsVuztVcZoBhT6EEklGdyf5UaTDpzd31k
	 E2y53ZdYrArBnuWxebhqENW7ffcWJqURR12Gk9JYXLhvIxLnFgae4wj3Nl+VeEpz5k
	 9VAWkhjFeSAsZGioKtt/x9feGqQMPLXuE1LdbD5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D58DF8007C;
	Mon, 30 Jan 2023 14:19:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E270F8032B; Mon, 30 Jan 2023 14:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B4BF8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 14:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B4BF8007C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=fK0RmXdx; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=sSr16hIE
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B9BA45C028A;
 Mon, 30 Jan 2023 08:19:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 30 Jan 2023 08:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1675084757; x=1675171157; bh=XT
 d7WUXVhTCu43w9oij1RLz0kvp4yYp/n7sWFtTgDAY=; b=fK0RmXdxCCHT5pbLwV
 fDYQCWoBEeoHmuE/SRntVqhF6XaSw3bbBFrOZWIac9K/2ni1N4qGkeohVbw3DIB+
 YayOYVdg+j8krIeSSzGqqOT9Ydrk8rVMrjMpQ/Ra0RpiODWfgZ/vjQJZduUcwlTn
 WytwRyZB6aV5r1XtwVm04EaMPnbfhj7aE/E/+8GyrZcvk2HIqoGtJmtrlJf34eOh
 g5Js9YOwi8fiRUSzBQlbcLZOnzXvXQnNMFO9Ce5+MDv6XX7+FhJ2hVo2jRQ5Ftpk
 SN0L60iukXWK94wm/qRsl/gxpXizaRhmlSIYBOQMQXOw9HxALC8N5p5kcNNAq3+Y
 wwJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675084757; x=1675171157; bh=XTd7WUXVhTCu43w9oij1RLz0kvp4
 yYp/n7sWFtTgDAY=; b=sSr16hIEbImAwYl+kj32yxgmd7DIOVsS94PdLyq/NWpd
 TrITxnflWHeavTv8Al4T2tHITDvbYIA+r6o5BqUPuHCt26RsU4rgpS851wu4Ru+6
 mfgqbMRF+iQnLIrFIkG0OIAjp/tntzYazZv/3DMA5VASKzRe4B7HS/NHDBQiJISs
 zxuJJFGvBxvqyAnkfMHhVzhwWBqELOlmNXPpk0CG3tKVuh8hWocqPmHM1n3tNCMC
 YTLzWtOMr+Wg4X6deyMwZuL1svzOli+1bb8ivPHbn2c02toYn3zFhENlPVtFrZDX
 gCGB5eNGcZyhaAD8+wtt/alcQjW63UMSl0to0KiBbw==
X-ME-Sender: <xms:1cPXY0PQ55M92VGIUSGYF9zKkCfwXZVR6C1UZDaac4KCSXkyqSxZWg>
 <xme:1cPXY6_6iZ7XqYHeFVmmaod_SCISbgZSoc66bBfLyIGSWo1cg7vKuvO6YWlob3i78
 x35z85_A6Lnxa5unDQ>
X-ME-Received: <xmr:1cPXY7ROrUo0DdJ7GdTPVnxzMpon9uG51l-aVq48op5F6Sp5olyL7moP0pOGjz9hImVaBkArbMgHkwXiqajvhTBzntKR5i9-_9k7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepueeiueevleefvedttefgvdeutdekveduheevffdv
 hfeluefhgfdtgeeutedtudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
 hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1cPXY8umU2s7OqC1g5pzVOHe-svum_zm8PJaZfjKi0QeWkiFQimTnw>
 <xmx:1cPXY8cq4OOFPXkMyiOEW6QBy0dlQgZoItxY3IX5RRyWp32CjnPLRQ>
 <xmx:1cPXYw2dO-8HgUWauZr8Ts-cB6-KSSKqxliQwIUbHy4YpGD4-KLLqQ>
 <xmx:1cPXY4GgDhb7FleY8cu0DcjNK9ZGNrxJcMOV7BVPdYDlBqN3yj7VEQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 08:19:16 -0500 (EST)
Date: Mon, 30 Jan 2023 22:19:12 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "M. Armsby" <m.armsby@gmx.de>
Subject: Re: Firewire Phase24 Motu help
Message-ID: <Y9fD0Nzg+bwKsDEZ@workstation>
Mail-Followup-To: "M. Armsby" <m.armsby@gmx.de>,
 alsa-devel@alsa-project.org, perex@perex.cz
References: <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

(C.C.ed to administrator of alsa-devel mailing list)

On Mon, Jan 30, 2023 at 12:40:06PM +0100, M. Armsby wrote:
>    Hi Takashi,
>    I'm writing direct because I cannot seem to get a post on AlsaDevel
>    list.

I've realized your two posts, but no reaction since they have no message
body:

* Firewire ALSA Motu and Phase24
    * https://lore.kernel.org/alsa-devel/sokos1-r6xj933yn42y-hmy3gsrfgsma-mnwe9a-cahiug-3btbiljo1il7-8lhisz-trzq63b9es27-41z6o2wylkgf-tjvaeo3olqkz-elr571-us6u4977mlo1-p2gxkncmroem-foujcu-jg85lg-sqi612.1674640678660@email.android.com/
* Firewire Motu ALSA (Re-post)
    * https://lore.kernel.org/alsa-devel/v6inx6-fwmr0r-kvajcd-kfs8u9l6m2qn2cnogd-2odpkz-d7vadu94fw76-iv1ohfsnh0nxdhq3hl-irmx6t-3alyitjtt3oq-m2jt5z8uktj3-1khriq-w6pr0c-bitxl26qa5mx-sc4dcno22ycq-2x7a4f.1674740730928@email.android.com/

Jaroslav, would I ask your opinion for the problem which perhaps dropped
the message body from his messages?

>    I need to repair my two Phase X24 (defekt caps?) and I'm having
>    problems with Traveler and other Motu interfaces on Linux.
>    Thanks for any hints or where I should post.
>    Here's  a copy of my post:

>    Hello everyone!
>    Thank you for all the hard work on this.
>    Especially Mr. Takashi Sakamoto.
>    I'm an experienced studio engineer and was a Beta tester for Samplitude
>    for years.
>    Not a programmer and have very little experience with Linux.
>    So please excuse me blundering in on this professional programmer forum
>    but I'm hoping my experience will help somehow to find bugs. I'll
>    provide any information I can or test following instructions.
>    I really would love to completely change over to Linux but I need
>    reliable drivers.
>    How can I help?
>    Here's my experience so far.

>    Around November I started testing Linux for audio as I have
>    occasionally over the last years. I was pleased to find Manjaro and
>    Sparky would detect Traveler Mk1 and Mk3 and to run so efficiently
>    compared to Win10.
>    But things would freeze.
>    Reaper has a long standing Midi bug so it was difficult at first to see
>    why my laptop would freeze on occasion.  I dissabled hardware midi in
>    the software.
>    Then I updated Sparky beginning of December and to my surprise Firewire
>    didn't work anymore. The Firewire stack must have been removed.
>    I use:
>    Dell Laptops 4310, 6510, M4800
>    Tested platforms Ardour and Reaper using Pianoteq 8
>    No JACK
>    Manjaro Kernel from 6.0 rc4? and 6.1.1 work for a limited time.
>    Sparky only works with special kernels Xanmod1 6.1.7-x64v2 but the
>    audio is completely distorted.
>    CachyOS Kernel 6.2 rc4 sounds good.
>    Common problem is freezing or loosing audio. Ardour is less sensitive
>    than Reaper but Reaper is far more efficient on CPU
>    (20% compared to 90%and more with one instance of Pianoteq 7 or 8)
>    Motu Traveler MK3 and MK1 wrong channel assignment from 1+2 (3+4 are
>    actually 1+2) and freezing or just loosing audio.
>    Motu 896Mk3 Hybrid not recognised in firewire or USB mode.
>    Shame cause its the best.
>    Motu 8pre working similarly.
>    Phase 24 working much better but still freezes or looses audio after
>    long period.
>    Tested in Ardour and Reaper.
>    I hope that's not too much at once.
>    Martin Armsby
>    M. Armsby

Thanks for the report including many issues. I apologize to trouble you.
In my opinion, the issues are not so easy since each application uses ALSA
PCM device by slightly different ways. So we need to investigate the
issue step by step to take relevant longer time than easy issues.

Before discussing about the issue, I need to ask a help about MOTU
devices. As you realized, 896 mk3 is neither supported yet, FireWire only
nor Hybrid, in IEEE 1394 bus nor Universal Serial Bus. For example, you
can see no entry for the device in module device table[1] in the file
which consists of snd-firewire-motu driver.

The reason is apparent; no one provides information enough to support
it. Then I would like you to help me to integrate for it in the case in
IEEE 1394 bus.

I maintain a remote repository for my collection of configuration ROM
image which includes identity information of each node in IEEE 1394 bus[2].
The information is useful both to make the entry of module device table
and to make hardware database[3] in systemd project.

When 896 mk3 Hybrid is connected to IEEE 1394 bus and only connected to
the bus, Linux FireWire subsystem detects it as '/dev/fw1'. Then the
rom image is exported to an node on sysfs. You can retrieve the content
by the command line below:

$ cat /sys/bus/firewire/devices/fw1/config_rom > motu-896mk3hybrid.img

If retrieved successfully, please send it to me. I don't mind to receive
it to private message, mailing list, any upload services.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/firewire/motu/motu.c#n162
[2] https://github.com/takaswie/am-config-roms
[3] https://github.com/systemd/systemd/blob/main/hwdb.d/80-ieee1394-unit-function.hwdb


Thanks

Takashi Sakamoto
