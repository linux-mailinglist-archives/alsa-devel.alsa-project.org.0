Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1A110EC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 03:37:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1259171D;
	Thu,  2 May 2019 03:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1259171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556761073;
	bh=YXaTHntiAG2uRyH+Uk1nqZ7CSc3ccJfLiKyPszaUhYI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ppz1TFSiEpRGT4oZa0rSPDNM12E2ZaMk3w35VYh4XJNl4ibL+TvpgvT1/SlWmHcJa
	 fv72UBRDrUh8LeqGjyqmfSJVmuatdZwgavbWWjKyDXxh0B/lcWP0Vh7wLOPh1M3KRa
	 7qioGily+uWz6/rSMOf6gqsm9+5sbZmus3CfTKgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7308F896CB;
	Thu,  2 May 2019 03:36:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEAEFF896B7; Thu,  2 May 2019 03:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C2F0F8065C
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 03:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C2F0F8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G1oRCbB4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mHcQr+g+0WgMZRfflF73S5O7LOkh9mLNOPrXGsXs5/c=; b=G1oRCbB4IuFIHtYIe4YHD+ILg
 SWHLu0NuG2IicYWgLxEPgXnFjlKNpTA9FkNLNz0YlX+ZYP2oi3Q+ZqrbIRT3cRZXVlGW+OBUHsGbq
 W56vROASK8m7dT3J9uRwFL6aXDNulmmoXX3T5vaFQmbA0rZtke+CcuaWXcYCdEW1/8w/k=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM0dk-0005aT-GN; Thu, 02 May 2019 01:36:00 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id DA641441D3B; Thu,  2 May 2019 02:35:56 +0100 (BST)
Date: Thu, 2 May 2019 10:35:56 +0900
From: Mark Brown <broonie@kernel.org>
To: Ross Zwisler <zwisler@google.com>
Message-ID: <20190502013556.GO14916@sirena.org.uk>
References: <20190429202918.GA35915@google.com>
MIME-Version: 1.0
In-Reply-To: <20190429202918.GA35915@google.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Correct git tree for ALSA development
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
Content-Type: multipart/mixed; boundary="===============3497531339079597765=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3497531339079597765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bAr+fMtvBxbbbkvl"
Content-Disposition: inline


--bAr+fMtvBxbbbkvl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 29, 2019 at 02:29:18PM -0600, Ross Zwisler wrote:

> it seems like current development/maintenance actually happens somewhere else,
> possibly on Mark Brown's kernel.org tree?

My tree and Takashi's tree for our work.

> If so, should we update those stale MAINTAINERS entries?

You need to check with the relevant submaintainers, they may well still
be using the relevant trees for their specific areas.  If something is
listed separately in MAINTAINERS then there's a submaintainer who may be
maintaining their own stuff.

--bAr+fMtvBxbbbkvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKSXwACgkQJNaLcl1U
h9BovAf/bwLtqcAVsqmVhs5NN4rhvNHpCrOqS7ZUc783n8zHxerZNtNBSkjaBnaD
r2VsGhfPc5PLG88IEoniNmJabe2TlakiZSArnFqqUFLw15zkdCxXSWNl8wOZ4cdv
8YizlxD7x7t4/OWzsRDHj3F/9e94lNQ5453b9hwYW32hYEjxJV5QT/4+HywD41bT
rn9yzeQ0aQjwe+L9px/CpVH8fJJsE/ePPHDaPx0eW56izfEPKBtb+Uy5Zh6KSOEb
W87O1AOtwu1YT4WHfJom0MT161/eDBKdz5W5LFh5mj/0dqr7XjTf2faw1dNrTzp/
syJYkKMcvmyTIiao1c5boK+8HiYA0A==
=GEWW
-----END PGP SIGNATURE-----

--bAr+fMtvBxbbbkvl--

--===============3497531339079597765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3497531339079597765==--
