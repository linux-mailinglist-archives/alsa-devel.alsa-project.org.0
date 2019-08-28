Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA0A1CD2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E35167C;
	Thu, 29 Aug 2019 16:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E35167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089164;
	bh=PKFyTDwzuUtyj7USK7bngmMlBOf3F4StiN6T4ptn6q0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AW9zAz8Wgl5kE65H0NVTSTCSX8KbWgWWgLrmnQbYJMx8gY2rleBoofu6JQEsyaQyD
	 3D83xUgiErtFeTiaEdGD/2U/kkQGbw4BUf1EbxTJCjUoFcPFx0y4g6ImcN2cMHGWGt
	 BeC9uCsccmKoMkvKpJbEbveeW/f/TQS3yhnb0mOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52DFAF89752;
	Wed, 28 Aug 2019 12:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E25C5F89751; Wed, 28 Aug 2019 12:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99F05F8974C
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 12:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F05F8974C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FHwIN28/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RS1RV8+vrhe1HHrZF1bcYrfNj1k6BlgJrN5DjugN3j8=; b=FHwIN28/QvkWQpi/ooyJGKS8d
 G1FNc5/yD1dPYkRUCL5TITIDz7xsXSI32o2pOjtQgnwrFMveFtiESj1VH/zF1nZjf0HXgRsCOl7M7
 +bQPhmVooroCk5mUt4PfN0qKUaqIaXpqieaW+96xP9wofJS2ib8ppKgfkrDXW+1v4lvcE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i2vWF-0003dc-RB; Wed, 28 Aug 2019 10:49:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D7B312742A55; Wed, 28 Aug 2019 11:49:38 +0100 (BST)
Date: Wed, 28 Aug 2019 11:49:38 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Message-ID: <20190828104938.GF4298@sirena.co.uk>
References: <20190826090120.1937-1-shumingf@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20190826090120.1937-1-shumingf@realtek.com>
X-Cookie: Oatmeal raisin.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt1011: ADCDAT pin config
	modification
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
Content-Type: multipart/mixed; boundary="===============6149617110266277293=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6149617110266277293==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Content-Disposition: inline


--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2019 at 05:01:20PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> ADCDAT pin config sets to output mode in default.
> And the driver creates the kcontrol to control ADCDAT pin configuration.

Why would this change at runtime?  I'd expect this to be controlled by
the machine driver or a DT property.

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mXEEACgkQJNaLcl1U
h9BARQf7B+igTrQh/wu3MSJ+gfpTm0twpKyaZRXGaeqfKdEvy3t+lvYrdH2sHhJh
d4FN7QnapUkjMMPJTaeoRwtYjEWPaGfacIUoaYcZxF2k1blvq0q2IA+yXs+GTEh0
ANXhanQThTLsDTLN1RaagcQuoPDyLb1Sr++5BbEJrZyQq9wtjC3dQwbevmD/U546
SZB//BJWyljTEGYwaquEFX3IG/WD77aIJ2bw7lk3CoRBNadUb9PEj26sKlVejVUk
UhgFCivZJwcEsnrEGUYZFirP7yHVA/YG5OYnSCc6aFT3z2jgwmNvI8INfgwa2q2b
y9rNQu49eXwAiWCvCVhpuducmm6rlQ==
=M3WZ
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--

--===============6149617110266277293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6149617110266277293==--
