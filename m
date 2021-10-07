Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3434254FE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 16:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 690BE1685;
	Thu,  7 Oct 2021 16:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 690BE1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633615523;
	bh=FxCAFLlGgK49/2COjsXgG1rVtjEcAsgaFojdvABsXqo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJEMfQkPrfR/EshP0Oa471RZkLzShB7mWf/kOrDDk4/wRIyx2Wjx+/ADLk6H13iV6
	 nZIbtk5Q+rf5UDla+NlTsPVOeOebpjyWPTW3j4siLmQxVdEi08Gpzs/4nENr2KZF1B
	 Vv7Hhi1CushF3IGr2JD6esMI0078EW68CXYUoHY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB134F8028B;
	Thu,  7 Oct 2021 16:04:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46F1F8027D; Thu,  7 Oct 2021 16:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_RED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4B3F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 16:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4B3F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CvUZI27J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60D0161040;
 Thu,  7 Oct 2021 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633615435;
 bh=FxCAFLlGgK49/2COjsXgG1rVtjEcAsgaFojdvABsXqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CvUZI27JoscBZGdZ9A6RfsjyOv7+5yiC9bYrhS1AQRCBO591YKc8EM+uKvl2wnBHm
 sGtXsUs8Dvb/gSQbVcLjLyKOG82Xkis8mSpmlz6ZvQ8w/yWRLcmht/4duU4PpSNi8T
 YH+OldYxh6AF6hTEtWHyDBJTPzsxQMfZwomxEbBUjM5+HpV7p3pkDWrX22K6nqMWVJ
 n6jCaedFT//3P7hUkfHRm1BTTF+Dp2SoRYpSnj8le6f96QykH6Cnufzufs41ij+/mO
 qEEWoTTnq4CRCMSlkwWyvofuwg8cKJ+HTW3QbHMksGyAXOXwvVnktUSotjrr9rP0vB
 +6qOIaczWzP+w==
Date: Thu, 7 Oct 2021 15:03:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Alejandro Tafalla <atafalla@dnyon.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: sound: max98927: Add reset-gpios
 optional property
Message-ID: <YV7+STMCR9VwVwzH@sirena.org.uk>
References: <cover.1633572679.git.atafalla@dnyon.com>
 <5004d52da527bf1dd9e5b17e20b2ce50a0b57b5a.1633572679.git.atafalla@dnyon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NUQMgpiVZHupYbGL"
Content-Disposition: inline
In-Reply-To: <5004d52da527bf1dd9e5b17e20b2ce50a0b57b5a.1633572679.git.atafalla@dnyon.com>
X-Cookie: Colors may fade.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--NUQMgpiVZHupYbGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 07, 2021 at 04:38:58AM +0200, Alejandro Tafalla wrote:
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--NUQMgpiVZHupYbGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFe/kgACgkQJNaLcl1U
h9CPCQf/c8ztQc827+7duxObGTk551NtNF0ANN+oi7Jj8i4cc12kZNRdnATusEp4
87+//IPw49XR2ecA1z/7vRO6nLWN82hYJg8+maq4mYyC6Iz2jzuyA/Z1EutvNuC3
jerDjqtvT6UPH5B6p46l9gwdsJQJ9JotNz8jo/YeQBTeTevsa8KG23UqE2dpv3vc
yz1wpRMo5+IygDns+PbkwaZnTtCSA6y0Fb/wF0YyAn8yt2I/EnRV6FSyO2nxA3Cf
4loSR5+Lqf5v6TrnZy2wOJ3PyNH0eYqg59Pj7ZQEqEc+91Af1xFm236cuHTajczr
sevuM75gVsXBmFbhoYu/QBc1eJQHTQ==
=Ulyj
-----END PGP SIGNATURE-----

--NUQMgpiVZHupYbGL--
