Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD27853045
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:12:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE1F1EF;
	Tue, 13 Feb 2024 13:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE1F1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707826330;
	bh=dzeU2uecARJY2Bct18987ZwkHF4w1EEaBu1mOFDkJUA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Idj4kHZ6ysy2xNR5hDaOwD6NhZGAQ8l/xoQkPQk3Mf/nt6LEL61ocR+Ku4s3FisqO
	 sBqmulpsatGFffk1OfIRgVHu5xfUNrlmpOL1WZjxylsGW2v1zFofPgUyOMu4i49dwZ
	 C3jKJYo8J1yuOCDFYMXN186vvoa/i61d6ABX1n9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA62F8016E; Tue, 13 Feb 2024 13:11:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0275DF805A9;
	Tue, 13 Feb 2024 13:11:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362EEF80238; Tue, 13 Feb 2024 13:11:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D1E5F8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D1E5F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=mEvckPP5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=PesdoPT+Kn9ZSk2rQu5s2jwY0m9VD05Cv7LDJN7pDF8=; b=mEvckPP5uGiXMo8BfUXY9l0uyc
	Er5b7TMJumfH+lFcg7aq46syQwE4H6/+5SZvhCazi+GS19dDymeVySIDtE4w2lLv2RkHn7VCfaPPZ
	wnmp2EK33xnzNOpmuRo5BjLMiinTW/rWrEZm3BgD4vZXVQKX4HJ6fNMaIazRFJq6n3z0=;
Received: from [2a00:1370:819a:f1b4:f5a8:7291:14f0:548b]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rZrdB-00000002MK2-0ydR;
	Tue, 13 Feb 2024 15:11:21 +0300
Message-ID: <a31c7f4403a867edd90f7a8e42a22ce16ef4f06f.camel@tsoy.me>
Subject: Re: [PATCH] USB: Always select config with the highest supported
 UAC version
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	 <perex@perex.cz>, Nikolay Yakimov <root@livid.pp.ru>, Saranya Gopal
	 <saranya.gopal@intel.com>
Date: Tue, 13 Feb 2024 15:11:07 +0300
In-Reply-To: <87sf1wy3la.wl-tiwai@suse.de>
References: <20240212152848.44782-1-alexander@tsoy.me>
	 <2024021353-reversing-waltz-7402@gregkh> <87sf1wy3la.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: WGFH3V5KIVMKQJ2UUIUV7YGRZVRJDQY7
X-Message-ID-Hash: WGFH3V5KIVMKQJ2UUIUV7YGRZVRJDQY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGFH3V5KIVMKQJ2UUIUV7YGRZVRJDQY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=92=D1=82, 13/02/2024 =D0=B2 13:02 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> On Tue, 13 Feb 2024 12:05:47 +0100,
> Greg Kroah-Hartman wrote:
> > On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> > > =C2=A0
> > > -			/* If there is no UAC3 config, prefer
> > > the first config */
> > > -			else if (i =3D=3D 0)
> > > +			if (i =3D=3D 0)
> > > =C2=A0				best =3D c;
> > > =C2=A0
> > > +			/* Assume that bInterfaceProtocol value
> > > is always
> > > +			 * growing when UAC versions are
> > > incremented, so that
> > > +			 * the direct comparison is possible. */
> >=20
> > How do we know this assumption is always true?=C2=A0 What happens when
> > it is not?
>=20
> I believe this assumption is acceptable.=C2=A0 It's all about the protoco=
l
> number from 1 to 3, so far.=C2=A0 If UAC4 is ever supported in future,
> it'll be highly probably the number 4.=C2=A0 (If not and keeping the same
> protocol number 3, we'll need a different check in anyway.)
> And the other numbers are excluded already in is_supported_uac()
> check.
>=20
> > > +			else if (is_supported_uac(desc) &&
> > > best_desc &&
> > > +				 (!is_supported_uac(best_desc)
> > > ||
> > > +				=C2=A0 (desc->bInterfaceProtocol >
> > > +				=C2=A0=C2=A0 best_desc-
> > > >bInterfaceProtocol)))
> > > +					best =3D c;
> >=20
> > I really can't understand this if logic, sorry, can you describe it
> > better so that we can maintain it over time?
>=20
> The condition looks cryptic, though, yes.
>=20
> Maybe the check should be factored out, e.g.
>=20
> /* return true if the new config has a higher priority then the old
> config */
> static bool check_uac_desc_priority(struct usb_host_config *old,
> 				struct usb_host_config *new)
> {
> 	if (!is_supported_uac(new))
> 		return false;
>=20
> 	if (!is_supported_uac(old))
> 		return true;
>=20
> 	/*
> 	 * Assume that bInterfaceProtocol value is always growing;
> 	 * so far, it's true from UAC1 to UAC3 (1..3)
> 	 */
> 	if (new->bInterfaceProtocol > old->bInterfaceProtocol)
> 		return true;
>=20
> 	return false;
> }
>=20

Thank you both for response! I'll try to simplify the logic.
