Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC71A37F86
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B6D60278;
	Mon, 17 Feb 2025 11:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B6D60278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739787117;
	bh=I0lAqZhhCBViVeX7MJHeY215g3SJL9ckNmOtMzp0HdQ=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uf3B3OAatgtW8Noh8ZJibbNijsd1gnC5DzO9ZIq0/s/tTejcwOOXlVhk/0XcBVwTX
	 eXtmt1irGgN3zLapJi4V/E/JFcwEs7nUNXdlU9Dfs1rIUat6VUrliCZKStWktyNOa3
	 uBdeXmNTaF0F/NJHQij22TQrIQufLodWuQL8vLDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D64F5F80699; Mon, 17 Feb 2025 11:09:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECEBCF80095;
	Mon, 17 Feb 2025 11:09:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 337B2F804B0; Fri, 14 Feb 2025 13:06:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.nihil.gay (nihil.gay [157.90.242.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C2BFF800BF
	for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2025 13:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C2BFF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nihil.gay header.i=@nihil.gay header.a=rsa-sha256
 header.s=2021 header.b=GRQUPp9j;
	dkim=pass (2048-bit key) header.d=nihil.gay header.i=@nihil.gay
 header.a=rsa-sha256 header.s=2021 header.b=GRQUPp9j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nihil.gay; s=2021;
	t=1739534781; bh=I0lAqZhhCBViVeX7MJHeY215g3SJL9ckNmOtMzp0HdQ=;
	h=Date:From:Subject:To:From;
	b=GRQUPp9jfzapoBLR3RMZXtpBnnbFZckZpYRPaqxrAzEA7pRY+zJ78Lag+WzfXT04O
	 KvD3iX3WNNioAxAbvLgjL4C5ypyJbJHa4+oX8RC8XyoY2Pj4meXQAyCnGrt+e5ehyd
	 En7d8cFLZernS9NUIq+5SypAXvPaeyAKR6Us6KrYlIZxBBSzW3iRAOCzUw/tPrZZgs
	 A9Aq0FgjP/INXEw60ESwkCP2Bf5ejDgpQVhujRfQqRPGJWJJzfvMzwkgZB4rm4M0vx
	 2QBrgiNIi2EUHRIn78+p1ckoPnZbPHwb76mQLQdsXoW7kZ+Vghddidel79NkZovjCB
	 Homl1i3VRVoOA==
Received: by mail.nihil.gay (Postfix, from userid 114)
	id 6F8BD9D1B6; Fri, 14 Feb 2025 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nihil.gay; s=2021;
	t=1739534781; bh=I0lAqZhhCBViVeX7MJHeY215g3SJL9ckNmOtMzp0HdQ=;
	h=Date:From:Subject:To:From;
	b=GRQUPp9jfzapoBLR3RMZXtpBnnbFZckZpYRPaqxrAzEA7pRY+zJ78Lag+WzfXT04O
	 KvD3iX3WNNioAxAbvLgjL4C5ypyJbJHa4+oX8RC8XyoY2Pj4meXQAyCnGrt+e5ehyd
	 En7d8cFLZernS9NUIq+5SypAXvPaeyAKR6Us6KrYlIZxBBSzW3iRAOCzUw/tPrZZgs
	 A9Aq0FgjP/INXEw60ESwkCP2Bf5ejDgpQVhujRfQqRPGJWJJzfvMzwkgZB4rm4M0vx
	 2QBrgiNIi2EUHRIn78+p1ckoPnZbPHwb76mQLQdsXoW7kZ+Vghddidel79NkZovjCB
	 Homl1i3VRVoOA==
Received: from [10.0.0.2] (host-79-37-133-17.retail.telecomitalia.it
 [79.37.133.17])
	(Authenticated sender: lena@nihil.gay)
	by mail.nihil.gay (Postfix) with ESMTPSA id 0B30F9CF61
	for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2025 12:06:20 +0000 (UTC)
Message-ID: <6f03b7d6-97d5-48a4-be6f-a1df481971fc@nihil.gay>
Date: Fri, 14 Feb 2025 13:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Lena <lena@nihil.gay>
Subject: ALSA USB quirk mixer driver question
To: alsa-devel@alsa-project.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: lena@nihil.gay
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 347MDDMRT7SAXLOKXX33TEUZN2YBBAJL
X-Message-ID-Hash: 347MDDMRT7SAXLOKXX33TEUZN2YBBAJL
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:09:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/347MDDMRT7SAXLOKXX33TEUZN2YBBAJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all!

I'm currently trying to develop an usb quirk mixer driver for a desktop 
USB audio interface.

The interface exposes the following:

- interface 0-2 are USB UAC compliant, bound to by snd-usb-audio, and
   working flawlessly

- interface 3 is vendor specific, and we can ignore it (used for
   firmware updates)

- interface 4 exposes a non-standard mixer with a HID interface exposing
   2 interrupt endpoints, and is used by the vendor windows app.

I have studied the protocol with usbpcap and can successfully talk to 
the interface on the userspace, but i had a question regarding how to 
proceed in the kernel.

This is because, after creating a new entry in `sound/usb/mixer_quirks.c`
with all the needed controls, userspace can interact with them, etc.

I can't figure out how to tell ALSA to
bind to the correct interface for the mixer (and kick out usbhid).
Looking at the other quirk mixer drivers it doesn't look (?) like any
other quirk mixer driver is binding to a *different* interface, not even 
`sound/usb/mixer_scarlett.c`.

Generally, in a standalone USB driver you'd have tracking/teardown
handled easily with a callback, but i'm having trouble with the
dependencies here. (simply using `usb_sndintpipe()` or
`usb_interrupt_msg()` triggers kernel oopses, so that's probably not it)

What i think i have to do is to use `usb_get_intf()`, then i have to
somehow claim it (does `usb_driver_claim_interface()` work here?). But
`usb_get_intf()` requires me to then release the interface with
`usb_put_intf()`, and it doesn't look like there's anywhere for me to do
that. (`snd_usb_mixer_elem_free()`? doesn't look like the order is
correct)

`iface_ref_find()` would sorta do what i need, but i cannot use it here.

Could someone please point me in the right direction? I'm very stuck at
the moment.

Thanks,

Lena
