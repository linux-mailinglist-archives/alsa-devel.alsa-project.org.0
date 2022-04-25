Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192A050E513
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 18:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B7A17A0;
	Mon, 25 Apr 2022 18:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B7A17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650902530;
	bh=qiYmrQ20MKDWg1snu9b8DO3wenapaGeU+JhlqEU5XL4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQCbgMb6S2Amxd8l2f5tmLp8i2ynthT9m5ZQQ2EQjlfNGRVWDKdC84hAH0w0HKTLx
	 hEzbnfIR4fat4Y0sDXFTf/R7l9sqpCGgUr661b42AeGQZyoT6Zf/06lznfua3Xc8dt
	 bLkGGxlEagkIYP2cPmOof4wmGWBj62l6H6CqkDc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C692EF804FD;
	Mon, 25 Apr 2022 18:00:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F0FEF804F1; Mon, 25 Apr 2022 18:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB7CCF804F1
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 18:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB7CCF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QrwFjXYq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D93A612B3;
 Mon, 25 Apr 2022 16:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2BEC385A4;
 Mon, 25 Apr 2022 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650902452;
 bh=qiYmrQ20MKDWg1snu9b8DO3wenapaGeU+JhlqEU5XL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QrwFjXYq5E46lSsIDbTvmV+T+LUq3mrCLABmVXV8MAWFN5ct9G1H3wtocmUAGHeSz
 D2K3NmBId6yjst8B9blzlAdStWHkD6bbD4sk8Qlp+uJUAWE/qWDr3MdKhCxX+FMUay
 C5+KbBwkJbqvJ/FJoi8ollt+qnAcEPYO9TNvU5SamE7JFex5j4yIuz3HVnmVN9hH3P
 Fe9R15lWvfjxceHNkFTnLSQycPc/fVTdGLi8lcitt9v2xYCQ6XIJKBSi262pyES6j6
 UjhZ+WNL/QILZoYq6gPWJfGVV9aqC4fIBCK2nlvXnBRzcrtysRDwJOj4r80DaZ2cFi
 idXHla7M2LX7g==
Date: Mon, 25 Apr 2022 17:00:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: dmaengine: do not use a NULL
 prepare_slave_config() callback"
Message-ID: <YmbFr14wI6qoNJ0b@sirena.org.uk>
References: <20220421125403.2180824-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k+MPFSU5/RcDk67f"
Content-Disposition: inline
In-Reply-To: <20220421125403.2180824-1-codrin.ciubotariu@microchip.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.com, sha@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
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


--k+MPFSU5/RcDk67f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 03:54:02PM +0300, Codrin Ciubotariu wrote:
> This reverts commit 9a1e13440a4f2e7566fd4c5eae6a53e6400e08a4.
>=20
> As pointed out by Sascha Hauer, this patch changes:
> if (pmc->config && !pcm->config->prepare_slave_config)

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--k+MPFSU5/RcDk67f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJmxa4ACgkQJNaLcl1U
h9AFNgf/WwS6xweS6qV95cLfmYic7buazN1dEMvcR/XgOmXtFYCGTzZvZHkpCzm1
4QN0Rp1rPXwl58OVqHYQq079GlNXcWrBpmkR5hVIs3tCk58ldE+zO7TDOVL+rN94
djItDzzJHVddxXkja6q7E0FZqaIhZyjNSyGpw2jmSkqvQbeWLUHhApenTjUCv16D
4XF6fx5Or+zEgc0fX+FU0Uq15bZM+/vRE0G6TjXWpKVvmZhTHVZ26kWkVHylporE
XPWS+d9KKp+tvt31UrZnFukNZ6RhrtDQ2pts3hW1U3oxepSqk6M8MQh5crhLyVN/
bAA14SqLGcjTNzI/fF7Te12Z8zVHfg==
=mIXA
-----END PGP SIGNATURE-----

--k+MPFSU5/RcDk67f--
