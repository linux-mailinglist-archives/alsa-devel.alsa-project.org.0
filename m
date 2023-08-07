Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053B87732A0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 00:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D547A3E7;
	Tue,  8 Aug 2023 00:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D547A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691446041;
	bh=rJcCUWhPyyM5mzK7S7IrT4zFEv2xdGjB11nGKXOZ/J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HiX7BhOL8cAlUhoQWF/C5OIPHHUt8mDhOq6khG0Mrmu8zWDeEj7C7ysRqjST/kyvP
	 rfeAOA59Dqrrbx63GDe1kA5J2HH265QxAXFEIrDGvYgTYaKvhfOWWjgmpzQ6ARG3z4
	 UHsk5+3tUuyFxFruxr+KyZz4o2lt8J8LBqH/A/GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1366AF80087; Tue,  8 Aug 2023 00:06:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD7F4F8016B;
	Tue,  8 Aug 2023 00:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8612DF8016D; Tue,  8 Aug 2023 00:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 132E8F80132
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 00:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 132E8F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P3CHFMkC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0785622B7;
	Mon,  7 Aug 2023 22:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB10C433BC;
	Mon,  7 Aug 2023 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691445982;
	bh=rJcCUWhPyyM5mzK7S7IrT4zFEv2xdGjB11nGKXOZ/J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3CHFMkCrOnt7AaoGrZAEcjbTq7Wd3M9ZCo24zSvAmqPlZLcBGbIPfteqoZhQUkYb
	 LYaYOK1STPJ/AvwsIW1AKkl3A98XhHroKUhYRRSBCcF6J9AbkVwNMQg5789eoNiMYD
	 fP3Pal+LSsS4jXec9v/BV7zDFloOOA2aaAY9eZCOW3BrcH85vjVKn1usYUBBK3fXr0
	 Yab5TSR6h/p9AupAdVEMIVb/dqDdu98aaZDn8OLoq+PpPZ2jdjX8gDMPeGEowd4/f7
	 4RSg69BOI2IWNc0BtZSNgx00Z6OqifSsx89xG+HZGoMmPtPwXxLv3bLvvyNH7Sz2yf
	 nsxEbps6N2uGg==
Date: Mon, 7 Aug 2023 23:06:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, vkoul@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: Re: [PATCH 02/20] ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
Message-ID: <ee52997b-55b9-4f8d-9a29-4f18474c6f3f@sirena.org.uk>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
 <20230807210959.506849-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pVIRVOt7QtHfRg8i"
Content-Disposition: inline
In-Reply-To: <20230807210959.506849-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: idleness, n.:
Message-ID-Hash: 6K6RMH25LNJB4MFVU4I2XGA5MRMOXTEJ
X-Message-ID-Hash: 6K6RMH25LNJB4MFVU4I2XGA5MRMOXTEJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pVIRVOt7QtHfRg8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 04:09:41PM -0500, Pierre-Louis Bossart wrote:
> Likely a combination of copy-paste and test coverage problem. Oops.
>=20
> Fixes: 87a6ddc0cf1c ("ASoC: SOF: Intel: hda-mlink: program SoundWire LSDI=
ID registers")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>

The above commit doesn't seem to be from mainline?

--pVIRVOt7QtHfRg8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTRatgACgkQJNaLcl1U
h9AwcAf9FpO2Uytxs8YSJ1lgX/Prf29r3ARl0ZcC4zy3zT9Nj6Fu1YU+GYRzB0R2
lAexqME0MBZLBBotC8DxmS7kzUh2T7Wp5hV1U7gPZLiLEQ+1kPGNpr9oLgD2NttE
kSEeD7Zcjn+rDwfzB1Czh8DvV+7hv16F0FtthwnRo6km2bYfCK59XkF50lMsd2rh
brNnILkv0XUy62NFvuMhSJaP5akul3iZ4qTHCgN1vUV/jF2DzUI4s+7kuq9WKhwr
G8meASeW/1XGrzvmfIWWem25kOQSvKz09eA4VQBycH3i3lTyESxTwj+6ssEzjCk1
gGArCsKPiojBukuRQdQIExSYAMe6KA==
=4D7O
-----END PGP SIGNATURE-----

--pVIRVOt7QtHfRg8i--
