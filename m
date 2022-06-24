Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A15599C8
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 14:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A4C1840;
	Fri, 24 Jun 2022 14:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A4C1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656074626;
	bh=zXEEiTB5hNROKtS+7IsmV4DDkSH6bCRmdd4a6UQfT4M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QVBVdv0fc9LUl6w0ygV1k+2RuclsUNzqrMfkiydaspRrtteheOIgjn1bGuMzjUPIK
	 S6047ROK10UdmVB/OGItrPXiF+lHMGmeAtzYcZ4WuFm5fWMittR+f7qcEw88CWFkTR
	 1ZvEKb3fwupV5Ln4Mzkzx3HUej45gfLIWjxT25os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3505BF80165;
	Fri, 24 Jun 2022 14:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1699AF80139; Fri, 24 Jun 2022 14:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87197F800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 14:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87197F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mopz3ih5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3067260B29;
 Fri, 24 Jun 2022 12:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F871C34114;
 Fri, 24 Jun 2022 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656074554;
 bh=zXEEiTB5hNROKtS+7IsmV4DDkSH6bCRmdd4a6UQfT4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mopz3ih5CivdhvvWtgzuYMrYJFlzxH4EqLMz6R3GTukGm8Spsc98V5M4pkueKF0Ou
 0UHwYhZIhpjMIr2bATJuYriA2+ItYdtA1rB7ui/kfDasnZOI/s6fBYqCCg5NtogRkj
 sXiCxRrN5Ji/QRLL/3kmRP2Q1v2RkonnDEkfUejEkEEpWfIa43PwBjgPd4OvgNy7aw
 KJaP1zgCjmDiWAVtZ9xoDDIoUQZ+4wm4KIevD1F0R9vj2xIcxc4gvJc6JNlF6nrpwh
 o5OzPfVwS/Zm/Quaa0eK/0InJFAlbYiIAjmssEzuUN1aV5/2/E/rktJsbX49ZzbRr1
 qBPuU4YkqEWxA==
Date: Fri, 24 Jun 2022 13:42:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 3/8] ASoC: dt-bindings: max98396: Document
 adi,bypass-slot-no
Message-ID: <YrWxNk8NMVw7Ecfn@sirena.org.uk>
References: <20220624104712.1934484-1-daniel@zonque.org>
 <20220624104712.1934484-4-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DoLimtTxHasAn9Ka"
Content-Disposition: inline
In-Reply-To: <20220624104712.1934484-4-daniel@zonque.org>
X-Cookie: Help!  I'm trapped in a PDP 11/70!
Cc: devicetree@vger.kernel.org, ryan.lee.analog@gmail.com, robh+dt@kernel.org,
 alsa-devel@alsa-project.org
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


--DoLimtTxHasAn9Ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2022 at 12:47:07PM +0200, Daniel Mack wrote:
> This property allows to select the PCM data input channel that is
> routed to the speaker audio processing bypass path.
>=20
> The driver already implements this property.

This really should be runtime sleectable but oh well :(

--DoLimtTxHasAn9Ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK1sTUACgkQJNaLcl1U
h9CIewf/X6Lwb7FsmzRAUspCb+zpAb5EvRWRzmkFmbrYzHhlQOax/6yxeI93Rclc
o+vjv9NCeStvFP0MTpwYO4kDFiNa4l427+X9L0vSlsR8A20PTBJtLUIUDMG5aw/G
QqEbEwKmdnJpQWL55YxLlm6k58EJ9af5mf02hogfYTvtSzzoFqaSYXOZ0xsoy1PZ
a0J3P64B+sCXUN+g6nLV5vn7pKCFKJ4sw28Etfxdrpn6Yl3HEKUNeSM0B+klBNUU
/IMjV0SlTLjLJMt4+ooRpomPFdmgLhhTvrvggblnZ8Avgml88bv2FYPhfCmBI6uA
O7JdbkI0kwF8HiBMGAcsRSmOuxp+wQ==
=1e8K
-----END PGP SIGNATURE-----

--DoLimtTxHasAn9Ka--
