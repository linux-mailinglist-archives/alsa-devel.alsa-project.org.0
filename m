Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC9700D47
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 18:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 395141E8;
	Fri, 12 May 2023 18:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 395141E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683910014;
	bh=R241F6k+VOJb7pk8aILqOWdHKe//PB0TzUO4/VM6H/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s14Jlfdt5jWa9hnUK0VvEUzM+Tu0uipJc2pqcqJUW83BJJwwFaYMdOFnGMou931Ac
	 2jG+NdWJP5BB18fjRlwdFdAJmdK/fceECJYOL9On4E2yOC9LFQNuTRM5xBCmmqpjL0
	 Y/X0hov1OWX6nE3loCsy+GIgTOSRID9n+TLTzhlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 475C0F8053D; Fri, 12 May 2023 18:45:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D88DAF802E8;
	Fri, 12 May 2023 18:45:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34B00F8032D; Fri, 12 May 2023 18:45:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7F66F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 18:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F66F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=icequake.net header.i=@icequake.net header.a=rsa-sha256
 header.s=mail-1 header.b=lpJgsGLP
Received: from mail.icequake.net (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id AEA5ED42C7;
	Fri, 12 May 2023 11:45:24 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icequake.net;
	s=mail-1; t=1683909924; x=1684514724;
	bh=KElXq4OwK+pk7AEPmliksFgajImN6q7NU4SHNUXF/eo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:Subject:
	 From:To:Date;
	b=lpJgsGLPFwIBKIherzSSVrljhxr4lmLCVyCFL/RdTBDOnXTsXhqmC/QvlbxBuzQ8y
	 tx9vdjcCu41zCb7RFunErSL6IHRcL12Se//sCC6sg4JiSGerkNxrQxkp6oqNUWORFl
	 NkreIVAl2k+dJobTZ5ehv+QuHdGhh8kRiCLGo54Y=
Received: from localhost (aurora [127.0.0.1])
	by mail.icequake.net (Postfix) with ESMTP id 6FEC3D4319;
	Fri, 12 May 2023 11:45:24 -0500 (CDT)
X-Virus-Scanned: Debian amavisd-new at icequake.net
Received: from mail.icequake.net ([127.0.0.1])
	by localhost (aurora.icequake.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30pky7ZJko4f; Fri, 12 May 2023 11:45:23 -0500 (CDT)
Received: from localhost (rrcs-71-42-125-220.sw.biz.rr.com [71.42.125.220])
	(Authenticated sender: nemesis@icequake.net)
	by mail.icequake.net (Postfix) with ESMTPSA id 9B04ED42C7;
	Fri, 12 May 2023 11:45:22 -0500 (CDT)
Date: Fri, 12 May 2023 11:42:34 -0500
From: "Ryan C. Underwood" <nemesis@icequake.net>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] snd-hda-intel: Apply HP B&O top speaker profile to
 Pavilion 15
Message-ID: <ZF5seo0JPbcU7wij@icequake.net>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org
References: <ZF0mpcMz3ezP9KQw@icequake.net>
 <871qjmar8h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R89g+Ma61XKxmtYR"
Content-Disposition: inline
In-Reply-To: <871qjmar8h.wl-tiwai@suse.de>
Message-ID-Hash: D2GM7SIIRLD2VUYX2NE64OPP542XSC3G
X-Message-ID-Hash: D2GM7SIIRLD2VUYX2NE64OPP542XSC3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2GM7SIIRLD2VUYX2NE64OPP542XSC3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--R89g+Ma61XKxmtYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 10:28:14AM +0200, Takashi Iwai wrote:
>=20
> The patch seems mangled by your mailer (spaces instead of tabs).
> I applied it manually as it's a trivial change.  But at the next time,
> please check your mailer setup.

Sorry, I pasted to terminal from another system and that must have
mangled it.

> Also, please include all maintainers to Cc :)

Apologies for my ignorance, but what's the correct way to get "all
maintainers" if not scripts/get_maintainer.pl, which you said produced
too many cc's in the previous attempt?

--=20
Ryan C. Underwood, <nemesis@icequake.net>

--R89g+Ma61XKxmtYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSqqegowG2kcGXAAAMiiceeH7ruOQUCZF5sdwAKCRAiiceeH7ru
OeccAJ41DD664qHQsDBkqYgGqbGR8A4ragCePqIccuv8uSeo8B7KLqnmxvdOb8E=
=sLbV
-----END PGP SIGNATURE-----

--R89g+Ma61XKxmtYR--
