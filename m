Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC030F876
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 17:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1411614;
	Thu,  4 Feb 2021 17:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1411614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612457454;
	bh=LcO1yRAm1OdJ+WPUOMGfAM2m+dXYl1VDF5Xw46wAgVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LlwNZUuXlNeRwui2z6BGOXsJRA13fl1karGVWa7W5L8UBcUiXHqgkii3FBzjO/L93
	 IJNzw6ftsMc/rpFhiEb+avWms2vkklqn9f0zPg6kl0/7/TuWbZwDp4W+Sd/s33O7gO
	 W6fixax7FdMWTAfGmE3SJmmGfstzXaCLx884Oigw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD6A7F801F7;
	Thu,  4 Feb 2021 17:49:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE93DF80171; Thu,  4 Feb 2021 17:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3044BF80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 17:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3044BF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qLzL3KAk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 963CA64F53;
 Thu,  4 Feb 2021 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612457355;
 bh=LcO1yRAm1OdJ+WPUOMGfAM2m+dXYl1VDF5Xw46wAgVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLzL3KAkeej7gVd10qAfK53pezuGCo/rU9dLvtXRZpifg1dCqllx3oxiEnpUD+3Zg
 3qeh4GcdCGioP7Y/zVBzfxNHT/pVZAzlE0wsT4/U2ND2gdHNCDdu20+4hb6lj4B8Yn
 wnAYeD5MhIw8fwwgv6uKUFJMhXwGmUJsgAVmUeLRpm16MVzMd9odJKzH9ZtK7s6nqo
 MW74l2TjgUyZYsiLll4q0r467iWKPyZQb+9tL1YDJauxL65eGayfRBUST8eqUdGZ9z
 UZptAbd7HOVM9xehsvu/pbopfBwVWFf5+/SEcVwajg076oaXJt815HfAoWNrNG1d8r
 BpdRJokrg7pTg==
Date: Thu, 4 Feb 2021 16:48:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Message-ID: <20210204164826.GF4288@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
 <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
 <20210204124335.GA4288@sirena.org.uk>
 <20210204134606.GH2789116@dell>
 <20210204150904.GD4288@sirena.org.uk>
 <20210204152124.GO2789116@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
Content-Disposition: inline
In-Reply-To: <20210204152124.GO2789116@dell>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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


--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 03:21:24PM +0000, Lee Jones wrote:

> The default point-of-view is; if a patch was submitted as part of a
> set, it's likely that it makes the most sense to merge it as a set.

Blocking the whole series is itself not ideal since it means the whole
large series keeps on getting resent for minor changes in individual
patches where it's only a small number of leaf patches that have issues,=20
with a lot of these serieses the reason they're bundled together is that
there's some constants being added in one of the early patches that gets
used everywhere else, not that there's a really a particularly strong
relationship.

> Very often sets will have inter-dependencies (usually headers) which
> would otherwise require the base patches to be applied (perhaps the
> MFD core and the headers) in one release, followed by the accompanying
> child device changes during a subsequent release.  This doesn't scale
> well and puts the contributor in an unfair position.

You had been sharing pull requests for the common bits in the past which
had resolved the dependency issues?

> This is how we usually work together.  Why is ASoC so different?

Like I say we've got active work that ends up doing subsystem wide
interface changes on a fairly frequent basis which then creates issues
if a new user pops up that's still trying to use the old API.  Often
it's fine but coordinating near the time is safer than just acking with
a potentially long lead time on things actually going through.

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAcJVkACgkQJNaLcl1U
h9C2wgf/bIo0O0+WD5J5xb7GrHcSGFUfdnb8rQTTzJHB8vrCoQTjOj7fqtDOf3J6
SNgaTs3ohgNjhAb3mmSLzBqGsDkNKabCX0oT1xnpQjwDNeS/pUUOkZYMDafGSxHS
Gixal3inUvH7TUpzd1SODfaAtqIa2Vd0ZfAubh+gDbHn2C2vbqqc/cdTse8Zjssv
ivAVJQ3CMuLQRB+gx/ND+l1UMfw1Y/ilwg/wKItyPjt9ZpwjwzxAAK3l1c3CFTy3
7ONkxp/E968pDvxe6DaFFfFji2SpG7YURisZMMjB8Fj0NFZ9hlGznGOh0Uy3Brxk
wbXXazfS+8UaRH33SJcdpnufLnnOMQ==
=J/Kw
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--
