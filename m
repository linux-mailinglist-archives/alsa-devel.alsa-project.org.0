Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7833B83F505
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 11:38:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E0DF83B;
	Sun, 28 Jan 2024 11:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E0DF83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706438331;
	bh=PysUJPrwPRAXP68I0Rtgzr/rQ87OE0GEwEypUvcROZY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q3pDovF9SMMR5oK3eeoF3sg77MOMxnJvdDNsh6MhozFrFLmQ4zD6KBcayOfoKKSJn
	 p44Uq0VITHgJLIuIJXutYZqvI+LQqO0CDtNsTOek+fYRGMdcRGS/MpYuu1S40f18UF
	 aCr4O/hnuJCMQsw4VQWOrZHf9J5UhK3AbrLiIUZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E1D5F80580; Sun, 28 Jan 2024 11:38:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB96EF80310;
	Sun, 28 Jan 2024 11:38:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3271DF80310; Sun, 28 Jan 2024 11:36:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E17FF80149
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 11:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E17FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=cBr2EUHG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=PysUJPrwPRAXP68I0Rtgzr/rQ87OE0GEwEypUvcROZY=; b=cBr2EUHGCNw5UEGiI5CyMWbIT2
	YH18//bEtOQbWnCzx4gp3HTkLRInpeWFots+4bQ077lmFWuou51Ir2belmEXAehRjZceGO5qpD3Tu
	fjnu+NnTrOalfRO14btCQQoytAK5phuK7QK0jtPZb+jaRYW0GmjIl9kbO1mzW9N5y1lM=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rU2WC-00000000AQ5-0S2l;
	Sun, 28 Jan 2024 13:36:04 +0300
Message-ID: <3d4b6eca78d222598f8313c1fca34f3b9ee0bdba.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Skip setting clock selector for single
 connections
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav
 Kysela <perex@perex.cz>
Date: Sun, 28 Jan 2024 13:35:51 +0300
In-Reply-To: <87mssw6sry.wl-tiwai@suse.de>
References: <20240123134635.54026-1-alexander@tsoy.me>
	 <87mssw6sry.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: P4JEU77CFMDTJ5YTPJ4GOIUVJGXRDQYZ
X-Message-ID-Hash: P4JEU77CFMDTJ5YTPJ4GOIUVJGXRDQYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4JEU77CFMDTJ5YTPJ4GOIUVJGXRDQYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=92=D1=82, 23/01/2024 =D0=B2 15:14 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> > On Tue, 23 Jan 2024 14:46:35 +0100,
> > Alexander Tsoy wrote:
> > > >=20
> > > > Since commit 086b957cc17f5 ("ALSA: usb-audio: Skip the clock
> > > > selector
> > > > inquiry for single connections") we are already skipping clock
> > > > selector
> > > > inquiry if only one clock source is connected, but we are still
> > > > sending
> > > > a set request. Lets skip that too.
> > > >=20
> > > > This should fix errors when setting a sample rate on devices
> > > > that
> > > > don't
> > > > have any controls present within the clock selector. An example
> > > > of
> > > > such
> > > > device is the new revision of MOTU M Series (07fd:000b):
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AudioControl Interface Descriptor:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bLength=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 8
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bDescriptorType=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bDescriptorSubtype=C2=A0=
=C2=A0=C2=A0=C2=A0 11 (CLOCK_SELECTOR)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bClockID=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bNrInPins=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 baCSourceID(0)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bmControls=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iClockSelector=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> > > >=20
> > > > Perhaps we also should check if clock selectors are readable
> > > > and
> > > > writeable
> > > > like we already do for clock sources, but this is out of scope
> > > > of
> > > > this
> > > > patch.
> > > >=20
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217601
> > > > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> >=20
> > Thanks, applied.

It looks like this patch will bring back problems with Behringer mixers
[1]. So we probably should revert. The mentioned case with MOTU M
Series should be also covered by "Support read-only clock selector
control" commit.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D199327
