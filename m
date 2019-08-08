Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FC86226
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 14:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F266E1616;
	Thu,  8 Aug 2019 14:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F266E1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565268390;
	bh=fqV7QbwnlPOTEac189irNDbwM8DKW97IY3s1Z5qPnxg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=brQKcJov4kA89qTvJ6UbCvFB0fZNyg2Mc+INPmRtXvLRZucIcWe5ieLwK9cUW8b9w
	 0xv1kkTanSPi9moxd0JjR/nbheEo5whBaf36vUUZUZlihxTTt5b8L8b1jprc8dHNj8
	 J4ZY1YZruYaSpeN8EmcMxYo91z2u6dbkJ8IvQf7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42F28F803F3;
	Thu,  8 Aug 2019 14:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CF59F800E3; Thu,  8 Aug 2019 14:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE3B9F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 14:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3B9F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rq4cT89p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lCsofZGv+cxb/oUf1c4muQ0GNQflHlLh+n32fEyltgY=; b=rq4cT89puSmiOH6w551MDjl6P
 WFKsDiYQyjd16N+pdyGRdfd/4TbFM9y1ujcg5J0XPaEvbtEUC0HQUAQcsd32ZZasiVEHnZ/bQ1QAr
 /MeWf9p6T1hy+UyDZVVngOwOaODEFK6Lq4bcxCPDxX6ZZf35zRZ9DOHsQYHVJbLezWdoE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvhmY-0002rE-S3; Thu, 08 Aug 2019 12:44:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8BCD22742BDD; Thu,  8 Aug 2019 13:44:37 +0100 (BST)
Date: Thu, 8 Aug 2019 13:44:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20190808124437.GD3795@sirena.co.uk>
References: <20190808123655.31520-1-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <20190808123655.31520-1-stefan@agner.ch>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stefan Agner <stefan.agner@toradex.com>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: remove error due to probe
	deferral
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
Content-Type: multipart/mixed; boundary="===============4840347219332033799=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4840347219332033799==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 02:36:55PM +0200, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> Deferred probes shouldn't cause error messages in the boot log. Avoid
> printing with dev_err() in case EPROBE_DEFER is the return value.

No, they absolutely should tell the user why they are deferring so the
user has some information to go on when they're trying to figure out why
their device isn't instantiating.

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MGTQACgkQJNaLcl1U
h9AZOgf/ec4pDTD4WicmfgDb6XwsH4eD1aXoxrGSnAB5x5OCvTtls7jFlVUGSmQx
J9Ymtb5GfHoT9di2uTZimz1Pj8K97ahY3Ov4Tebl6pinVRZh9cH7j0L03gaxRDQP
EEVUkju6pq09n9JR8B2F6iIvoZb6YPRZcuOlZInlbwuW+S1hk25rmGvenhsryxgD
JytTBgBlByqutRVIPLSFI1MDLgyGoF5BtgAqqiCP+wccGpa5vSsfpdOY9lPkA/Dz
1J8RvlsWkcJg4Q/YPBAA96CS5IwlX2Cf2EVOs02vTFIldoZub8j/ZMSfhAJhNph8
pUWXwAmBMFjCoV9IoS4b5XlmBjq1Vw==
=Ire8
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--

--===============4840347219332033799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4840347219332033799==--
