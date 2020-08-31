Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 576EA258CA4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139E117B9;
	Tue,  1 Sep 2020 12:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139E117B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955652;
	bh=CXAdQMOSMaK7LUZusVC5fX5N4ydvlE6Hxnp5qeMEIM4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IkqYzNyl4zQJe4wj7KFNYsOcqZWQ+jS63N874+fJcE2BB2ZpaBdVJz62bBM40WHmx
	 TJzY5fQx4lBBDR0rK/IrbXrAB3owigxetqpCcipqe0LdUkzdidJ9ZrcBS6rUzMlAP8
	 643QyGdy4Va156AErL5hWNKDg3yfBff+n/oTD9Lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D43F802F7;
	Tue,  1 Sep 2020 12:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 265FAF80212; Mon, 31 Aug 2020 23:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A0F6F80096
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 23:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A0F6F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=fraction.io header.i=@fraction.io
 header.b="F13X7hIc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fZhrX/ii"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B9A5FA42;
 Mon, 31 Aug 2020 17:55:32 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute3.internal (MEProxy); Mon, 31 Aug 2020 17:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fraction.io; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm2; bh=BsjVqyEaGVEh4rNqDwV6ejSNuQA3xw/Gxt4roGvrd/o=; b=F13X7hIc
 Nn27rPIW+sAK0+5sYXJoPX/huj0biQd3VTLWxZZc8T2GW8Y9WvxR4iWZ16b/GtBW
 W++3pWTW4gvo0LE3pRP5Xzt1XlgKUoHNPIbmEpnUN2LW/JrRlzClozEIjWqTQ2MF
 7mbimsXO6qRIW3LG2UQbhR5ZWFpbBZWhdYnNoMCD2xI9LIT0q9Sh5jsyFrYL8YKY
 3SyyvsaZsaNmct2I1NzSD3C2EYfd4ENh7kBGJngPcB29RO9KOtWWwF6aegbl+Fq5
 CSS4cc2MNYZ7dADsS4zDm+2TambtIuCh2I8c2m4Ai8+ORliu1AjmZmOK/On9F1eH
 xNkzahB+9431Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=BsjVqyEaGVEh4rNqDwV6ejSNuQA3x
 w/Gxt4roGvrd/o=; b=fZhrX/iiNvfidrY3F6cC+GjrMEhDdc3qEa1+E6V8HUWiL
 TXRPsVNRZmoTxKfJCfZUv+h9Ch7wxgw6d0+tVrwFgS0GJv8j7NGBum/npExbw4cd
 7QRPg6m4qeChof9VVWKpHeiPACGzYvq8uCSLjP5XAm1EEwf/dhZ0mosIQkQKhRfD
 LO3BHqAIB0Xp3WywPu1EAMPvHuMG1XPq8FmJDGzaCZSLi+RHTPUJqPP/sSc0Dkkm
 MyGcywAHmj6jLEMuKT9xK+iaRWL/Oskk6nY59vRGPYyg+2l8NXkYB6PLlpDJrhcW
 sbcC5jOIl+96ayOEPEN3sgJBBFmrqNwKwOvVX99/Q==
X-ME-Sender: <xms:03FNX58xaVcKtvZ1DU_R6haDqvQ0wgwQkzyrL5kq6S2KfaC5kHv9Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefiedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erreejnecuhfhrohhmpedfvehhrhhishhtihgrnhcuuehunhguhidfuceotghhrhhishht
 ihgrnhgsuhhnugihsehfrhgrtghtihhonhdrihhoqeenucggtffrrghtthgvrhhnpedtge
 ekleduffdvvefffeeljeetffeffeffleettddtvdehledvuefhteevgfeuheenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheptghhrhhishhtihgrnhgsuhhnugihsehfrhgrtghtihhonhdr
 ihho
X-ME-Proxy: <xmx:03FNX9sW6aJRfziYfXtR65fiKw2NRlTH31mN2JiLT0l-v5wtdUlpgg>
 <xmx:03FNX3DVC7s4YYKsJjAeo6BknQqVsaJzfTey06SgD3J_8fWU2Zdj4A>
 <xmx:03FNX9fs723krUbOOoFRq1p1fBqbElV8T3n-9HuNnKsupLwUD8LMPA>
 <xmx:1HFNX7rbe2-0z0dNvvwXLK11X0d9O5YdAivwcO4-ShyT1vy3swgLkg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4D9AEC200A5; Mon, 31 Aug 2020 17:55:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-232-g4bdb081-fm-20200825.002-g4bdb081a
Mime-Version: 1.0
Message-Id: <9bc5b3ac-87a0-4d7c-abfd-2407db90d310@www.fastmail.com>
Date: Mon, 31 Aug 2020 14:55:10 -0700
From: "Christian Bundy" <christianbundy@fraction.io>
To: alsa-devel@alsa-project.org
Subject: =?UTF-8?Q?[bug_report]_'ASoC:_Intel:_haswell:_Power_transition_refactor'?=
 =?UTF-8?Q?_and_PulseAudio?=
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
Cc: cezary.rojewski@intel.com, yang.jie@linux.intel.com, zwisler@google.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

After upgrading to Linux 5.8 I discovered an audio issue on my device that was introduced in 8ec7d6043263ecf250b9b7c0dd8ade899487538a [0]. I used 'git bisect' to identify the commit that introduced the bug and have confirmed that reverting the commit resolves the problem

Reproduction:

1. Play any audio via PulseAudio.
2. Observe that the audio output is fuzzy and choppy.

I can use programs like mpv to play audio without PulseAudio, and the audio is fine, but as soon as I open a process that uses PulseAudio it will ruin the audio output for all processes (including mpv) until I reboot.

I'm using a 2015 Chromebook Pixel ("Samus") and have confirmed this problem with a friend who has the same device.

Is there anything I can do to help debug this instead of sending a patch to revert the commit?

Relevant lspci output:

    00:03.0 Audio device: Intel Corporation Broadwell-U Audio Controller (rev 09)
	Subsystem: Intel Corporation Broadwell-U Audio Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 50
	Region 0: Memory at e1218000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee00378  Data: 0000
	Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag- RBE- FLReset+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=8ec7d6043263ecf250b9b7c0dd8ade899487538a
