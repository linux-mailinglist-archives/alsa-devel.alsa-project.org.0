Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B8820AB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 17:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00FE1682;
	Mon,  5 Aug 2019 17:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00FE1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565020023;
	bh=Xi44CIg5Xj2jAusNxlTLWhjXx5iWC5/xw+ns+Zy9MwE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WoaVJhEB+PyVRtNYcc/ffyQ6GKXfe/A83Oyo+rUB846KA5JT7oJTuhbZAyYs22Iml
	 26N+MAMkvAdAgivtLpFV7xS//Ivn3UAcxsQo+MDIDAo/X5oFNd1/t63K0aWnpO1L8M
	 Gmk88pWNSXPlx8VSlX/Z0wZTBbEbG5ksQCgTjx5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB872F80535;
	Mon,  5 Aug 2019 17:45:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35EA3F80533; Mon,  5 Aug 2019 17:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 160FEF800F4
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 17:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 160FEF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ripdpKwm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5eVpkFEdw5egTTAtjO0lJ5/quvRjbUUWrPiHNU8aOOo=; b=ripdpKwmF/MCfBI5bBWz1Eo8b
 q814eMTQI3hLotYx/OlgTtbkTHzt3vAgP2wG+VdIdPuey22EZXEOp0R682YdVWG95t14n3QCqnxjS
 i0bOxuNpqjNd/ljuRJ1fotbx77AByE3osRVlq9qizWDtPfQyzvrEet5BwmGQarkqxBqyk=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufAf-0000fi-MZ; Mon, 05 Aug 2019 15:45:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 722832742D06; Mon,  5 Aug 2019 16:45:12 +0100 (BST)
Date: Mon, 5 Aug 2019 16:45:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190805154512.GJ6432@sirena.org.uk>
References: <87pnlx5rq3.wl-kuninori.morimoto.gx@renesas.com>
 <87o91h5rp5.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87o91h5rp5.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 01/29] ASoC: Intel: skl-pcm: disable
	skl_get_time_info
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
Content-Type: multipart/mixed; boundary="===============0065193283058204460=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0065193283058204460==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="72k7VsmfIboquFwl"
Content-Disposition: inline


--72k7VsmfIboquFwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2019 at 01:49:17PM +0900, Kuninori Morimoto wrote:

> Now, ALSA SoC doesn't setup rtd->ops.get_time_info.
> This means it never used in ALSA SoC even if
> sound driver had .get_time_info.

> This patch disable .get_time_info from skl-pcm.c.
> Because we might be going to support it in the future,
> it uses #if 0.

The #if 0 here isn't exactly nice...  it'd be better to just implement
get_time_info().

--72k7VsmfIboquFwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ITwcACgkQJNaLcl1U
h9BXowf/bZLOdC/nKV4j4ogYg8CtnKH17xq3ayjIbuQdZaiQqgOQclny98lqks9V
MNfeq0PELaDGxNoVOP/15/G5+omwbn08vWPAm/NZ1F9E+LcWGW6zv01Gn6B09pHo
eqCIRqOHgnGJ3z+/ynA6sIS9p9qjZITk53ggemhH+SRLxp/76aZoippNXOcSINXB
+fmJp4iT+c+Rij/1KFv7v7753XDG6CtRPuAqnmT2+Q9xT4Vb2e6J+r9LfhAPfuse
lYvf1y11svqSGHdixGDeVpZJm08kewc9yCLSBa/W2Hb5Uz0aqQiExl7XNNDkhJ8b
kzsHsi5AbA8XONqm5MaK3IQKITadMw==
=8cY3
-----END PGP SIGNATURE-----

--72k7VsmfIboquFwl--

--===============0065193283058204460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0065193283058204460==--
