Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F44C6E4C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 14:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706B41726;
	Mon, 28 Feb 2022 14:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706B41726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646055272;
	bh=yB0sPUbTKBz3OHkJ3G6+IqQ0pPTptMupgZ9LMvAJgus=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPR/0xRGaCo4LJE+pj5yRHjbLSU300n5fwqS/qo3575bp1Bs9T8EuPCXYISxnDxab
	 KXLxy+ta+wKO/GKeXN6PHyJAF2n8GO8JEI2s5JlcN++v7X2AWBAhVNicOr/6NHewum
	 T8uF7y6O2So+gEosi/0O5/FvTA4L1vLJerTuFeVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D10C2F80154;
	Mon, 28 Feb 2022 14:33:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC7ACF8013C; Mon, 28 Feb 2022 14:33:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FBA4F80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FBA4F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zm+d71XH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 813D4CE13E7;
 Mon, 28 Feb 2022 13:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13CAC340E7;
 Mon, 28 Feb 2022 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646055194;
 bh=yB0sPUbTKBz3OHkJ3G6+IqQ0pPTptMupgZ9LMvAJgus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zm+d71XHR+VSc9BT2Y7ITUr/pshhbUbsa3nrkjCjlgrBgxoYYw69Db8A3ozUKmNqO
 HTRJW2I/30ImkDLC6q0eMoZ++7xAamdTKRyxV01yqboWkXIghaKnsJZz9mNR01DZeX
 ldlfaRAww9UFOndzSwLBXezR66fnCxbGpx0N/7qN4oguMcCosQLvhMaCGp2UXS+EKf
 wUX4IfkfY0RcEHU3DFV8miwfZbbrq2dCcq2pUbaqhnowdSHnL7g481484O37pAkWur
 0F4Kygqa+xO2AVtwfCCuxjxVli2T52OuW0DkM6B5/l35POZRjwxtjWPy/B/RU+UHee
 g3quF9+bSxQlQ==
Date: Mon, 28 Feb 2022 13:33:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3] ASoC: codecs: wsa881x: add runtime pm support
Message-ID: <YhzPFJabTS5UZd7v@sirena.org.uk>
References: <20220225180716.13462-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q7LTR4vJwJn2BIA4"
Content-Disposition: inline
In-Reply-To: <20220225180716.13462-1-srinivas.kandagatla@linaro.org>
X-Cookie: I Know A Joke!!
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--Q7LTR4vJwJn2BIA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 06:07:16PM +0000, Srinivas Kandagatla wrote:
> WSA SoundWire Controller does not support Clock stop and performs a soft =
reset
> on suspend  resume path. Its recommended that WSA881x codecs connected to=
 this
> are also reset using a hard reset during suspend resume.
>=20
> So this codec driver performs a hard reset during suspend resume cycle.
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--Q7LTR4vJwJn2BIA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIczxMACgkQJNaLcl1U
h9DLqgf+M/Cs5pWdkUZ2HJPRzifLJs6eTrRAA1rulsnPHNTVdAkEu00XsFfql7Yv
XdJjusjNH1D6afwCaVBI0FJCy8YSVC/spauaa5JAg9ndo55oE6njzetW9T6g8q+t
nf5ZDo0DCRg1S+7EQDMKKl9LWzjaJspIYffFMBdZYw65ciTTkFODOBVLXgDwrFor
i1wWEVGNJndkIg9Amm65vDy8f0aFu7NETXU5CPFBtyrUnnULk+Ja/bjM1c1ooA4y
9La0XGfRO1krDmB7uFM9WBAq+PmLE5SDN6gNB6P9ev5pKJ9JOiXIb028+DGdm6JP
XDDeAl9+WtstMFRq9B01JiW4yM31qg==
=SAQ3
-----END PGP SIGNATURE-----

--Q7LTR4vJwJn2BIA4--
