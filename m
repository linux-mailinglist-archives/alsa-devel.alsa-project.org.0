Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426F894C1A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A999423D1;
	Tue,  2 Apr 2024 09:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A999423D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041473;
	bh=iiB+ohhdGDDHn94LUJZBnmiPN6ssp8gAo+XsbDfUF4A=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iNrkw+Hdb8P9UCdJHSWqaAZ28v7KwMMBeUIsUZ4tlJwZOJuwB+i+PwUXqyZe+kxDa
	 VXqOaK5eQLJ5CaQVRZKq1tmJf6xg4zBxo0e1TOtLHy7Sc3VMdN+puPcOX42zTcFzEI
	 CEbihZcLuhsBa+JzD1AnSMvkvttuKbbRsSAiTkNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABF6FF89626; Tue,  2 Apr 2024 08:54:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95CA0F89951;
	Tue,  2 Apr 2024 08:54:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4885F8025F; Fri, 29 Mar 2024 16:06:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C2ECF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 16:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C2ECF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256
 header.s=fm2 header.b=N7OCx1+g;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=byv1MLAY
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 45A253200495
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 11:06:31 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
  by compute3.internal (MEProxy); Fri, 29 Mar 2024 11:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1711724790; x=1711811190; bh=qi+kS6GfeU
	y0wlUQxvBVRE6xdnzhloCVdn9VLnaZg/Y=; b=N7OCx1+gWjAJeAjMszGeVQxvuo
	/MwPAdmY38ZZqyj949QPUuBKR3TBmGRaLL5JA6xPW22CdFU8YAKOFyd+cD+Vf6OU
	U81lM10MnGvbLAnZYRAMDlF7UDz7pnS/yZj/j+tlC9mIWVmP+agWj+oHnkMGCCGZ
	H1zpl53z6PF66SJQxYDmaqEZcqOppaXQoJ5YDfODdmg/3XHxV2SjjiNtsaGEous4
	ugvgdUOPDINKuA0DOYyJFaefsgZa5jAHJ3Bmc/nYv7+gNfVt4N9gfeFeZdkbx4kF
	ckLEBSGNauiN2UxI55bklQjr44fhNLdpBD3Dnp55vzn4jk0w8Nimji8KcKAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711724790; x=1711811190; bh=qi+kS6GfeUy0wlUQxvBVRE6xdnzh
	loCVdn9VLnaZg/Y=; b=byv1MLAYNo4/zvbUeMefQfVRtBC/dAhbV04EdLbfo6xf
	78ucOJzwN8eRcdojMcyvA5AU4PmJiRXWAefE3rTL3ihgu9vddYg4RMtxhW0Cujht
	mcmHkLdpOrm6sxfLC4nG27t5tY4XYSxjwhlHadTyYWizoBBsOAtpl1VChpv/Ukym
	Vsjf9QOZy76cilvK1u57++Ef7XJWfi/kdghQ0IrVKs2mnI+M7uSb/ekBUJwQsfnG
	KFXtR/dBad9sHlpjVbcb0QhhJWjPBo1+2q4pW62aWhf4YUEKp8FkL87R0Oy+qUok
	77KAxR3ndXZYvfprMB/VbHTF60Orb0SrYQLoTLj0tA==
X-ME-Sender: <xms:9tgGZgJd-tzmQz_GBsaPvv6zYIyfaupwkKXDhZD0ZKxcoCoX3QlKYw>
    <xme:9tgGZgKC98cV3skLmRlqsFJoF5LnEw5Cpl6QztEB2cBU15w4JyglE_Qmio4INE2IJ
    0N0naggLrKOolL5eQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledruddvvddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftfhosggvrhhtucfjohhskhhinhdfuceorhhhohhskhhi
    nhesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeeihedvfedvfeelgf
    ehfefffeegtedvvdduhfdtkeettdfhleekjeeljeevheeujeenucffohhmrghinheprghl
    shgrqdhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhhhohhskhhinhesfhgrshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:9tgGZgt_aBDHol6Z8HigTbES5yfKgoezlkHnLloddn1DeHK5EvPwaw>
    <xmx:9tgGZtZlqcuqRZjhYQM2OJjuNbtKJmwsqssnAHXvxhap2Y4qdw8New>
    <xmx:9tgGZnZkKpomhLERdYGQ-GpOy-JIfnwLc7ZS2TiP47975kFVxI3kHg>
    <xmx:9tgGZpBm_StcIi13SPLyTqxyKAq1KU6hJrfzqxuKg7P9R9TamVTMPw>
    <xmx:9tgGZoBSRF5nWaHcJIZpswVhGnrBXjzVnYn_u62JTatLHTzfidM5yA>
