Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A74D2ED2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 13:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC5D1758;
	Wed,  9 Mar 2022 13:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC5D1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646828045;
	bh=HQtUh5F+3Pud/JJ6YLhmkIUGJhE7yFbx4GD9vgSBFwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQBJgzkU+qcZ44rJ6KxoWacqqL1i59+Leff0A/OyJA35seWqpTolOy5F7a9ml+CE2
	 DNnuqxlciI+QVe/UIqvBoAsYBfevFMdXG49yuCq4Z5wT9nU6qJKvQMjt+jVbXUfH8x
	 OKeisnmyc2SDr/KozpU8QyYkTnrRNt4LrOx8KlIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E4BF80155;
	Wed,  9 Mar 2022 13:12:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D1FF8016C; Wed,  9 Mar 2022 13:12:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F19D4F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 13:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F19D4F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D4a4Xqtu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EE51B81E9F;
 Wed,  9 Mar 2022 12:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5137BC340E8;
 Wed,  9 Mar 2022 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646827971;
 bh=HQtUh5F+3Pud/JJ6YLhmkIUGJhE7yFbx4GD9vgSBFwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D4a4XqtuwDJM076l2/hG2lboDE9MUfk9TC1l5WgleXDqzjvNYxsSt2MCWCpESIaK8
 Odlfv39dSnu5Hh/yJdYeoEkjAgV29phD20ZhFexkUXDX+lLwzBBxHF6PZImQpvMS9z
 Dj8vhiQ0K19J7kmclLZENZsVj3xelyXwx1ZuBgz25paW2E5WL0oFdM+QZ+mRWJuzOG
 vubUujc5vfI7cRSJtDWNgM9x6RFaj0B2Zncpiywf1Vx155uYdiPscpTej6XhwQc03u
 zbQP7UukPveegzZi/fANjonV+vZ88Nt0WyQZL6ACORGkNy44V/d4IMRjOzwsKlhhNr
 lLOEPEXN+FijA==
Date: Wed, 9 Mar 2022 12:12:47 +0000
From: Mark Brown <broonie@kernel.org>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH] ASoC: tas5805m: fix pdn polarity
Message-ID: <YiiZv7Fc8a4O1nYR@sirena.org.uk>
References: <20220309104104.3605112-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ba1YCjGxAge/4h5/"
Content-Disposition: inline
In-Reply-To: <20220309104104.3605112-1-john@metanate.com>
X-Cookie: You will inherit millions of dollars.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--Ba1YCjGxAge/4h5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 10:41:04AM +0000, John Keeping wrote:

> Fixes: ec45268467f4 ("ASoC: add support for TAS5805M digital amplifier")

Please don't insert fixes tags unless you're actually fixing a bug,
stylistic improvements like this - people try to use the tag for
backporting bug fixes and so on so extra tags create noise for them.

--Ba1YCjGxAge/4h5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIomb4ACgkQJNaLcl1U
h9A0sgf7BAc7mpPh6cd6TuUWK6w07kKjeD9dDKEN7YQPDl8/DoGFHQa187x3NEzx
7isd/LtzDtFbxqxCJZ9fInOYWk30hNQa9PwjO91UhWbHLUTdUABh1cRzH72vHw3t
sIkVA0MoX7kuA0gRooWOTWYDH5sVN3c2KaO8tGDVtqoXZBnNm55aCmyGu9ESyaOL
cOqCsfdGUWMVuuR5n6c1oQpX4U2GXfZ2711hoWxAzt6aPeVCYY5HZs4kKUAHUEAH
6kxn8ZdLQoi8zu4b4FXd8TA5KZVcWB7hsptsvxeOZR/25uU+tnmdS4hEpcSspZyq
piirNBAh25ogtsX9Urp4S42XgrHSrQ==
=cmOh
-----END PGP SIGNATURE-----

--Ba1YCjGxAge/4h5/--
