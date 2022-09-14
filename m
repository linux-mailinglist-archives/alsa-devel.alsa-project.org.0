Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126A5B8567
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C631843;
	Wed, 14 Sep 2022 11:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C631843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663148691;
	bh=ftt4KHas9O1x52VvAgYGxjYQEWbrp1OLoaku6EDK78g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZM2Aui92+NoNjLyeTI2owwLNFMDoMHYHKzqmmOHotnxFA5Readr5y+lklQAt/wgV
	 lHTfUtAdDIlLbDauUJloT2M9v2XcpiqjiL6oGtfFHfgM6CIKIth1wXBYj0BzxwFlL2
	 5HXIIYAu7ZNf7U4hQXY6aItYwYZ3MkCGwZkIrSwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D65BF800C0;
	Wed, 14 Sep 2022 11:43:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3616F800C0; Wed, 14 Sep 2022 11:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82FFDF800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82FFDF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nC2JRbY1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB1E361AF6;
 Wed, 14 Sep 2022 09:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC591C433D6;
 Wed, 14 Sep 2022 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663148623;
 bh=ftt4KHas9O1x52VvAgYGxjYQEWbrp1OLoaku6EDK78g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nC2JRbY1UVVLAOWxzO/itNFX9XsiekOEMzXRBEihNgRAMcAuCM9hGXIkYaDcw+DnR
 M9tM5hWiSdycDWEBts+ZRuZ8YqlNCm2VrHSeWNrH1n375rnk2BpjZeGpvKlwf7aje8
 BTOPdEmVpIJ5OciroLqXh/VR2nF7B4X9biGHVuaH+ooT0swQqS/8VqLwGVRtpNDHxT
 jL8D7dZJ1szazR/GNd4PO36z8RMxuZHW5kgq4LNsjoXheEB7JrUYF6G4cS12vKLAV1
 zudP5QsAX3G3RVvucg4x//1OmluJXPlToTJmwkuU72lp/wE1xCMyE1NFoRM5qTsw0u
 RH1XKdo6bjo1Q==
Date: Wed, 14 Sep 2022 10:43:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 3/4] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Message-ID: <YyGiTHZzUDlSCEpn@sirena.org.uk>
References: <20220914045712.8775-4-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0hJL38rNocqmJAkH"
Content-Disposition: inline
In-Reply-To: <20220914045712.8775-4-kiseok.jo@irondevice.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Gyuhwa Park <gyuhwa.park@irondevice.com>
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


--0hJL38rNocqmJAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 01:57:10PM +0900, Kiseok Jo wrote:
> The Iron Device SMA1303 is a boosted Class-D audio amplifier.
>=20
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> Reviewed-by: Gyuhwa Park <gyuhwa.park@irondevice.com>
> ---
>  sound/soc/codecs/sma1303.c | 2781 ++++++++++--------------------------
>  sound/soc/codecs/sma1303.h |    7 +-
>  2 files changed, 762 insertions(+), 2026 deletions(-)

These look like incremental patches against some existing code
(perhaps your previous submission?) rather than a new post.  You
should be able to combine them with the original patch using git
rebase -i and resend.

--0hJL38rNocqmJAkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMhoksACgkQJNaLcl1U
h9CurAf/UCbLukBQrYQOcPgsyFSLen60ZayHqFGQRRA/PMWfIAid4EYWb1kCLLC7
SBdCPkvX8+nbqRD+uUAjzx24D7eB7oJCGCtGKF/L6qZUUnv6Wrii9lndYYHPnjFi
7iIEeHrcDxhBaidEdryLFQjW1+7m0nEQP6ZblGCA7j+AytC+R10DpN0hcnif6+nt
h19TEtLz8Veqig2awpM0pPYWswHDKyuQKANwWVP5X6PWekHS1ZYOGm4ZF+OtWbpn
+ZxXppe76aPYUI6DLGJSm1qEcWsgIze9hC+UcVsLjdImd7MjnTD0zOQLJ+WvdXQX
GK6oZD0Fi5UevcormXav+GP5Vqaurg==
=2Fg+
-----END PGP SIGNATURE-----

--0hJL38rNocqmJAkH--
