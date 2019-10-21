Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F84DF087
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 16:54:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2B0166B;
	Mon, 21 Oct 2019 16:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2B0166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571669657;
	bh=ZYxBKhnKxqTj22AkRMADPAD3NCtVHyRt45Ulg6tsgKE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbljxN6//sVuJ42SxnZVYGhFhL81kbK45HjCT5L5h5sxTqzD9LMy8HLjwddghIwAg
	 9mSFsOfAj1kfZldJx0TJSdahE3HMQsD6uJBt/w0H+AY6gu1Sz4k+2LNp3dcL1+fZoa
	 MpF4h1rVtocDC2dEzJgS0ZiLtqBn0eUCRgJRu1DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 998BFF80393;
	Mon, 21 Oct 2019 16:52:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F29F80368; Mon, 21 Oct 2019 16:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C4F3F800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 16:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C4F3F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="U9FNaa4j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cl4SFYYSIDTMj3GUDISXtr+bUlNzJ4lPzxVAaEKBSV0=; b=U9FNaa4jnmUGmPgBoZievN6Pt
 1/7cWEfjp0R4M1H2Jq2JRpcSqOgN3+bGUybu/rqPCW59VoWbL2HeNen5Tn+Zb3b8DvvCcVoEA+X6S
 oqBdweM5fa51AOpzKiZjg04F3ezKCmf6R4MRhdTdJFnEbZi9uEG7vMkJ86uaAy8ViLuiw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMZ2o-0004M1-6A; Mon, 21 Oct 2019 14:52:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2CF1A274301C; Mon, 21 Oct 2019 15:52:25 +0100 (BST)
Date: Mon, 21 Oct 2019 15:52:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <20191021145225.GG4691@sirena.co.uk>
References: <20191021140816.262401-1-nuno.sa@analog.com>
 <20191021140816.262401-2-nuno.sa@analog.com>
MIME-Version: 1.0
In-Reply-To: <20191021140816.262401-2-nuno.sa@analog.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
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
Content-Type: multipart/mixed; boundary="===============8374967731540050442=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8374967731540050442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 04:08:15PM +0200, Nuno S=E1 wrote:
> This changes are in accordance with the review done to this bindings.
> This is a follow-up patch to 969d49b2cdc8.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2txigACgkQJNaLcl1U
h9DjAgf+PV9vOpdiw8ZF/t9vOrEiceLN50X7baJ1t7kS8qZ1Mkw5/Sis1mO3C8Ix
mszvAMdJB3xQD3N8x/KLiaBAqHtgvSemGIlP6Vt5kl59eOfOxOT7eN+ulUjplu3m
Vwkt4tSca6Uz8TmsjD6QinZPtOjIwM2slJABC6opepYhR93LwoeC35OnUuaGnLyU
KBWwzwtqUr0QtsT9Ch773O5DqB+IODJ40D9Iuse+dXAVozjievXEr0Q89P5Nirke
lwdIZ1ky5DLhB09wa0TkiZR4stZad5weCDrgGjk/X6d+hqjqLZT67Li75rO8y2aD
caJM7bJQefvSs3IvTolTsdKoYJ7b1w==
=s/Xl
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--

--===============8374967731540050442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8374967731540050442==--
