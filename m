Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD42894BBB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0983623E0;
	Tue,  2 Apr 2024 08:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0983623E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040433;
	bh=+OIjmq/msMJ1nthLx4ArprFpl/aIBuVdUAwqkFQH2wY=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ez7J8SlXxzCURfPFJhcHc04ANrnOlMYRczov4xloPYpfd/UQyGsoNHAXjsNxdAjjg
	 8LdNQqdwaA7DD1qUoF5h63lUZU2K8qrFXSjy+7iu6y5arQtiylYJDTi+cAx292awFm
	 6BTAcN1zZ2s+jUx+v2Oo8eJQrwNH3y/cAvuU6at4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF0CDF805D4; Tue,  2 Apr 2024 08:46:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E90FF805D3;
	Tue,  2 Apr 2024 08:46:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F0A8F805E6; Mon, 25 Mar 2024 17:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6BA9F805E3
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 17:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6BA9F805E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256
 header.s=fm2 header.b=PBhkAZJz;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nOFe9GT9
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 48DB4114015F
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 12:14:15 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
  by compute3.internal (MEProxy); Mon, 25 Mar 2024 12:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1711383255; x=1711469655; bh=wEyO9FDH4khOoC/BG1WNRgZjHYfO2Koa
	+qfLwIMgQXo=; b=PBhkAZJzYlXZoszK5y9QfhpNn1HtW1Ey1T+WpzWVEBK+FDkS
	pigYx31ImzPpvGGS/lmfquQhTUKe/H9SNt/D3hDLSJBvfehggkEEoRzKj18h8Grs
	eIGuSKAxzOLlvpt28RwQVI8BHN8LilSKoREVfu6wLvuHBQTNPbWSz3RHv52VzHRT
	hvbYdTErVRKMz6Q39Q3x/Z/jp1UIHRN6Cd9XDTxkqqQCjZ9pFqco9r+/MdCuclxc
	Dny45pn587ODamLA5RMHd9+08JMBFRASDR2nzT0ss+5nmWvcVo2eMv/pGaEmKopk
	wZAy/5YX2tbNOdnJfoBs2nsvoP+h00AaGsjWug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1711383255; x=1711469655; bh=wEyO9FDH4khOoC/BG1WNRgZjHYfO2Koa+qf
	LwIMgQXo=; b=nOFe9GT9f0X1Yhfv+74aYiYf90Rp2OOWbFmRiLyYpugcPdn1sQy
	OP0AD4WLXAU7/2umwxYF30C3YRW9P26jaUeEyB99PG49tWNlSgsri+IR5xv1fWuz
	lA3nMjFk7kKRbkoW7fI09DfuCHSoE1cdamJqkPIoVzx8KHXS37VzxkvblICBQ4w2
	9Pox0fIgof6qNJl0RKwqrrU+3A6hdj1b1VaLij6Z/zvh5XpdgZjpD8qzp4iNaYsy
	sdy8qetWRjKxmk9nfNRwm7AN7L8ByORh2V9JPjHZikWYo3AgEcuFncc0/M8xqeMl
	tlTJ6ixVVJszRGU6s2yzt0CW9CGhvSJ3Dvg==
X-ME-Sender: <xms:1qIBZgh06_D6FV60_aRsvIk3OW1aafPM1FDtyc5eH9Gns1QbEggGRw>
    <xme:1qIBZpCz1U1ChccfDW8cU_BKat9ftpVNklGLnJiVCUb7vAYqdV-ioj_eEje-RQ-vI
    OSAfQeeGBU2yHhMWA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrudduuddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedftfhosggvrhhtucfjohhskhhinhdfuceorhhhohhskhhinhes
    fhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuvdefuedukedute
    dvjeetvdeigedttdetheelkeeghfelgeelgfeujedtjeenucffohhmrghinheprghlshgr
    qdhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhhhohhskhhinhesfhgrshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:1qIBZoEscYNsNLSNkjDgOdXkODO1kTOYK-2wYEOPe5w_ut3uxDBGNg>
    <xmx:1qIBZhRF-86D5W2fzZcmHU9buaYdOUWTPutnaOTSkn6gsBuxrwElbg>
    <xmx:1qIBZtwlwCOKaeXYnUwlOQbboYM-qFZ2itU4UV0F62E4RaqyMCmI8w>
    <xmx:1qIBZv5iigpGO9e9tFGh_wHfGliSwhX8LQWGA-oYfR4IbFSt9aKI5w>
    <xmx:16IBZupehkEiOwd7PtuIhQqS_aCqLAll-P8oaqDZWzW4r6NVsHOpSQ>
Feedback-ID: ib8714271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9CEF4BC0082; Mon, 25 Mar 2024 12:14:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-332-gdeb4194079-fm-20240319.002-gdeb41940
MIME-Version: 1.0
Message-Id: <5266542c-3f18-41ad-b57c-395e9c57f655@app.fastmail.com>
Date: Mon, 25 Mar 2024 12:13:54 -0400
From: "Robert Hoskin" <rhoskin@fastmail.org>
To: alsa-devel@alsa-project.org
Subject: alsa-info uploads re periodic sound failures on P16 w/ Mint
Content-Type: text/plain
X-MailFrom: rhoskin@fastmail.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BPE2QKCADVUH63IOGCM62VBIKAGL56OY
X-Message-ID-Hash: BPE2QKCADVUH63IOGCM62VBIKAGL56OY
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:46:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPE2QKCADVUH63IOGCM62VBIKAGL56OY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Greetings!  

The alsa-info output links below is from a Lenovo P16 Gen2, running Linux Mint 21.3, with an intermittent sound problem.  

The problem is that: 
Sound will be available from either built in speakers or headphones, perhaps for several days after a startup, but at some point will fail, with both Headphones (via jack) and internal Speakers disappearing from the "sound" app, and "Dummy Output" appearing in their place.   If it's possible to reproduce this failure, I haven't figured out how.  It happens when it happens, usually after a few days of uptime. 

I've found that sound can be restored with "sudo alsa force-reload", so I do have a workaround.  

*** For before-and-after comparison purposes...
***
This report was taken when "Dummy Output" was shown in the Sound app:
http://alsa-project.org/db/?f=4ec46710d176deb77fcdd950520eaafc4c9db1c3
***
This report was taken after a "sudo alsa force-reload", which restored both headphones and speakers to the Sound app"
http://alsa-project.org/db/?f=3832b192eaa22ea4d51b0e6073f389318b983356
***

In the "System Reports" app, there are no crash reports shown.

BUT... In the system logs app, I did find some lines in the Hardware section that may be relevant:
09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_prepare on 0000:00:1f.3: -22
09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_prepare on 0000:00:1f.3: -22
09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: error: set pcm hw_params after resume
09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
09:41:50 kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -22

I really have no idea whether I'm submitting this in the right place or not, whether this is a kernel problem, a driver problem, a config problem, or whatever.  I can tell you that this Mint install is new on a new machine, otherwise well-behaved, with subsequent updates that have not changed this sound behavior.  

Hope this is useful to you, love to have it fixed.

Thanks!

- Bob


-- 
  Robert Hoskin
  rhoskin@fastmail.org
