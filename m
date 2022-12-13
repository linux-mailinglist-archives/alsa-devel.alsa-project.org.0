Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400B64BC2F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 19:38:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C33B1820;
	Tue, 13 Dec 2022 19:37:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C33B1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670956684;
	bh=TZt06SyB1pRuSeRM8PyPzTftv5HrZokdtl7YXOZCqLo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aj823ad9Mlp4KdI9vcyuzOZqKfS4TEMzJcQlQkthnSyNLQKOqAkIbszLS6z5bvG+I
	 /asLmYyU2L1ojxyCp0UW39rDALZEYBjyZivCoZDkl6jyYBH3P8UHmDEj0p4n0l5mRF
	 GDqT1zcayXOACFjqW8s4NhhyR/kHlJGfanlV+Qro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36B64F804ED;
	Tue, 13 Dec 2022 19:37:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B96F804E2; Tue, 13 Dec 2022 19:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80FB6F8047D
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 19:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FB6F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ODZmT8ri
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C1998CE1785;
 Tue, 13 Dec 2022 18:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C48BC433EF;
 Tue, 13 Dec 2022 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670956624;
 bh=TZt06SyB1pRuSeRM8PyPzTftv5HrZokdtl7YXOZCqLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODZmT8ris3vWslK2p0e3u3fRwVt9Z0vKqngv66h3i2t2Ros4cxz8qyp+ZeIe2/s4Z
 LWwdx1HWTlVC5hbJmd6RX8KaiIllJ9w/WLONqDiWhG6FT/xk0IwwZiEAogRje+kKBX
 pBtxdOk91SpTDB08KiMuNF8NfPReJylCwNXz9yjzMNf/QD5TCSIsGZCJ/ss2Izpcnh
 UyUFkToyN6Apx4Whg0bWMbo0sBSNLIdSZw2Oz6kn+9Jude6pc8dCU0/zNnZulqMu3t
 bTsMR0bB5nhfxgjiaEAnwAhW9hMUNNWqeMfF7ObpiIbXJ9+1RyH7vrTZUjhD4X6g4u
 oQ6+1H2QTnHiQ==
Date: Tue, 13 Dec 2022 18:36:58 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] kselftest/alsa: Increase kselftest timeout
Message-ID: <Y5jGSk0WQ6OwYuT/@sirena.org.uk>
References: <20221213183242.1908249-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o4OjguzpDJJHyi8a"
Content-Disposition: inline
In-Reply-To: <20221213183242.1908249-1-nfraprado@collabora.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org,
 kernel@collabora.com, Shuah Khan <shuah@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--o4OjguzpDJJHyi8a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 03:32:42PM -0300, N=EDcolas F. R. A. Prado wrote:
> The default timeout for kselftests is 45 seconds, but pcm-test can take
> longer than that to run depending on the number of PCMs present on a
> device.

Reviewed-by: Mark Brown <broonie@kernel.org>

This is also useful for mixer-test with slower control buses and fancier
CODECs.

--o4OjguzpDJJHyi8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYxkoACgkQJNaLcl1U
h9CYiQf+OQRoREGJ0ahUyN/ztXNCsKXPSDumEO7MjTxV2r5SNAGhJyfY0nJBXkZq
6qBS/liQx8l1vt80ShBTn4u+2eqz60W92WRfO8A57bOEScn//N2wDECoC+6Qu+Kt
5mSsuF+8X28+oejIuguyjtFstR28yecl/LAJNZtWr1ppUxmm4vilCbsD7rO3Pcx+
TeMg/WnaK8gy8wbUV2dfmUn61N2J1Y5+L26GxeA5v0ro4l4Hbh9UPJpJllWXVlB8
DgaBkv38r1EwaK8VL1Xl264VXeOAa/sKoXx8QEfpz6laSbUs8qADkm0Hjb1UParx
sQIus6/udG238dBmQTC+EzsXSNj3zw==
=2DJM
-----END PGP SIGNATURE-----

--o4OjguzpDJJHyi8a--
