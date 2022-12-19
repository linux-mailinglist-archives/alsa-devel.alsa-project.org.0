Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2323650C67
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 14:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F3A30A6;
	Mon, 19 Dec 2022 14:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F3A30A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671455128;
	bh=/I4Kb7hC8uOUuswynbcWKvpfRKg1AKsJ8i1itOIMgNM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hXhrbjvuHy7ZWRU4UyHK8TxSWcKmaALZ1SX5TpjTX8JpcDW07V24zT+VkmEaE9mmB
	 T1m4/7NXe2E7YZb0wCSOZSaz44nizc2Y4X3JEvBVwbtj3A55FHfmonKzmNtV+uUKfJ
	 4ZG9S9K6wqlUmJTA9fEmyUiT4nuECuRG97jM+2Vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EED24F800DF;
	Mon, 19 Dec 2022 14:04:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05062F80423; Mon, 19 Dec 2022 14:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F037FF8025E
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 14:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F037FF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BG2+K+xY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4A333CE0F1F;
 Mon, 19 Dec 2022 13:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D238C433D2;
 Mon, 19 Dec 2022 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671455059;
 bh=/I4Kb7hC8uOUuswynbcWKvpfRKg1AKsJ8i1itOIMgNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BG2+K+xYYC9R2EJR9LrAcE7VbEA78z7mrhopFIdT+aCu4zUHpmniLrhoMxHYQV0yZ
 74Ph1aMRO83yS8UAWWUCQv/usAUeB976hfoR5Ug0eqconlMbDogpR9cupYKqtgGzjx
 hBYiBKOd+MbNKkhB7haTMR+Eu/KWlcujQqAw1nxE2OJ+ACNMthN/WdRE6olT26otJJ
 hcY3rz2RKWS/8EQXUNXas3QeGh9Hd8q+i1IfXyQl6vT34uzFsdjtuMVG7/aBbIReV7
 LGfuSiI229qmvNJv2NRi6BSCjDjn+HTpOUw7YIQSdF3E+UfELU364lEk4hwlbARDe7
 7jsxWAu8gInyA==
Date: Mon, 19 Dec 2022 13:04:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Message-ID: <Y6BhTWGUp2D5hhbE@sirena.org.uk>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z24uizcIcNefEU/8"
Content-Disposition: inline
In-Reply-To: <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
X-Cookie: Pay toll ahead.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 yung-chuan.liao@linux.intel.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 ranjani.sridharan@linux.intel.com, Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--z24uizcIcNefEU/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:

> * there are no "CC: <stable..." tags in these patches. Is the plan to
> manually ask for a backport? Or how can we get the regression fixed in
> older releases?

Speak to the stable maintainers I guess, or hope their bot picks the
commits up.

--z24uizcIcNefEU/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOgYUwACgkQJNaLcl1U
h9CJiAf+LFKoxKrnzbInjPMtZRBK99rFEvMVdssNVJslU5cTUDwpSv+36pXZuOQH
+dqHk715zIBic2CIlYArrY0jr1Z5eDIGSVgpn9kxTl3GNiOdHH1pIG9+Cf2ZSdL8
m5iUPKQRWAGGqtep02hodZtMatdTBBhN+goepgcnKwudoggltP83SiGHBwxRivvM
Gd/XMN6puIcpXsYe+UWnTAAYshOAHchTandsJ9kmWfPJwtHMIJqzZ5XxVIRRGqk8
kmRRzX1iXq/w5h8fAWIYK/ZZ3aWn/YVXjdBxKQhuVXAc10TCoGIIMxgxY0KDKl7A
7fvb3XroltdaVX33fP/BFYRehJLGBg==
=H6ZP
-----END PGP SIGNATURE-----

--z24uizcIcNefEU/8--
