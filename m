Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D85AD7BF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 18:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463B51607;
	Mon,  5 Sep 2022 18:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463B51607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662396243;
	bh=ofMIlFd626hGnUnboJkZEEUtEXPdrkIL6ZPCOm2bYOg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JX3KGi3wxRH3C9aztm+lag6GC4OpYTDfm5aRL29tE2WXSEIBlaaLfYO+OQagTKLl0
	 bPUBUjcOUI5PK3GiLeyIUwGYsi7l3imI7pqIEswo69UCb5j3QL5B+CANa+1LlDq+Kl
	 E+Uko+nK+t66xbsd7u2oOqYvFKtrvU0h7Z+rbJ38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2987F8032D;
	Mon,  5 Sep 2022 18:43:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2363F800E9; Mon,  5 Sep 2022 18:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51133F800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 18:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51133F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rpo8q0KB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38B6EB811A6;
 Mon,  5 Sep 2022 16:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F4FC433D6;
 Mon,  5 Sep 2022 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662396175;
 bh=ofMIlFd626hGnUnboJkZEEUtEXPdrkIL6ZPCOm2bYOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rpo8q0KBfj9SC5purKcAV+ErKFencFzGfWmknDo9og64dr2jBJegpm2rdeznXuq3g
 owtZQNlnD311DWhaS967QHhrXLDojjdgCB32jL4NWLEsApWt1z+Mgknpqz6E2DgTT5
 W71WSgccfp+AHKV/QZwccQv73T7IX6m2xhT+Gkp58EPf7VlNL98B0seSJiB4XvVRCI
 FrIGGF3HXw2VA4bqFZ4J5f5k8ufkEEcNEjgsJshC4tE5z37awXo0xxT3LU08jTRzU6
 zbmKEq8pMjb4rLC4mBraTuxus7i5p8WX+cIQTCg9fuw36cwgLBFNvetTtSE4uYJNQE
 lMDllkoy/kqww==
Date: Mon, 5 Sep 2022 17:42:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH 0/2] Untested TAS2562 power setting fixes
Message-ID: <YxYnCoWzCzMCGpEQ@sirena.org.uk>
References: <20220825142226.80929-1-povik+lin@cutebit.org>
 <166239232739.736206.17258746656389143736.b4-ty@kernel.org>
 <C600ACEB-C64F-4501-94E4-17B4FD0A8918@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EoXYJhccnS9/KYaw"
Content-Disposition: inline
In-Reply-To: <C600ACEB-C64F-4501-94E4-17B4FD0A8918@cutebit.org>
X-Cookie: What's so funny?
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, asyrus@ti.com,
 linux-kernel@vger.kernel.org, navada@ti.com, raphael-xu@ti.com,
 shenghao-ding@ti.com, Stephen Kitt <steve@sk2.org>
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


--EoXYJhccnS9/KYaw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 05:45:09PM +0200, Martin Povi=C5=A1er wrote:

> Texas Instruments is shipping me samples of the affected
> codecs, so I should be able to test the changes on hardware soon.

> Should I find regressions, I will report back.

Ah, that's great news.

--EoXYJhccnS9/KYaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMWJwkACgkQJNaLcl1U
h9D33Af/QSb6Pe1owP1mrK1vVJUDtrHI6iUyUdFHPK24FwuUl4JkDGiHhWaaA0xn
kP24h+f3Kad02l5UM02y1IwVJipW7J7/VmPOrdi4evrNQ6qdXAeiEauHhAMsnRnO
9HGdCnqaGytdYK8Q01ZN0zuYq4QEOTIDCMXgWgwIjEPgPH4kdEe4KXeAjdn9ks+T
oIrequRljgRTyhoj1+s2J2Hj9Cm+KJXOJBlhxr3HkVWftWztKT+GP6MipBwXJcmk
2gf21m0YM7MRY1dWNZEEjeHLPUGl4f8QRikx2gRqbgV8uOS7YihpCs4vAclTZ2y8
Es3gD+1UVr5RTCVZyRFQXT5ZWXFU1w==
=4sYU
-----END PGP SIGNATURE-----

--EoXYJhccnS9/KYaw--
