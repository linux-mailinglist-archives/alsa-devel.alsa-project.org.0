Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A08176CA39A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 14:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B527826;
	Mon, 27 Mar 2023 14:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B527826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679919435;
	bh=E0aEdCM3jvSMs/38zuXbXkxHJ78t/3YMqCcj/tnhccs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PjlbpJJQgunDMvuLPilk9Jf0J4u83KUAH30/3r7LhU6ZIQVL+igWpncjIH7Q21dt9
	 CEsTJyJjYQX4VL5BRFX5hIHH9Dtxc+DwoQXs1mTUTb+Y1Jex5MvBhrnJMlsQyYHwLk
	 cJQMz7P7Crc8ePZZix1Vp//Ebkx0S/J456WkgliU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E75F8024E;
	Mon, 27 Mar 2023 14:16:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C42C0F80272; Mon, 27 Mar 2023 14:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2FD5F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 14:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FD5F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rTqOSQRs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8CF4B80B7E;
	Mon, 27 Mar 2023 12:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C62C4339C;
	Mon, 27 Mar 2023 12:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919373;
	bh=E0aEdCM3jvSMs/38zuXbXkxHJ78t/3YMqCcj/tnhccs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTqOSQRsCLihHxxFpDn+uPb23rtNaKM4885EluAW0rTF6ImFoM8RmNcuJHcmdoTYH
	 OYNDidlkJ0No4vMTWwurwEgfSvui/QeXabiytVmUK30z864Xq7iJqtcUMc3OgSYL27
	 2aK82Ni2iLUUuAPZ7LpZ5WzrjLPw6nEMigrCN+UJhGKR/IZX72RZkK99H3NdmC17nA
	 rLAT4IA+982U9IWwE7sc261yNx+vEj169dtARnlsUsVgNfZAGJm091DJZ3CSADkpo8
	 7uMosQYkO+6DSyHWNuBSgppnrjCwitBH6Aihv4PC42fjLxGZSjFCWMycfBTnpGRAB5
	 By4u5+shGx7lw==
Date: Mon, 27 Mar 2023 13:16:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: da7213.c: add missing pm_runtime_disable()
Message-ID: <ZCGJCoFj6DLUEcmT@sirena.org.uk>
References: <87fs9r6ktm.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RIMLg1e2eQKu4z/i"
Content-Disposition: inline
In-Reply-To: <87fs9r6ktm.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: WHDYMU6SS3I6EFGY5RSWFGLC4NL5K6VH
X-Message-ID-Hash: WHDYMU6SS3I6EFGY5RSWFGLC4NL5K6VH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>, Khanh Le <khanh.le.xr@renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHDYMU6SS3I6EFGY5RSWFGLC4NL5K6VH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RIMLg1e2eQKu4z/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 01:32:06AM +0000, Kuninori Morimoto wrote:
> da7213.c is missing pm_runtime_disable(), thus we will get
> below error when rmmod -> insmod. This patch solves it.
>=20
> 	$ rmmod  snd-soc-da7213.ko
> 	$ insmod snd-soc-da7213.ko
> 	da7213 0-001a: Unbalanced pm_runtime_enable!"
>=20
> [Kuninori adjusted to latest upstream]
>=20
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Khanh Le <khanh.le.xr@renesas.com>

If Duy originally wrote the patch it should have a From: line
saying they wrote it (they should be the commit author in your
local git, in which case git send-email will do the right thing).

--RIMLg1e2eQKu4z/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQhiQkACgkQJNaLcl1U
h9C9Mgf/VrpHe60VTzNb8sO611f7eQkYe5DhgFhH7Z1RyjmwBrh3g9csxFAT2N4m
pLt2zQ6Zn+K65fZWkEO7dYcT/gcSYWljei2kO99uSiYTn1UIvrvXavwM4kCQkXVR
ptf2Ah/3F8LI8UE82OyqZy8dWPeSELY2a/XnqXj5QhX/c3euLIhaeIS9x/xnbSZY
sDk/4iEXxc46A2P10xASU3eSQk/bYKEKVtjGAa4vFhaNe8LIIVWrVHuE1Fp7QW+3
4x1Bd7YAmKdPq/rAWCz5I9amsW+IZ/6vWj4I0yDiONP7miSrblUlEqG8f+LzuMW0
XzgJfUOacytQc4ba2QaRVkHxuQVq1A==
=u4HI
-----END PGP SIGNATURE-----

--RIMLg1e2eQKu4z/i--
