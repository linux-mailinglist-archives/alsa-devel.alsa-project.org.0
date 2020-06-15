Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03D1F965D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 14:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC3C1670;
	Mon, 15 Jun 2020 14:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC3C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592223349;
	bh=SeO45nafpNrqNLAigKnrSNTvi4D8+s00hYG6wlDqxv8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqs5OtKEaAuZBeWBcx/e/AKFQUK/Zrr6WJRvKuT7pbzTjBKDgLgXUoOexoSe+qxEj
	 6TjESFmrAlK32a0Am8Lvk+FhO1S7AGaTysa2GM3xla2j4kBobSGowKJ97WGhGqyY39
	 oMFeF2nhwRPX1xaxNxY6wmxElVZRutLsmdsdN1kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B9BF800EF;
	Mon, 15 Jun 2020 14:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 351A4F80171; Mon, 15 Jun 2020 14:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA55F800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 14:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA55F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cc0Dcebb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 108A920679;
 Mon, 15 Jun 2020 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592223237;
 bh=SeO45nafpNrqNLAigKnrSNTvi4D8+s00hYG6wlDqxv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cc0DcebbMjDEL3CjM/ijLclP/AWSsll98fqcBtIAQbkJTW7cyNrsFm/msWwokMbMh
 ZogCJ5ltMb5HE+bHz0VH3OhwhgKtUVqYA5YwRkSWADMDqEfU/6DP44vyaiAi8vI4LN
 e3rO2+hYfe38xF36OMMrkERvkJ3eUIE6X/OPhE+U=
Date: Mon, 15 Jun 2020 13:13:55 +0100
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com
Subject: Re: [PATCH 1/2] ASoC: rt1015: Update rt1015 default register value
 according to spec modification.
Message-ID: <20200615121355.GM4447@sirena.org.uk>
References: <20200615032433.31061-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Content-Disposition: inline
In-Reply-To: <20200615032433.31061-1-jack.yu@realtek.com>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 11:24:32AM +0800, jack.yu@realtek.com wrote:
> From: Jack Yu <jack.yu@realtek.com>
>=20
> Update rt1015 default register value according to spec modification.

Do we also need a register patch to ensure that early silicon has the
correct values or was this just a software bug?

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nZgIACgkQJNaLcl1U
h9D+zAf+KcIsrJVCkuHDQxYRMkVagPbh0vY5H4um1h8xkb86Fhp1xo0l4wE0k938
pomcyFIEDuWYSe3FFROE7V+Uf2g+SWvLbg4TkVer+4kSXFPe5NM5OMVVOlOOA7tN
cmjXkyQB/+7NNQhNYgvcHEDwGYSRtpn11h+bJlcW7JTFaS2AqWyXQShdrl1ej+op
QaErSn+Oohi3rU8noPq9j2drIP1R4Ic64V9giwSTdJHpV5ha2XP2Ex8b50OuLCK3
a8K29UV+q5VDBOcDCw8xyW1iN+9YZ6irFrNudmF2pmEt0uI4vA7PsA1lT0lx57kf
YJsxd30PzUHno6QHdHFVgiouGFkYCQ==
=ifh7
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--
