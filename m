Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB43BF987
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 20:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A711770;
	Thu, 26 Sep 2019 20:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A711770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569523556;
	bh=+21SINDf1YuVfT4g+uoZ6gyvzjhmYTg0+hTJSOk6z0E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RR+y50AcIAJHNTjol+PomCh4Phmjx9vWtW7Ztc0YwXgInNppiEkXADIdaeN2Go1mw
	 ibBv2aw0Q/MMo2u9zs+y7XDaP/JEin/1v9c2nfR1BR5AsgW7qOLhZPvCrM2d0+HBhm
	 f4rjPon6c3RXIMxG6+GO3tiWYdToRtfQbi6mG0Ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8E2F805DF;
	Thu, 26 Sep 2019 20:44:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A323F80533; Thu, 26 Sep 2019 20:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB4F3F8048D
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 20:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB4F3F8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mquiCq1z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p5AsxclfyD526xJDQoQ4sUnL8tX1BJhL3h58XggnCVY=; b=mquiCq1z60o3JHCRkv+P62tPi
 Yl8tS+2lgyEbYp8Vzoj19dEHzEBDL3tw53N/RDPUhscCh7QQObjmo8OYHdH6WF+Qp3OLeFHknRj3A
 vjLoiEkdz1JYKxdS7sW6SFTVRT/dh3yns+79GPtvc+yWukJhonJdtMgeAJyDECbNnXEcQ=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDYkG-0004Uq-1I; Thu, 26 Sep 2019 18:44:04 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7DC97D02DD8; Thu, 26 Sep 2019 19:44:02 +0100 (BST)
Date: Thu, 26 Sep 2019 11:44:02 -0700
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <20190926184402.GG2036@sirena.org.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926071707.17557-2-nuno.sa@analog.com>
MIME-Version: 1.0
In-Reply-To: <20190926071707.17557-2-nuno.sa@analog.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] dt-bindings: asoc: Add ADAU7118
	documentation
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
Content-Type: multipart/mixed; boundary="===============6021427838965693078=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6021427838965693078==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0TJQK8JvXJ+EbTps"
Content-Disposition: inline


--0TJQK8JvXJ+EbTps
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 09:17:07AM +0200, Nuno S=E1 wrote:

> +required:
> +  - "#sound-dai-cells"
> +  - compatible

The regulators should be listed as required too.

--0TJQK8JvXJ+EbTps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NBvEACgkQJNaLcl1U
h9Bozgf9G95EmLRFp/BjEK+ieWiSOxCSpfQ8L8hEJCGT8vD8d9yf2e6H/KdCTo6V
b17L8CH24RuXJehCjLgjAkGKyzcGUtiLgqb9IYHzeMchMRMqVK2rbgic9C2uku1K
xKOdX9+oshFQwmPAdXSQIWTazGE6yjSiUgi5MqFQXL29qPLd9ussClxVlIo+us7r
zDB3k4TR5RvSXmbH6qlgh6DXLif5iagV1Wj6eDx8Y1gKa8Rq+IzqXtsHPDjMyjyj
UGPPHWYSSbHKjhHWdh1cxzlO0nI5f87PsuaWtFc5ih0Xq/DZuMhJKn07pYREiyV5
P9kxfSY4g5mLQdX6vQaVeX54HJfUqA==
=DuqT
-----END PGP SIGNATURE-----

--0TJQK8JvXJ+EbTps--

--===============6021427838965693078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6021427838965693078==--
