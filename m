Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B381A46F3CE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 20:17:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D7D2032;
	Thu,  9 Dec 2021 20:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D7D2032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639077479;
	bh=VqPjE74hUiM+wV9wag+bjqN/URzt4NeUOb8KYkowL5o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGjH9Oni0ZiPgtzpTZm85T5bZdtRY/UDtJtilvhk1rnRBWyA2gTeurLrOOty+hux2
	 1i/RXDTWPwMtBCSOoFvm+HY7iAG6uE0tzPv9HIt0EbyK9QYM69L/ZX9ncxxrKvx+2E
	 CKQOQrE3gKlEGFtm5Kz5PNmhFpngFg2RByo7zi30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B26BF8028D;
	Thu,  9 Dec 2021 20:16:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9E6F804AE; Thu,  9 Dec 2021 20:16:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF74F800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 20:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF74F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sjEvlS5+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 745F7CE27F7;
 Thu,  9 Dec 2021 19:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43FCC004DD;
 Thu,  9 Dec 2021 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639077388;
 bh=VqPjE74hUiM+wV9wag+bjqN/URzt4NeUOb8KYkowL5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sjEvlS5+hQU4fB/H9lpg9Ts/lSab8T1RBLIEr589scWZqkl2Bkc/dPI+bzGs41I1O
 BUFfIjluzuUFhqYpPFUf0nc7HO5X2+z0sJkezTb4W1fNDBrAnLSdcZ1p86+5bNkA77
 N1Me/mr3L1zj2Oqq22/KDABOSN66s2/TffrX0dp4AQY7sMTgf/tfmUBtdhdfFTkyXb
 Pv88yhhaO1I4+7uHsMV4Srg/ENdeH4OoXslRUXnguMCWvz/mBK7ekTpI7lhYidVpWB
 iKRDjFboULkE8YiJBUnEV02p6l9yjJkg/tq/RRjzsL6Yofwc7BBSCkghSZZI5e6CBn
 Mb0i4gW2ffuDg==
Date: Thu, 9 Dec 2021 19:16:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF
 OF device
Message-ID: <YbJWBpxHo4zN4zFJ@sirena.org.uk>
References: <20211209174657.141268-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hEvhH7N569Hzdzpj"
Content-Disposition: inline
In-Reply-To: <20211209174657.141268-1-daniel.baluta@oss.nxp.com>
X-Cookie: One picture is worth 128K words.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Paul Olaru <paul.olaru@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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


--hEvhH7N569Hzdzpj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 07:46:57PM +0200, Daniel Baluta wrote:
>=20
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---


You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--hEvhH7N569Hzdzpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGyVgUACgkQJNaLcl1U
h9DXDAf/V9WKvYxWtyKZWaVx8aEh0kubvlvQRgFVA9NuUrK8ERYh83ykeUpVX6JC
3x8VgygJLVz00vpIZ7/+Xe6kmpHTezjzdhKayOtXEdBr8uGA4UaTErSb8DWpYJ5f
Es7u+0jIIOJa2QvHRgTmAq2EllPEEgQ4rt2aISxj/tUEhWHdF6ElY//3EzZXxf82
U0fQq8LHRPfPdjrywngBPVbyGOUgXzM3FAYCatVYdG2cclJejWWHPD6Zc44TRIc9
H2qDFnaEzZTvdQ6ZNvhkK9w4QLeh80YSWplXHoSLWuG/vqdivqNJkqgPqFDra4Iw
bPaNP6k50hPDeiFdIWPFIhUH989GSQ==
=BmDs
-----END PGP SIGNATURE-----

--hEvhH7N569Hzdzpj--
