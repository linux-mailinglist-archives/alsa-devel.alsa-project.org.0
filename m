Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BA2E7999
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 14:18:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2B01842;
	Wed, 30 Dec 2020 14:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2B01842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609334291;
	bh=AkIQMFW3uBWg0gGY3L1pmtX/HhTTMeoRJWJ7Vk4TO1M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ISYuwMkR8dS50At5wYqFmaRY1qlphqKKuJFnL1KLg9tzDoqTchK9yCzCsz7tnOuJC
	 fF5DwXp34Ry+/9NW1cZzuL5iOsMzl2ZYeRIxFUMseZKYpaiTj69IIzwhnx3uimRG1a
	 6pzwnhOvHiMu6XKIxPpIohzw9GgUdOtBjatg+j+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDAA1F801F5;
	Wed, 30 Dec 2020 14:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C1BF801F5; Wed, 30 Dec 2020 14:16:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B879F80132
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 14:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B879F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L58OaIVO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F6E3217BA;
 Wed, 30 Dec 2020 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609334190;
 bh=AkIQMFW3uBWg0gGY3L1pmtX/HhTTMeoRJWJ7Vk4TO1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L58OaIVOcbGms4rTCqXro1aX5Njbgnj7qwZGelpPOPbnR1t/lDqUf6tyKZD4gsBDD
 ixbe0WZ8l/uJjQr6Pb8vzd1Bpt1RWP2jUbAbKeHk0KLdmJcOX25Wrf1hNpFE4zA4fK
 n/I1CTf9GNSBVfectAvujzS3E7f7EqySg3M+SEEKb07fcCl6lgbfPgf+fm9qqiqETd
 fFcry8suuTC2IRaZ/CaEDI4oMBgnpBPZN/9+WNuNa6fOJKc+Uwx4YF5dRLocmxx1Kj
 KCIqYSG9ZdFNqCz9/duIitFMosFtv26TBvajZ3w1WFKZYKqu4KFIkpm3KDZRMNbWjx
 A34fAkEaDfNgQ==
Date: Wed, 30 Dec 2020 13:16:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Message-ID: <20201230131605.GB4428@sirena.org.uk>
References: <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150635.GP9673@ediswmail.ad.cirrus.com>
 <20201229151548.GG4786@sirena.org.uk>
 <1d982dd1-eb02-e7c7-357e-83cf5003c624@redhat.com>
 <21333e30-1e7a-2c95-9e7c-6325c7e78f9a@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <21333e30-1e7a-2c95-9e7c-6325c7e78f9a@opensource.cirrus.com>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Chanwoo Choi <cw00.choi@samsung.com>, patches@opensource.cirrus.com,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 29, 2020 at 04:51:57PM +0000, Richard Fitzgerald wrote:
> On 29/12/2020 15:40, Hans de Goede wrote:

> > I guess we should move it out of drivers/extcon then though.
> > I suggest using: sound/soc/cirrus/arizona-jack-detect.c
> > Note that sound/soc/cirrus is a new dir here. Would that work
> > for you ?

> Shouldn't it be sound/soc/codecs/arizona-jack.c so that it is with all
> the other code for those codecs?

That is what I would expect too.

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/sfZUACgkQJNaLcl1U
h9CFSgf/f+vIYBwZ3rH9QPaqfupdc6tEu8+Fq4isSWufnfyuPY3KAZouiqdbNv8p
0Rm9lfFQ67lJLEktLfFXwC7v43abUZrh9Ms6MrfEMVVoJcVVs+u4wuHUraq32VE4
QFzIPPcQm+kNT5npR0y9dSAW5JVg6q6/iyY9Taxaw/72r78+5Rw00XkLkMwTeifR
Y25bS7zfNSUNKuCLVKrCMY6w1q9ufLX2ekPOdgz0oPn/99Q2VhCCvrPVnVJi98PL
AF/DNWxYUHxP+5LZZUyZneUw2jckwVvPMLeERLE4ADd7MEgZU3BGTQcxo3F8QTgc
0INXfUZy2WdHt/+8QmfkSAmBXs0DGQ==
=zAvb
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
