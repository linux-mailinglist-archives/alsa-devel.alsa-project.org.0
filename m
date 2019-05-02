Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37998111AE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:41:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9485174E;
	Thu,  2 May 2019 04:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9485174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764893;
	bh=m12P4msXpgKIyhgahf+ttpQ4SuQbkX22876cBXUfihw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fKKYCqFD855kO2WJXjf0uvgyB3gII++1hl9LB0y9AULYyRB2BxIQ/S4D43pM+LOQo
	 at+CuMTsz4N3i0HRUU9A2N4Xe9zn7POy3tv3xVvc84XMtUfWelbwTOzpH39obNuGU3
	 6hHLJMKQfHBQ+rzw36rhuxNAHpVepj9aewOzhfS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B24AF896EA;
	Thu,  2 May 2019 04:27:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51BC3F896EA; Thu,  2 May 2019 04:27:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 619F7F896AA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619F7F896AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aLU4nCOv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9c4BcFPduca/5DIXVfe1mO9D4wGow/7aiG5RgWCHmVw=; b=aLU4nCOvtXATqFiWNV81qdttd
 0zXOKNP1h12+KvH+DanJiqPnoQf9Vu9NbeR/Yr2aXENfdbl8kaWNXuGjyB/aeJ9uldnFpmJ19LeIb
 hqrQFgLM7sXo4QhJuLsLmaFqsdiAFulTN/z3wEYOZFe/gKC2G3E1/31EYBfd0Lq78P4qI=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1R8-0005z1-7W; Thu, 02 May 2019 02:27:02 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 17DAC441D3C; Thu,  2 May 2019 03:26:59 +0100 (BST)
Date: Thu, 2 May 2019 11:26:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190502022659.GR14916@sirena.org.uk>
References: <20190428072550.31087-1-tiwai@suse.de>
 <20190428072550.31087-2-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20190428072550.31087-2-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: Add support for Conexant
	CX2072X CODEC
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
Content-Type: multipart/mixed; boundary="===============1504920989372867966=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1504920989372867966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zj18g9eElA7rRQh+"
Content-Disposition: inline


--zj18g9eElA7rRQh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 28, 2019 at 09:25:49AM +0200, Takashi Iwai wrote:
> From: Simon Ho <simon.ho@conexant.com>
>=20
> Initial commit of the Conexant CX2072X CODEC driver. Some features are
> not present.

It looks like this raced with me reviewing the earlier version and my
comments against v1 still apply here?

--zj18g9eElA7rRQh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKVXIACgkQJNaLcl1U
h9CQvgf/eEA8Rqg+J/hXBuY5uGTB2ZqsRYWjWnpgfP2g8PeT+NDWHlw6rVt7Yzua
hRiZqVeD4qz93rQyE6iMz9KhcwkGQl+Fy4+9z9lCvTWzFAZvTYrot2CNd6IlgQBH
e3Z9TytqEXc8bW34FHmiGiuIjPRxOXiU8bN2GtNkc7LyzBqOewlXzhqONBc2A9vX
Xo33jz+4Q+NQ1zIVvuLgxAGIoFiw5inHqkcPV3YdIK3pU/ujGCY9p5o7DLsk/bND
z+JJJQecf/ltwkMSp+Ad3ZtgSdQkG8Jea24dwl9K36R+NG73wEz4qFF1yl+h+6CL
c67L1xSoWvwwTI/4Q8L2pWf41dVrvw==
=PDS8
-----END PGP SIGNATURE-----

--zj18g9eElA7rRQh+--

--===============1504920989372867966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1504920989372867966==--
