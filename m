Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D579655FEAC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 13:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD07164E;
	Wed, 29 Jun 2022 13:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD07164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656502338;
	bh=wdL0PGXVkgilQIJ0YMP3Ex7wwkvoEs1dNccET/NyjOo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGpNqVsQuX0cT09FC6pdyQBjoXknjIjRZHVLZaVtWL8OtJkpHAKTi3YFEFHmasGTL
	 fodMSS1wI58w3vs6TaWehOL7gWLcB+sQIJ5H4iTFKPPJAS2VNR/SKgtwuV5E+ZfNqg
	 LxYF+NRYcTaUIbT7cQcux4PIKA8gNW8Sqw/MBHAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3A6F80245;
	Wed, 29 Jun 2022 13:31:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03DFF8020D; Wed, 29 Jun 2022 13:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4630F800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 13:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4630F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T2+H71Hv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FCF66192F;
 Wed, 29 Jun 2022 11:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C56C34114;
 Wed, 29 Jun 2022 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656502268;
 bh=wdL0PGXVkgilQIJ0YMP3Ex7wwkvoEs1dNccET/NyjOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2+H71HvbuMnldgnYUirKOIGzou2Ld/86lZAuag3NY9niEmzCu1qVyLebLtVyH4hD
 lpNKI5/xjGjAKM2spWDD5Us08groao9J8n0eANDQ3N5K/5Ax1XmG2myxUBBIdJegRS
 rHHE+kRgloDSZmo3gmmG3Yd8Qv5F5EHMHs/0aDq23o+IQ2LT3sYleMU47SKsywGMQX
 AQCswqroFGa49QYo+sNnZmh6E4pRbRFz6ck5Bz3D+9g9uONiV06cuQeTcO3Mlzx3+e
 MIt2PukAKnMCiWAIEUWK3yof6VpUnoZa3a8OG8mlDtP0W5SLj7VdmnjNSCqdUwYF9u
 oMPUO3VY4HNlA==
Date: Wed, 29 Jun 2022 13:31:03 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
Message-ID: <Yrw39+EsPYcAH2Fs@shikoro>
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
 <165469532489.615471.10019728812817999193.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xuc/xVUT+cLFf/Ir"
Content-Disposition: inline
In-Reply-To: <165469532489.615471.10019728812817999193.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, geert+renesas@glider.be,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--xuc/xVUT+cLFf/Ir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Maybe a Fixes-tag helps to convince? :)

Fixes: f28dbaa958fb ("ASoC: ak4613: add TDM256 support")


--xuc/xVUT+cLFf/Ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK8N/MACgkQFA3kzBSg
KbassA//fBxUVdnUMYOsQeYF+/EsqVKjcmvaxg2bvNowZxcwkb5jNsfzW3aW448r
DRpzm5LZzQ+T7QxTmkowJ+NuHOcRTim3Dcz9cfb0WnjRboNOzq4KmWyr5x7dhbs3
9tswtqnsDT7cB5uESpGGpHZgJTRasOXr1b/k8lvBlJyz33pToURyL8MHrZUQ5TDK
7O5k2/R3FTg8tU7XSAz+5MFYdno5dcGB9b4pFLsoCvU5HUcc2oHboTzX6GvHIQG/
QKSXyV1x8RZ+3uaGp4uuwDso/cwpAv3goPLe4LObckTgDrdG461HqV+/qyEwgjFz
1SyRJE7HZCRqlKJpSI2dByur20wrWnk/aAHaF7de0ua8k1i2HOxZ/4k5/CLnSqKG
A/gyTGSPjzrccWzX50eK5iBkxelXmAYBTUMeQDD+PRhRaowygrwWc07JrtAXdJfb
B+dtc/WGsCFyYVbxFsuDl0aocfWWF/wRGs9iNOwvQP2dyPVZCeHlOmCPlEnYBbQL
xJ2WeQT3MLbgO2jaQ0W3LB7M/vVcV6jgi1od5Pk2efJK3W11BdEVy42WSZkI97XH
1Df5GBxo2NMsYHAWRI1sW1azfUxSYhZK26N1np42S9uILwbHOX3GN67ATyTmU9m5
IIPSlXLXmHYkleLTFAQjXiahfGR1DQilIC8baF8mU4GMGuHxCos=
=BiH9
-----END PGP SIGNATURE-----

--xuc/xVUT+cLFf/Ir--
