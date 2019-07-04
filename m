Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AE5FC04
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 18:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910EB16A2;
	Thu,  4 Jul 2019 18:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910EB16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562258484;
	bh=jSru6HL92V34uhhE18ySTvCpSFe2SlBYuCwb65LIoTA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BPoef0j4ZzX1PGordOWDbjbUR2eqjg5IPj8eKNzq2zeRcFgQ1uhPLsGk4AF/X/ULS
	 cQwBE+fHunx1mpENsUwblebmQgYoCZAsPorZXcr/UVjEK2rZ5d5JPCkivYa4h6UhkW
	 dZVBtk0IZbzi6JW0urt2qajI4r30KNbLmE5uJmxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B09B9F80113;
	Thu,  4 Jul 2019 18:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C56C9F80111; Thu,  4 Jul 2019 18:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88545F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 18:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88545F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TXhdKBuq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQ7qymNBmIn5r3j+lXOrUKQbw23ni3Gm99jWZjB1Kqc=; b=TXhdKBuqNG3tMb7Gb84QYC5Eq
 qr8bxMX9JG3/EddXsvuQzSTQGKaJPnKyQJeHIXuNzgPzCkWBlvIpKsVtj0RjzvMkDr2JX7PQLZhDi
 u10/TubbAGlBQzJE3Pz/kmzU4z0QfpktwJqC2k68N+uylbYyrkRms8lYiedaj4NHpOFis=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hj4lh-0001Mm-EH; Thu, 04 Jul 2019 16:39:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 781652742EB1; Thu,  4 Jul 2019 17:39:32 +0100 (BST)
Date: Thu, 4 Jul 2019 17:39:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190704163932.GA16332@sirena.org.uk>
References: <20190703123257.27228-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190703123257.27228-1-srinivas.kandagatla@linaro.org>
X-Cookie: ASHes to ASHes, DOS to DOS.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd9335: remove multiple defines.
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
Content-Type: multipart/mixed; boundary="===============9159541829335569623=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9159541829335569623==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2019 at 01:32:57PM +0100, Srinivas Kandagatla wrote:
> Found during review that there are multiple defines of same constants.
> This patch removes them!

This doesn't apply against current code, please check and resend.

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0eK8MACgkQJNaLcl1U
h9CfVwf/XYySTd1B7uZk1uM6lEcovI+6DiXX6JjOeCWv4gEy3QewgbG4Tr39a5OJ
b7swR0mvF3vq6gNJMuWNdIE2cpZZs4wQSyugLhglSTUWoBd9/COmAWkcqn6FGb6w
Uo2WfgquqrBfVPE4OpZV0XypXJIoAnBXo5HV4M+hMHeyFzIOp2xz46+mQPfBzpXY
Jtg4u1jCoQW4/ZZGPk81S18ykawYsFN7QUuOuvHrUVkvQR2iRaDXG6WtiRNbMe4l
psUlBmLqvyPWku4cEc9Jsw46dbyA5MZo46TyTCm+TKcR2t22h4HsvilQ/AUbeM7O
E1KgeiU22xz9XmPfDhTT897wRAnCdA==
=Xpoj
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

--===============9159541829335569623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9159541829335569623==--
