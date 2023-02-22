Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442AC69F299
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 11:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35593E8B;
	Wed, 22 Feb 2023 11:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35593E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677061341;
	bh=RxA55QL3kceLXRzzYl2wYkiLirPFa6M00cJUTqj9zQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k3tK/n78mFOACYu7XtR5+a1M9edTTJfYWj+mbQPNW4J1H8ZmIHoFhd6fdjQoEtIYR
	 PREG4hNBcpLUyqSolVBaKq5Y0e/nPAzVKVmCCLsedJw9SLiOeBbGQj8Yyv2VXS5uyl
	 JhCyDsCAYslc4ZiXLbsjw0yeygx1Qf66ynExKLig=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71840F8025A;
	Wed, 22 Feb 2023 11:21:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83EA2F80266; Wed, 22 Feb 2023 11:21:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC954F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 11:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC954F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=J2iNf9KV;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Jr55O56o
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4ABDD320016F;
	Wed, 22 Feb 2023 05:21:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 22 Feb 2023 05:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677061271; x=
	1677147671; bh=RxA55QL3kceLXRzzYl2wYkiLirPFa6M00cJUTqj9zQ0=; b=J
	2iNf9KVtHTIINbvHKLG1NAd7bmZGW1m29KHyrBOhCvwQ5iB38+4atZHNY907ounL
	BstlR72sCR5c5NbLdmNCMYaBuywkS7EW931DqCcKlQoh9p44k+OZ5JXipTP68xRj
	uKwjVO1zOQP2aB4hQ5Q8Zz6sR/zuzz0Q0p033DTaMYmJqgmWxrYJshIP9mVSAovG
	H/mgLvVYj/2lHeoiW6gLPa0k2WR1esaC/dPPDW2bI3jingYwlD+4IDfVIR1mNSxJ
	WU4u63Io1FGovKLzsrby55QEFa0heWDy+0tCh1BRW5k45s7wW/mun5ip8mnY/DnT
	/xfk5y9LlPEDaDbTZaVLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677061271; x=
	1677147671; bh=RxA55QL3kceLXRzzYl2wYkiLirPFa6M00cJUTqj9zQ0=; b=J
	r55O56oU9axMGZtomYugaf67tSZUFMhcGO64BH6uOOt2xow0vjS3vQ/BNV7+njmi
	yy1Z+ua2BKoODPldqzQ/2VgIa7SqiNLjFcFNXc0TeH3qQxPTYvmvaI6XkVIufMsm
	u8OnZfNa08BTaQZEYRbekTaLszQbWr8PngxmJSj/KUqapu7lFVox/D7O4hIfhk5E
	IlVtqASLo+LFm69DS/xd8H3j/GubzxyqCkTQFE6AcKK/6vTLMLTb1yun47X4y4rn
	+hClYVeVw0X0qIhXXN0ENw7rpk6MrLyBWaxcUkMLoY0CvawIVmFvcLMvMtUjVp7/
	IFzY4YeetIYqf13NavMLw==
X-ME-Sender: <xms:l-z1YzsAq4tdRI1LUMiZzJb2vvYyz93qJBL1Vf2rh0_Er9SbkEWl0g>
    <xme:l-z1Y0c3XsI3oryAm12SrDeKz4FOvrTDitcw0BqIDlZIakBjbawbDpL7KhrNc1Wgj
    L6o3L0rKdFFyeXhpQc>
X-ME-Received: 
 <xmr:l-z1Y2yrm-b1Bwig-NVcOEHebDQAHSIVm_N0qTR1A-ZJ5if7CPssHDZ0dIvoY49jpIxicJTnD006L5ZyNAHvKODaGuSQN9ZKm0lxpA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesth
    ekredttddtjeenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgr
    khgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgeelke
    euhedvjeduvdeigeduudffheegfeekgeegledvieelhfelhfetffelheehnecuffhomhgr
    ihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:l-z1YyNxvgCuo_mqzzXgydwl-lWlwADCocvs7-x6Lh_D_ZLdZVVC1g>
    <xmx:l-z1Yz9iQ02BrMaEYfkaeUcqGAOaUMRklJ7_d3ByYs-Ki75BvPjGhg>
    <xmx:l-z1YyUL8CTyCHMqeasEMySiWFHwrd-qr0n_y0eRZW4HN5iCfG9gAw>
    <xmx:l-z1YwFKcmwqnlb9FzPH8anLznyhehodXWgOv0F9yf1GSssr4QofHA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 05:21:10 -0500 (EST)
Date: Wed, 22 Feb 2023 19:21:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "mj@mj" <mj@michaeljosephs.com>
Subject: Re: Firewire Audio Interface
Message-ID: <Y/Xskw6JUYY+xWN1@workstation>
Mail-Followup-To: "mj@mj" <mj@michaeljosephs.com>,
	alsa-devel@alsa-project.org
References: <2E89E35E-85D0-45D1-8727-BB013FA78DAA@michaeljosephs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2E89E35E-85D0-45D1-8727-BB013FA78DAA@michaeljosephs.com>
Message-ID-Hash: 277JTE3AKQKE2TLBO7WNNKS262NWDCPC
X-Message-ID-Hash: 277JTE3AKQKE2TLBO7WNNKS262NWDCPC
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/277JTE3AKQKE2TLBO7WNNKS262NWDCPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
(C.C.ed to alsa-devel)

On Tue, Feb 21, 2023 at 10:21:14AM -0500, mj@mj wrote:
> Hello Takashi!
> I came across your name when trying to find software to make a TC
> Konnekt 6 work in OSX Big Sur.
> TC has abandoned the Konnekt series.
> I saw this Github entry that I think is from you?
> [1]https://github.com/alsa-project/snd-firewire-ctl-services/blob/master/README.rst
> I wanted to ask…is this your project? and would it allow me to use the
> Konnekt with OSX 64-bit?

I maintain the repository.

Linux kernel has driver stack for audio and music unit in IEEE 1394 bus.
I maintain the driver stack as well. For example, you can see backport
drivers from mainline Linux kernel:

* https://github.com/takaswie/snd-firewire-improve/

The repository you found is supplemental one. It provides user space
service program to configure DSP functions such as channel strip effects.

Besides, they are available in Linux only. As long as I know, no one
work to develop craft drivers in MacOS for your device.


P.S. I think you use 'Desktop Konnekt 6' or 'Konnekt 8'.

Takashi Sakamoto
