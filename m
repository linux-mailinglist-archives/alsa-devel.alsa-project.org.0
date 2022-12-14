Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB164CCC1
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 15:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 084D82A20;
	Wed, 14 Dec 2022 15:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 084D82A20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671029840;
	bh=yZdmbCXTWUddvVBEZHmeG2z9NI9Lx2d7dIQudtCYe74=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nrFyf/PgmJaeoaQqET2qO6fRxGNEB7oG+zR+OR4OQ3G++i7Y7dQijbzxmD4y9rMdz
	 VCpptiKwjg0HEgEW9C0T7D50n1K8nUpb0rqyt4kfvdhCAowZqIy6xJCTjN4g0CBni0
	 Ez53lGb1EspKB090YhcHaQ1QA1VpqiwZHxpUU03Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B13FDF80141;
	Wed, 14 Dec 2022 15:56:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF29BF804D7; Wed, 14 Dec 2022 15:56:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61302F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 15:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61302F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JPGSqz1K
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A176B818E3;
 Wed, 14 Dec 2022 14:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F822C433F0;
 Wed, 14 Dec 2022 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671029777;
 bh=yZdmbCXTWUddvVBEZHmeG2z9NI9Lx2d7dIQudtCYe74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPGSqz1KYnRvZzGrfNEcaYJlisk1nWUqray5NbRVq9cd4j3AJ0xN0D2rUJp4emJkF
 2ujcrlyUkh/F52zgC7YB1Wf7Ljx7xQX2j6q4Rd+wBFExEpyvDC/5Uj7NVe0FoBvtlq
 NkCXYh9VE2G4+IOLHhQY/0Brs4V68VY4BcTBaHwFv6jy+xdndUX9OHs7Q1UyFP1P13
 dzuRu+P160rGM/iGGhJrn7o10xNwkha99J6+hDfa2AE/AGg3l8jD9F4oDzDcdp0JX5
 mtuh2zMDbBC9CSzr4lVREVt99RE1viOYiuVSY2mX1J7aOEkDxt2XlpSj4WjMpuBSig
 DdahU8XY7t85w==
Date: Wed, 14 Dec 2022 14:56:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [PATCH 2/2] ASoC: da7213: Add support for mono, set frame width
 to 32 when possible
Message-ID: <Y5nkDEcgbZ2vNEsK@sirena.org.uk>
References: <20221214044058.6289-1-David.Rau.opensource@dm.renesas.com>
 <Y5nb7ik1cCKo+FlR@sirena.org.uk>
 <CAG+cZ07erTzV8Re-xo8GixpsEhK28Q6wHxQeE0co+sWgQAFgGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9H/SuYdosBTIY+zW"
Content-Disposition: inline
In-Reply-To: <CAG+cZ07erTzV8Re-xo8GixpsEhK28Q6wHxQeE0co+sWgQAFgGA@mail.gmail.com>
X-Cookie: I disagree with unanimity.
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
Cc: alsa-devel@alsa-project.org, support.opensource@diasemi.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 David Rau <David.Rau.opensource@dm.renesas.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--9H/SuYdosBTIY+zW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 03:31:26PM +0100, Piotr Wojtaszczyk wrote:
> It was a single patch, with no deps.
>=20

It's flagged as patch 2/2?

> On Wed, Dec 14, 2022 at 3:21 PM Mark Brown <broonie@kernel.org> wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--9H/SuYdosBTIY+zW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ5AsACgkQJNaLcl1U
h9Bd4Af+LPQLMTNkvKgvj0m+xCZebSX/5SfFCTHBQ6rwcogNbgHy+suNi+8WHRKs
O9qU8gKEshxtUqyh9qG1GmIYJZ4gtbKHxBnjAeMPTTFQPc4a4ehxwKbOJgDizMmo
/vHWERfBZ562FGUDVGHzOSWsffAAvJLg42t9yatHJlYV/88q84VVq1enDd6uu5EM
u4QdIjqjtjgoGFqsF/Xc+5Xyq3C8d2evmjdlXO5/hnCuplgWrsJXn5+JY3yuOfVj
WzDuuPZ5GZoc84Nnvsd1ltTjOMcuJkVjkno5dqrVVUQ/aB1uZHanDw+9ClFqbC7z
25FSe85pqkPp5cyN7MGbqsX/NKAYeQ==
=Kpy7
-----END PGP SIGNATURE-----

--9H/SuYdosBTIY+zW--
