Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C61869F92
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 19:54:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B719C827;
	Tue, 27 Feb 2024 19:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B719C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709060048;
	bh=rrY353cXaM+QqUrBZ6bXfD+btjVKZSJcrU7cr3tjby4=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BQ5YgHNLJODhD7eOF0BsNrpXft2HAxFGudYQvuukirE1yCsVKLI71EefYN5N/DUMg
	 GJkQ6H0Dw1XVBqMAdAvW+IMaoETLTfXMeb751Rz+axvppzcnXUfeZuf+xHqwGx6dfu
	 tN3JFhJK40MQ8wBWWSRiYD2IxwVlSOjVI5NWXT1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60BE4F805A9; Tue, 27 Feb 2024 19:53:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC2E1F8059F;
	Tue, 27 Feb 2024 19:53:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A201F801C0; Tue, 27 Feb 2024 19:53:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5795EF80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 19:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5795EF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=dh3IJE82
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=rrY353cXaM+QqUrBZ6bXfD+btjVKZSJcrU7cr3tjby4=; b=dh3IJE822u7cBx9CJSgRWydmYl
	PENgxaw/ZrQKCMH4t43mi3AvNjt3S6dkmOkOBob/p++Lxem7J9tXvWF8/HFFLrVTtCKSURqF0NBkg
	uiIfxPvghVZu1nNxAe7Zn0GSMAvWRI4NxKu6P8rtZdIybRtO0yXRjRUshID8YpDuzMQc=;
Received: from [10.8.10.223]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rf2Zg-00000001Jgm-0AZh;
	Tue, 27 Feb 2024 21:53:08 +0300
Message-ID: <f0f0cf20329ad148f74cdc532adb66834b7084ef.camel@tsoy.me>
Subject: Re: synaptics hi-res audio usb device duplex, usb bandwidth issues
From: Alexander Tsoy <alexander@tsoy.me>
To: Ian Malone <ibmalone@gmail.com>, alsa-devel@alsa-project.org
Date: Tue, 27 Feb 2024 21:52:42 +0300
In-Reply-To: <95a7e60c5b95a7febd64e2cf16e59362cf72a9c3.camel@tsoy.me>
References: 
	<CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
	 <95a7e60c5b95a7febd64e2cf16e59362cf72a9c3.camel@tsoy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: P7E3VMRBXUP35FGKJMGJPEXNZ2VJNO5L
X-Message-ID-Hash: P7E3VMRBXUP35FGKJMGJPEXNZ2VJNO5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7E3VMRBXUP35FGKJMGJPEXNZ2VJNO5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=92=D1=82, 27/02/2024 =D0=B2 21:27 +0300, Alexander Tsoy =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> =D0=92 =D0=9F=D0=BD, 26/02/2024 =D0=B2 13:05 +0000, Ian Malone =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> >=20
> ---------->%-----------
> > In this case the dmesg output is clear after device connection.
> > This
> > seems like some kind of bandwidth calculation problem in
> > snd_usb_audio. I've tried building a kernel and modifying various
> > of
> > the defines in sound/usb/card.h (currently MAX_PACKS 4 and
> > MAX_PACKS_HS (MAX_PACKS * 4), compared to 6 and *8) but not hit on
> > a
> > winning formula yet. Is there any information I could collect to
> > try
> > to fix this?
> >=20
>=20
> I always had bandwidth allocation problems with full-speed
> isochronous
> devices connected directly to xhci host controllers (and no other
> devices connected!). The same devices works with ehci host
> controllers
> without issues. So I think the problem is somewhere in the xhci code.
>=20
> Also if device is connected to the hub which is connected to xhci
> controller, everything also works. This is why rear ports works for
> you
> - they are connected to the internal hub.

And this is because transaction translation is performed on the hub, so
the controller is only dealing with high-speed transfers.

BTW, I just tested all mentioned connection scenarios with Audiotrak
Prodigy CUBE. And indeed I get "Not enough bandwidth" errors in duplex
mode only if it is connected directly to xhci controller.
