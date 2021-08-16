Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B83ED401
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 14:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E3F16B2;
	Mon, 16 Aug 2021 14:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E3F16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629117192;
	bh=lFDUCt1L5Sy+iB56tPkSj+hCxghA6uRUN0xwLVoJftg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X5kpND3zrTTkAtFfum6wpU8ba/Xl8ehlYq//XCVB624zBjXntpMcfCpb40lUcrU5G
	 KeCQESpa/7wFCUgviblYp0U/5fM5g7u1+piNPmOizlhTP6vDeYWMw/gdRYmO/X5Yuh
	 It7MwaDcWGXznzSqdSanjFD64/qhzeB19mfmOB3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 401BFF80259;
	Mon, 16 Aug 2021 14:31:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA237F80249; Mon, 16 Aug 2021 14:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82512F80134
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 14:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82512F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UKucAnSj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53EA563261;
 Mon, 16 Aug 2021 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629117093;
 bh=lFDUCt1L5Sy+iB56tPkSj+hCxghA6uRUN0xwLVoJftg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKucAnSjXVZ0n5vmzxEQ6xFEO7TpLoYgqDp9SSWz+xbCRoImxE61oGutgZ0qsLFf0
 kb4DQ5WipbfpQQ4jfTw5kIb2dTVVCxs/kFhOwtt7Xu/TzTzimxEmlMR0CoVz/+2Bp5
 lKtBoDufEpNJeLH+Rq7/N8d4hdufAsIIWvqmNPfX4UpGnZjlaO3RcAeW5/lSZaXCOY
 nrITYlyvFl7IFl8qIFetX4SUQY1pyKj6wS0qEPIfRpZCBPy2k7MGd26jQNGVUtAjCV
 6huDxhJkqQ81ja5eb7zaChWSBIJoG0q+iaYKIDaXF6G/ghos+Zplo53zK5Z6yrtDXl
 e1efYA+H0rYVg==
Date: Mon, 16 Aug 2021 13:31:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Derek <Derek@sirena.org.uk>
Subject: Re: [PATCH] ASoC: rt5682: Fix the vol+ button detection issue
Message-ID: <20210816123111.GA11849@sirena.org.uk>
References: <15a267e360f64618b82356b925b002f2@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <15a267e360f64618b82356b925b002f2@realtek.com>
X-Cookie: You will be awarded some great honor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
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


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2021 at 10:36:22AM +0000, Derek wrote:
> Fix the wrong button vol+ detection issue with some brand headsets
> by fine tuning the threshold of button vol+ and SAR ADC button accuracy.

This doesn't apply against current code, please check and resend.

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEaWo4ACgkQJNaLcl1U
h9A30wf/bdd6CFvnewsUtorgUsCcpMKw5w3DMjorRVtJE4dOypKb2byMNY3rBUAE
5Lnb29pDwu0pr6zZRxSQ3wNM17t8bbEVFMZj1G4IjbTlDgJ+5qbNxKBlE4Oud/rz
VWKQ8rjoOrnr6eIMe+swd+n/UtIGCKpUtuq/DRwGt1vdWr/8hafgm2b74Csqo03M
Opl7MElD71TTRKzBDotxPygLppJdkoKhamVFtvzE3Dk8XqJcZ+dVlRUsnNdOtkkb
33oud0leVviT58jviSLwwBHAPEPKJdPtrSHcC/e+op/a9sXHGimyS0znyFgYQY/p
gmr5PvN9zqa5C3wDtNPYz3LjkiEtvQ==
=mqdZ
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
