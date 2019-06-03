Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03C33761
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBA91665;
	Mon,  3 Jun 2019 19:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBA91665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584838;
	bh=OntFSFn783v6oo3frOuVc1tixHYtHdYrEr5OoxuqQjo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dts93ukudqvjWqWCUInnAOgEaFobj1Wz1LpIQgzpXurkcb3jiLXIKr1WZ/zWv3yWl
	 EzLaGLBgWuDWv8UiaPETr47rSTflFnYE+09qMJ4qXR7e3OaLXg5FLEIPhQAXJ/JAPD
	 PIQC3JdX6kYpWZ/k4BwMQIDVkuivy65GN5K0iznc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D92F896ED;
	Mon,  3 Jun 2019 19:58:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81339F896DD; Mon,  3 Jun 2019 19:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D645F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D645F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ERkp3AU0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vNoaf/BsgR5R3vkbQszzxACBpSzqrvmtQNpGl/ZGtVo=; b=ERkp3AU0Wn3OR8kwDnboAVXRT
 HSa2MUef+xurMo13nBTNlXdnGoslMWOjPzFa8Ch8O0j5Bi98vHUVSfr1K8F9wfwv43BduTAQ9m+X+
 STCp7vL/qJB+IhZjMXLi+drV920WiM+1XvaGg7dv7exOUTKS7KR/CHP1FfUC7ekZjy/7c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrEK-0003XG-PV; Mon, 03 Jun 2019 17:58:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B2C30440046; Mon,  3 Jun 2019 18:58:43 +0100 (BST)
Date: Mon, 3 Jun 2019 18:58:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <20190603175843.GA30701@sirena.org.uk>
References: <alpine.DEB.2.21.1905301904530.2500@hadrien>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905301904530.2500@hadrien>
X-Cookie: Goes (Went) over like a lead balloon.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: fix ifnullfree.cocci
	warnings
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
Content-Type: multipart/mixed; boundary="===============3399619187531891029=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3399619187531891029==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 07:06:11PM -0400, Julia Lawall wrote:
> From: kbuild test robot <lkp@intel.com>
>=20
> sound/soc/soc-core.c:391:2-7: WARNING: NULL check before some freeing fun=
ctions is not needed.
>=20
>  NULL check before some freeing functions is not needed.

This doesn't apply against current code, please check and resend.

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz1X9IACgkQJNaLcl1U
h9CjqAf/dHMmaH160jKSA3JntU1LqgMdZeChArVfnwMLbNzKgFHsL3QKbmUKc4AG
Tr2UTEkqrx9bWisFr6QHitR8Cn4J65tJd11GlgbtKhbIp4SzA0R91QBgwIq11Ydf
be3a/fPLacVITJLzpB6HXX84NbutITX7NXO3UBrHdvGungUBdp8Y+v7fEtQslP4u
jJjMISUqPyM7zZzKR53beoKqjHQpfyKXaEyM/zJwvj/1kQzOLfw2CXQ7qEfIs0B0
im0OuQfsVNFiOwzP5Ns10p96TbTJ+pTFuuT0jbiMwmKjNDgETC9chUUljIsZZwM+
mCFTYM80ltgY0iT3MjGFN/GPtxoUqA==
=kyDr
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============3399619187531891029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3399619187531891029==--
