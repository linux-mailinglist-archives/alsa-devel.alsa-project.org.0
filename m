Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC8D2C22
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A4B166C;
	Thu, 10 Oct 2019 16:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A4B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570716598;
	bh=ZvY7CWYh2MRKtZyt2Y3GcFIhfQfmIdynD60Ljak2wv8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+UU/sG4KdUBidsJH9p5FIhA9ygVwtJ9ian/bXLKPurfKjOwd8vhWovF6FVCqkspM
	 n2XpvPkbT3l1YpxX+z0NWOjr+jTmLYZSpIMuULOG1MEO89Zqj1HRs0YvAPCU11B1HQ
	 DSnp8Ol13R5D0Dotm/COTwFmrWRtkV7t8dLiH3TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C114AF805FF;
	Thu, 10 Oct 2019 16:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19F6AF805FD; Thu, 10 Oct 2019 16:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C69FF80113
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C69FF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="K2lvcm8B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4IuIsRMRH2elRAKEMCJGwkUYAyqXJl+LHJEriHj45dU=; b=K2lvcm8B06t4n2soyVFF3jlsf
 tlF01SEKtcRb8kPEvgaDMheKX5Kj7g9snavhE7hEphOqs8Sby4K8tFqOCjfofOcZcTInE/9fMPg8N
 De8caEigTMwUdZVx220epobvaBAaOgux3t0k2NLClG5crSoppvBn5d7pkLVZQ+s9DP+Lg=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZ6r-0001WL-L3; Thu, 10 Oct 2019 14:08:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 49E88D0003A; Thu, 10 Oct 2019 15:08:05 +0100 (BST)
Date: Thu, 10 Oct 2019 15:08:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191010140805.GA4741@sirena.org.uk>
References: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
 <20191008164443.1358-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191008164443.1358-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: Void where prohibited by law.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/9] Revert "ASoC: SOF: Force polling mode
	on CFL and CNL"
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
Content-Type: multipart/mixed; boundary="===============5312134884777474056=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5312134884777474056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 11:44:36AM -0500, Pierre-Louis Bossart wrote:
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>=20
> This reverts commit 64ca9d9fcb3e3c86b1417e3d17a90b43dd660f81.

Please use normal subject lines even for reverts - it makes
things esier to spot.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fO0QACgkQJNaLcl1U
h9Cq+Qf9GNVxc9OR6NhV5veGCRtTiG8H6n3H2MdFC4uDIriBKWs7xfJtW0oviqhT
asMxyB2MXXxWzjVtSmUaAAuGXZu9q+PbSUecWakAH1NWJKcwmYc6nqIRQDKLwAqu
kSv9cTTVd/q1hjzJqgSWG3ZWTCl5/HunWVoiCoOP+lvt9xC4RrCnBql5773vNwFd
KkQKHkz6Xnt5dmngHEi7AbT+FcU+V6WG+RuFAyV1BhLgfLcfY0pfIxgbwg+P6EPT
/kbLSmcfXZz5QRwoqlDc5Oca4BYvxp299fTZgWRPK9M//F1zMdAyiL/SiQ8vfbKq
AoHDLoRcSgnbtCqvrLczW4hfJjNCzA==
=TWjY
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

--===============5312134884777474056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5312134884777474056==--
