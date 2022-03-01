Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2584C8BF6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:48:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19BE31B40;
	Tue,  1 Mar 2022 13:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19BE31B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646138900;
	bh=jtAoclxF4W/Rcwo81tZhYTW4wbtw+ru4YHsFmRKBcEc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RypwZLN2t8s5bukeoM+FafjaHBgomeV31WGBAu2Bdc6wxRKyh4oZaQptVY3J+PWb1
	 TJoEKJh52+k6YiuNOmGQCzoTG85s0X+z1XxAoIvFk+wv4Q4t34HaBHiS8tb5JDxlO0
	 nzGehZg+P6YswOxk7mHEH6VlHRKi1us16rxdtm2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 013BDF802D2;
	Tue,  1 Mar 2022 13:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B211F80475; Tue,  1 Mar 2022 13:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 463FDF802D2
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463FDF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pY0WCCeh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78F19612FA;
 Tue,  1 Mar 2022 12:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CACC340F0;
 Tue,  1 Mar 2022 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646138834;
 bh=jtAoclxF4W/Rcwo81tZhYTW4wbtw+ru4YHsFmRKBcEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pY0WCCeh/y8ZxcIBE5Cj3AwQMf8oLjnZ4vsTNt6WxuMn1c2ZCX7aRDLnxAHNacz0G
 tmpyKtokLrBcZaZbClSUp0PKsPlLyUSXqdPzVLvNHQmrEn3JsbiWNQRlUzssXWsX0H
 nBXhcPvi26LmPdbPxC07JDepjNyBRwlxSlqVLy+PN5Pam/5WpyH02/O5Lg4F3RWKi/
 4RMOH7VLuUMdgJprNB2OB496stVURY7LeiiC32EkV23wWwnIejK8lbJNNMAGiStFXe
 GcC3CGVALvjS0mQ+BEH2eucPtirJrBcyNB/LwduVkV4Gv4yqcWsZzsBkqs8XMm9CGp
 N/4sa79SnCyrQ==
Date: Tue, 1 Mar 2022 12:47:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Message-ID: <Yh4VziYJ2M2aenjz@sirena.org.uk>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vdzBDqxFknfIm3vF"
Content-Disposition: inline
In-Reply-To: <20220301123742.72146-3-stephan@gerhold.net>
X-Cookie: You have a message from the operator.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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


--vdzBDqxFknfIm3vF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 01:37:42PM +0100, Stephan Gerhold wrote:
> From: Jonathan Albrieux <jonathan.albrieux@gmail.com>
>=20
> The Awinic AW8738 is a simple audio amplifier using an enable GPIO.
> The main difference to simple-amplifier is that there is a "one-wire
> pulse control" that allows configuring the amplifier to one of a few
> pre-defined modes.

I only have this patch, nothing else from the rest of the series.
What's the story with dependencies?

--vdzBDqxFknfIm3vF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeFc0ACgkQJNaLcl1U
h9DsEQf9HySKDU6ivk0FFYXHeW+y8mmyj8tRuL4dn5rY2t8YIEynWOSgRcvTyyY5
qdCo9U0iluUhzZMbHMnpnZ1opW2POXTamH/snEN9qREMi3pKGff2CBLASSDX7dXy
5hutMMXL7mCRZA4tnTJ/KYg0mgyhH5Qt3Ua+tY+rHbBWX2hycoESRVPM1gJ+t5g9
0VeOGX2EZ+Zc8GuW3ETaAS/QnyBS88A6zYcnHK+MXSJev3b/CjK0jrfjJHl7lXna
sPGZoEWrmfiLowAvrvI2YZrBdEQPg2x+yFlPeh7cYJZBupmiplQ2VmrGe9hHgPE4
zkeqEVTieGxNobRCqJNxQ/plk9zg/Q==
=N/L7
-----END PGP SIGNATURE-----

--vdzBDqxFknfIm3vF--
