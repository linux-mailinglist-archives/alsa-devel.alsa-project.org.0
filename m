Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA5252322
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 23:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF21A16DA;
	Tue, 25 Aug 2020 23:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF21A16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598392285;
	bh=9BrDq6Gjq/Y77i7qs+NbOYbjNIjZinMPZkwE9YvtUjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmfRCstZVVW56VUIzevAzf1WUnBMBl+ml78BXu9LI/pV9SNWkCL2GflJh4oq9iHqf
	 RK1hIkBeRuEnjsRiL5AR79JJ2imJzIB/zxDG4HOQvjwrUwxZWml6DszfA037rKQnV3
	 YU01PPlKWSX8L3KZ8nyD7Y4K2cDxru4xw1KKvPOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E24A8F80260;
	Tue, 25 Aug 2020 23:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64D59F8025A; Tue, 25 Aug 2020 23:49:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3718CF800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 23:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3718CF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AVppPwLq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACFAA2071E;
 Tue, 25 Aug 2020 21:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598392174;
 bh=9BrDq6Gjq/Y77i7qs+NbOYbjNIjZinMPZkwE9YvtUjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AVppPwLq36+HSZ5f14EL8j46bG9IbZ0AJSo/oTViYnbKjmzg3aM/nWhvjH7S+Nuzk
 DOQ3h1H2OIJ3ngRNujyjDsESlFtSSlyTdb1oHtZO/Rz3XCjO7X/Cgq6j/Xma0xhrPV
 eaCdA+pSkcGdyRZj8IeDDvcehjTMr9gLnQyWmeKA=
Date: Tue, 25 Aug 2020 22:48:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] regmap: sdw: move to -EOPNOTSUPP
Message-ID: <20200825214858.GK5379@sirena.org.uk>
References: <20200825171656.75836-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DfnuYBTqzt7sVGu3"
Content-Disposition: inline
In-Reply-To: <20200825171656.75836-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--DfnuYBTqzt7sVGu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 12:16:53PM -0500, Pierre-Louis Bossart wrote:
> -ENOTSUPP is not a valid error code, use recommended value instead.

What makes you say this - it's what regmap uses internally for
unsupported operations?

--DfnuYBTqzt7sVGu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Fh0kACgkQJNaLcl1U
h9D4Vgf7BdFX5Dbcg2/N9Rn0iKz9WFK0Q8Wf7j3HHZ9+IFyb7s1woC1ODAYmdK4V
exXPOHHe/01Wchdbbd285hFg9dmvi0LrIgck3vu0g9RsiUu9xIKcE+WlUOJWXyKq
0FvkMXGZA+WM4h85C9IAXgghI3aTX+rLZX0eASivujZu4m8SCii2g+oD2crk7e+5
SBzKjm3QR7bWSSgJmhrlFFVF2gUaTLVlLiM80dymV9rS6+OtDyyptl/586owjA9q
I9Y7II+RCy9ZeDeVjsgBcxFXsu8+MlnUd9QLT7uzqzNRBcl1jWFCLTg0bRzKq2Zx
Au0AkyS+sLDojGFTaWGPJnECuZ4QzA==
=Hv01
-----END PGP SIGNATURE-----

--DfnuYBTqzt7sVGu3--
