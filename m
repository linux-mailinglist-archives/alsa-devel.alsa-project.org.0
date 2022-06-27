Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D863455B961
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 13:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8FF163A;
	Mon, 27 Jun 2022 13:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8FF163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656330422;
	bh=VwADrRZxFk1rx290fAkceHuvRfDBtWvrEJXtxd3r2+M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FaZu4DhrpIwxdUgdUgTt5UG9I66qhkPNHDIFNJzMcf2kJPMRmbaisni9vfIywP9qn
	 Inxk3wCTscyn1IDp/2WBcmdt770lRPG9w5UVmlGBOGrngT4f1GpgTn+CXZqbsxz6w6
	 EuUZBz0go5W0LsG9YWU4Itt6Zk7S5ijjv0u168N4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE82F800E9;
	Mon, 27 Jun 2022 13:46:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC9F1F8028B; Mon, 27 Jun 2022 13:46:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A102F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 13:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A102F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qo2nk0KS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5846B6130E;
 Mon, 27 Jun 2022 11:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E820AC341C7;
 Mon, 27 Jun 2022 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656330354;
 bh=VwADrRZxFk1rx290fAkceHuvRfDBtWvrEJXtxd3r2+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qo2nk0KSOwfsUGuWeIrmyKqTCUNAZIDAkfFoNw4Ut/1aIDOAkKWq1iK5HF8Gixklm
 tIpA6xPXFAax0TtCIKCzysoM2W3chXUDd7SU0IfqaZJRKe4oirtcAHGbMDjMkNO8FS
 34UrMWzSWeZyCuR/EBXumonWH9+Vh69wM6KSUDogqgDgNZTHWGR1eFGAgkRBGwpcfv
 /MuJ7eBMf/I2PV/pYtzFpbfD8PDee+vkuzTZu9vfob4uzjmz8DihrT0JXV059ItckD
 SycYYkUBL/OqBIqQDAq5AdevAEnvStSYyiW2W0njPmEYhfWhhvEWEdFdZrbr3AsleN
 yVf+TLN+wsInQ==
Date: Mon, 27 Jun 2022 12:45:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Message-ID: <YrmYbZV4mj9d9++t@sirena.org.uk>
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
 <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cGrbKaug4SaBI0GC"
Content-Disposition: inline
In-Reply-To: <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
X-Cookie: Your supervisor is thinking about you.
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, jrdr.linux@gmail.com
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


--cGrbKaug4SaBI0GC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 11:49:46AM +0200, Krzysztof Kozlowski wrote:
> On 27/06/2022 11:43, Charles Keepax wrote:
> > The conversion of the set_fmt callback to direct clock specification
> > included a small typo, correct the affected code.

> > Fixes: 91c49199e6d6 ("ASoC: samsung: Update to use set_fmt_new callback")

> Where is this commit from? It's not in next.

0b491c7c1b2555ef08285fd49a8567f2f9f34ff8 - if you can't find something
search for the subject, people often get things wrong.

> You should put such big patchsets in your own repo (e.g. on
> Github/Gitlab) and feed it to linux-next or at least to LKP.

The size of the patch set isn't really relevant here, the same issue can
apply to anything that can be built in more than one configuration.
People should of course try to do things that work but equally we
shouldn't be putting procedural blockers in place, we have integration
trees for a reason.

> This way you would get build coverage... because it seems the build was
> missing in your case.

That coverage has apparently also been missing in -next for several
weeks.

--cGrbKaug4SaBI0GC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK5mG0ACgkQJNaLcl1U
h9BVlAf+OdXMLIbXe5mSgKiE3F5jvcMaD820Gt9mVcl9LubefegZsfo7YwlfYblG
T9PiPgq0pwJOjh2fYmW0ISNuL3KqSgd3PCyOs9BkRCj0ELAtDn15G3UGVtjwEQjH
h70i8Iy4MbZQu8CZEBen+earhLqXvuqe3dH27eJUyDjSCHzvOq7zkCfeFS6JCXFQ
02I5/NBZGYC6r71IYGlpgRhMj94/PYKhnvhyfh+1dnVLEC9WD3eAZOB1YRfLDcBk
jv4XUFP81VyzcGlNbj6K57AMPMGNWFo5R0K5oYPTwUx6ytuSdx/+kAXPIWuG2eLH
iMgqgebuD6gmWiew3VdW9sJF6uBj8g==
=G3oz
-----END PGP SIGNATURE-----

--cGrbKaug4SaBI0GC--
