Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B324D666B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 17:34:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71EFC1A47;
	Fri, 11 Mar 2022 17:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71EFC1A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647016495;
	bh=nXDTLmoC8BE8JKKBt3JG2w6GdigCA+dZrYuxemDr/RA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXTj7bCRaQn/PPw7Qg7Flj/QIaY+zsfQMqZWrtbW0WhbZGWC66D3BjBKsW+54d/Me
	 dBomQa3S7Bt3doC9Qzr/1efgB/Fkpg3MzqF5mQk1BoimLzCAZuEtX6NzdzBHnT4zFI
	 uzmydkD09a/h/0HADIXh/IN2Sdv/T6XX1s0bOtj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B321AF801D8;
	Fri, 11 Mar 2022 17:33:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52E5AF80227; Fri, 11 Mar 2022 17:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1095BF800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 17:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1095BF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MF8AUhNJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E637AB80EA6;
 Fri, 11 Mar 2022 16:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A90C340E9;
 Fri, 11 Mar 2022 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647016388;
 bh=nXDTLmoC8BE8JKKBt3JG2w6GdigCA+dZrYuxemDr/RA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MF8AUhNJgIyAMKvB8bhzDjWZCsJ/dP3bDYqhk7WCBov07ZQLBkt6L9BlQYl8bIe1Q
 d4wiFcOmNf33i5oiQRJgWf/3lc2UvSnH3Bp2+c4IB97F9YQyaehHoHA3vxTFJ7ev+5
 RCDkV284k38yfSZzcmBI238YSLnNLeQviYfHBdivOpo4EICAlPCjURJKZHiNRvS4Cs
 dfv0zdAKQ2bilNkqFG22v+o1U6zLCTbIm1TKkv5fXswm49lIFuKBvIkmLft2NiqTiw
 zXfnn55BCca9PGALC+h5xpfcp1g4ntewrpzAdpwZTOxXuMHmMS2i4dvZcOlEMPIZoR
 Q5BixrLnOUd8Q==
Date: Fri, 11 Mar 2022 16:33:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steve.lee.analog@gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: max98390: Add reset gpio control
Message-ID: <Yit5v+JkYDiWz0z0@sirena.org.uk>
References: <20220311132906.32292-1-steve.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="apjVmizt8XulXsfJ"
Content-Disposition: inline
In-Reply-To: <20220311132906.32292-1-steve.lee.analog@gmail.com>
X-Cookie: The Moral Majority is neither.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ryans.lee@maximintegrated.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--apjVmizt8XulXsfJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 11, 2022 at 10:29:05PM +0900, Steve Lee wrote:
>  Add reset gpio control to support RESET PIN connected to gpio.

This doesn't apply against current code, please check and resend.

--apjVmizt8XulXsfJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIreb4ACgkQJNaLcl1U
h9AYZQf9EamrxEyS8lwo4jJYqN1cJ9ICPCbndKpPkymTnb9WG+afnigV3k2hQAjQ
m1XlnL0pkJu1ICTu4vMwRrIQ2jHG7dn3jLkEqMbzKwgBn4nyCLjijoeUwwPJDZLo
eI40VY3F5EnHz5I3bWCZD3N/aSYS3ZrGAbYLTZaYLOqOTrm4aatzY1Roz+hhVpgT
qwUQhy5tyXZtNEQDG2i9A7yGZdDgPQtaCdjwipk3ER72rQbcpmvrQE89fqCf9R0h
f6sc7V2m+LUSmswOLqNHPapOtRlwQZC2frn/DSwMcr9rBiOfc0i1Ut1wVNfY2Jx+
eYToDX/nA/2tpmVyALEA31UdBKN7/Q==
=okX0
-----END PGP SIGNATURE-----

--apjVmizt8XulXsfJ--