Feedback-ID: ib8714271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5AC89BC007E; Fri, 29 Mar 2024 11:06:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <bfef4cde-4351-4748-b9c7-edf3868f6b13@app.fastmail.com>
In-Reply-To: <5266542c-3f18-41ad-b57c-395e9c57f655@app.fastmail.com>
References: <5266542c-3f18-41ad-b57c-395e9c57f655@app.fastmail.com>
Date: Fri, 29 Mar 2024 11:06:10 -0400
From: "Robert Hoskin" <rhoskin@fastmail.org>
To: alsa-devel@alsa-project.org
Subject: Re: alsa-info uploads re periodic sound failures on P16 w/ Mint ->
 another
 "Dummy Output"
Content-Type: text/plain
X-MailFrom: rhoskin@fastmail.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XDBP5JR2OUA662A7PMSYG5U637J6MTS2
X-Message-ID-Hash: XDBP5JR2OUA662A7PMSYG5U637J6MTS2
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDBP5JR2OUA662A7PMSYG5U637J6MTS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sent this in on Monday, haven't seen it turn up on the list yet.  To be clear, this is another "Dummy Output" problem.

Hope this helps.  

-- 
  Robert Hoskin
  rhoskin@fastmail.org

On Mon, Mar 25, 2024, at 12:13, Robert Hoskin wrote:
> Greetings!  
>
> The alsa-info output links below is from a Lenovo P16 Gen2, running 
> Linux Mint 21.3, with an intermittent sound problem.  
>
> The problem is that: 
> Sound will be available from either built in speakers or headphones, 
> perhaps for several days after a startup, but at some point will fail, 
> with both Headphones (via jack) and internal Speakers disappearing from 
> the "sound" app, and "Dummy Output" appearing in their place.   If it's 
> possible to reproduce this failure, I haven't figured out how.  It 
> happens when it happens, usually after a few days of uptime. 
>
> I've found that sound can be restored with "sudo alsa force-reload", so 
> I do have a workaround.  
>
> *** For before-and-after comparison purposes...
> ***
> This report was taken when "Dummy Output" was shown in the Sound app:
> http://alsa-project.org/db/?f=4ec46710d176deb77fcdd950520eaafc4c9db1c3
> ***
> This report was taken after a "sudo alsa force-reload", which restored 
> both headphones and speakers to the Sound app"
> http://alsa-project.org/db/?f=3832b192eaa22ea4d51b0e6073f389318b983356
> ***
>
> In the "System Reports" app, there are no crash reports shown.
>
> BUT... In the system logs app, I did find some lines in the Hardware 
> section that may be relevant:
> 09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at 
> snd_soc_pcm_component_prepare on 0000:00:1f.3: -22
> 09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at 
> snd_soc_pcm_component_prepare on 0000:00:1f.3: -22
> 09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: error: set pcm 
> hw_params after resume
> 09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc 
> failed for stream 1
> 09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 
> 0x60010000 (msg/reply size: 108/20): -22
>
> I really have no idea whether I'm submitting this in the right place or 
> not, whether this is a kernel problem, a driver problem, a config 
> problem, or whatever.  I can tell you that this Mint install is new on 
> a new machine, otherwise well-behaved, with subsequent updates that 
> have not changed this sound behavior.  
>
> Hope this is useful to you, love to have it fixed.
>
> Thanks!
>
> - Bob
>
>
> -- 
>   Robert Hoskin
>   rhoskin@fastmail.org
