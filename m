Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DCB869F18
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 19:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C199850;
	Tue, 27 Feb 2024 19:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C199850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709058525;
	bh=KR8QOOdqiU0SnE4hU13kgHU9KcBs6uk2tDFWZC+ZanQ=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MKkTlml1GymIbJZcN5NcFIcSfc3t8eYQ1cGDCkwkic8594+OFaopnJ6a2dbqMSMRT
	 ZCzsxOUTS4vwkwz2MD0dUcKYXejWYA0j0aIdedz4LJQoTg/yO0J2+QRzYvNbmAoZac
	 53teJ3eeFc42qOLiNKLGzghlAi87DLZvqIeBfWts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C38D7F8057C; Tue, 27 Feb 2024 19:28:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5433F8057F;
	Tue, 27 Feb 2024 19:28:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C256F801C0; Tue, 27 Feb 2024 19:27:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4400F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 19:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4400F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=Gcpz2FyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=KR8QOOdqiU0SnE4hU13kgHU9KcBs6uk2tDFWZC+ZanQ=; b=Gcpz2FyFMyQH6jqHtmwgSOZ4Ny
	N13ech+1VhnY4bEbG/e2Z3Zbn9n+eR29rQ8eAmIHw6yMIDrWdcks0u7FMSGsMS7gU7sFZ40q7zJJl
	wv0APBMJb4Iea7uWxhNdD+T9RDayz0ph8EHqJVqOv7JKXHG3w9g/b7bCYyN87WMBaOK0=;
Received: from [10.8.10.223]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rf2Az-00000001JVD-1Bd2;
	Tue, 27 Feb 2024 21:27:37 +0300
Message-ID: <95a7e60c5b95a7febd64e2cf16e59362cf72a9c3.camel@tsoy.me>
Subject: Re: synaptics hi-res audio usb device duplex, usb bandwidth issues
From: Alexander Tsoy <alexander@tsoy.me>
To: Ian Malone <ibmalone@gmail.com>, alsa-devel@alsa-project.org
Date: Tue, 27 Feb 2024 21:27:11 +0300
In-Reply-To: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
References: 
	<CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: PZQ65QWF6IWH3BB3DBXQOMBZDBE6A4JJ
X-Message-ID-Hash: PZQ65QWF6IWH3BB3DBXQOMBZDBE6A4JJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZQ65QWF6IWH3BB3DBXQOMBZDBE6A4JJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=9F=D0=BD, 26/02/2024 =D0=B2 13:05 +0000, Ian Malone =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
>=20
---------->%-----------
> In this case the dmesg output is clear after device connection. This
> seems like some kind of bandwidth calculation problem in
> snd_usb_audio. I've tried building a kernel and modifying various of
> the defines in sound/usb/card.h (currently MAX_PACKS 4 and
> MAX_PACKS_HS (MAX_PACKS * 4), compared to 6 and *8) but not hit on a
> winning formula yet. Is there any information I could collect to try
> to fix this?
>=20

I always had bandwidth allocation problems with full-speed isochronous
devices connected directly to xhci host controllers (and no other
devices connected!). The same devices works with ehci host controllers
without issues. So I think the problem is somewhere in the xhci code.

Also if device is connected to the hub which is connected to xhci
controller, everything also works. This is why rear ports works for you
- they are connected to the internal hub.
