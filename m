Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1CF6FF854
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 19:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68F6EF0;
	Thu, 11 May 2023 19:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68F6EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683825788;
	bh=QRRgfZvkPlGtgWy3cGwCeg8uo8zx/1k89rW1+PYQSVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6ywoIv5sXuwj3Eq/o2tvWol65j7qrsaL5RlqIeLEsZUW1FdUpfkK0wHIgXxJvHL8
	 XK24DiZbz1RBph4MW2PnaP4zBLWAJTTes6zvD3EvHQjz46xF83CZoGjuEu/RjKzg3a
	 syMi2/+ueQiuiVvSQSSj2d8HJc1pm5dkXAcL+Ets=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BAFBF802E8; Thu, 11 May 2023 19:22:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B732F802E8;
	Thu, 11 May 2023 19:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EFFEF8052E; Thu, 11 May 2023 19:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.icequake.net (64-251-151-187.fidnet.com [64.251.151.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71FF5F802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 19:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71FF5F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=icequake.net header.i=@icequake.net header.a=rsa-sha256
 header.s=mail-1 header.b=rMmBLGEH
Received: from mail.icequake.net (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id 21AC2D4317;
	Thu, 11 May 2023 12:22:06 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icequake.net;
	s=mail-1; t=1683825726; x=1684430526;
	bh=CAzlANPnd+Utywt4JFcXZwCjohXjazq1tLQOoRiPCJ0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:Subject:
	 From:To:Date;
	b=rMmBLGEHzZyL3GaTs7LkStQREUC+frqO9gsAxFt6bUyADAKAgjNHyPrA6F3sBzBnE
	 /HDoN8RX2h/oxyIMUL1lsN9hAxep/adQuE7c5gbAVkFKWOHAXVc81O5a3YZVxzdFNr
	 xVvsRIT4QO6wxx/7rvEkHo1ElCPI6AqpvafBI4zk=
Received: from localhost (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id 0718CD4319;
	Thu, 11 May 2023 12:22:06 -0500 (CDT)
X-Virus-Scanned: Debian amavisd-new at icequake.net
Received: from mail.icequake.net ([127.0.0.1])
	by localhost (aurora.icequake.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uXHgolWnhXZ; Thu, 11 May 2023 12:22:04 -0500 (CDT)
Received: from localhost (rrcs-71-42-125-220.sw.biz.rr.com [71.42.125.220])
	(Authenticated sender: nemesis@icequake.net)
	by mail.icequake.net (Postfix) with ESMTPSA id 82FD9D4317;
	Thu, 11 May 2023 12:22:04 -0500 (CDT)
Date: Thu, 11 May 2023 12:21:38 -0500
From: "Ryan C. Underwood" <nemesis@icequake.net>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] snd-hda-intel: Apply HP B&O top speaker profile to
 Pavilion 15
Message-ID: <ZF0kIsLPs0fzvDXI@icequake.net>
References: <ZFvD/HwNPd6xuCMo@icequake.net>
 <87ednm4zux.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kjlkBg6p9NDPpFjC"
Content-Disposition: inline
In-Reply-To: <87ednm4zux.wl-tiwai@suse.de>
Message-ID-Hash: 7I2Y5ZZV42WJNMFEBMF57JTXBHW4ZC3K
X-Message-ID-Hash: 7I2Y5ZZV42WJNMFEBMF57JTXBHW4ZC3K
X-MailFrom: nemesis@icequake.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nemesis@icequake.net
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I2Y5ZZV42WJNMFEBMF57JTXBHW4ZC3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kjlkBg6p9NDPpFjC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, May 11, 2023 at 06:06:14PM +0200, Takashi Iwai wrote:
> On Wed, 10 May 2023 18:19:08 +0200,
> Ryan C. Underwood wrote:
> >=20
> >=20
> > The Pavilion 15 line has B&O top speakers similar to the x360 and
> > applying the same profile produces good sound.  Without this, the sound
> > would be tinny and underpowered without either applying
> > model=3Dalc295-hp-x360 or booting another OS first.
>=20
> The code change looks OK, but could you give your Signed-off-by tag?
> It's a legal requirement and mandatory for merging to the upstream.

I'll send a new patch with that updated.

> Also, you can reduce the recipients in Cc a bit more.
> For this kind of trivial change, just maintainers and ML should
> suffice.

Sorry, I just used the output of get_maintainer.pl...

--=20
Ryan C. Underwood, <nemesis@icequake.net>

--kjlkBg6p9NDPpFjC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSqqegowG2kcGXAAAMiiceeH7ruOQUCZF0kIAAKCRAiiceeH7ru
OTZOAJ9SNKUt4Xqu/x6Ktoay2dR4sPVVWgCgoJOGW7Rpja7ZyhFGp9wzHnt/s2A=
=kDJV
-----END PGP SIGNATURE-----

--kjlkBg6p9NDPpFjC--
