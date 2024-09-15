Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F897999A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 01:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBC3E7D;
	Mon, 16 Sep 2024 01:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBC3E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726444037;
	bh=s0e67RSN1t5WEzYwjV695FDhg4NLG32hDQQoElWglqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ReX2yPTBd3jztXUhvM2VIHTuIxBXSfL0yQHlICvNAOtDMZJdCVyzmZgZDrIbS2zpw
	 tFR44ZYi4ZkwbARd0u+9qMuPTPM7rQcBumuO9E30JuXGnmWrNZDyIsq0WVClC1sb4p
	 P4uIVYXZfu0skfL6TYABvkPbN4P77CHbG+aw/RGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE1C1F80518; Mon, 16 Sep 2024 01:46:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 772BCF805B0;
	Mon, 16 Sep 2024 01:46:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C99B5F8020D; Mon, 16 Sep 2024 01:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7BBDF80074
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 01:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7BBDF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d6RT0Ih4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B8D1A406D1;
	Sun, 15 Sep 2024 23:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A17C4CEC3;
	Sun, 15 Sep 2024 23:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726443996;
	bh=s0e67RSN1t5WEzYwjV695FDhg4NLG32hDQQoElWglqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6RT0Ih4RqrmZu/dZE7aeye9xTKExmXCtxmy7571HDGz2BT2OIjzQyqoeZRB+GtC1
	 bQKriEJ7JUmGEO1eXB7RmJ7r2z8HnMTK5LDsVDohbAKvoIA7gpdYPVNioTHn8LKKF1
	 myb3L/oY7KREbEgeeb8AsoRtyzrMzi5uiFudgME8RKn7ZSn2LfxzVm2HWUiRZouitn
	 r3nAl7bsS2daoRlK6psYJf6N4GLzPczzL+bwnMhsoPPjuklrKSohh1oDlxwD6fu3rm
	 qQvb38QNIFaUZ/jQugDie5PxM3PIllSvC7clrPSSMO0B7t99/tXge4LNhVf1zaFpq3
	 THe06+4fMQ89g==
Date: Mon, 16 Sep 2024 00:46:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.12
Message-ID: <Zudx2R-AIw1xikvS@finisterre.sirena.org.uk>
References: <23466023e6cdb472a39086dc4f7a4b40.broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5rgtH+InqVa2Cuxm"
Content-Disposition: inline
In-Reply-To: <23466023e6cdb472a39086dc4f7a4b40.broonie@kernel.org>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: WP6W52UKN34TDVRGVUQDVCSTOR4JTSX6
X-Message-ID-Hash: WP6W52UKN34TDVRGVUQDVCSTOR4JTSX6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WP6W52UKN34TDVRGVUQDVCSTOR4JTSX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5rgtH+InqVa2Cuxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 12:26:02AM +0100, Mark Brown wrote:
> The following changes since commit 839a4ec06f75cec8fec2cc5fc14e921d0c3f73=
69:
>=20
>   ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less s=
trict (2024-08-23 11:02:53 +0100)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-v6.12
>=20
> for you to fetch changes up to 2772ee6de6cf94e5f2a0c0ce6067d0796a4170ba:

This is a duplicate, sorry - my script gets confused when pull requests
that I send on one system aren't pulled yet when I send more pull
requests on another one.

--5rgtH+InqVa2Cuxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbncdgACgkQJNaLcl1U
h9D6OAf+LqRuUrDd4Z7hbij3ANhTC5UCM+taJa8i+1vBVuqD/pDW7Iy+jOL59uPr
BRv5RQkx2jmCTDMW6ngTw8GZFInSJ9yhJ3VZ5Xq75s3XsyDPxB+/qNqijJ2hAjH0
/Jdlhu2xvYI+LtWvUculuZUGSda9GloFWBH+6VmzEDue6yMcCrXDhIp2aGzZGWiU
V4bNchssch+ZtZS+aA5Y0jvYMPOvt/c5HAH1mi1dFHaJbveFTEkKN0j2seB5I23R
QejlfpNyIWteI0wCVZlheX7vG+ztvwxhF6XBhDjYf8IEkS9Gy1yIbrZsqYZmlVlF
GeSOB/vNbTdXMM1BM0Y/Jjb/kH/oNg==
=eCga
-----END PGP SIGNATURE-----

--5rgtH+InqVa2Cuxm--
