Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC489BA9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 12:38:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A8D166D;
	Mon, 12 Aug 2019 12:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A8D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565606320;
	bh=2c9zR0ys4bSxIKhr8xS/UiGELojS7i8csVbyD43VW6s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oLSZNQkp+eB9jso4cZvio5+9rIj7Fp5ySXJuVI+aVubVmcLi4HG1roErYP+eaev3b
	 njYyL0R8aKYewCMTNHkijvIhPAEiKUhOCfREk3tPALS7rSbkTaR1aEkIGTmWKsIlvw
	 SzImqIVAJjje+P/4O7pYd7gC547e4OoD9h7wijNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EDE3F800F6;
	Mon, 12 Aug 2019 12:36:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 887ACF80213; Mon, 12 Aug 2019 12:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24D8EF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 12:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24D8EF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="erOlG55c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUwH9pIyIjc1JYBj35DZL/G76kPUojZ0LNv0jAlGAD0=; b=erOlG55cUA6tiOT6+2H0bGoib
 IX4sEcb+LJGCJ+7A2h3fIxrXWTqsJFft+ws9m/HGU1EH0Rcnn6vWyUQyB1wfNudNH2QzVBogsFWuy
 4FGKwwVPo+ERG43bAp/4CAs23HFUc0ul4PqSe0xenSVz/XDDmGyPot9rXGM23Do6+ENfU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hx7h4-0000rc-UZ; Mon, 12 Aug 2019 10:36:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3D2C427430B7; Mon, 12 Aug 2019 11:36:50 +0100 (BST)
Date: Mon, 12 Aug 2019 11:36:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190812103650.GB4592@sirena.co.uk>
References: <20190809202749.742267-1-arnd@arndb.de>
 <20190809202749.742267-9-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20190809202749.742267-9-arnd@arndb.de>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 08/16] ASoC: remove w90x900/nuc900 platform
	drivers
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
Content-Type: multipart/mixed; boundary="===============4837542394991127300=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4837542394991127300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2019 at 10:27:36PM +0200, Arnd Bergmann wrote:
> The ARM w90x900 platform is getting removed, so this driver is obsolete.

Acked-by: Mark Brown <broonie@kernel.org>

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RQUEACgkQJNaLcl1U
h9DOggf6A+rCl807lQPPc9jvHHoo/VB+g1cF17QNn1JsjP18wNo35uCHJsYOdPC+
LxdxpnoymsYTJxArM87ZGS4OZKKUtwmWVAsy7TxaxJFl0MwtGXvhtzX6BemVPv5Q
2MBWYqkBEbYufL/ldD0B/N6VCnwLwFnYr2iMNNeHg+9MCMblJkeU2GT0Zc3TdQea
VYnj0n3kIUUAAx+uLzLUXyotZ9O4F5R4JG0aDMastWN4fGtOscGwHQP7sDzmDRT3
AWHfuHEVCKOXn78Cpp1Xzum0eHFdBwz33GgrVt8qWtT9LeNOirtEemawzO5FKYZF
Kpt9q0gVAV2vnSXQAjmVBT1vVHgf7g==
=n+W8
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--

--===============4837542394991127300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4837542394991127300==--
