Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70886A0F9
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 21:46:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4029B829;
	Tue, 27 Feb 2024 21:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4029B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709066773;
	bh=xD73H6ns1vtloIsIwk44DawfS9kVjpwDHV1O6apbZVI=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lsaGOqZsZULUu51ct99UJJvdRiXi/L1SefiI4aIMSyOmYRQQ3h4YU0/EEd12W8fkf
	 xz3eA3xwxPT/727/E1hf9BCBLQCp9ov3TxOeYBB6T+DWLDPB0kSyE24lz6gFKBsLd8
	 ogsl+249fCzP+JfBQJp2x5OxsMtZy2vTZcXSUWXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE53F8028B; Tue, 27 Feb 2024 21:45:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B061F805A0;
	Tue, 27 Feb 2024 21:45:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAEA4F801C0; Tue, 27 Feb 2024 21:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07A48F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 21:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A48F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=FCybUin4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=xD73H6ns1vtloIsIwk44DawfS9kVjpwDHV1O6apbZVI=; b=FCybUin4iv93TQVSRsqbjUlDq1
	YLxvEfxvhyeVmtb2rnOmaZbojToXwMuUuXguaEy0I29pbeg4ztKpQI8NmnjDOOw3EXO/KdwjNuSrC
	vOCtFO1HbUa/33e+k3IpFDKC66w8r2F5oSVl/DvijZy2YiVewQ1DLC0HNyJ8yoTI/KcY=;
Received: from [10.8.10.223]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rf4KQ-00000001K4Z-3JZd;
	Tue, 27 Feb 2024 23:45:30 +0300
Message-ID: <d7ae7dadbefb6dcd26e4ab17e25d76c506d479a9.camel@tsoy.me>
Subject: Re: synaptics hi-res audio usb device duplex, usb bandwidth issues
From: Alexander Tsoy <alexander@tsoy.me>
To: Ian Malone <ibmalone@gmail.com>, alsa-devel@alsa-project.org
Date: Tue, 27 Feb 2024 23:45:04 +0300
In-Reply-To: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
References: 
	<CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: LGRA73PUTPHXNDE27XQGVIMQUC5WLFWN
X-Message-ID-Hash: LGRA73PUTPHXNDE27XQGVIMQUC5WLFWN
X-MailFrom: puleglot@puleglot.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGRA73PUTPHXNDE27XQGVIMQUC5WLFWN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=9F=D0=BD, 26/02/2024 =D0=B2 13:05 +0000, Ian Malone =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
> Hi,
>=20
> In short I have a USB to 3.5mm adapter which seems not to work in
> duplex mode on USB2.0 systems, possibly due to a bandwidth
> calculation
> bug.
>=20
> This is an evolution of an issue I previously posted on the users
> list
> with no luck. I have an Anker USB-C to 3.5mm audio dongle (lsusb:
> Conexant Systems (Rockwell), Inc. Hi-Res Audio) which I've used for
> some time on my phone (Android with USB-3.2). On trying to use it
> with
> an older T420 laptop recently with only USB-2.0 ports I discovered it
> will not work in duplex mode. Input-only and output-only profiles
> work
> (tested recording and playback with audacity), but with duplex no
> sound is recorded (Fedora 39, pipewire). This is easily reproduced by
> looking at the pavucontrol volume monitor for Output Devices, if I
> switch the device to Analog or Digital Input in configuration then
> the
> Input Devices level monitor for it shows activity if I speak into or
> tap the microphone. With duplex selected there is no activity, the
> level monitor bar may or may not display. I can switch between the
> two
> behaviours by changing the profile. Various applications such as
> Audacity and Zoom appear to hang when accessing this microphone with
> the duplex profile set. I've used pipewire configuration to force the
> format to 16LE only (playback and recording), but this has not
> helped.
>=20
> In dmesg this error appears when this happens (microphone opened, for
> example by pavucontrol):
> [=C2=A0 294.825544] usb 1-1.1: cannot submit urb 0, error -28: not enough
> bandwidth
> (T420, Fedora 39, kernel 6.7.5)

Sorry, I somehow misread the first part of an email and was under
impression that the problem is only with xhci host controller. Here I
can only add that I have a system with the same "6 Series/C200 Series"
chipset where I cannot reproduce this issue. But my full-speed card has
a lower wMaxPacketSize.

