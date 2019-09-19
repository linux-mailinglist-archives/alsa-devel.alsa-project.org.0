Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F5B7934
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 14:21:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660E41670;
	Thu, 19 Sep 2019 14:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660E41670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568895711;
	bh=oSwqmcVJldok6KWPu610m77oA5PF0BDn09/JtT3DGyo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FR78WAdsG18KG3dHbbdG87wRxVssiKnde1Zh4TMjd7L/hT61vkYi9So6IIoDmPULR
	 oRY0VMud1Ost3mSj4Z42xoKBE9oW4ubL5NXIddQ6ZxOJuz7F9zeP72YFsTYcnQDAEe
	 r77FL2CrcoivYb4PLI2yX2dnxwvMbJw1lILJGKb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A313F80307;
	Thu, 19 Sep 2019 14:20:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CB9F80307; Thu, 19 Sep 2019 14:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10F09F80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 14:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F09F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="resN0vOp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AKopFK9dEIstEyim43tGHA3fBYATZ7qA4xc74oY0yuI=; b=resN0vOphZBdOMgJs8+wgivHZ
 SVUSQdBoKjNnMbNMYq8nrtj8dkQCIQLwK8xaUubEn1VZdV67XmuYsZYIpy6BRe8bQ+kP/rV4IXU0N
 es6Q7U+ZLAqSMO0sNnQpGblBqa6XDJl5BF72KSv7IooaMtFU75sI73zGKbs19pPVPMjds=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAvPj-0002Su-Mu; Thu, 19 Sep 2019 12:19:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 290F42742939; Thu, 19 Sep 2019 13:19:59 +0100 (BST)
Date: Thu, 19 Sep 2019 13:19:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Message-ID: <20190919121959.GH3642@sirena.co.uk>
References: <20190910092016.GA6821@ubuntu>
MIME-Version: 1.0
In-Reply-To: <20190910092016.GA6821@ubuntu>
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] DPCM: suspicious code in dpcm_prune_paths()
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
Content-Type: multipart/mixed; boundary="===============8609301038415984483=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8609301038415984483==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 11:20:17AM +0200, Guennadi Liakhovetski wrote:

> This code in dpcm_prune_paths() seems to have no effect:

> 		/* is there a valid CODEC DAI widget for this BE */
> 		for_each_rtd_codec_dai(dpcm->be, i, dai) {
> 			widget =3D dai_get_widget(dai, stream);
>=20
> 			/* prune the BE if it's no longer in our active list */
> 			if (widget && widget_in_list(list, widget))
> 				continue;
> 		}

> Neither of the variables, that are modified in this loop are used outside=
=20
> of it. Was the "continue" maybe meant to continue the encompassing loop?

Liam?

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Dcm4ACgkQJNaLcl1U
h9B0rQf5AQXL8hYaKy1bLoXYcxTwsfVDZRIsGCj81qI1CeNjLlVUHfX8wBSTbGFY
p0mdFv1We73gKiaBiCeYMvBBHC4Vb+BnmT4qrS7u+8L90luxxnxo6Pn1dy967RvU
lM1PXZCc1xjqWar2n7MEN39sjMdmUPlXLuwdDiXz2d1g2HD/XZxB5QymYt45JyNN
qhxrgxJAREcLmqzXdR7PMlPug511TuzWZ6OYqCxGozrG8lqqfELtjct36x1ZRQxL
+/ZD3gYXSKoy6nc4Ovrv82hZD3WmixkC5VAVC7TOTQrRPfaJMebBaNCzYaqTelGv
GVkmNlcnCsWxqH6QzgHvlessJpdTnA==
=S++M
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--

--===============8609301038415984483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8609301038415984483==--
