Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9820464EF7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 14:45:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB92245F;
	Wed,  1 Dec 2021 14:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB92245F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638366313;
	bh=L9GVwxT/4hupyPhB6SPvO0BAgVIsLKOGuEG0vnIs69E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Abs4g/I3ZQv3l4Aqtrw583YrFhCqvR3ePDqKe9ztqs5pCgxe+AqG8EIj8sEQg7X5e
	 XD0wXiOSwPLNb9mFBwjeqX+DwqQvyUqCBPZ8fvS4eKzZxqRHNA7ZxnrrmiuiBtDrV1
	 FZKA2PIyPT0pKHuqw/V9ymFUzf68YSIlhvu0819s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8A7F800EE;
	Wed,  1 Dec 2021 14:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DD22F80246; Wed,  1 Dec 2021 14:43:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88234F80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 14:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88234F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dU+xxRHg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 249FDB81EE9;
 Wed,  1 Dec 2021 13:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C25C53FAD;
 Wed,  1 Dec 2021 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638366221;
 bh=L9GVwxT/4hupyPhB6SPvO0BAgVIsLKOGuEG0vnIs69E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dU+xxRHgNWH+oi7PVKNH0Cm0hVeAvgOMWBNZr/vcSrRXMKEWm66jHhCYQv8Nq/Tii
 HMsPTAcHO6xprcLXDWiqf3191uErevjcrduDIZdqxp7Q/yS+KGaTtuuOu+/soqYbiW
 +La7B4XFAV3mue1uVWdclihpHFOXeas81sTTC7LlY73gE4pVAdwg7CygeDF+IQaJHi
 t4JSfoGjWFSe8ZiApochkUIMVeWqdTcvJYwixjBJ3/2iJ72/20T7/+/sSwh1BnQgBn
 47bgUegXlh1vH609v3dFSnXxozV5Ku+jv9/ooPEsgbECkjH2xBDqss0FO/SihUWYlR
 Jxi9IF8itZMdQ==
Date: Wed, 1 Dec 2021 13:43:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH v6 0/2] Codec driver for TLV320ADC3001 and 3101
Message-ID: <Yad8CVmZKUDtpQaX@sirena.org.uk>
References: <alpine.DEB.2.21.2112011338260.1159@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s20gVsSPtkBamVIe"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2112011338260.1159@lnxricardw1.se.axis.com>
X-Cookie: All true wisdom is found on T-shirts.
Cc: alsa-devel <alsa-devel@alsa-project.org>,
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


--s20gVsSPtkBamVIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 01:43:54PM +0100, Ricard Wanderlof wrote:

> Changes v5->v6:
>=20
> - Added missing "depends on I2C" in the Kconfig
>   (reported by lkp@intel.com).
> - Fold include file into source as it is not needed elsewhere.
> - Fix SPDX-License-Identifier which was using a deprecated license.
> - Clean up authorship information in file header, removing history.
> - Remove useless GPIOLIB ifdefs.
> - Use devm_gpiod_get for reset gpio rather than devm_gpio_request etc.
> - Handle EPROBE_DEFER properly for reset gpio request.
> - Use dev_err_probe rather than explicit EPROBE_DEFER checking.
> - Properly check value from DT parsing for mic bias and codec gpio pins.
>=20
> No changes to the devicetree bindings.

I had review comments on the DT bindings?

--s20gVsSPtkBamVIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnfAkACgkQJNaLcl1U
h9CR3wf/TjQ/yxFSWFOPe0ibm0nI1GgOlfi1kK8zIJsfLjMWfQyVb41WT2CRS+nJ
d7JdLVd6RzEnotMWwmvydKPDU/ZaZ3RXian62AMXJiJAGmPxx/qibwAW6RgjkhSZ
LD0j8C1PApA8ewT3CV9UNV04clbXnFqlANNhKqEXyfsPLnieyRF1roaxUI+0UacJ
WV/qWeQmvcwGKinzMjnvm31MR0KnQp4SpzeI7dqh7g3zHSG+Rhs5/vZZRKCqgUaR
FmG7CIbRS/Q9ajb8QVcFVi7gG4yvuSuLyLA8Tmhlxwuzff33nsHLzzDDnF2DRv+5
9wfv1gHeUaE+oah+08h/S0NOIFpcyQ==
=V6h1
-----END PGP SIGNATURE-----

--s20gVsSPtkBamVIe--
