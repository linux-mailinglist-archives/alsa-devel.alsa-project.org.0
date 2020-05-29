Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797E21E7E04
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 15:08:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B0716C6;
	Fri, 29 May 2020 15:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B0716C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590757699;
	bh=VgueqRLGA2u0PoQlOS/UIUB79bJfuzHVTtcLbLM1B8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0z9ExW31a0kQBWSoEYQbUQCypqUdV6tQT6TVaiEyy3P5DLzX7bfblvgwaxxuGi5b
	 cI3yYfEco17uTD4uPlq7XQnrdk7daVqf1OvDhyH1na0ZKaio4rru5+E7vsJTCy1Oqy
	 V1raNNRLH/Z+0mc0QxQobA/sdO/Gj8vbRPIduPuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837C4F80107;
	Fri, 29 May 2020 15:06:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BD01F80227; Fri, 29 May 2020 15:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF35F8014E
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 15:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF35F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YEIfybcl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9797206B6;
 Fri, 29 May 2020 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590757576;
 bh=VgueqRLGA2u0PoQlOS/UIUB79bJfuzHVTtcLbLM1B8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YEIfybclwoOl0BGpbpGbtIY579PxWFU8wi+B6w7RbqWHA+/cGo+vBg5wyei242byX
 qJp5a0c0UdZK8sgM6heaeXq75YRQEn41OjQnqcgNL+VNlMucS5R2XUg8kxwlbVOaOE
 c3CnKuP13JIU7tcX7y+v2sFEIKGUz4lnmQZSfFq4=
Date: Fri, 29 May 2020 14:06:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] Enable class-D silence and clock detections
Message-ID: <20200529130613.GL4610@sirena.org.uk>
References: <1590750310-30085-1-git-send-email-derek.fang@realtek.com>
 <20200529110758.GG4610@sirena.org.uk>
 <39997dae03af408f94e581c2a4034473@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Content-Disposition: inline
In-Reply-To: <39997dae03af408f94e581c2a4034473@realtek.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 11:22:25AM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> > Please submit patches using subject lines reflecting the style for the
> > subsystem, this makes it easier for people to identify relevant patches.

> Sorry for the mistake. I will resend the patch.

It's OK, no need for this one - just please bear this in mind in future.

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RCMUACgkQJNaLcl1U
h9DbZwf+PIhFUd1+079C441pDZP39DnhBjSgw7VQXKrnkDd2RyLUIKwIEjO1Z9LX
mDKHB6wFk5kezCc8HSOULFVP+oSzsNrC1kGzvV2XCzMJ8MVSgekbxp7iLJXt4cL1
7BP0I7XIg77jfGAXnEh7DXHCFJt6yNfT9rtdjBu9yQqapAubJZqiJqL+bC+HmNvP
qTIc9VwTXWD/n0dx0IDF5tvLHfetYrI13iuEee78vhTLuVjGWVtkAyMG707steTd
c6AFPk/5WZkkuUBgHizfwVr0dQdYF94OdXMG1HgJyx9JoWBTazhhPPaZHefuFK68
qs9fTsk5jyCOJdX8aVoFHdW8jDaKUA==
=KXhH
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--
